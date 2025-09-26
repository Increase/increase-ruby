# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardRefunds
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::CardRefundCreateParams} for more details.
        #
        # Simulates refunding a card transaction. The full value of the original sandbox
        # transaction is refunded.
        #
        # @overload create(pending_transaction_id: nil, transaction_id: nil, request_options: {})
        #
        # @param pending_transaction_id [String] The identifier of the Pending Transaction for the refund authorization. If this
        #
        # @param transaction_id [String] The identifier for the Transaction to refund. The Transaction's source must have
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
