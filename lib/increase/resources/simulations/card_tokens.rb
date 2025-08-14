# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardTokens
        # Simulates tokenizing a card in the sandbox environment.
        #
        # @overload create(capabilities: nil, expiration: nil, last4: nil, prefix: nil, primary_account_number_length: nil, request_options: {})
        #
        # @param capabilities [Array<Increase::Models::Simulations::CardTokenCreateParams::Capability>] The capabilities of the outbound card token.
        #
        # @param expiration [Date] The expiration date of the card.
        #
        # @param last4 [String] The last 4 digits of the card number.
        #
        # @param prefix [String] The prefix of the card number, usually the first 8 digits.
        #
        # @param primary_account_number_length [Integer] The total length of the card number, including prefix and last4.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CardToken]
        #
        # @see Increase::Models::Simulations::CardTokenCreateParams
        def create(params = {})
          parsed, options = Increase::Simulations::CardTokenCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/card_tokens",
            body: parsed,
            model: Increase::CardToken,
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
