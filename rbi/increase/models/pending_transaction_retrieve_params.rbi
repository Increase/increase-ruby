# typed: strong

module Increase
  module Models
    class PendingTransactionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::PendingTransactionRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Pending Transaction.
      sig { returns(String) }
      attr_accessor :pending_transaction_id

      sig do
        params(
          pending_transaction_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Pending Transaction.
        pending_transaction_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            pending_transaction_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
