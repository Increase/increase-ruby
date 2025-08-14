# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#update_beneficial_owner_address
    class EntityUpdateBeneficialOwnerAddressParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute address
      #   The individual's physical address. Mail receiving locations like PO Boxes and
      #   PMB's are disallowed.
      #
      #   @return [Increase::Models::EntityUpdateBeneficialOwnerAddressParams::Address]
      required :address, -> { Increase::EntityUpdateBeneficialOwnerAddressParams::Address }

      # @!attribute beneficial_owner_id
      #   The identifying details of anyone controlling or owning 25% or more of the
      #   corporation.
      #
      #   @return [String]
      required :beneficial_owner_id, String

      # @!method initialize(address:, beneficial_owner_id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityUpdateBeneficialOwnerAddressParams} for more details.
      #
      #   @param address [Increase::Models::EntityUpdateBeneficialOwnerAddressParams::Address] The individual's physical address. Mail receiving locations like PO Boxes and PM
      #
      #   @param beneficial_owner_id [String] The identifying details of anyone controlling or owning 25% or more of the corpo
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Address < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city, district, town, or village of the address.
        #
        #   @return [String]
        required :city, String

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

        # @!attribute line2
        #   The second line of the address. This might be the floor or room number.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!attribute state
        #   The two-letter United States Postal Service (USPS) abbreviation for the US
        #   state, province, or region of the address. Required in certain countries.
        #
        #   @return [String, nil]
        optional :state, String

        # @!attribute zip
        #   The ZIP or postal code of the address. Required in certain countries.
        #
        #   @return [String, nil]
        optional :zip, String

        # @!method initialize(city:, country:, line1:, line2: nil, state: nil, zip: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateBeneficialOwnerAddressParams::Address} for more
        #   details.
        #
        #   The individual's physical address. Mail receiving locations like PO Boxes and
        #   PMB's are disallowed.
        #
        #   @param city [String] The city, district, town, or village of the address.
        #
        #   @param country [String] The two-letter ISO 3166-1 alpha-2 code for the country of the address.
        #
        #   @param line1 [String] The first line of the address. This is usually the street number and street.
        #
        #   @param line2 [String] The second line of the address. This might be the floor or room number.
        #
        #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the US state
        #
        #   @param zip [String] The ZIP or postal code of the address. Required in certain countries.
      end
    end
  end
end
