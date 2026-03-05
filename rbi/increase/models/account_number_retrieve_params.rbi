# typed: strong

module Increase
  module Models
    class AccountNumberRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::AccountNumberRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Account Number to retrieve.
      sig { returns(String) }
      attr_accessor :account_number_id

      sig do
        params(
          account_number_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Account Number to retrieve.
        account_number_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_number_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
