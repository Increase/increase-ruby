# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardIncrements
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::CardIncrementCreateParams} for more details.
        #
        # Simulates the increment of an authorization by a card acquirer. An authorization
        # can be incremented multiple times.
        #
        # @overload create(amount:, card_payment_id:, event_subscription_id: nil, request_options: {})
        #
        # @param amount [Integer] The amount of the increment in minor units in the card authorization's currency.
        #
        # @param card_payment_id [String] The identifier of the Card Payment to create a increment on.
        #
        # @param event_subscription_id [String] The identifier of the Event Subscription to use. If provided, will override the
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::CardPayment]
        #
        # @see Increase::Models::Simulations::CardIncrementCreateParams
        def create(params)
          parsed, options = Increase::Simulations::CardIncrementCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/card_increments",
            body: parsed,
            model: Increase::CardPayment,
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
