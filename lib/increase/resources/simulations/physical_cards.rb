# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class PhysicalCards
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
