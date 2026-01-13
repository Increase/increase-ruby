# frozen_string_literal: true

module Increase
  module Webhooks
    class << self
      def unwrap(payload, signature, secret = nil)
        if secret
          verify_signature(payload, signature, secret)
        end

        JSON.parse(payload)
      end

      def verify_signature(payload, signature, secret = nil)
        begin
          parsed_signature = parse_kv_pairs(signature)
        rescue StandardError
          raise "Unable to parse webhook signature."
        end

        timestamp = parsed_signature["t"]
        signature = parsed_signature["v1"]

        expected_signature = OpenSSL::HMAC.hexdigest(
          OpenSSL::Digest.new("sha256"),
          secret,
          "#{timestamp}.#{payload}"
        )

        unless OpenSSL.secure_compare(expected_signature, signature)
          raise "None of the given webhook signatures match the expected signature."
        end

        nil
      end

      private

      def parse_kv_pairs(text, item_sep: ",", value_sep: "=")
        Hash[*text.split(item_sep).map { |t| t.split(value_sep) }.flatten]
      end
    end
  end
end
