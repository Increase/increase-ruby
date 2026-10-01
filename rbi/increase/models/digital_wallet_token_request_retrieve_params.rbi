# typed: strong

module Increase
  module Models
    class DigitalWalletTokenRequestRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::DigitalWalletTokenRequestRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Digital Wallet Token Request.
      sig { returns(String) }
      attr_accessor :digital_wallet_token_request_id

      sig do
        params(
          digital_wallet_token_request_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Digital Wallet Token Request.
        digital_wallet_token_request_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            digital_wallet_token_request_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
