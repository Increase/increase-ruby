# typed: strong

module Increase
  module Models
    class BeneficialOwnerUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::BeneficialOwnerUpdateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Beneficial Owner to update.
      sig { returns(String) }
      attr_accessor :entity_beneficial_owner_id

      # The individual's physical address. Mail receiving locations like PO Boxes and
      # PMB's are disallowed.
      sig { returns(T.nilable(Increase::BeneficialOwnerUpdateParams::Address)) }
      attr_reader :address

      sig do
        params(
          address: Increase::BeneficialOwnerUpdateParams::Address::OrHash
        ).void
      end
      attr_writer :address

      sig do
        params(
          entity_beneficial_owner_id: String,
          address: Increase::BeneficialOwnerUpdateParams::Address::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Beneficial Owner to update.
        entity_beneficial_owner_id:,
        # The individual's physical address. Mail receiving locations like PO Boxes and
        # PMB's are disallowed.
        address: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            entity_beneficial_owner_id: String,
            address: Increase::BeneficialOwnerUpdateParams::Address,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Address < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::BeneficialOwnerUpdateParams::Address,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(String) }
        attr_accessor :city

        # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
        sig { returns(String) }
        attr_accessor :country

        # The first line of the address. This is usually the street number and street.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address. This might be the floor or room number.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # The two-letter United States Postal Service (USPS) abbreviation for the US
        # state, province, or region of the address. Required in certain countries.
        sig { returns(T.nilable(String)) }
        attr_reader :state

        sig { params(state: String).void }
        attr_writer :state

        # The ZIP or postal code of the address. Required in certain countries.
        sig { returns(T.nilable(String)) }
        attr_reader :zip

        sig { params(zip: String).void }
        attr_writer :zip

        # The individual's physical address. Mail receiving locations like PO Boxes and
        # PMB's are disallowed.
        sig do
          params(
            city: String,
            country: String,
            line1: String,
            line2: String,
            state: String,
            zip: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
          country:,
          # The first line of the address. This is usually the street number and street.
          line1:,
          # The second line of the address. This might be the floor or room number.
          line2: nil,
          # The two-letter United States Postal Service (USPS) abbreviation for the US
          # state, province, or region of the address. Required in certain countries.
          state: nil,
          # The ZIP or postal code of the address. Required in certain countries.
          zip: nil
        )
        end

        sig do
          override.returns(
            {
              city: String,
              country: String,
              line1: String,
              line2: String,
              state: String,
              zip: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
