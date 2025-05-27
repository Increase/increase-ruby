# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::PhysicalCards#tracking_updates
      class PhysicalCardTrackingUpdatesParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute category
        #   The type of tracking event.
        #
        #   @return [Symbol, Increase::Models::Simulations::PhysicalCardTrackingUpdatesParams::Category]
        required :category, enum: -> { Increase::Simulations::PhysicalCardTrackingUpdatesParams::Category }

        # @!attribute carrier_estimated_delivery_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the
        #   carrier expects the card to be delivered.
        #
        #   @return [Time, nil]
        optional :carrier_estimated_delivery_at, Time

        # @!attribute city
        #   The city where the event took place.
        #
        #   @return [String, nil]
        optional :city, String

        # @!attribute postal_code
        #   The postal code where the event took place.
        #
        #   @return [String, nil]
        optional :postal_code, String

        # @!attribute state
        #   The state where the event took place.
        #
        #   @return [String, nil]
        optional :state, String

        # @!method initialize(category:, carrier_estimated_delivery_at: nil, city: nil, postal_code: nil, state: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::PhysicalCardTrackingUpdatesParams} for more
        #   details.
        #
        #   @param category [Symbol, Increase::Models::Simulations::PhysicalCardTrackingUpdatesParams::Category] The type of tracking event.
        #
        #   @param carrier_estimated_delivery_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the ca
        #
        #   @param city [String] The city where the event took place.
        #
        #   @param postal_code [String] The postal code where the event took place.
        #
        #   @param state [String] The state where the event took place.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The type of tracking event.
        module Category
          extend Increase::Internal::Type::Enum

          # The physical card is in transit.
          IN_TRANSIT = :in_transit

          # The physical card has been processed for delivery.
          PROCESSED_FOR_DELIVERY = :processed_for_delivery

          # The physical card has been delivered.
          DELIVERED = :delivered

          # Delivery failed and the physical card was returned to sender.
          RETURNED_TO_SENDER = :returned_to_sender

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
