# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::PhysicalCards#advance_shipment
      class PhysicalCardAdvanceShipmentParams < Increase::Internal::Type::BaseModel
        # @!parse
        #   extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute shipment_status
        #   The shipment status to move the Physical Card to.
        #
        #   @return [Symbol, Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus]
        required :shipment_status,
                 enum: -> { Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus }

        # @!parse
        #   # @param shipment_status [Symbol, Increase::Models::Simulations::PhysicalCardAdvanceShipmentParams::ShipmentStatus]
        #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(shipment_status:, request_options: {}, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # The shipment status to move the Physical Card to.
        module ShipmentStatus
          extend Increase::Internal::Type::Enum

          # The physical card has not yet been shipped.
          PENDING = :pending

          # The physical card shipment was canceled prior to submission.
          CANCELED = :canceled

          # The physical card shipment has been submitted to the card fulfillment provider.
          SUBMITTED = :submitted

          # The physical card shipment has been acknowledged by the card fulfillment provider and will be processed in their next batch.
          ACKNOWLEDGED = :acknowledged

          # The physical card shipment was rejected by the card printer due to an error.
          REJECTED = :rejected

          # The physical card has been shipped.
          SHIPPED = :shipped

          # The physical card shipment was returned to the sender and destroyed by the production facility.
          RETURNED = :returned

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
