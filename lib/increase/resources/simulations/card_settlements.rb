# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardSettlements
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::CardSettlementCreateParams} for more details.
        #
        # Simulates the settlement of an authorization by a card acquirer. After a card
        # authorization is created, the merchant will eventually send a settlement. This
        # simulates that event, which may occur many days after the purchase in
        # production. The amount settled can be different from the amount originally
        # authorized, for example, when adding a tip to a restaurant bill.
        #
        # @overload create(card_id:, pending_transaction_id:, amount: nil, request_options: {})
        #
        # @param card_id [String] The identifier of the Card to create a settlement on.
        #
        # @param pending_transaction_id [String] The identifier of the Pending Transaction for the Card Authorization you wish to
        #
        # @param amount [Integer] The amount to be settled. This defaults to the amount of the Pending Transaction
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
