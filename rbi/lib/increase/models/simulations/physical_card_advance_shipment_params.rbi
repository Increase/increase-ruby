# typed: strong

module Increase
  module Models
    module Simulations
      class PhysicalCardAdvanceShipmentParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # The shipment status to move the Physical Card to.
        sig { returns(Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::OrSymbol) }
        attr_accessor :shipment_status

        sig do
          params(
            shipment_status: Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::OrSymbol,
            request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(shipment_status:, request_options: {})
        end

        sig do
          override
            .returns(
              {
                shipment_status: Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::OrSymbol,
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
            T.type_alias { T.all(Symbol, Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus) }
          OrSymbol =
            T.type_alias do
              T.any(
                Symbol,
                String,
                Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
              )
            end

          # The physical card has not yet been shipped.
          PENDING =
            T.let(
              :pending,
              Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment was canceled prior to submission.
          CANCELED =
            T.let(
              :canceled,
              Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment has been submitted to the card fulfillment provider.
          SUBMITTED =
            T.let(
              :submitted,
              Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment has been acknowledged by the card fulfillment provider and will be processed in their next batch.
          ACKNOWLEDGED =
            T.let(
              :acknowledged,
              Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment was rejected by the card printer due to an error.
          REJECTED =
            T.let(
              :rejected,
              Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card has been shipped.
          SHIPPED =
            T.let(
              :shipped,
              Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          # The physical card shipment was returned to the sender and destroyed by the production facility.
          RETURNED =
            T.let(
              :returned,
              Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol
            )

          sig do
            override
              .returns(
                T::Array[Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus::TaggedSymbol]
              )
          end
          def self.values
          end
        end
      end
    end
  end
end
