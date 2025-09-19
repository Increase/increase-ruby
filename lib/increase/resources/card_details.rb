# frozen_string_literal: true

module Increase
  module Resources
    class CardDetails
      # Update a Card's PIN
      #
      # @overload update(card_id, pin:, request_options: {})
      #
      # @param card_id [String] The card identifier.
      #
      # @param pin [String] The 4-digit PIN for the card, for use with ATMs.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardDetailsAPI]
      #
      # @see Increase::Models::CardDetailUpdateParams
      def update(card_id, params)
        parsed, options = Increase::CardDetailUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["cards/%1$s/details", card_id],
          body: parsed,
          model: Increase::CardDetailsAPI,
          options: options
        )
      end

      # Create an iframe URL for a Card to display the card details. More details about
      # styling and usage can be found in the
      # [documentation](/documentation/embedded-card-component).
      #
      # @overload create_details_iframe(card_id, physical_card_id: nil, request_options: {})
      #
      # @param card_id [String] The identifier of the Card to retrieve details for.
      #
      # @param physical_card_id [String] The identifier of the Physical Card to retrieve details for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardIframeURL]
      #
      # @see Increase::Models::CardDetailCreateDetailsIframeParams
      def create_details_iframe(card_id, params = {})
        parsed, options = Increase::CardDetailCreateDetailsIframeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["cards/%1$s/create_details_iframe", card_id],
          body: parsed,
          model: Increase::CardIframeURL,
          options: options
        )
      end

      # Sensitive details for a Card include the primary account number, expiry, card
      # verification code, and PIN.
      #
      # @overload details(card_id, request_options: {})
      #
      # @param card_id [String] The identifier of the Card to retrieve details for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardDetailsAPI]
      #
      # @see Increase::Models::CardDetailDetailsParams
      def details(card_id, params = {})
        @client.request(
          method: :get,
          path: ["cards/%1$s/details", card_id],
          model: Increase::CardDetailsAPI,
          options: params[:request_options]
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
