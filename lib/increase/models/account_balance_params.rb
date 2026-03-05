# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#balance
    class AccountBalanceParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier of the Account to retrieve.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute at_time
      #   The moment to query the balance at. If not set, returns the current balances.
      #
      #   @return [Time, nil]
      optional :at_time, Time

      # @!method initialize(account_id:, at_time: nil, request_options: {})
      #   @param account_id [String] The identifier of the Account to retrieve.
      #
      #   @param at_time [Time] The moment to query the balance at. If not set, returns the current balances.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
