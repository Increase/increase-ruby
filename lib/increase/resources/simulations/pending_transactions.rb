# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class PendingTransactions
        # This endpoint simulates immediately releasing an Inbound Funds Hold, which might
        # be created as a result of, for example, an ACH debit.
        #
        # @overload release_inbound_funds_hold(pending_transaction_id, request_options: {})
        #
        # @param pending_transaction_id [String]
        #   The pending transaction to release. The pending transaction must have a
        #   `inbound_funds_hold` source.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::PendingTransaction]
        #
        # @see Increase::Models::Simulations::PendingTransactionReleaseInboundFundsHoldParams
        def release_inbound_funds_hold(pending_transaction_id, params = {})
          @client.request(
            method: :post,
            path: [
              "simulations/pending_transactions/%1$s/release_inbound_funds_hold",
              pending_transaction_id
            ],
            model: Increase::PendingTransaction,
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
end
