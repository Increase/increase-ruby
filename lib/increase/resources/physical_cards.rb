# frozen_string_literal: true

module Increase
  module Resources
    class PhysicalCards
      # Some parameter documentations has been truncated, see
      # {Increase::Models::PhysicalCardCreateParams} for more details.
      #
      # Create a Physical Card
      #
      # @overload create(card_id:, cardholder:, shipment:, physical_card_profile_id: nil, request_options: {})
      #
      # @param card_id [String] The underlying card representing this physical card.
      #
      # @param cardholder [Increase::Models::PhysicalCardCreateParams::Cardholder] Details about the cardholder, as it will appear on the physical card.
      #
      # @param shipment [Increase::Models::PhysicalCardCreateParams::Shipment] The details used to ship this physical card.
      #
      # @param physical_card_profile_id [String] The physical card profile to use for this physical card. The latest default phys
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCard]
      #
      # @see Increase::Models::PhysicalCardCreateParams
      def create(params)
        parsed, options = Increase::PhysicalCardCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "physical_cards",
          body: parsed,
          model: Increase::PhysicalCard,
          options: options
        )
      end

      # Retrieve a Physical Card
      #
      # @overload retrieve(physical_card_id, request_options: {})
      #
      # @param physical_card_id [String] The identifier of the Physical Card.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCard]
      #
      # @see Increase::Models::PhysicalCardRetrieveParams
      def retrieve(physical_card_id, params = {})
        @client.request(
          method: :get,
          path: ["physical_cards/%1$s", physical_card_id],
          model: Increase::PhysicalCard,
          options: params[:request_options]
        )
      end

      # Update a Physical Card
      #
      # @overload update(physical_card_id, status:, request_options: {})
      #
      # @param physical_card_id [String] The Physical Card identifier.
      #
      # @param status [Symbol, Increase::Models::PhysicalCardUpdateParams::Status] The status to update the Physical Card to.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCard]
      #
      # @see Increase::Models::PhysicalCardUpdateParams
      def update(physical_card_id, params)
        parsed, options = Increase::PhysicalCardUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["physical_cards/%1$s", physical_card_id],
          body: parsed,
          model: Increase::PhysicalCard,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::PhysicalCardListParams} for more details.
      #
      # List Physical Cards
      #
      # @overload list(card_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param card_id [String] Filter Physical Cards to ones belonging to the specified Card.
      #
      # @param created_at [Increase::Models::PhysicalCardListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardListResponse]
      #
      # @see Increase::Models::PhysicalCardListParams
      def list(params = {})
        parsed, options = Increase::PhysicalCardListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "physical_cards",
          query: parsed,
          model: Increase::Models::PhysicalCardListResponse,
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
