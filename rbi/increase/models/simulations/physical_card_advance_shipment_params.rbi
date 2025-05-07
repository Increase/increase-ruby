# typed: strong

module Increase
  module Models
    module Simulations
      class PhysicalCardAdvanceShipmentParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The shipment status to move the Physical Card to.
        sig do
          returns(
            Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::OrSymbol
          )
        end
        attr_accessor :shipment_status

        sig do
          params(
            shipment_status:
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The shipment status to move the Physical Card to.
          shipment_status:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              shipment_status:
                Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The shipment status to move the Physical Card to.
        module ShipmentStatus
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The physical card has not yet been shipped.
          PENDING =
            T.let(
              :pending,
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment was canceled prior to submission.
          CANCELED =
            T.let(
              :canceled,
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment has been submitted to the card fulfillment provider.
          SUBMITTED =
            T.let(
              :submitted,
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment has been acknowledged by the card fulfillment provider and will be processed in their next batch.
          ACKNOWLEDGED =
            T.let(
              :acknowledged,
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment was rejected by the card printer due to an error.
          REJECTED =
            T.let(
              :rejected,
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card has been shipped.
          SHIPPED =
            T.let(
              :shipped,
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment was returned to the sender and destroyed by the production facility.
          RETURNED =
            T.let(
              :returned,
              Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
