# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardRefunds
        # Simulates refunding a card transaction. The full value of the original sandbox
        # transaction is refunded.
        #
        # @overload create(amount: nil, pending_transaction_id: nil, transaction_id: nil, request_options: {})
        #
        # @param amount [Integer]
        #   The refund amount in cents. Pulled off the `pending_transaction` or the
        #   `transaction` if not provided.
        #
        # @param pending_transaction_id [String]
        #   The identifier of the Pending Transaction for the refund authorization. If this
        #   is provided, `transaction` must not be provided as a refund with a refund
        #   authorized can not be linked to a regular transaction.
        #
        # @param transaction_id [String]
        #   The identifier for the Transaction to refund. The Transaction's source must have
        #   a category of card_settlement.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Transaction]
        #
        # @see Increase::Models::Simulations::CardRefundCreateParams
        def create(params = {})
          parsed, options = Increase::Simulations::CardRefundCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/card_refunds",
            body: parsed,
            model: Increase::Transaction,
            options: options
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
