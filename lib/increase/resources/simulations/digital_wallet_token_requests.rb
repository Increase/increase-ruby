# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class DigitalWalletTokenRequests
        # Simulates a user attempting to add a [Card](#cards) to a digital wallet such as
        # Apple Pay.
        #
        # @overload create(card_id:, request_options: {})
        #
        # @param card_id [String] The identifier of the Card to be authorized.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse]
        #
        # @see Increase::Models::Simulations::DigitalWalletTokenRequestCreateParams
        def create(params)
          parsed, options = Increase::Simulations::DigitalWalletTokenRequestCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/digital_wallet_token_requests",
            body: parsed,
            model: Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse,
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
