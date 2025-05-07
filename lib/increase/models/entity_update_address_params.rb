# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#update_address
    class EntityUpdateAddressParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute address
      #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
      #   are disallowed.
      #
      #   @return [Increase::EntityUpdateAddressParams::Address]
      required :address, -> { Increase::EntityUpdateAddressParams::Address }

      # @!method initialize(address:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityUpdateAddressParams} for more details.
      #
      #   @param address [Increase::EntityUpdateAddressParams::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Address < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the address.
        #
        #   @return [String]
        required :city, String

        # @!attribute line1
        #   The first line of the address. This is usually the street number and street.
        #
        #   @return [String]
        required :line1, String

        # @!attribute state
        #   The two-letter United States Postal Service (USPS) abbreviation for the state of
        #   the address.
        #
        #   @return [String]
        required :state, String

        # @!attribute zip
        #   The ZIP code of the address.
        #
        #   @return [String]
        required :zip, String

        # @!attribute line2
        #   The second line of the address. This might be the floor or room number.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!method initialize(city:, line1:, state:, zip:, line2: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::EntityUpdateAddressParams::Address} for more details.
        #
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        #
        #   @param city [String] The city of the address.
        #
        #   @param line1 [String] The first line of the address. This is usually the street number and street.
        #
        #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
        #
        #   @param zip [String] The ZIP code of the address.
        #
        #   @param line2 [String] The second line of the address. This might be the floor or room number.
      end
    end
  end
end
