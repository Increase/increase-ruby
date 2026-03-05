# typed: strong

module Increase
  module Models
    class DeclinedTransactionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::DeclinedTransactionRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Declined Transaction.
      sig { returns(String) }
      attr_accessor :declined_transaction_id

      sig do
        params(
          declined_transaction_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Declined Transaction.
        declined_transaction_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            declined_transaction_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
