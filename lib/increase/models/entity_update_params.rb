# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#update
    class EntityUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute corporation
      #   Details of the corporation entity to update. If you specify this parameter and
      #   the entity is not a corporation, the request will fail.
      #
      #   @return [Increase::Models::EntityUpdateParams::Corporation, nil]
      optional :corporation, -> { Increase::EntityUpdateParams::Corporation }

      # @!attribute details_confirmed_at
      #   When your user last confirmed the Entity's details. Depending on your program,
      #   you may be required to affirmatively confirm details with your users on an
      #   annual basis.
      #
      #   @return [Time, nil]
      optional :details_confirmed_at, Time

      # @!attribute government_authority
      #   Details of the government authority entity to update. If you specify this
      #   parameter and the entity is not a government authority, the request will fail.
      #
      #   @return [Increase::Models::EntityUpdateParams::GovernmentAuthority, nil]
      optional :government_authority, -> { Increase::EntityUpdateParams::GovernmentAuthority }

      # @!attribute natural_person
      #   Details of the natural person entity to update. If you specify this parameter
      #   and the entity is not a natural person, the request will fail.
      #
      #   @return [Increase::Models::EntityUpdateParams::NaturalPerson, nil]
      optional :natural_person, -> { Increase::EntityUpdateParams::NaturalPerson }

      # @!attribute risk_rating
      #   An assessment of the entity’s potential risk of involvement in financial crimes,
      #   such as money laundering.
      #
      #   @return [Increase::Models::EntityUpdateParams::RiskRating, nil]
      optional :risk_rating, -> { Increase::EntityUpdateParams::RiskRating }

      # @!attribute third_party_verification
      #   If you are using a third-party service for identity verification, you can use
      #   this field to associate this Entity with the identifier that represents them in
      #   that service.
      #
      #   @return [Increase::Models::EntityUpdateParams::ThirdPartyVerification, nil]
      optional :third_party_verification, -> { Increase::EntityUpdateParams::ThirdPartyVerification }

      # @!attribute trust
      #   Details of the trust entity to update. If you specify this parameter and the
      #   entity is not a trust, the request will fail.
      #
      #   @return [Increase::Models::EntityUpdateParams::Trust, nil]
      optional :trust, -> { Increase::EntityUpdateParams::Trust }

      # @!method initialize(corporation: nil, details_confirmed_at: nil, government_authority: nil, natural_person: nil, risk_rating: nil, third_party_verification: nil, trust: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityUpdateParams} for more details.
      #
      #   @param corporation [Increase::Models::EntityUpdateParams::Corporation] Details of the corporation entity to update. If you specify this parameter and t
      #
      #   @param details_confirmed_at [Time] When your user last confirmed the Entity's details. Depending on your program, y
      #
      #   @param government_authority [Increase::Models::EntityUpdateParams::GovernmentAuthority] Details of the government authority entity to update. If you specify this parame
      #
      #   @param natural_person [Increase::Models::EntityUpdateParams::NaturalPerson] Details of the natural person entity to update. If you specify this parameter an
      #
      #   @param risk_rating [Increase::Models::EntityUpdateParams::RiskRating] An assessment of the entity’s potential risk of involvement in financial crimes,
      #
      #   @param third_party_verification [Increase::Models::EntityUpdateParams::ThirdPartyVerification] If you are using a third-party service for identity verification, you can use th
      #
      #   @param trust [Increase::Models::EntityUpdateParams::Trust] Details of the trust entity to update. If you specify this parameter and the ent
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Corporation < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        #
        #   @return [Increase::Models::EntityUpdateParams::Corporation::Address, nil]
        optional :address, -> { Increase::EntityUpdateParams::Corporation::Address }

        # @!attribute industry_code
        #   The North American Industry Classification System (NAICS) code for the
        #   corporation's primary line of business. This is a number, like `5132` for
        #   `Software Publishers`. A full list of classification codes is available
        #   [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
        #
        #   @return [String, nil]
        optional :industry_code, String

        # @!attribute name
        #   The legal name of the corporation.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(address: nil, industry_code: nil, name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::Corporation} for more details.
        #
        #   Details of the corporation entity to update. If you specify this parameter and
        #   the entity is not a corporation, the request will fail.
        #
        #   @param address [Increase::Models::EntityUpdateParams::Corporation::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #
        #   @param industry_code [String] The North American Industry Classification System (NAICS) code for the corporati
        #
        #   @param name [String] The legal name of the corporation.

        # @see Increase::Models::EntityUpdateParams::Corporation#address
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
          #   {Increase::Models::EntityUpdateParams::Corporation::Address} for more details.
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

      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        #
        #   @return [Increase::Models::EntityUpdateParams::GovernmentAuthority::Address, nil]
        optional :address, -> { Increase::EntityUpdateParams::GovernmentAuthority::Address }

        # @!attribute name
        #   The legal name of the government authority.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(address: nil, name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::GovernmentAuthority} for more details.
        #
        #   Details of the government authority entity to update. If you specify this
        #   parameter and the entity is not a government authority, the request will fail.
        #
        #   @param address [Increase::Models::EntityUpdateParams::GovernmentAuthority::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #
        #   @param name [String] The legal name of the government authority.

        # @see Increase::Models::EntityUpdateParams::GovernmentAuthority#address
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
          #   {Increase::Models::EntityUpdateParams::GovernmentAuthority::Address} for more
          #   details.
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

      class NaturalPerson < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        #
        #   @return [Increase::Models::EntityUpdateParams::NaturalPerson::Address, nil]
        optional :address, -> { Increase::EntityUpdateParams::NaturalPerson::Address }

        # @!attribute name
        #   The legal name of the natural person.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(address: nil, name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::NaturalPerson} for more details.
        #
        #   Details of the natural person entity to update. If you specify this parameter
        #   and the entity is not a natural person, the request will fail.
        #
        #   @param address [Increase::Models::EntityUpdateParams::NaturalPerson::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #
        #   @param name [String] The legal name of the natural person.

        # @see Increase::Models::EntityUpdateParams::NaturalPerson#address
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
          #   {Increase::Models::EntityUpdateParams::NaturalPerson::Address} for more details.
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

      class RiskRating < Increase::Internal::Type::BaseModel
        # @!attribute rated_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk
        #   rating was performed.
        #
        #   @return [Time]
        required :rated_at, Time

        # @!attribute rating
        #   The rating given to this entity.
        #
        #   @return [Symbol, Increase::Models::EntityUpdateParams::RiskRating::Rating]
        required :rating, enum: -> { Increase::EntityUpdateParams::RiskRating::Rating }

        # @!method initialize(rated_at:, rating:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::RiskRating} for more details.
        #
        #   An assessment of the entity’s potential risk of involvement in financial crimes,
        #   such as money laundering.
        #
        #   @param rated_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk ra
        #
        #   @param rating [Symbol, Increase::Models::EntityUpdateParams::RiskRating::Rating] The rating given to this entity.

        # The rating given to this entity.
        #
        # @see Increase::Models::EntityUpdateParams::RiskRating#rating
        module Rating
          extend Increase::Internal::Type::Enum

          # Minimal risk of involvement in financial crime.
          LOW = :low

          # Moderate risk of involvement in financial crime.
          MEDIUM = :medium

          # Elevated risk of involvement in financial crime.
          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        # @!attribute reference
        #   The reference identifier for the third party verification.
        #
        #   @return [String]
        required :reference, String

        # @!attribute vendor
        #   The vendor that was used to perform the verification.
        #
        #   @return [Symbol, Increase::Models::EntityUpdateParams::ThirdPartyVerification::Vendor]
        required :vendor, enum: -> { Increase::EntityUpdateParams::ThirdPartyVerification::Vendor }

        # @!method initialize(reference:, vendor:)
        #   If you are using a third-party service for identity verification, you can use
        #   this field to associate this Entity with the identifier that represents them in
        #   that service.
        #
        #   @param reference [String] The reference identifier for the third party verification.
        #
        #   @param vendor [Symbol, Increase::Models::EntityUpdateParams::ThirdPartyVerification::Vendor] The vendor that was used to perform the verification.

        # The vendor that was used to perform the verification.
        #
        # @see Increase::Models::EntityUpdateParams::ThirdPartyVerification#vendor
        module Vendor
          extend Increase::Internal::Type::Enum

          # Alloy. See https://alloy.com for more information.
          ALLOY = :alloy

          # Middesk. See https://middesk.com for more information.
          MIDDESK = :middesk

          # Oscilar. See https://oscilar.com for more information.
          OSCILAR = :oscilar

          # Persona. See https://withpersona.com for more information.
          PERSONA = :persona

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Trust < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        #
        #   @return [Increase::Models::EntityUpdateParams::Trust::Address, nil]
        optional :address, -> { Increase::EntityUpdateParams::Trust::Address }

        # @!attribute name
        #   The legal name of the trust.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(address: nil, name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::Trust} for more details.
        #
        #   Details of the trust entity to update. If you specify this parameter and the
        #   entity is not a trust, the request will fail.
        #
        #   @param address [Increase::Models::EntityUpdateParams::Trust::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #
        #   @param name [String] The legal name of the trust.

        # @see Increase::Models::EntityUpdateParams::Trust#address
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
          #   {Increase::Models::EntityUpdateParams::Trust::Address} for more details.
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
end
