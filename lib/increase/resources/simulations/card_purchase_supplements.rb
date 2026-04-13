# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardPurchaseSupplements
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::CardPurchaseSupplementCreateParams} for more
        # details.
        #
        # Simulates the creation of a Card Purchase Supplement (Level 3 data) for a card
        # settlement. This happens asynchronously in production when Visa sends enhanced
        # transaction data about a purchase.
        #
        # @overload create(transaction_id:, invoice: nil, line_items: nil, request_options: {})
        #
        # @param transaction_id [String] The identifier of the Transaction to create a Card Purchase Supplement for. The
        #
        # @param invoice [Increase::Models::Simulations::CardPurchaseSupplementCreateParams::Invoice] Invoice-level information about the payment.
        #
        # @param line_items [Array<Increase::Models::Simulations::CardPurchaseSupplementCreateParams::LineItem>] Line item information, such as individual products purchased.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CardPurchaseSupplement]
        #
        # @see Increase::Models::Simulations::CardPurchaseSupplementCreateParams
        def create(params)
          parsed, options = Increase::Simulations::CardPurchaseSupplementCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/card_purchase_supplements",
            body: parsed,
            model: Increase::CardPurchaseSupplement,
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
