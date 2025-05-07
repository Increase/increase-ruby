# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardFuelConfirmations
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::CardFuelConfirmationCreateParams} for more
        # details.
        #
        # Simulates the fuel confirmation of an authorization by a card acquirer. This
        # happens asynchronously right after a fuel pump transaction is completed. A fuel
        # confirmation can only happen once per authorization.
        #
        # @overload create(amount:, card_payment_id:, request_options: {})
        #
        # @param amount [Integer] The amount of the fuel_confirmation in minor units in the card authorization's c
        #
        # @param card_payment_id [String] The identifier of the Card Payment to create a fuel_confirmation on.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::CardPayment]
        #
        # @see Increase::Models::Simulations::CardFuelConfirmationCreateParams
        def create(params)
          parsed, options = Increase::Simulations::CardFuelConfirmationCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/card_fuel_confirmations",
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
