# typed: strong

module Increase
  module Models
    class PhysicalCard < Increase::Internal::Type::BaseModel
      # The physical card identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Card this Physical Card represents.
      sig { returns(String) }
      attr_accessor :card_id

      # Details about the cardholder, as it appears on the printed card.
      sig { returns(Increase::Models::PhysicalCard::Cardholder) }
      attr_reader :cardholder

      sig { params(cardholder: T.any(Increase::Models::PhysicalCard::Cardholder, Increase::Internal::AnyHash)).void }
      attr_writer :cardholder

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Physical Card was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The Physical Card Profile used for this Physical Card.
      sig { returns(T.nilable(String)) }
      attr_accessor :physical_card_profile_id

      # The details used to ship this physical card.
      sig { returns(Increase::Models::PhysicalCard::Shipment) }
      attr_reader :shipment

      sig { params(shipment: T.any(Increase::Models::PhysicalCard::Shipment, Increase::Internal::AnyHash)).void }
      attr_writer :shipment

      # The status of the Physical Card.
      sig { returns(Increase::Models::PhysicalCard::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      #   `physical_card`.
      sig { returns(Increase::Models::PhysicalCard::Type::TaggedSymbol) }
      attr_accessor :type

      # Custom physical Visa cards that are shipped to your customers. The artwork is
      #   configurable by a connected [Card Profile](/documentation/api#card-profiles).
      #   The same Card can be used for multiple Physical Cards. Printing cards incurs a
      #   fee. Please contact [support@increase.com](mailto:support@increase.com) for
      #   pricing!
      sig do
        params(
          id: String,
          card_id: String,
          cardholder: T.any(Increase::Models::PhysicalCard::Cardholder, Increase::Internal::AnyHash),
          created_at: Time,
          idempotency_key: T.nilable(String),
          physical_card_profile_id: T.nilable(String),
          shipment: T.any(Increase::Models::PhysicalCard::Shipment, Increase::Internal::AnyHash),
          status: Increase::Models::PhysicalCard::Status::OrSymbol,
          type: Increase::Models::PhysicalCard::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        card_id:,
        cardholder:,
        created_at:,
        idempotency_key:,
        physical_card_profile_id:,
        shipment:,
        status:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              card_id: String,
              cardholder: Increase::Models::PhysicalCard::Cardholder,
              created_at: Time,
              idempotency_key: T.nilable(String),
              physical_card_profile_id: T.nilable(String),
              shipment: Increase::Models::PhysicalCard::Shipment,
              status: Increase::Models::PhysicalCard::Status::TaggedSymbol,
              type: Increase::Models::PhysicalCard::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      class Cardholder < Increase::Internal::Type::BaseModel
        # The cardholder's first name.
        sig { returns(String) }
        attr_accessor :first_name

        # The cardholder's last name.
        sig { returns(String) }
        attr_accessor :last_name

        # Details about the cardholder, as it appears on the printed card.
        sig { params(first_name: String, last_name: String).returns(T.attached_class) }
        def self.new(first_name:, last_name:)
        end

        sig { override.returns({first_name: String, last_name: String}) }
        def to_hash
        end
      end

      class Shipment < Increase::Internal::Type::BaseModel
        # The location to where the card's packing label is addressed.
        sig { returns(Increase::Models::PhysicalCard::Shipment::Address) }
        attr_reader :address

        sig { params(address: T.any(Increase::Models::PhysicalCard::Shipment::Address, Increase::Internal::AnyHash)).void }
        attr_writer :address

        # The shipping method.
        sig { returns(Increase::Models::PhysicalCard::Shipment::Method::TaggedSymbol) }
        attr_accessor :method_

        # The status of this shipment.
        sig { returns(Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol) }
        attr_accessor :status

        # Tracking details for the shipment.
        sig { returns(T.nilable(Increase::Models::PhysicalCard::Shipment::Tracking)) }
        attr_reader :tracking

        sig do
          params(
            tracking: T.nilable(T.any(Increase::Models::PhysicalCard::Shipment::Tracking, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :tracking

        # The details used to ship this physical card.
        sig do
          params(
            address: T.any(Increase::Models::PhysicalCard::Shipment::Address, Increase::Internal::AnyHash),
            method_: Increase::Models::PhysicalCard::Shipment::Method::OrSymbol,
            status: Increase::Models::PhysicalCard::Shipment::Status::OrSymbol,
            tracking: T.nilable(T.any(Increase::Models::PhysicalCard::Shipment::Tracking, Increase::Internal::AnyHash))
          )
            .returns(T.attached_class)
        end
        def self.new(address:, method_:, status:, tracking:)
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::PhysicalCard::Shipment::Address,
                method_: Increase::Models::PhysicalCard::Shipment::Method::TaggedSymbol,
                status: Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol,
                tracking: T.nilable(Increase::Models::PhysicalCard::Shipment::Tracking)
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the shipping address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the shipping address.
          sig { returns(String) }
          attr_accessor :line1

          # The second line of the shipping address.
          sig { returns(T.nilable(String)) }
          attr_accessor :line2

          # The third line of the shipping address.
          sig { returns(T.nilable(String)) }
          attr_accessor :line3

          # The name of the recipient.
          sig { returns(String) }
          attr_accessor :name

          # The postal code of the shipping address.
          sig { returns(String) }
          attr_accessor :postal_code

          # The US state of the shipping address.
          sig { returns(String) }
          attr_accessor :state

          # The location to where the card's packing label is addressed.
          sig do
            params(
              city: String,
              line1: String,
              line2: T.nilable(String),
              line3: T.nilable(String),
              name: String,
              postal_code: String,
              state: String
            )
              .returns(T.attached_class)
          end
          def self.new(city:, line1:, line2:, line3:, name:, postal_code:, state:)
          end

          sig do
            override
              .returns(
                {
                  city: String,
                  line1: String,
                  line2: T.nilable(String),
                  line3: T.nilable(String),
                  name: String,
                  postal_code: String,
                  state: String
                }
              )
          end
          def to_hash
          end
        end

        # The shipping method.
        module Method
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::PhysicalCard::Shipment::Method) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::PhysicalCard::Shipment::Method::TaggedSymbol) }

          # USPS Post with tracking.
          USPS = T.let(:usps, Increase::Models::PhysicalCard::Shipment::Method::TaggedSymbol)

          # FedEx Priority Overnight, no signature.
          FEDEX_PRIORITY_OVERNIGHT =
            T.let(:fedex_priority_overnight, Increase::Models::PhysicalCard::Shipment::Method::TaggedSymbol)

          # FedEx 2-day.
          FEDEX_2_DAY = T.let(:fedex_2_day, Increase::Models::PhysicalCard::Shipment::Method::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::PhysicalCard::Shipment::Method::TaggedSymbol]) }
          def self.values
          end
        end

        # The status of this shipment.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::PhysicalCard::Shipment::Status) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol) }

          # The physical card has not yet been shipped.
          PENDING = T.let(:pending, Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol)

          # The physical card shipment was canceled prior to submission.
          CANCELED = T.let(:canceled, Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol)

          # The physical card shipment has been submitted to the card fulfillment provider.
          SUBMITTED = T.let(:submitted, Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol)

          # The physical card shipment has been acknowledged by the card fulfillment provider and will be processed in their next batch.
          ACKNOWLEDGED = T.let(:acknowledged, Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol)

          # The physical card shipment was rejected by the card printer due to an error.
          REJECTED = T.let(:rejected, Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol)

          # The physical card has been shipped.
          SHIPPED = T.let(:shipped, Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol)

          # The physical card shipment was returned to the sender and destroyed by the production facility.
          RETURNED = T.let(:returned, Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::PhysicalCard::Shipment::Status::TaggedSymbol]) }
          def self.values
          end
        end

        class Tracking < Increase::Internal::Type::BaseModel
          # The tracking number.
          sig { returns(String) }
          attr_accessor :number

          # For returned shipments, the tracking number of the return shipment.
          sig { returns(T.nilable(String)) }
          attr_accessor :return_number

          # For returned shipments, this describes why the package was returned.
          sig { returns(T.nilable(String)) }
          attr_accessor :return_reason

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the fulfillment provider marked the card as ready for pick-up by the shipment
          #   carrier.
          sig { returns(Time) }
          attr_accessor :shipped_at

          # Tracking details for the shipment.
          sig do
            params(
              number: String,
              return_number: T.nilable(String),
              return_reason: T.nilable(String),
              shipped_at: Time
            )
              .returns(T.attached_class)
          end
          def self.new(number:, return_number:, return_reason:, shipped_at:)
          end

          sig do
            override
              .returns(
                {
                  number: String,
                  return_number: T.nilable(String),
                  return_reason: T.nilable(String),
                  shipped_at: Time
                }
              )
          end
          def to_hash
          end
        end
      end

      # The status of the Physical Card.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::PhysicalCard::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::PhysicalCard::Status::TaggedSymbol) }

        # The physical card is active.
        ACTIVE = T.let(:active, Increase::Models::PhysicalCard::Status::TaggedSymbol)

        # The physical card is temporarily disabled.
        DISABLED = T.let(:disabled, Increase::Models::PhysicalCard::Status::TaggedSymbol)

        # The physical card is permanently canceled.
        CANCELED = T.let(:canceled, Increase::Models::PhysicalCard::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::PhysicalCard::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `physical_card`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::PhysicalCard::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::PhysicalCard::Type::TaggedSymbol) }

        PHYSICAL_CARD = T.let(:physical_card, Increase::Models::PhysicalCard::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::PhysicalCard::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
