# typed: strong

module Increase
  module Models
    class EntityUpdateBeneficialOwnerAddressParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::EntityUpdateBeneficialOwnerAddressParams,
            Increase::Internal::AnyHash
          )
        end

      # The individual's physical address. Mail receiving locations like PO Boxes and
      # PMB's are disallowed.
      sig do
        returns(Increase::EntityUpdateBeneficialOwnerAddressParams::Address)
      end
      attr_reader :address

      sig do
        params(
          address:
            Increase::EntityUpdateBeneficialOwnerAddressParams::Address::OrHash
        ).void
      end
      attr_writer :address

      # The identifying details of anyone controlling or owning 25% or more of the
      # corporation.
      sig { returns(String) }
      attr_accessor :beneficial_owner_id

      sig do
        params(
          address:
            Increase::EntityUpdateBeneficialOwnerAddressParams::Address::OrHash,
          beneficial_owner_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The individual's physical address. Mail receiving locations like PO Boxes and
        # PMB's are disallowed.
        address:,
        # The identifying details of anyone controlling or owning 25% or more of the
        # corporation.
        beneficial_owner_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            address:
              Increase::EntityUpdateBeneficialOwnerAddressParams::Address,
            beneficial_owner_id: String,
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
              Increase::EntityUpdateBeneficialOwnerAddressParams::Address,
              Increase::Internal::AnyHash
            )
          end

        # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
        sig { returns(String) }
        attr_accessor :country

        # The first line of the address. This is usually the street number and street.
        sig { returns(String) }
        attr_accessor :line1

        # The city, district, town, or village of the address. Required in certain
        # countries.
        sig { returns(T.nilable(String)) }
        attr_reader :city

        sig { params(city: String).void }
        attr_writer :city

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
            country: String,
            line1: String,
            city: String,
            line2: String,
            state: String,
            zip: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
          country:,
          # The first line of the address. This is usually the street number and street.
          line1:,
          # The city, district, town, or village of the address. Required in certain
          # countries.
          city: nil,
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
              country: String,
              line1: String,
              city: String,
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
