# typed: strong

module Increase
  module Models
    class InboundACHTransferCreateNotificationOfChangeParams < Increase::BaseModel
      extend Increase::RequestParameters::Converter
      include Increase::RequestParameters

      sig { returns(T.nilable(String)) }
      attr_reader :updated_account_number

      sig { params(updated_account_number: String).void }
      attr_writer :updated_account_number

      sig { returns(T.nilable(String)) }
      attr_reader :updated_routing_number

      sig { params(updated_routing_number: String).void }
      attr_writer :updated_routing_number

      sig do
        params(
          updated_account_number: String,
          updated_routing_number: String,
          request_options: T.any(Increase::RequestOptions, T::Hash[Symbol, T.anything])
        ).void
      end
      def initialize(updated_account_number: nil, updated_routing_number: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            updated_account_number: String,
            updated_routing_number: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
