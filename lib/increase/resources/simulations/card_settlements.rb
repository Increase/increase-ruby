# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardSettlements
        # Simulates the settlement of an authorization by a card acquirer. After a card
        # authorization is created, the merchant will eventually send a settlement. This
        # simulates that event, which may occur many days after the purchase in
        # production. The amount settled can be different from the amount originally
        # authorized, for example, when adding a tip to a restaurant bill.
        #
        # @overload create(card_id:, amount: nil, pending_transaction_id: nil, request_options: {})
        #
        # @param card_id [String] The identifier of the Card to create a settlement on.
        #
        # @param amount [Integer]
        #   The amount to be settled. This defaults to the amount of the Pending Transaction
        #   being settled, or a random amount if `pending_transaction_id` is not provided.
        #
        # @param pending_transaction_id [String]
        #   The identifier of the Pending Transaction for the Card Authorization you wish to
        #   settle. If not provided, the settlement will be force posted without a Card
        #   Authorization.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Transaction]
        #
        # @see Increase::Models::Simulations::CardSettlementCreateParams
        def create(params)
          parsed, options = Increase::Simulations::CardSettlementCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/card_settlements",
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
