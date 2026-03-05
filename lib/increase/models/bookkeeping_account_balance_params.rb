# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingAccounts#balance
    class BookkeepingAccountBalanceParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute bookkeeping_account_id
      #   The identifier of the Bookkeeping Account to retrieve.
      #
      #   @return [String]
      required :bookkeeping_account_id, String

      # @!attribute at_time
      #   The moment to query the balance at. If not set, returns the current balances.
      #
      #   @return [Time, nil]
      optional :at_time, Time

      # @!method initialize(bookkeeping_account_id:, at_time: nil, request_options: {})
      #   @param bookkeeping_account_id [String] The identifier of the Bookkeeping Account to retrieve.
      #
      #   @param at_time [Time] The moment to query the balance at. If not set, returns the current balances.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
