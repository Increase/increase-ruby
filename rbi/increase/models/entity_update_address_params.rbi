# typed: strong

module Increase
  module Models
    class EntityUpdateAddressParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
      # are disallowed.
      sig { returns(Increase::EntityUpdateAddressParams::Address) }
      attr_reader :address

      sig do
        params(
          address: Increase::EntityUpdateAddressParams::Address::OrHash
        ).void
      end
      attr_writer :address

      sig do
        params(
          address: Increase::EntityUpdateAddressParams::Address::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        address:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            address: Increase::EntityUpdateAddressParams::Address,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Address < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The city of the address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the address. This is usually the street number and street.
        sig { returns(String) }
        attr_accessor :line1

        # The two-letter United States Postal Service (USPS) abbreviation for the state of
        # the address.
        sig { returns(String) }
        attr_accessor :state

        # The ZIP code of the address.
        sig { returns(String) }
        attr_accessor :zip

        # The second line of the address. This might be the floor or room number.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig do
          params(
            city: String,
            line1: String,
            state: String,
            zip: String,
            line2: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the address.
          city:,
          # The first line of the address. This is usually the street number and street.
          line1:,
          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
          state:,
          # The ZIP code of the address.
          zip:,
          # The second line of the address. This might be the floor or room number.
          line2: nil
        )
        end

        sig do
          override.returns(
            {
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
