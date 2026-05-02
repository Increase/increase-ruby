# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#update
    class EntityUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_id
      #   The entity identifier.
      #
      #   @return [String]
      required :entity_id, String

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

      # @!attribute terms_agreements
      #   New terms that the Entity agreed to. Not all programs are required to submit
      #   this data. This will not archive previously submitted terms.
      #
      #   @return [Array<Increase::Models::EntityUpdateParams::TermsAgreement>, nil]
      optional :terms_agreements,
               -> { Increase::Internal::Type::ArrayOf[Increase::EntityUpdateParams::TermsAgreement] }

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

      # @!method initialize(entity_id:, corporation: nil, details_confirmed_at: nil, government_authority: nil, natural_person: nil, risk_rating: nil, terms_agreements: nil, third_party_verification: nil, trust: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityUpdateParams} for more details.
      #
      #   @param entity_id [String] The entity identifier.
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
      #   @param terms_agreements [Array<Increase::Models::EntityUpdateParams::TermsAgreement>] New terms that the Entity agreed to. Not all programs are required to submit thi
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

        # @!attribute email
        #   An email address for the business. Not every program requires an email for
        #   submitted Entities.
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute incorporation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the
        #   corporation's state of incorporation.
        #
        #   @return [String, nil]
        optional :incorporation_state, String

        # @!attribute industry_code
        #   The North American Industry Classification System (NAICS) code for the
        #   corporation's primary line of business. This is a number, like `5132` for
        #   `Software Publishers`. A full list of classification codes is available
        #   [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
        #
        #   @return [String, nil]
        optional :industry_code, String

        # @!attribute legal_identifier
        #   The legal identifier of the corporation. This is usually the Employer
        #   Identification Number (EIN).
        #
        #   @return [Increase::Models::EntityUpdateParams::Corporation::LegalIdentifier, nil]
        optional :legal_identifier, -> { Increase::EntityUpdateParams::Corporation::LegalIdentifier }

        # @!attribute name
        #   The legal name of the corporation.
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute website
        #   A website for the business. Not every program requires a website for submitted
        #   Entities.
        #
        #   @return [String, nil]
        optional :website, String

        # @!method initialize(address: nil, email: nil, incorporation_state: nil, industry_code: nil, legal_identifier: nil, name: nil, website: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::Corporation} for more details.
        #
        #   Details of the corporation entity to update. If you specify this parameter and
        #   the entity is not a corporation, the request will fail.
        #
        #   @param address [Increase::Models::EntityUpdateParams::Corporation::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #
        #   @param email [String] An email address for the business. Not every program requires an email for submi
        #
        #   @param incorporation_state [String] The two-letter United States Postal Service (USPS) abbreviation for the corporat
        #
        #   @param industry_code [String] The North American Industry Classification System (NAICS) code for the corporati
        #
        #   @param legal_identifier [Increase::Models::EntityUpdateParams::Corporation::LegalIdentifier] The legal identifier of the corporation. This is usually the Employer Identifica
        #
        #   @param name [String] The legal name of the corporation.
        #
        #   @param website [String] A website for the business. Not every program requires a website for submitted E

        # @see Increase::Models::EntityUpdateParams::Corporation#address
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
          #   {Increase::Models::EntityUpdateParams::Corporation::Address} for more details.
          #
          #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          #   are disallowed.
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

        # @see Increase::Models::EntityUpdateParams::Corporation#legal_identifier
        class LegalIdentifier < Increase::Internal::Type::BaseModel
          # @!attribute value
          #   The identifier of the legal identifier. For US Employer Identification Numbers,
          #   submit nine digits with no dashes or other separators.
          #
          #   @return [String]
          required :value, String

          # @!attribute category
          #   The category of the legal identifier.
          #
          #   @return [Symbol, Increase::Models::EntityUpdateParams::Corporation::LegalIdentifier::Category, nil]
          optional :category, enum: -> { Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category }

          # @!method initialize(value:, category: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::EntityUpdateParams::Corporation::LegalIdentifier} for more
          #   details.
          #
          #   The legal identifier of the corporation. This is usually the Employer
          #   Identification Number (EIN).
          #
          #   @param value [String] The identifier of the legal identifier. For US Employer Identification Numbers,
          #
          #   @param category [Symbol, Increase::Models::EntityUpdateParams::Corporation::LegalIdentifier::Category] The category of the legal identifier.

          # The category of the legal identifier.
          #
          # @see Increase::Models::EntityUpdateParams::Corporation::LegalIdentifier#category
          module Category
            extend Increase::Internal::Type::Enum

            # The Employer Identification Number (EIN) for the company. The EIN is a 9-digit number assigned by the IRS; submit it as nine digits with no dashes or other separators.
            US_EMPLOYER_IDENTIFICATION_NUMBER = :us_employer_identification_number

            # A legal identifier issued by a foreign government, like a tax identification number or registration number.
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end
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

        # @!attribute confirmed_no_us_tax_id
        #   The identification method for an individual can only be a passport, driver's
        #   license, or other document if you've confirmed the individual does not have a US
        #   tax id (either a Social Security Number or Individual Taxpayer Identification
        #   Number).
        #
        #   @return [Boolean, nil]
        optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

        # @!attribute identification
        #   A means of verifying the person's identity.
        #
        #   @return [Increase::Models::EntityUpdateParams::NaturalPerson::Identification, nil]
        optional :identification, -> { Increase::EntityUpdateParams::NaturalPerson::Identification }

        # @!attribute name
        #   The legal name of the natural person.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(address: nil, confirmed_no_us_tax_id: nil, identification: nil, name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::NaturalPerson} for more details.
        #
        #   Details of the natural person entity to update. If you specify this parameter
        #   and the entity is not a natural person, the request will fail.
        #
        #   @param address [Increase::Models::EntityUpdateParams::NaturalPerson::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #
        #   @param confirmed_no_us_tax_id [Boolean] The identification method for an individual can only be a passport, driver's lic
        #
        #   @param identification [Increase::Models::EntityUpdateParams::NaturalPerson::Identification] A means of verifying the person's identity.
        #
        #   @param name [String] The legal name of the natural person.

        # @see Increase::Models::EntityUpdateParams::NaturalPerson#address
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
          #   {Increase::Models::EntityUpdateParams::NaturalPerson::Address} for more details.
          #
          #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          #   are disallowed.
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

        # @see Increase::Models::EntityUpdateParams::NaturalPerson#identification
        class Identification < Increase::Internal::Type::BaseModel
          # @!attribute method_
          #   A method that can be used to verify the individual's identity.
          #
          #   @return [Symbol, Increase::Models::EntityUpdateParams::NaturalPerson::Identification::Method]
          required :method_,
                   enum: -> { Increase::EntityUpdateParams::NaturalPerson::Identification::Method },
                   api_name: :method

          # @!attribute number
          #   An identification number that can be used to verify the individual's identity,
          #   such as a social security number. For Social Security Numbers and Individual
          #   Taxpayer Identification Numbers, submit nine digits with no dashes or other
          #   separators.
          #
          #   @return [String]
          required :number, String

          # @!attribute drivers_license
          #   Information about the United States driver's license used for identification.
          #   Required if `method` is equal to `drivers_license`.
          #
          #   @return [Increase::Models::EntityUpdateParams::NaturalPerson::Identification::DriversLicense, nil]
          optional :drivers_license,
                   -> { Increase::EntityUpdateParams::NaturalPerson::Identification::DriversLicense }

          # @!attribute other
          #   Information about the identification document provided. Required if `method` is
          #   equal to `other`.
          #
          #   @return [Increase::Models::EntityUpdateParams::NaturalPerson::Identification::Other, nil]
          optional :other, -> { Increase::EntityUpdateParams::NaturalPerson::Identification::Other }

          # @!attribute passport
          #   Information about the passport used for identification. Required if `method` is
          #   equal to `passport`.
          #
          #   @return [Increase::Models::EntityUpdateParams::NaturalPerson::Identification::Passport, nil]
          optional :passport, -> { Increase::EntityUpdateParams::NaturalPerson::Identification::Passport }

          # @!method initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::EntityUpdateParams::NaturalPerson::Identification} for more
          #   details.
          #
          #   A means of verifying the person's identity.
          #
          #   @param method_ [Symbol, Increase::Models::EntityUpdateParams::NaturalPerson::Identification::Method] A method that can be used to verify the individual's identity.
          #
          #   @param number [String] An identification number that can be used to verify the individual's identity, s
          #
          #   @param drivers_license [Increase::Models::EntityUpdateParams::NaturalPerson::Identification::DriversLicense] Information about the United States driver's license used for identification. Re
          #
          #   @param other [Increase::Models::EntityUpdateParams::NaturalPerson::Identification::Other] Information about the identification document provided. Required if `method` is
          #
          #   @param passport [Increase::Models::EntityUpdateParams::NaturalPerson::Identification::Passport] Information about the passport used for identification. Required if `method` is

          # A method that can be used to verify the individual's identity.
          #
          # @see Increase::Models::EntityUpdateParams::NaturalPerson::Identification#method_
          module Method
            extend Increase::Internal::Type::Enum

            # A social security number.
            SOCIAL_SECURITY_NUMBER = :social_security_number

            # An individual taxpayer identification number (ITIN).
            INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER = :individual_taxpayer_identification_number

            # A passport number.
            PASSPORT = :passport

            # A driver's license number.
            DRIVERS_LICENSE = :drivers_license

            # Another identifying document.
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::EntityUpdateParams::NaturalPerson::Identification#drivers_license
          class DriversLicense < Increase::Internal::Type::BaseModel
            # @!attribute expiration_date
            #   The driver's license's expiration date in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :expiration_date, Date

            # @!attribute file_id
            #   The identifier of the File containing the front of the driver's license.
            #
            #   @return [String]
            required :file_id, String

            # @!attribute state
            #   The state that issued the provided driver's license.
            #
            #   @return [String]
            required :state, String

            # @!attribute back_file_id
            #   The identifier of the File containing the back of the driver's license.
            #
            #   @return [String, nil]
            optional :back_file_id, String

            # @!method initialize(expiration_date:, file_id:, state:, back_file_id: nil)
            #   Information about the United States driver's license used for identification.
            #   Required if `method` is equal to `drivers_license`.
            #
            #   @param expiration_date [Date] The driver's license's expiration date in YYYY-MM-DD format.
            #
            #   @param file_id [String] The identifier of the File containing the front of the driver's license.
            #
            #   @param state [String] The state that issued the provided driver's license.
            #
            #   @param back_file_id [String] The identifier of the File containing the back of the driver's license.
          end

          # @see Increase::Models::EntityUpdateParams::NaturalPerson::Identification#other
          class Other < Increase::Internal::Type::BaseModel
            # @!attribute country
            #   The two-character ISO 3166-1 code representing the country that issued the
            #   document (e.g., `US`).
            #
            #   @return [String]
            required :country, String

            # @!attribute description
            #   A description of the document submitted.
            #
            #   @return [String]
            required :description, String

            # @!attribute file_id
            #   The identifier of the File containing the front of the document.
            #
            #   @return [String]
            required :file_id, String

            # @!attribute back_file_id
            #   The identifier of the File containing the back of the document. Not every
            #   document has a reverse side.
            #
            #   @return [String, nil]
            optional :back_file_id, String

            # @!attribute expiration_date
            #   The document's expiration date in YYYY-MM-DD format.
            #
            #   @return [Date, nil]
            optional :expiration_date, Date

            # @!method initialize(country:, description:, file_id:, back_file_id: nil, expiration_date: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::EntityUpdateParams::NaturalPerson::Identification::Other} for
            #   more details.
            #
            #   Information about the identification document provided. Required if `method` is
            #   equal to `other`.
            #
            #   @param country [String] The two-character ISO 3166-1 code representing the country that issued the docum
            #
            #   @param description [String] A description of the document submitted.
            #
            #   @param file_id [String] The identifier of the File containing the front of the document.
            #
            #   @param back_file_id [String] The identifier of the File containing the back of the document. Not every docume
            #
            #   @param expiration_date [Date] The document's expiration date in YYYY-MM-DD format.
          end

          # @see Increase::Models::EntityUpdateParams::NaturalPerson::Identification#passport
          class Passport < Increase::Internal::Type::BaseModel
            # @!attribute country
            #   The two-character ISO 3166-1 code representing the country that issued the
            #   document (e.g., `US`).
            #
            #   @return [String]
            required :country, String

            # @!attribute expiration_date
            #   The passport's expiration date in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :expiration_date, Date

            # @!attribute file_id
            #   The identifier of the File containing the passport.
            #
            #   @return [String]
            required :file_id, String

            # @!method initialize(country:, expiration_date:, file_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::EntityUpdateParams::NaturalPerson::Identification::Passport}
            #   for more details.
            #
            #   Information about the passport used for identification. Required if `method` is
            #   equal to `passport`.
            #
            #   @param country [String] The two-character ISO 3166-1 code representing the country that issued the docum
            #
            #   @param expiration_date [Date] The passport's expiration date in YYYY-MM-DD format.
            #
            #   @param file_id [String] The identifier of the File containing the passport.
          end
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

      class TermsAgreement < Increase::Internal::Type::BaseModel
        # @!attribute agreed_at
        #   The timestamp of when the Entity agreed to the terms.
        #
        #   @return [Time]
        required :agreed_at, Time

        # @!attribute ip_address
        #   The IP address the Entity accessed reviewed the terms from.
        #
        #   @return [String]
        required :ip_address, String

        # @!attribute terms_url
        #   The URL of the terms agreement. This link will be provided by your bank partner.
        #
        #   @return [String]
        required :terms_url, String

        # @!method initialize(agreed_at:, ip_address:, terms_url:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::TermsAgreement} for more details.
        #
        #   @param agreed_at [Time] The timestamp of when the Entity agreed to the terms.
        #
        #   @param ip_address [String] The IP address the Entity accessed reviewed the terms from.
        #
        #   @param terms_url [String] The URL of the terms agreement. This link will be provided by your bank partner.
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

          # Taktile. See https://taktile.com for more information.
          TAKTILE = :taktile

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
