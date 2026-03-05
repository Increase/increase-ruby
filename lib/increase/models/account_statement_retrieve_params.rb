# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountStatements#retrieve
    class AccountStatementRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_statement_id
      #   The identifier of the Account Statement to retrieve.
      #
      #   @return [String]
      required :account_statement_id, String

      # @!method initialize(account_statement_id:, request_options: {})
      #   @param account_statement_id [String] The identifier of the Account Statement to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
