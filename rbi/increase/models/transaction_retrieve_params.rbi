# typed: strong

module Increase
  module Models
    class TransactionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::TransactionRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Transaction to retrieve.
      sig { returns(String) }
      attr_accessor :transaction_id

      sig do
        params(
          transaction_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Transaction to retrieve.
        transaction_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { transaction_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
