# frozen_string_literal: true

module Increase
  module Resources
    class IntrafiBalances
      # Returns the IntraFi balance for the given account. IntraFi may sweep funds to
      # multiple banks. This endpoint will include both the total balance and the amount
      # swept to each institution.
      #
      # @overload intrafi_balance(account_id, request_options: {})
      #
      # @param account_id [String] The identifier of the Account to get balances for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::IntrafiBalance]
      #
      # @see Increase::Models::IntrafiBalanceIntrafiBalanceParams
      def intrafi_balance(account_id, params = {})
        @client.request(
          method: :get,
          path: ["accounts/%1$s/intrafi_balance", account_id],
          model: Increase::Models::IntrafiBalance,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
