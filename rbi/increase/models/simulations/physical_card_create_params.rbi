# typed: strong

module Increase
  module Models
    module Simulations
      class PhysicalCardCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::PhysicalCardCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The type of tracking event.
        sig do
          returns(
            Increase::Simulations::PhysicalCardCreateParams::Category::OrSymbol
          )
        end
        attr_accessor :category

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the
        # carrier expects the card to be delivered.
        sig { returns(T.nilable(Time)) }
        attr_reader :carrier_estimated_delivery_at

        sig { params(carrier_estimated_delivery_at: Time).void }
        attr_writer :carrier_estimated_delivery_at

        # The city where the event took place.
        sig { returns(T.nilable(String)) }
        attr_reader :city

        sig { params(city: String).void }
        attr_writer :city

        # The postal code where the event took place.
        sig { returns(T.nilable(String)) }
        attr_reader :postal_code

        sig { params(postal_code: String).void }
        attr_writer :postal_code

        # The state where the event took place.
        sig { returns(T.nilable(String)) }
        attr_reader :state

        sig { params(state: String).void }
        attr_writer :state

        sig do
          params(
            category:
              Increase::Simulations::PhysicalCardCreateParams::Category::OrSymbol,
            carrier_estimated_delivery_at: Time,
            city: String,
            postal_code: String,
            state: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
              category:
                Increase::Simulations::PhysicalCardCreateParams::Category::OrSymbol,
              carrier_estimated_delivery_at: Time,
              city: String,
              postal_code: String,
              state: String,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The type of tracking event.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::PhysicalCardCreateParams::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The physical card is in transit.
          IN_TRANSIT =
            T.let(
              :in_transit,
              Increase::Simulations::PhysicalCardCreateParams::Category::TaggedSymbol
            )

          # The physical card has been processed for delivery.
          PROCESSED_FOR_DELIVERY =
            T.let(
              :processed_for_delivery,
              Increase::Simulations::PhysicalCardCreateParams::Category::TaggedSymbol
            )

          # The physical card has been delivered.
          DELIVERED =
            T.let(
              :delivered,
              Increase::Simulations::PhysicalCardCreateParams::Category::TaggedSymbol
            )

          # Delivery failed and the physical card was returned to sender.
          RETURNED_TO_SENDER =
            T.let(
              :returned_to_sender,
              Increase::Simulations::PhysicalCardCreateParams::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::PhysicalCardCreateParams::Category::TaggedSymbol
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
