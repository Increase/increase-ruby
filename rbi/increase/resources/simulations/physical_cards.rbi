# typed: strong

module Increase
  module Resources
    class Simulations
      class PhysicalCards
        # This endpoint allows you to simulate advancing the shipment status of a Physical
        # Card, to simulate e.g., that a physical card was attempted shipped but then
        # failed delivery.
        sig do
          params(
            physical_card_id: String,
            shipment_status:
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::PhysicalCard)
        end
        def advance_shipment(
          # The Physical Card you would like to action.
          physical_card_id,
          # The shipment status to move the Physical Card to.
          shipment_status:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Increase::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
