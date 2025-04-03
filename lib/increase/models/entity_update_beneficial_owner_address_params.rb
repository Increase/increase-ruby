# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#update_beneficial_owner_address
    class EntityUpdateBeneficialOwnerAddressParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute address
      #   The individual's physical address. Mail receiving locations like PO Boxes and
      #     PMB's are disallowed.
      #
      #   @return [Increase::Models::EntityUpdateBeneficialOwnerAddressParams::Address]
      required :address, -> { Increase::Models::EntityUpdateBeneficialOwnerAddressParams::Address }

      # @!attribute beneficial_owner_id
      #   The identifying details of anyone controlling or owning 25% or more of the
      #     corporation.
      #
      #   @return [String]
      required :beneficial_owner_id, String

      # @!parse
      #   # @param address [Increase::Models::EntityUpdateBeneficialOwnerAddressParams::Address]
      #   # @param beneficial_owner_id [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(address:, beneficial_owner_id:, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class Address < Increase::Internal::Type::BaseModel
        # @!attribute country
        #   The two-letter ISO 3166-1 alpha-2 code for the country of the address.
        #
        #   @return [String]
        required :country, String

        # @!attribute line1
        #   The first line of the address. This is usually the street number and street.
        #
        #   @return [String]
        required :line1, String

        # @!attribute [r] city
        #   The city, district, town, or village of the address. Required in certain
        #     countries.
        #
        #   @return [String, nil]
        optional :city, String

        # @!parse
        #   # @return [String]
        #   attr_writer :city

        # @!attribute [r] line2
        #   The second line of the address. This might be the floor or room number.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :line2

        # @!attribute [r] state
        #   The two-letter United States Postal Service (USPS) abbreviation for the US
        #     state, province, or region of the address. Required in certain countries.
        #
        #   @return [String, nil]
        optional :state, String

        # @!parse
        #   # @return [String]
        #   attr_writer :state

        # @!attribute [r] zip
        #   The ZIP or postal code of the address. Required in certain countries.
        #
        #   @return [String, nil]
        optional :zip, String

        # @!parse
        #   # @return [String]
        #   attr_writer :zip

        # @!parse
        #   # The individual's physical address. Mail receiving locations like PO Boxes and
        #   #   PMB's are disallowed.
        #   #
        #   # @param country [String]
        #   # @param line1 [String]
        #   # @param city [String]
        #   # @param line2 [String]
        #   # @param state [String]
        #   # @param zip [String]
        #   #
        #   def initialize(country:, line1:, city: nil, line2: nil, state: nil, zip: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
