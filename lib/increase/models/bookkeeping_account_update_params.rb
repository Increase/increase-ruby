# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingAccounts#update
    class BookkeepingAccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute bookkeeping_account_id
      #   The bookkeeping account you would like to update.
      #
      #   @return [String]
      required :bookkeeping_account_id, String

      # @!attribute name
      #   The name you choose for the account.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(bookkeeping_account_id:, name:, request_options: {})
      #   @param bookkeeping_account_id [String] The bookkeeping account you would like to update.
      #
      #   @param name [String] The name you choose for the account.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
