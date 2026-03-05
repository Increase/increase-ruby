# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountNumbers#retrieve
    class AccountNumberRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   The identifier of the Account Number to retrieve.
      #
      #   @return [String]
      required :account_number_id, String

      # @!method initialize(account_number_id:, request_options: {})
      #   @param account_number_id [String] The identifier of the Account Number to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
