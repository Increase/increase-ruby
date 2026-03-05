# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiBalances#intrafi_balance
    class IntrafiBalanceIntrafiBalanceParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier of the Account to get balances for.
      #
      #   @return [String]
      required :account_id, String

      # @!method initialize(account_id:, request_options: {})
      #   @param account_id [String] The identifier of the Account to get balances for.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
