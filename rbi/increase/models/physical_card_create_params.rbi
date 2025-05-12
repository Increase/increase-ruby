# typed: strong

module Increase
  module Models
    class PhysicalCardCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::PhysicalCardCreateParams, Increase::Internal::AnyHash)
        end

      # The underlying card representing this physical card.
      sig { returns(String) }
      attr_accessor :card_id

      # Details about the cardholder, as it will appear on the physical card.
      sig { returns(Increase::PhysicalCardCreateParams::Cardholder) }
      attr_reader :cardholder

      sig do
        params(
          cardholder: Increase::PhysicalCardCreateParams::Cardholder::OrHash
        ).void
      end
      attr_writer :cardholder

      # The details used to ship this physical card.
      sig { returns(Increase::PhysicalCardCreateParams::Shipment) }
      attr_reader :shipment

      sig do
        params(
          shipment: Increase::PhysicalCardCreateParams::Shipment::OrHash
        ).void
      end
      attr_writer :shipment

      # The physical card profile to use for this physical card. The latest default
      # physical card profile will be used if not provided.
      sig { returns(T.nilable(String)) }
      attr_reader :physical_card_profile_id

      sig { params(physical_card_profile_id: String).void }
      attr_writer :physical_card_profile_id

      sig do
        params(
          card_id: String,
          cardholder: Increase::PhysicalCardCreateParams::Cardholder::OrHash,
          shipment: Increase::PhysicalCardCreateParams::Shipment::OrHash,
          physical_card_profile_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The underlying card representing this physical card.
        card_id:,
        # Details about the cardholder, as it will appear on the physical card.
        cardholder:,
        # The details used to ship this physical card.
        shipment:,
        # The physical card profile to use for this physical card. The latest default
        # physical card profile will be used if not provided.
        physical_card_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            card_id: String,
            cardholder: Increase::PhysicalCardCreateParams::Cardholder,
            shipment: Increase::PhysicalCardCreateParams::Shipment,
            physical_card_profile_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Cardholder < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::PhysicalCardCreateParams::Cardholder,
              Increase::Internal::AnyHash
            )
          end

        # The cardholder's first name.
        sig { returns(String) }
        attr_accessor :first_name

        # The cardholder's last name.
        sig { returns(String) }
        attr_accessor :last_name

        # Details about the cardholder, as it will appear on the physical card.
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
            T.any(
              Increase::PhysicalCardCreateParams::Shipment,
              Increase::Internal::AnyHash
            )
          end

        # The address to where the card should be shipped.
        sig { returns(Increase::PhysicalCardCreateParams::Shipment::Address) }
        attr_reader :address

        sig do
          params(
            address:
              Increase::PhysicalCardCreateParams::Shipment::Address::OrHash
          ).void
        end
        attr_writer :address

        # The shipping method to use.
        sig do
          returns(
            Increase::PhysicalCardCreateParams::Shipment::Method::OrSymbol
          )
        end
        attr_accessor :method_

        # The details used to ship this physical card.
        sig do
          params(
            address:
              Increase::PhysicalCardCreateParams::Shipment::Address::OrHash,
            method_:
              Increase::PhysicalCardCreateParams::Shipment::Method::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The address to where the card should be shipped.
          address:,
          # The shipping method to use.
          method_:
        )
        end

        sig do
          override.returns(
            {
              address: Increase::PhysicalCardCreateParams::Shipment::Address,
              method_:
                Increase::PhysicalCardCreateParams::Shipment::Method::OrSymbol
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PhysicalCardCreateParams::Shipment::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the shipping address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the shipping address.
          sig { returns(String) }
          attr_accessor :line1

          # The name of the recipient.
          sig { returns(String) }
          attr_accessor :name

          # The postal code of the shipping address.
          sig { returns(String) }
          attr_accessor :postal_code

          # The US state of the shipping address.
          sig { returns(String) }
          attr_accessor :state

          # The second line of the shipping address.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The third line of the shipping address.
          sig { returns(T.nilable(String)) }
          attr_reader :line3

          sig { params(line3: String).void }
          attr_writer :line3

          # The phone number of the recipient.
          sig { returns(T.nilable(String)) }
          attr_reader :phone_number

          sig { params(phone_number: String).void }
          attr_writer :phone_number

          # The address to where the card should be shipped.
          sig do
            params(
              city: String,
              line1: String,
              name: String,
              postal_code: String,
              state: String,
              line2: String,
              line3: String,
              phone_number: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the shipping address.
            city:,
            # The first line of the shipping address.
            line1:,
            # The name of the recipient.
            name:,
            # The postal code of the shipping address.
            postal_code:,
            # The US state of the shipping address.
            state:,
            # The second line of the shipping address.
            line2: nil,
            # The third line of the shipping address.
            line3: nil,
            # The phone number of the recipient.
            phone_number: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                name: String,
                postal_code: String,
                state: String,
                line2: String,
                line3: String,
                phone_number: String
              }
            )
          end
          def to_hash
          end
        end

        # The shipping method to use.
        module Method
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::PhysicalCardCreateParams::Shipment::Method
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # USPS Post with tracking.
          USPS =
            T.let(
              :usps,
              Increase::PhysicalCardCreateParams::Shipment::Method::TaggedSymbol
            )

          # FedEx Priority Overnight, no signature.
          FEDEX_PRIORITY_OVERNIGHT =
            T.let(
              :fedex_priority_overnight,
              Increase::PhysicalCardCreateParams::Shipment::Method::TaggedSymbol
            )

          # FedEx 2-day.
          FEDEX_2_DAY =
            T.let(
              :fedex_2_day,
              Increase::PhysicalCardCreateParams::Shipment::Method::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::PhysicalCardCreateParams::Shipment::Method::TaggedSymbol
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
