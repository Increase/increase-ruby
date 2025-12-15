# typed: strong

module Increase
  module Models
    class PhysicalCard < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::PhysicalCard, Increase::Internal::AnyHash)
        end

      # The physical card identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Card this Physical Card represents.
      sig { returns(String) }
      attr_accessor :card_id

      # Details about the cardholder, as it appears on the printed card.
      sig { returns(Increase::PhysicalCard::Cardholder) }
      attr_reader :cardholder

      sig do
        params(cardholder: Increase::PhysicalCard::Cardholder::OrHash).void
      end
      attr_writer :cardholder

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Physical Card was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The Physical Card Profile used for this Physical Card.
      sig { returns(T.nilable(String)) }
      attr_accessor :physical_card_profile_id

      # The details used to ship this physical card.
      sig { returns(Increase::PhysicalCard::Shipment) }
      attr_reader :shipment

      sig { params(shipment: Increase::PhysicalCard::Shipment::OrHash).void }
      attr_writer :shipment

      # The status of the Physical Card.
      sig { returns(Increase::PhysicalCard::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `physical_card`.
      sig { returns(Increase::PhysicalCard::Type::TaggedSymbol) }
      attr_accessor :type

      # Custom physical Visa cards that are shipped to your customers. The artwork is
      # configurable by a connected [Card Profile](/documentation/api#card-profiles).
      # The same Card can be used for multiple Physical Cards. Printing cards incurs a
      # fee. Please contact [support@increase.com](mailto:support@increase.com) for
      # pricing!
      sig do
        params(
          id: String,
          card_id: String,
          cardholder: Increase::PhysicalCard::Cardholder::OrHash,
          created_at: Time,
          idempotency_key: T.nilable(String),
          physical_card_profile_id: T.nilable(String),
          shipment: Increase::PhysicalCard::Shipment::OrHash,
          status: Increase::PhysicalCard::Status::OrSymbol,
          type: Increase::PhysicalCard::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The physical card identifier.
        id:,
        # The identifier for the Card this Physical Card represents.
        card_id:,
        # Details about the cardholder, as it appears on the printed card.
        cardholder:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Physical Card was created.
        created_at:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The Physical Card Profile used for this Physical Card.
        physical_card_profile_id:,
        # The details used to ship this physical card.
        shipment:,
        # The status of the Physical Card.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `physical_card`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            card_id: String,
            cardholder: Increase::PhysicalCard::Cardholder,
            created_at: Time,
            idempotency_key: T.nilable(String),
            physical_card_profile_id: T.nilable(String),
            shipment: Increase::PhysicalCard::Shipment,
            status: Increase::PhysicalCard::Status::TaggedSymbol,
            type: Increase::PhysicalCard::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Cardholder < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::PhysicalCard::Cardholder,
              Increase::Internal::AnyHash
            )
          end

        # The cardholder's first name.
        sig { returns(String) }
        attr_accessor :first_name

        # The cardholder's last name.
        sig { returns(String) }
        attr_accessor :last_name

        # Details about the cardholder, as it appears on the printed card.
        sig do
          params(first_name: String, last_name: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The cardholder's first name.
          first_name:,
          # The cardholder's last name.
          last_name:
        )
        end

        sig { override.returns({ first_name: String, last_name: String }) }
        def to_hash
        end
      end

      class Shipment < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::PhysicalCard::Shipment, Increase::Internal::AnyHash)
          end

        # The location to where the card's packing label is addressed.
        sig { returns(Increase::PhysicalCard::Shipment::Address) }
        attr_reader :address

        sig do
          params(
            address: Increase::PhysicalCard::Shipment::Address::OrHash
          ).void
        end
        attr_writer :address

        # The shipping method.
        sig { returns(Increase::PhysicalCard::Shipment::Method::TaggedSymbol) }
        attr_accessor :method_

        # When this physical card should be produced by the card printer. The default
        # timeline is the day after the card printer receives the order, except for
        # `FEDEX_PRIORITY_OVERNIGHT` cards, which default to `SAME_DAY`. To use faster
        # production methods, please reach out to
        # [support@increase.com](mailto:support@increase.com).
        sig do
          returns(Increase::PhysicalCard::Shipment::Schedule::TaggedSymbol)
        end
        attr_accessor :schedule

        # The status of this shipment.
        sig { returns(Increase::PhysicalCard::Shipment::Status::TaggedSymbol) }
        attr_accessor :status

        # Tracking details for the shipment.
        sig { returns(T.nilable(Increase::PhysicalCard::Shipment::Tracking)) }
        attr_reader :tracking

        sig do
          params(
            tracking:
              T.nilable(Increase::PhysicalCard::Shipment::Tracking::OrHash)
          ).void
        end
        attr_writer :tracking

        # The details used to ship this physical card.
        sig do
          params(
            address: Increase::PhysicalCard::Shipment::Address::OrHash,
            method_: Increase::PhysicalCard::Shipment::Method::OrSymbol,
            schedule: Increase::PhysicalCard::Shipment::Schedule::OrSymbol,
            status: Increase::PhysicalCard::Shipment::Status::OrSymbol,
            tracking:
              T.nilable(Increase::PhysicalCard::Shipment::Tracking::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # The location to where the card's packing label is addressed.
          address:,
          # The shipping method.
          method_:,
          # When this physical card should be produced by the card printer. The default
          # timeline is the day after the card printer receives the order, except for
          # `FEDEX_PRIORITY_OVERNIGHT` cards, which default to `SAME_DAY`. To use faster
          # production methods, please reach out to
          # [support@increase.com](mailto:support@increase.com).
          schedule:,
          # The status of this shipment.
          status:,
          # Tracking details for the shipment.
          tracking:
        )
        end

        sig do
          override.returns(
            {
              address: Increase::PhysicalCard::Shipment::Address,
              method_: Increase::PhysicalCard::Shipment::Method::TaggedSymbol,
              schedule:
                Increase::PhysicalCard::Shipment::Schedule::TaggedSymbol,
              status: Increase::PhysicalCard::Shipment::Status::TaggedSymbol,
              tracking: T.nilable(Increase::PhysicalCard::Shipment::Tracking)
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PhysicalCard::Shipment::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the shipping address.
          sig { returns(String) }
          attr_accessor :city

          # The country of the shipping address.
          sig { returns(String) }
          attr_accessor :country

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

          # The state of the shipping address.
          sig { returns(String) }
          attr_accessor :state

          # The location to where the card's packing label is addressed.
          sig do
            params(
              city: String,
              country: String,
              line1: String,
              line2: T.nilable(String),
              line3: T.nilable(String),
              name: String,
              postal_code: String,
              state: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the shipping address.
            city:,
            # The country of the shipping address.
            country:,
            # The first line of the shipping address.
            line1:,
            # The second line of the shipping address.
            line2:,
            # The third line of the shipping address.
            line3:,
            # The name of the recipient.
            name:,
            # The postal code of the shipping address.
            postal_code:,
            # The state of the shipping address.
            state:
          )
          end

          sig do
            override.returns(
              {
                city: String,
                country: String,
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

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::PhysicalCard::Shipment::Method)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # USPS Post.
          USPS =
            T.let(:usps, Increase::PhysicalCard::Shipment::Method::TaggedSymbol)

          # FedEx Priority Overnight, no signature.
          FEDEX_PRIORITY_OVERNIGHT =
            T.let(
              :fedex_priority_overnight,
              Increase::PhysicalCard::Shipment::Method::TaggedSymbol
            )

          # FedEx 2-day.
          FEDEX_2_DAY =
            T.let(
              :fedex_2_day,
              Increase::PhysicalCard::Shipment::Method::TaggedSymbol
            )

          # DHL Worldwide Express, international shipping only.
          DHL_WORLDWIDE_EXPRESS =
            T.let(
              :dhl_worldwide_express,
              Increase::PhysicalCard::Shipment::Method::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::PhysicalCard::Shipment::Method::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        # When this physical card should be produced by the card printer. The default
        # timeline is the day after the card printer receives the order, except for
        # `FEDEX_PRIORITY_OVERNIGHT` cards, which default to `SAME_DAY`. To use faster
        # production methods, please reach out to
        # [support@increase.com](mailto:support@increase.com).
        module Schedule
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::PhysicalCard::Shipment::Schedule)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The physical card will be shipped one business day after the order is received by the card printer. A card that is submitted to Increase on a Monday evening (Pacific Time) will ship out on Wednesday.
          NEXT_DAY =
            T.let(
              :next_day,
              Increase::PhysicalCard::Shipment::Schedule::TaggedSymbol
            )

          # The physical card will be shipped on the same business day that the order is received by the card printer. A card that is submitted to Increase on a Monday evening (Pacific Time) will ship out on Tuesday.
          SAME_DAY =
            T.let(
              :same_day,
              Increase::PhysicalCard::Shipment::Schedule::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::PhysicalCard::Shipment::Schedule::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        # The status of this shipment.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::PhysicalCard::Shipment::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The physical card has not yet been shipped.
          PENDING =
            T.let(
              :pending,
              Increase::PhysicalCard::Shipment::Status::TaggedSymbol
            )

          # The physical card shipment was canceled prior to submission.
          CANCELED =
            T.let(
              :canceled,
              Increase::PhysicalCard::Shipment::Status::TaggedSymbol
            )

          # The physical card shipment has been submitted to the card fulfillment provider.
          SUBMITTED =
            T.let(
              :submitted,
              Increase::PhysicalCard::Shipment::Status::TaggedSymbol
            )

          # The physical card shipment has been acknowledged by the card fulfillment provider and will be processed in their next batch.
          ACKNOWLEDGED =
            T.let(
              :acknowledged,
              Increase::PhysicalCard::Shipment::Status::TaggedSymbol
            )

          # The physical card shipment was rejected by the card printer due to an error.
          REJECTED =
            T.let(
              :rejected,
              Increase::PhysicalCard::Shipment::Status::TaggedSymbol
            )

          # The physical card has been shipped.
          SHIPPED =
            T.let(
              :shipped,
              Increase::PhysicalCard::Shipment::Status::TaggedSymbol
            )

          # The physical card shipment was returned to the sender and destroyed by the production facility.
          RETURNED =
            T.let(
              :returned,
              Increase::PhysicalCard::Shipment::Status::TaggedSymbol
            )

          # The physical card shipment requires attention from Increase before progressing.
          REQUIRES_ATTENTION =
            T.let(
              :requires_attention,
              Increase::PhysicalCard::Shipment::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::PhysicalCard::Shipment::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class Tracking < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PhysicalCard::Shipment::Tracking,
                Increase::Internal::AnyHash
              )
            end

          # The tracking number. Not available for USPS shipments.
          sig { returns(T.nilable(String)) }
          attr_accessor :number

          # For returned shipments, the tracking number of the return shipment.
          sig { returns(T.nilable(String)) }
          attr_accessor :return_number

          # For returned shipments, this describes why the package was returned.
          sig { returns(T.nilable(String)) }
          attr_accessor :return_reason

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the fulfillment provider marked the card as ready for pick-up by the shipment
          # carrier.
          sig { returns(Time) }
          attr_accessor :shipped_at

          # Tracking updates relating to the physical card's delivery.
          sig do
            returns(
              T::Array[Increase::PhysicalCard::Shipment::Tracking::Update]
            )
          end
          attr_accessor :updates

          # Tracking details for the shipment.
          sig do
            params(
              number: T.nilable(String),
              return_number: T.nilable(String),
              return_reason: T.nilable(String),
              shipped_at: Time,
              updates:
                T::Array[
                  Increase::PhysicalCard::Shipment::Tracking::Update::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # The tracking number. Not available for USPS shipments.
            number:,
            # For returned shipments, the tracking number of the return shipment.
            return_number:,
            # For returned shipments, this describes why the package was returned.
            return_reason:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the fulfillment provider marked the card as ready for pick-up by the shipment
            # carrier.
            shipped_at:,
            # Tracking updates relating to the physical card's delivery.
            updates:
          )
          end

          sig do
            override.returns(
              {
                number: T.nilable(String),
                return_number: T.nilable(String),
                return_reason: T.nilable(String),
                shipped_at: Time,
                updates:
                  T::Array[Increase::PhysicalCard::Shipment::Tracking::Update]
              }
            )
          end
          def to_hash
          end

          class Update < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::PhysicalCard::Shipment::Tracking::Update,
                  Increase::Internal::AnyHash
                )
              end

            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the
            # carrier expects the card to be delivered.
            sig { returns(T.nilable(Time)) }
            attr_accessor :carrier_estimated_delivery_at

            # The type of tracking event.
            sig do
              returns(
                Increase::PhysicalCard::Shipment::Tracking::Update::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # The city where the event took place.
            sig { returns(T.nilable(String)) }
            attr_accessor :city

            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the tracking event took place.
            sig { returns(Time) }
            attr_accessor :created_at

            # The postal code where the event took place.
            sig { returns(T.nilable(String)) }
            attr_accessor :postal_code

            # The state where the event took place.
            sig { returns(T.nilable(String)) }
            attr_accessor :state

            sig do
              params(
                carrier_estimated_delivery_at: T.nilable(Time),
                category:
                  Increase::PhysicalCard::Shipment::Tracking::Update::Category::OrSymbol,
                city: T.nilable(String),
                created_at: Time,
                postal_code: T.nilable(String),
                state: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time when the
              # carrier expects the card to be delivered.
              carrier_estimated_delivery_at:,
              # The type of tracking event.
              category:,
              # The city where the event took place.
              city:,
              # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
              # the tracking event took place.
              created_at:,
              # The postal code where the event took place.
              postal_code:,
              # The state where the event took place.
              state:
            )
            end

            sig do
              override.returns(
                {
                  carrier_estimated_delivery_at: T.nilable(Time),
                  category:
                    Increase::PhysicalCard::Shipment::Tracking::Update::Category::TaggedSymbol,
                  city: T.nilable(String),
                  created_at: Time,
                  postal_code: T.nilable(String),
                  state: T.nilable(String)
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
                    Increase::PhysicalCard::Shipment::Tracking::Update::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # The physical card is in transit.
              IN_TRANSIT =
                T.let(
                  :in_transit,
                  Increase::PhysicalCard::Shipment::Tracking::Update::Category::TaggedSymbol
                )

              # The physical card has been processed for delivery.
              PROCESSED_FOR_DELIVERY =
                T.let(
                  :processed_for_delivery,
                  Increase::PhysicalCard::Shipment::Tracking::Update::Category::TaggedSymbol
                )

              # The physical card has been delivered.
              DELIVERED =
                T.let(
                  :delivered,
                  Increase::PhysicalCard::Shipment::Tracking::Update::Category::TaggedSymbol
                )

              # There is an issue preventing delivery. The delivery will be attempted again if possible. If the issue cannot be resolved, the physical card will be returned to sender.
              DELIVERY_ISSUE =
                T.let(
                  :delivery_issue,
                  Increase::PhysicalCard::Shipment::Tracking::Update::Category::TaggedSymbol
                )

              # Delivery failed and the physical card was returned to sender.
              RETURNED_TO_SENDER =
                T.let(
                  :returned_to_sender,
                  Increase::PhysicalCard::Shipment::Tracking::Update::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::PhysicalCard::Shipment::Tracking::Update::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end

      # The status of the Physical Card.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PhysicalCard::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The physical card is active.
        ACTIVE = T.let(:active, Increase::PhysicalCard::Status::TaggedSymbol)

        # The physical card is temporarily disabled.
        DISABLED =
          T.let(:disabled, Increase::PhysicalCard::Status::TaggedSymbol)

        # The physical card is permanently canceled.
        CANCELED =
          T.let(:canceled, Increase::PhysicalCard::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::PhysicalCard::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `physical_card`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PhysicalCard::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PHYSICAL_CARD =
          T.let(:physical_card, Increase::PhysicalCard::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::PhysicalCard::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
