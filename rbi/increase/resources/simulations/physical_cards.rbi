# typed: strong

module Increase
  module Resources
    class Simulations
      class PhysicalCards
        # This endpoint allows you to simulate receiving a tracking update for a Physical
        # Card, to simulate the progress of a shipment.
        sig do
          params(
            physical_card_id: String,
            category:
              Increase::Simulations::PhysicalCardCreateParams::Category::OrSymbol,
            carrier_estimated_delivery_at: Time,
            city: String,
            postal_code: String,
            state: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::PhysicalCard)
        end
        def create(
          # The Physical Card you would like to action.
          physical_card_id,
          # The type of tracking event.
          category:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the
          # carrier expects the card to be delivered.
          carrier_estimated_delivery_at: nil,
          # The city where the event took place.
          city: nil,
          # The postal code where the event took place.
          postal_code: nil,
          # The state where the event took place.
          state: nil,
          request_options: {}
        )
        end

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
