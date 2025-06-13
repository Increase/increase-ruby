# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCards#create
    class PhysicalCard < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The physical card identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute card_id
      #   The identifier for the Card this Physical Card represents.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute cardholder
      #   Details about the cardholder, as it appears on the printed card.
      #
      #   @return [Increase::Models::PhysicalCard::Cardholder]
      required :cardholder, -> { Increase::PhysicalCard::Cardholder }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Physical Card was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute physical_card_profile_id
      #   The Physical Card Profile used for this Physical Card.
      #
      #   @return [String, nil]
      required :physical_card_profile_id, String, nil?: true

      # @!attribute shipment
      #   The details used to ship this physical card.
      #
      #   @return [Increase::Models::PhysicalCard::Shipment]
      required :shipment, -> { Increase::PhysicalCard::Shipment }

      # @!attribute status
      #   The status of the Physical Card.
      #
      #   @return [Symbol, Increase::Models::PhysicalCard::Status]
      required :status, enum: -> { Increase::PhysicalCard::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `physical_card`.
      #
      #   @return [Symbol, Increase::Models::PhysicalCard::Type]
      required :type, enum: -> { Increase::PhysicalCard::Type }

      # @!method initialize(id:, card_id:, cardholder:, created_at:, idempotency_key:, physical_card_profile_id:, shipment:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PhysicalCard} for more details.
      #
      #   Custom physical Visa cards that are shipped to your customers. The artwork is
      #   configurable by a connected [Card Profile](/documentation/api#card-profiles).
      #   The same Card can be used for multiple Physical Cards. Printing cards incurs a
      #   fee. Please contact [support@increase.com](mailto:support@increase.com) for
      #   pricing!
      #
      #   @param id [String] The physical card identifier.
      #
      #   @param card_id [String] The identifier for the Card this Physical Card represents.
      #
      #   @param cardholder [Increase::Models::PhysicalCard::Cardholder] Details about the cardholder, as it appears on the printed card.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param physical_card_profile_id [String, nil] The Physical Card Profile used for this Physical Card.
      #
      #   @param shipment [Increase::Models::PhysicalCard::Shipment] The details used to ship this physical card.
      #
      #   @param status [Symbol, Increase::Models::PhysicalCard::Status] The status of the Physical Card.
      #
      #   @param type [Symbol, Increase::Models::PhysicalCard::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::PhysicalCard#cardholder
      class Cardholder < Increase::Internal::Type::BaseModel
        # @!attribute first_name
        #   The cardholder's first name.
        #
        #   @return [String]
        required :first_name, String

        # @!attribute last_name
        #   The cardholder's last name.
        #
        #   @return [String]
        required :last_name, String

        # @!method initialize(first_name:, last_name:)
        #   Details about the cardholder, as it appears on the printed card.
        #
        #   @param first_name [String] The cardholder's first name.
        #
        #   @param last_name [String] The cardholder's last name.
      end

      # @see Increase::Models::PhysicalCard#shipment
      class Shipment < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The location to where the card's packing label is addressed.
        #
        #   @return [Increase::Models::PhysicalCard::Shipment::Address]
        required :address, -> { Increase::PhysicalCard::Shipment::Address }

        # @!attribute method_
        #   The shipping method.
        #
        #   @return [Symbol, Increase::Models::PhysicalCard::Shipment::Method]
        required :method_, enum: -> { Increase::PhysicalCard::Shipment::Method }, api_name: :method

        # @!attribute status
        #   The status of this shipment.
        #
        #   @return [Symbol, Increase::Models::PhysicalCard::Shipment::Status]
        required :status, enum: -> { Increase::PhysicalCard::Shipment::Status }

        # @!attribute tracking
        #   Tracking details for the shipment.
        #
        #   @return [Increase::Models::PhysicalCard::Shipment::Tracking, nil]
        required :tracking, -> { Increase::PhysicalCard::Shipment::Tracking }, nil?: true

        # @!method initialize(address:, method_:, status:, tracking:)
        #   The details used to ship this physical card.
        #
        #   @param address [Increase::Models::PhysicalCard::Shipment::Address] The location to where the card's packing label is addressed.
        #
        #   @param method_ [Symbol, Increase::Models::PhysicalCard::Shipment::Method] The shipping method.
        #
        #   @param status [Symbol, Increase::Models::PhysicalCard::Shipment::Status] The status of this shipment.
        #
        #   @param tracking [Increase::Models::PhysicalCard::Shipment::Tracking, nil] Tracking details for the shipment.

        # @see Increase::Models::PhysicalCard::Shipment#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the shipping address.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The first line of the shipping address.
          #
          #   @return [String]
          required :line1, String

          # @!attribute line2
          #   The second line of the shipping address.
          #
          #   @return [String, nil]
          required :line2, String, nil?: true

          # @!attribute line3
          #   The third line of the shipping address.
          #
          #   @return [String, nil]
          required :line3, String, nil?: true

          # @!attribute name
          #   The name of the recipient.
          #
          #   @return [String]
          required :name, String

          # @!attribute postal_code
          #   The postal code of the shipping address.
          #
          #   @return [String]
          required :postal_code, String

          # @!attribute state
          #   The US state of the shipping address.
          #
          #   @return [String]
          required :state, String

          # @!method initialize(city:, line1:, line2:, line3:, name:, postal_code:, state:)
          #   The location to where the card's packing label is addressed.
          #
          #   @param city [String] The city of the shipping address.
          #
          #   @param line1 [String] The first line of the shipping address.
          #
          #   @param line2 [String, nil] The second line of the shipping address.
          #
          #   @param line3 [String, nil] The third line of the shipping address.
          #
          #   @param name [String] The name of the recipient.
          #
          #   @param postal_code [String] The postal code of the shipping address.
          #
          #   @param state [String] The US state of the shipping address.
        end

        # The shipping method.
        #
        # @see Increase::Models::PhysicalCard::Shipment#method_
        module Method
          extend Increase::Internal::Type::Enum

          # USPS Post with tracking.
          USPS = :usps

          # FedEx Priority Overnight, no signature.
          FEDEX_PRIORITY_OVERNIGHT = :fedex_priority_overnight

          # FedEx 2-day.
          FEDEX_2_DAY = :fedex_2_day

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The status of this shipment.
        #
        # @see Increase::Models::PhysicalCard::Shipment#status
        module Status
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

          # The physical card shipment requires attention from Increase before progressing.
          REQUIRES_ATTENTION = :requires_attention

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::PhysicalCard::Shipment#tracking
        class Tracking < Increase::Internal::Type::BaseModel
          # @!attribute number
          #   The tracking number.
          #
          #   @return [String]
          required :number, String

          # @!attribute return_number
          #   For returned shipments, the tracking number of the return shipment.
          #
          #   @return [String, nil]
          required :return_number, String, nil?: true

          # @!attribute return_reason
          #   For returned shipments, this describes why the package was returned.
          #
          #   @return [String, nil]
          required :return_reason, String, nil?: true

          # @!attribute shipped_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the fulfillment provider marked the card as ready for pick-up by the shipment
          #   carrier.
          #
          #   @return [Time]
          required :shipped_at, Time

          # @!attribute updates
          #   Tracking updates relating to the physical card's delivery.
          #
          #   @return [Array<Increase::Models::PhysicalCard::Shipment::Tracking::Update>]
          required :updates,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::PhysicalCard::Shipment::Tracking::Update]
                   }

          # @!method initialize(number:, return_number:, return_reason:, shipped_at:, updates:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::PhysicalCard::Shipment::Tracking} for more details.
          #
          #   Tracking details for the shipment.
          #
          #   @param number [String] The tracking number.
          #
          #   @param return_number [String, nil] For returned shipments, the tracking number of the return shipment.
          #
          #   @param return_reason [String, nil] For returned shipments, this describes why the package was returned.
          #
          #   @param shipped_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param updates [Array<Increase::Models::PhysicalCard::Shipment::Tracking::Update>] Tracking updates relating to the physical card's delivery.

          class Update < Increase::Internal::Type::BaseModel
            # @!attribute carrier_estimated_delivery_at
            #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the
            #   carrier expects the card to be delivered.
            #
            #   @return [Time, nil]
            required :carrier_estimated_delivery_at, Time, nil?: true

            # @!attribute category
            #   The type of tracking event.
            #
            #   @return [Symbol, Increase::Models::PhysicalCard::Shipment::Tracking::Update::Category]
            required :category, enum: -> { Increase::PhysicalCard::Shipment::Tracking::Update::Category }

            # @!attribute city
            #   The city where the event took place.
            #
            #   @return [String, nil]
            required :city, String, nil?: true

            # @!attribute created_at
            #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            #   the tracking event took place.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute postal_code
            #   The postal code where the event took place.
            #
            #   @return [String, nil]
            required :postal_code, String, nil?: true

            # @!attribute state
            #   The state where the event took place.
            #
            #   @return [String, nil]
            required :state, String, nil?: true

            # @!method initialize(carrier_estimated_delivery_at:, category:, city:, created_at:, postal_code:, state:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::PhysicalCard::Shipment::Tracking::Update} for more details.
            #
            #   @param carrier_estimated_delivery_at [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the ca
            #
            #   @param category [Symbol, Increase::Models::PhysicalCard::Shipment::Tracking::Update::Category] The type of tracking event.
            #
            #   @param city [String, nil] The city where the event took place.
            #
            #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
            #
            #   @param postal_code [String, nil] The postal code where the event took place.
            #
            #   @param state [String, nil] The state where the event took place.

            # The type of tracking event.
            #
            # @see Increase::Models::PhysicalCard::Shipment::Tracking::Update#category
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

      # The status of the Physical Card.
      #
      # @see Increase::Models::PhysicalCard#status
      module Status
        extend Increase::Internal::Type::Enum

        # The physical card is active.
        ACTIVE = :active

        # The physical card is temporarily disabled.
        DISABLED = :disabled

        # The physical card is permanently canceled.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `physical_card`.
      #
      # @see Increase::Models::PhysicalCard#type
      module Type
        extend Increase::Internal::Type::Enum

        PHYSICAL_CARD = :physical_card

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
