# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardAuthorizationExpirations
        # Simulates expiring a Card Authorization immediately.
        #
        # @overload create(card_payment_id:, request_options: {})
        #
        # @param card_payment_id [String] The identifier of the Card Payment to expire.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CardPayment]
        #
        # @see Increase::Models::Simulations::CardAuthorizationExpirationCreateParams
        def create(params)
          parsed, options = Increase::Simulations::CardAuthorizationExpirationCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/card_authorization_expirations",
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
