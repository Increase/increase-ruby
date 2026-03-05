# typed: strong

module Increase
  module Models
    class AccountStatementRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::AccountStatementRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Account Statement to retrieve.
      sig { returns(String) }
      attr_accessor :account_statement_id

      sig do
        params(
          account_statement_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Account Statement to retrieve.
        account_statement_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_statement_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
