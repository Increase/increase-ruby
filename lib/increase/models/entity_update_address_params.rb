# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#update_address
    class EntityUpdateAddressParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute address
      #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
      #     are disallowed.
      #
      #   @return [Increase::Models::EntityUpdateAddressParams::Address]
      required :address, -> { Increase::Models::EntityUpdateAddressParams::Address }

      # @!parse
      #   # @param address [Increase::Models::EntityUpdateAddressParams::Address]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(address:, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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
        #     the address.
        #
        #   @return [String]
        required :state, String

        # @!attribute zip
        #   The ZIP code of the address.
        #
        #   @return [String]
        required :zip, String

        # @!attribute [r] line2
        #   The second line of the address. This might be the floor or room number.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :line2

        # @!parse
        #   # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   #   are disallowed.
        #   #
        #   # @param city [String]
        #   # @param line1 [String]
        #   # @param state [String]
        #   # @param zip [String]
        #   # @param line2 [String]
        #   #
        #   def initialize(city:, line1:, state:, zip:, line2: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
