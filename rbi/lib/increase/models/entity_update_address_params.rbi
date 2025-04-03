# typed: strong

module Increase
  module Models
    class EntityUpdateAddressParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
      #   are disallowed.
      sig { returns(Increase::Models::EntityUpdateAddressParams::Address) }
      attr_reader :address

      sig do
        params(address: T.any(Increase::Models::EntityUpdateAddressParams::Address, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :address

      sig do
        params(
          address: T.any(Increase::Models::EntityUpdateAddressParams::Address, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(address:, request_options: {})
      end

      sig do
        override
          .returns(
            {address: Increase::Models::EntityUpdateAddressParams::Address, request_options: Increase::RequestOptions}
          )
      end
      def to_hash
      end

      class Address < Increase::Internal::Type::BaseModel
        # The city of the address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the address. This is usually the street number and street.
        sig { returns(String) }
        attr_accessor :line1

        # The two-letter United States Postal Service (USPS) abbreviation for the state of
        #   the address.
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
        #   are disallowed.
        sig do
          params(
            city: String,
            line1: String,
            state: String,
            zip: String,
            line2: String
          ).returns(T.attached_class)
        end
        def self.new(city:, line1:, state:, zip:, line2: nil)
        end

        sig { override.returns({city: String, line1: String, state: String, zip: String, line2: String}) }
        def to_hash
        end
      end
    end
  end
end
