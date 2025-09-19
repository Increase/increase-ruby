# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class PhysicalCards
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::PhysicalCardCreateParams} for more details.
        #
        # This endpoint allows you to simulate receiving a tracking update for a Physical
        # Card, to simulate the progress of a shipment.
        #
        # @overload create(physical_card_id, category:, carrier_estimated_delivery_at: nil, city: nil, postal_code: nil, state: nil, request_options: {})
        #
        # @param physical_card_id [String] The Physical Card you would like to action.
        #
        # @param category [Symbol, Increase::Models::Simulations::PhysicalCardCreateParams::Category] The type of tracking event.
        #
        # @param carrier_estimated_delivery_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the ca
        #
        # @param city [String] The city where the event took place.
        #
        # @param postal_code [String] The postal code where the event took place.
        #
        # @param state [String] The state where the event took place.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::PhysicalCard]
        #
        # @see Increase::Models::Simulations::PhysicalCardCreateParams
        def create(physical_card_id, params)
          parsed, options = Increase::Simulations::PhysicalCardCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/physical_cards/%1$s/tracking_updates", physical_card_id],
            body: parsed,
            model: Increase::PhysicalCard,
            options: options
          )
        end

        # This endpoint allows you to simulate advancing the shipment status of a Physical
        # Card, to simulate e.g., that a physical card was attempted shipped but then
        # failed delivery.
        #
        # @overload advance_shipment(physical_card_id, shipment_status:, request_options: {})
        #
        # @param physical_card_id [String] The Physical Card you would like to action.
        #
        # @param shipment_status [Symbol, Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus] The shipment status to move the Physical Card to.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::PhysicalCard]
        #
        # @see Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams
        def advance_shipment(physical_card_id, params)
          parsed, options = Increase::Simulations::PhysicalCardAdvanceShipmentParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/physical_cards/%1$s/advance_shipment", physical_card_id],
            body: parsed,
            model: Increase::PhysicalCard,
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
