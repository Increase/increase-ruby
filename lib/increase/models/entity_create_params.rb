# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#create
    class EntityCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute structure
      #   The type of Entity to create.
      #
      #   @return [Symbol, Increase::Models::EntityCreateParams::Structure]
      required :structure, enum: -> { Increase::EntityCreateParams::Structure }

      # @!attribute corporation
      #   Details of the corporation entity to create. Required if `structure` is equal to
      #   `corporation`.
      #
      #   @return [Increase::Models::EntityCreateParams::Corporation, nil]
      optional :corporation, -> { Increase::EntityCreateParams::Corporation }

      # @!attribute description
      #   The description you choose to give the entity.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute government_authority
      #   Details of the Government Authority entity to create. Required if `structure` is
      #   equal to `government_authority`.
      #
      #   @return [Increase::Models::EntityCreateParams::GovernmentAuthority, nil]
      optional :government_authority, -> { Increase::EntityCreateParams::GovernmentAuthority }

      # @!attribute joint
      #   Details of the joint entity to create. Required if `structure` is equal to
      #   `joint`.
      #
      #   @return [Increase::Models::EntityCreateParams::Joint, nil]
      optional :joint, -> { Increase::EntityCreateParams::Joint }

      # @!attribute natural_person
      #   Details of the natural person entity to create. Required if `structure` is equal
      #   to `natural_person`. Natural people entities should be submitted with
      #   `social_security_number` or `individual_taxpayer_identification_number`
      #   identification methods.
      #
      #   @return [Increase::Models::EntityCreateParams::NaturalPerson, nil]
      optional :natural_person, -> { Increase::EntityCreateParams::NaturalPerson }

      # @!attribute risk_rating
      #   An assessment of the entity’s potential risk of involvement in financial crimes,
      #   such as money laundering.
      #
      #   @return [Increase::Models::EntityCreateParams::RiskRating, nil]
      optional :risk_rating, -> { Increase::EntityCreateParams::RiskRating }

      # @!attribute supplemental_documents
      #   Additional documentation associated with the entity.
      #
      #   @return [Array<Increase::Models::EntityCreateParams::SupplementalDocument>, nil]
      optional :supplemental_documents,
               -> { Increase::Internal::Type::ArrayOf[Increase::EntityCreateParams::SupplementalDocument] }

      # @!attribute third_party_verification
      #   If you are using a third-party service for identity verification, you can use
      #   this field to associate this Entity with the identifier that represents them in
      #   that service.
      #
      #   @return [Increase::Models::EntityCreateParams::ThirdPartyVerification, nil]
      optional :third_party_verification, -> { Increase::EntityCreateParams::ThirdPartyVerification }

      # @!attribute trust
      #   Details of the trust entity to create. Required if `structure` is equal to
      #   `trust`.
      #
      #   @return [Increase::Models::EntityCreateParams::Trust, nil]
      optional :trust, -> { Increase::EntityCreateParams::Trust }

      # @!method initialize(structure:, corporation: nil, description: nil, government_authority: nil, joint: nil, natural_person: nil, risk_rating: nil, supplemental_documents: nil, third_party_verification: nil, trust: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityCreateParams} for more details.
      #
      #   @param structure [Symbol, Increase::Models::EntityCreateParams::Structure] The type of Entity to create.
      #
      #   @param corporation [Increase::Models::EntityCreateParams::Corporation] Details of the corporation entity to create. Required if `structure` is equal to
      #
      #   @param description [String] The description you choose to give the entity.
      #
      #   @param government_authority [Increase::Models::EntityCreateParams::GovernmentAuthority] Details of the Government Authority entity to create. Required if `structure` is
      #
      #   @param joint [Increase::Models::EntityCreateParams::Joint] Details of the joint entity to create. Required if `structure` is equal to `join
      #
      #   @param natural_person [Increase::Models::EntityCreateParams::NaturalPerson] Details of the natural person entity to create. Required if `structure` is equal
      #
      #   @param risk_rating [Increase::Models::EntityCreateParams::RiskRating] An assessment of the entity’s potential risk of involvement in financial crimes,
      #
      #   @param supplemental_documents [Array<Increase::Models::EntityCreateParams::SupplementalDocument>] Additional documentation associated with the entity.
      #
      #   @param third_party_verification [Increase::Models::EntityCreateParams::ThirdPartyVerification] If you are using a third-party service for identity verification, you can use th
      #
      #   @param trust [Increase::Models::EntityCreateParams::Trust] Details of the trust entity to create. Required if `structure` is equal to `trus
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The type of Entity to create.
      module Structure
        extend Increase::Internal::Type::Enum

        # A corporation.
        CORPORATION = :corporation

        # An individual person.
        NATURAL_PERSON = :natural_person

        # Multiple individual people.
        JOINT = :joint

        # A trust.
        TRUST = :trust

        # A government authority.
        GOVERNMENT_AUTHORITY = :government_authority

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Corporation < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        #
        #   @return [Increase::Models::EntityCreateParams::Corporation::Address]
        required :address, -> { Increase::EntityCreateParams::Corporation::Address }

        # @!attribute beneficial_owners
        #   The identifying details of each person who owns 25% or more of the business and
        #   one control person, like the CEO, CFO, or other executive. You can submit
        #   between 1 and 5 people to this list.
        #
        #   @return [Array<Increase::Models::EntityCreateParams::Corporation::BeneficialOwner>]
        required :beneficial_owners,
                 -> { Increase::Internal::Type::ArrayOf[Increase::EntityCreateParams::Corporation::BeneficialOwner] }

        # @!attribute name
        #   The legal name of the corporation.
        #
        #   @return [String]
        required :name, String

        # @!attribute tax_identifier
        #   The Employer Identification Number (EIN) for the corporation.
        #
        #   @return [String]
        required :tax_identifier, String

        # @!attribute beneficial_ownership_exemption_reason
        #   If the entity is exempt from the requirement to submit beneficial owners,
        #   provide the justification. If a reason is provided, you do not need to submit a
        #   list of beneficial owners.
        #
        #   @return [Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason, nil]
        optional :beneficial_ownership_exemption_reason,
                 enum: -> { Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason }

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

        # @!attribute website
        #   The website of the corporation.
        #
        #   @return [String, nil]
        optional :website, String

        # @!method initialize(address:, beneficial_owners:, name:, tax_identifier:, beneficial_ownership_exemption_reason: nil, incorporation_state: nil, industry_code: nil, website: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityCreateParams::Corporation} for more details.
        #
        #   Details of the corporation entity to create. Required if `structure` is equal to
        #   `corporation`.
        #
        #   @param address [Increase::Models::EntityCreateParams::Corporation::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #
        #   @param beneficial_owners [Array<Increase::Models::EntityCreateParams::Corporation::BeneficialOwner>] The identifying details of each person who owns 25% or more of the business and
        #
        #   @param name [String] The legal name of the corporation.
        #
        #   @param tax_identifier [String] The Employer Identification Number (EIN) for the corporation.
        #
        #   @param beneficial_ownership_exemption_reason [Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason] If the entity is exempt from the requirement to submit beneficial owners, provid
        #
        #   @param incorporation_state [String] The two-letter United States Postal Service (USPS) abbreviation for the corporat
        #
        #   @param industry_code [String] The North American Industry Classification System (NAICS) code for the corporati
        #
        #   @param website [String] The website of the corporation.

        # @see Increase::Models::EntityCreateParams::Corporation#address
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
          #   {Increase::Models::EntityCreateParams::Corporation::Address} for more details.
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

        class BeneficialOwner < Increase::Internal::Type::BaseModel
          # @!attribute individual
          #   Personal details for the beneficial owner.
          #
          #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual]
          required :individual, -> { Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual }

          # @!attribute prongs
          #   Why this person is considered a beneficial owner of the entity. At least one
          #   option is required, if a person is both a control person and owner, submit an
          #   array containing both.
          #
          #   @return [Array<Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong>]
          required :prongs,
                   -> { Increase::Internal::Type::ArrayOf[enum: Increase::EntityCreateParams::Corporation::BeneficialOwner::Prong] }

          # @!attribute company_title
          #   This person's role or title within the entity.
          #
          #   @return [String, nil]
          optional :company_title, String

          # @!method initialize(individual:, prongs:, company_title: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::EntityCreateParams::Corporation::BeneficialOwner} for more
          #   details.
          #
          #   @param individual [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual] Personal details for the beneficial owner.
          #
          #   @param prongs [Array<Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong>] Why this person is considered a beneficial owner of the entity. At least one opt
          #
          #   @param company_title [String] This person's role or title within the entity.

          # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The individual's physical address. Mail receiving locations like PO Boxes and
            #   PMB's are disallowed.
            #
            #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address]
            required :address, -> { Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address }

            # @!attribute date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :date_of_birth, Date

            # @!attribute identification
            #   A means of verifying the person's identity.
            #
            #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification]
            required :identification,
                     -> { Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!attribute confirmed_no_us_tax_id
            #   The identification method for an individual can only be a passport, driver's
            #   license, or other document if you've confirmed the individual does not have a US
            #   tax id (either a Social Security Number or Individual Taxpayer Identification
            #   Number).
            #
            #   @return [Boolean, nil]
            optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

            # @!method initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual}
            #   for more details.
            #
            #   Personal details for the beneficial owner.
            #
            #   @param address [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address] The individual's physical address. Mail receiving locations like PO Boxes and PM
            #
            #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
            #
            #   @param identification [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification] A means of verifying the person's identity.
            #
            #   @param name [String] The person's legal name.
            #
            #   @param confirmed_no_us_tax_id [Boolean] The identification method for an individual can only be a passport, driver's lic

            # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual#address
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
              #   {Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address}
              #   for more details.
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

            # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method]
              required :method_,
                       enum: -> {
                         Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method
                       },
                       api_name: :method

              # @!attribute number
              #   An identification number that can be used to verify the individual's identity,
              #   such as a social security number.
              #
              #   @return [String]
              required :number, String

              # @!attribute drivers_license
              #   Information about the United States driver's license used for identification.
              #   Required if `method` is equal to `drivers_license`.
              #
              #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense, nil]
              optional :drivers_license,
                       -> { Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense }

              # @!attribute other
              #   Information about the identification document provided. Required if `method` is
              #   equal to `other`.
              #
              #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other, nil]
              optional :other,
                       -> { Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other }

              # @!attribute passport
              #   Information about the passport used for identification. Required if `method` is
              #   equal to `passport`.
              #
              #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport, nil]
              optional :passport,
                       -> { Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport }

              # @!method initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification}
              #   for more details.
              #
              #   A means of verifying the person's identity.
              #
              #   @param method_ [Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method] A method that can be used to verify the individual's identity.
              #
              #   @param number [String] An identification number that can be used to verify the individual's identity, s
              #
              #   @param drivers_license [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense] Information about the United States driver's license used for identification. Re
              #
              #   @param other [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other] Information about the identification document provided. Required if `method` is
              #
              #   @param passport [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport] Information about the passport used for identification. Required if `method` is

              # A method that can be used to verify the individual's identity.
              #
              # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification#method_
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

              # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification#drivers_license
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

              # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification#other
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
                #   {Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other}
                #   for more details.
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

              # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification#passport
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
                #   {Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport}
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

          module Prong
            extend Increase::Internal::Type::Enum

            # A person with 25% or greater direct or indirect ownership of the entity.
            OWNERSHIP = :ownership

            # A person who manages, directs, or has significant control of the entity.
            CONTROL = :control

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # If the entity is exempt from the requirement to submit beneficial owners,
        # provide the justification. If a reason is provided, you do not need to submit a
        # list of beneficial owners.
        #
        # @see Increase::Models::EntityCreateParams::Corporation#beneficial_ownership_exemption_reason
        module BeneficialOwnershipExemptionReason
          extend Increase::Internal::Type::Enum

          # A regulated financial institution.
          REGULATED_FINANCIAL_INSTITUTION = :regulated_financial_institution

          # A publicly traded company.
          PUBLICLY_TRADED_COMPANY = :publicly_traded_company

          # A public entity acting on behalf of the federal or a state government.
          PUBLIC_ENTITY = :public_entity

          # Any other reason why this entity is exempt from the requirement to submit beneficial owners. You can only use this exemption after approval from your bank partner.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        #
        #   @return [Increase::Models::EntityCreateParams::GovernmentAuthority::Address]
        required :address, -> { Increase::EntityCreateParams::GovernmentAuthority::Address }

        # @!attribute authorized_persons
        #   The identifying details of authorized officials acting on the entity's behalf.
        #
        #   @return [Array<Increase::Models::EntityCreateParams::GovernmentAuthority::AuthorizedPerson>]
        required :authorized_persons,
                 -> { Increase::Internal::Type::ArrayOf[Increase::EntityCreateParams::GovernmentAuthority::AuthorizedPerson] }

        # @!attribute category
        #   The category of the government authority.
        #
        #   @return [Symbol, Increase::Models::EntityCreateParams::GovernmentAuthority::Category]
        required :category, enum: -> { Increase::EntityCreateParams::GovernmentAuthority::Category }

        # @!attribute name
        #   The legal name of the government authority.
        #
        #   @return [String]
        required :name, String

        # @!attribute tax_identifier
        #   The Employer Identification Number (EIN) for the government authority.
        #
        #   @return [String]
        required :tax_identifier, String

        # @!attribute website
        #   The website of the government authority.
        #
        #   @return [String, nil]
        optional :website, String

        # @!method initialize(address:, authorized_persons:, category:, name:, tax_identifier:, website: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityCreateParams::GovernmentAuthority} for more details.
        #
        #   Details of the Government Authority entity to create. Required if `structure` is
        #   equal to `government_authority`.
        #
        #   @param address [Increase::Models::EntityCreateParams::GovernmentAuthority::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #
        #   @param authorized_persons [Array<Increase::Models::EntityCreateParams::GovernmentAuthority::AuthorizedPerson>] The identifying details of authorized officials acting on the entity's behalf.
        #
        #   @param category [Symbol, Increase::Models::EntityCreateParams::GovernmentAuthority::Category] The category of the government authority.
        #
        #   @param name [String] The legal name of the government authority.
        #
        #   @param tax_identifier [String] The Employer Identification Number (EIN) for the government authority.
        #
        #   @param website [String] The website of the government authority.

        # @see Increase::Models::EntityCreateParams::GovernmentAuthority#address
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
          #   {Increase::Models::EntityCreateParams::GovernmentAuthority::Address} for more
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

        class AuthorizedPerson < Increase::Internal::Type::BaseModel
          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(name:)
          #   @param name [String] The person's legal name.
        end

        # The category of the government authority.
        #
        # @see Increase::Models::EntityCreateParams::GovernmentAuthority#category
        module Category
          extend Increase::Internal::Type::Enum

          # A municipality.
          MUNICIPALITY = :municipality

          # A state agency.
          STATE_AGENCY = :state_agency

          # A state government.
          STATE_GOVERNMENT = :state_government

          # A federal agency.
          FEDERAL_AGENCY = :federal_agency

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Joint < Increase::Internal::Type::BaseModel
        # @!attribute individuals
        #   The two individuals that share control of the entity.
        #
        #   @return [Array<Increase::Models::EntityCreateParams::Joint::Individual>]
        required :individuals,
                 -> { Increase::Internal::Type::ArrayOf[Increase::EntityCreateParams::Joint::Individual] }

        # @!method initialize(individuals:)
        #   Details of the joint entity to create. Required if `structure` is equal to
        #   `joint`.
        #
        #   @param individuals [Array<Increase::Models::EntityCreateParams::Joint::Individual>] The two individuals that share control of the entity.

        class Individual < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The individual's physical address. Mail receiving locations like PO Boxes and
          #   PMB's are disallowed.
          #
          #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Address]
          required :address, -> { Increase::EntityCreateParams::Joint::Individual::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification]
          required :identification, -> { Increase::EntityCreateParams::Joint::Individual::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!attribute confirmed_no_us_tax_id
          #   The identification method for an individual can only be a passport, driver's
          #   license, or other document if you've confirmed the individual does not have a US
          #   tax id (either a Social Security Number or Individual Taxpayer Identification
          #   Number).
          #
          #   @return [Boolean, nil]
          optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

          # @!method initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::EntityCreateParams::Joint::Individual} for more details.
          #
          #   @param address [Increase::Models::EntityCreateParams::Joint::Individual::Address] The individual's physical address. Mail receiving locations like PO Boxes and PM
          #
          #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
          #
          #   @param identification [Increase::Models::EntityCreateParams::Joint::Individual::Identification] A means of verifying the person's identity.
          #
          #   @param name [String] The person's legal name.
          #
          #   @param confirmed_no_us_tax_id [Boolean] The identification method for an individual can only be a passport, driver's lic

          # @see Increase::Models::EntityCreateParams::Joint::Individual#address
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
            #   {Increase::Models::EntityCreateParams::Joint::Individual::Address} for more
            #   details.
            #
            #   The individual's physical address. Mail receiving locations like PO Boxes and
            #   PMB's are disallowed.
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

          # @see Increase::Models::EntityCreateParams::Joint::Individual#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method]
            required :method_,
                     enum: -> { Increase::EntityCreateParams::Joint::Individual::Identification::Method },
                     api_name: :method

            # @!attribute number
            #   An identification number that can be used to verify the individual's identity,
            #   such as a social security number.
            #
            #   @return [String]
            required :number, String

            # @!attribute drivers_license
            #   Information about the United States driver's license used for identification.
            #   Required if `method` is equal to `drivers_license`.
            #
            #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense, nil]
            optional :drivers_license,
                     -> { Increase::EntityCreateParams::Joint::Individual::Identification::DriversLicense }

            # @!attribute other
            #   Information about the identification document provided. Required if `method` is
            #   equal to `other`.
            #
            #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other, nil]
            optional :other, -> { Increase::EntityCreateParams::Joint::Individual::Identification::Other }

            # @!attribute passport
            #   Information about the passport used for identification. Required if `method` is
            #   equal to `passport`.
            #
            #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport, nil]
            optional :passport, -> { Increase::EntityCreateParams::Joint::Individual::Identification::Passport }

            # @!method initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::EntityCreateParams::Joint::Individual::Identification} for
            #   more details.
            #
            #   A means of verifying the person's identity.
            #
            #   @param method_ [Symbol, Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method] A method that can be used to verify the individual's identity.
            #
            #   @param number [String] An identification number that can be used to verify the individual's identity, s
            #
            #   @param drivers_license [Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense] Information about the United States driver's license used for identification. Re
            #
            #   @param other [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other] Information about the identification document provided. Required if `method` is
            #
            #   @param passport [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport] Information about the passport used for identification. Required if `method` is

            # A method that can be used to verify the individual's identity.
            #
            # @see Increase::Models::EntityCreateParams::Joint::Individual::Identification#method_
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

            # @see Increase::Models::EntityCreateParams::Joint::Individual::Identification#drivers_license
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

            # @see Increase::Models::EntityCreateParams::Joint::Individual::Identification#other
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
              #   {Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other}
              #   for more details.
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

            # @see Increase::Models::EntityCreateParams::Joint::Individual::Identification#passport
            class Passport < Increase::Internal::Type::BaseModel
              # @!attribute country
              #   The two-character ISO 3166-1 code representing the country that issued the
              #   passport (e.g., `US`).
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
              #   {Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport}
              #   for more details.
              #
              #   Information about the passport used for identification. Required if `method` is
              #   equal to `passport`.
              #
              #   @param country [String] The two-character ISO 3166-1 code representing the country that issued the passp
              #
              #   @param expiration_date [Date] The passport's expiration date in YYYY-MM-DD format.
              #
              #   @param file_id [String] The identifier of the File containing the passport.
            end
          end
        end
      end

      class NaturalPerson < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The individual's physical address. Mail receiving locations like PO Boxes and
        #   PMB's are disallowed.
        #
        #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Address]
        required :address, -> { Increase::EntityCreateParams::NaturalPerson::Address }

        # @!attribute date_of_birth
        #   The person's date of birth in YYYY-MM-DD format.
        #
        #   @return [Date]
        required :date_of_birth, Date

        # @!attribute identification
        #   A means of verifying the person's identity.
        #
        #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification]
        required :identification, -> { Increase::EntityCreateParams::NaturalPerson::Identification }

        # @!attribute name
        #   The person's legal name.
        #
        #   @return [String]
        required :name, String

        # @!attribute confirmed_no_us_tax_id
        #   The identification method for an individual can only be a passport, driver's
        #   license, or other document if you've confirmed the individual does not have a US
        #   tax id (either a Social Security Number or Individual Taxpayer Identification
        #   Number).
        #
        #   @return [Boolean, nil]
        optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

        # @!method initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityCreateParams::NaturalPerson} for more details.
        #
        #   Details of the natural person entity to create. Required if `structure` is equal
        #   to `natural_person`. Natural people entities should be submitted with
        #   `social_security_number` or `individual_taxpayer_identification_number`
        #   identification methods.
        #
        #   @param address [Increase::Models::EntityCreateParams::NaturalPerson::Address] The individual's physical address. Mail receiving locations like PO Boxes and PM
        #
        #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
        #
        #   @param identification [Increase::Models::EntityCreateParams::NaturalPerson::Identification] A means of verifying the person's identity.
        #
        #   @param name [String] The person's legal name.
        #
        #   @param confirmed_no_us_tax_id [Boolean] The identification method for an individual can only be a passport, driver's lic

        # @see Increase::Models::EntityCreateParams::NaturalPerson#address
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
          #   {Increase::Models::EntityCreateParams::NaturalPerson::Address} for more details.
          #
          #   The individual's physical address. Mail receiving locations like PO Boxes and
          #   PMB's are disallowed.
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

        # @see Increase::Models::EntityCreateParams::NaturalPerson#identification
        class Identification < Increase::Internal::Type::BaseModel
          # @!attribute method_
          #   A method that can be used to verify the individual's identity.
          #
          #   @return [Symbol, Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method]
          required :method_,
                   enum: -> { Increase::EntityCreateParams::NaturalPerson::Identification::Method },
                   api_name: :method

          # @!attribute number
          #   An identification number that can be used to verify the individual's identity,
          #   such as a social security number.
          #
          #   @return [String]
          required :number, String

          # @!attribute drivers_license
          #   Information about the United States driver's license used for identification.
          #   Required if `method` is equal to `drivers_license`.
          #
          #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense, nil]
          optional :drivers_license,
                   -> { Increase::EntityCreateParams::NaturalPerson::Identification::DriversLicense }

          # @!attribute other
          #   Information about the identification document provided. Required if `method` is
          #   equal to `other`.
          #
          #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other, nil]
          optional :other, -> { Increase::EntityCreateParams::NaturalPerson::Identification::Other }

          # @!attribute passport
          #   Information about the passport used for identification. Required if `method` is
          #   equal to `passport`.
          #
          #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport, nil]
          optional :passport, -> { Increase::EntityCreateParams::NaturalPerson::Identification::Passport }

          # @!method initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::EntityCreateParams::NaturalPerson::Identification} for more
          #   details.
          #
          #   A means of verifying the person's identity.
          #
          #   @param method_ [Symbol, Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method] A method that can be used to verify the individual's identity.
          #
          #   @param number [String] An identification number that can be used to verify the individual's identity, s
          #
          #   @param drivers_license [Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense] Information about the United States driver's license used for identification. Re
          #
          #   @param other [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other] Information about the identification document provided. Required if `method` is
          #
          #   @param passport [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport] Information about the passport used for identification. Required if `method` is

          # A method that can be used to verify the individual's identity.
          #
          # @see Increase::Models::EntityCreateParams::NaturalPerson::Identification#method_
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

          # @see Increase::Models::EntityCreateParams::NaturalPerson::Identification#drivers_license
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

          # @see Increase::Models::EntityCreateParams::NaturalPerson::Identification#other
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
            #   {Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other} for
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

          # @see Increase::Models::EntityCreateParams::NaturalPerson::Identification#passport
          class Passport < Increase::Internal::Type::BaseModel
            # @!attribute country
            #   The two-character ISO 3166-1 code representing the country that issued the
            #   passport (e.g., `US`).
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
            #   {Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport}
            #   for more details.
            #
            #   Information about the passport used for identification. Required if `method` is
            #   equal to `passport`.
            #
            #   @param country [String] The two-character ISO 3166-1 code representing the country that issued the passp
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
        #   @return [Symbol, Increase::Models::EntityCreateParams::RiskRating::Rating]
        required :rating, enum: -> { Increase::EntityCreateParams::RiskRating::Rating }

        # @!method initialize(rated_at:, rating:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityCreateParams::RiskRating} for more details.
        #
        #   An assessment of the entity’s potential risk of involvement in financial crimes,
        #   such as money laundering.
        #
        #   @param rated_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk ra
        #
        #   @param rating [Symbol, Increase::Models::EntityCreateParams::RiskRating::Rating] The rating given to this entity.

        # The rating given to this entity.
        #
        # @see Increase::Models::EntityCreateParams::RiskRating#rating
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

      class SupplementalDocument < Increase::Internal::Type::BaseModel
        # @!attribute file_id
        #   The identifier of the File containing the document.
        #
        #   @return [String]
        required :file_id, String

        # @!method initialize(file_id:)
        #   @param file_id [String] The identifier of the File containing the document.
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
        #   @return [Symbol, Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor]
        required :vendor, enum: -> { Increase::EntityCreateParams::ThirdPartyVerification::Vendor }

        # @!method initialize(reference:, vendor:)
        #   If you are using a third-party service for identity verification, you can use
        #   this field to associate this Entity with the identifier that represents them in
        #   that service.
        #
        #   @param reference [String] The reference identifier for the third party verification.
        #
        #   @param vendor [Symbol, Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor] The vendor that was used to perform the verification.

        # The vendor that was used to perform the verification.
        #
        # @see Increase::Models::EntityCreateParams::ThirdPartyVerification#vendor
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
        #   The trust's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        #
        #   @return [Increase::Models::EntityCreateParams::Trust::Address]
        required :address, -> { Increase::EntityCreateParams::Trust::Address }

        # @!attribute category
        #   Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
        #   their own Employer Identification Number. Revocable trusts require information
        #   about the individual `grantor` who created the trust.
        #
        #   @return [Symbol, Increase::Models::EntityCreateParams::Trust::Category]
        required :category, enum: -> { Increase::EntityCreateParams::Trust::Category }

        # @!attribute name
        #   The legal name of the trust.
        #
        #   @return [String]
        required :name, String

        # @!attribute trustees
        #   The trustees of the trust.
        #
        #   @return [Array<Increase::Models::EntityCreateParams::Trust::Trustee>]
        required :trustees, -> { Increase::Internal::Type::ArrayOf[Increase::EntityCreateParams::Trust::Trustee] }

        # @!attribute formation_document_file_id
        #   The identifier of the File containing the formation document of the trust.
        #
        #   @return [String, nil]
        optional :formation_document_file_id, String

        # @!attribute formation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the state in
        #   which the trust was formed.
        #
        #   @return [String, nil]
        optional :formation_state, String

        # @!attribute grantor
        #   The grantor of the trust. Required if `category` is equal to `revocable`.
        #
        #   @return [Increase::Models::EntityCreateParams::Trust::Grantor, nil]
        optional :grantor, -> { Increase::EntityCreateParams::Trust::Grantor }

        # @!attribute tax_identifier
        #   The Employer Identification Number (EIN) for the trust. Required if `category`
        #   is equal to `irrevocable`.
        #
        #   @return [String, nil]
        optional :tax_identifier, String

        # @!method initialize(address:, category:, name:, trustees:, formation_document_file_id: nil, formation_state: nil, grantor: nil, tax_identifier: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityCreateParams::Trust} for more details.
        #
        #   Details of the trust entity to create. Required if `structure` is equal to
        #   `trust`.
        #
        #   @param address [Increase::Models::EntityCreateParams::Trust::Address] The trust's physical address. Mail receiving locations like PO Boxes and PMB's a
        #
        #   @param category [Symbol, Increase::Models::EntityCreateParams::Trust::Category] Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require th
        #
        #   @param name [String] The legal name of the trust.
        #
        #   @param trustees [Array<Increase::Models::EntityCreateParams::Trust::Trustee>] The trustees of the trust.
        #
        #   @param formation_document_file_id [String] The identifier of the File containing the formation document of the trust.
        #
        #   @param formation_state [String] The two-letter United States Postal Service (USPS) abbreviation for the state in
        #
        #   @param grantor [Increase::Models::EntityCreateParams::Trust::Grantor] The grantor of the trust. Required if `category` is equal to `revocable`.
        #
        #   @param tax_identifier [String] The Employer Identification Number (EIN) for the trust. Required if `category` i

        # @see Increase::Models::EntityCreateParams::Trust#address
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
          #   {Increase::Models::EntityCreateParams::Trust::Address} for more details.
          #
          #   The trust's physical address. Mail receiving locations like PO Boxes and PMB's
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

        # Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
        # their own Employer Identification Number. Revocable trusts require information
        # about the individual `grantor` who created the trust.
        #
        # @see Increase::Models::EntityCreateParams::Trust#category
        module Category
          extend Increase::Internal::Type::Enum

          # The trust is revocable by the grantor.
          REVOCABLE = :revocable

          # The trust cannot be revoked.
          IRREVOCABLE = :irrevocable

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Trustee < Increase::Internal::Type::BaseModel
          # @!attribute structure
          #   The structure of the trustee.
          #
          #   @return [Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Structure]
          required :structure, enum: -> { Increase::EntityCreateParams::Trust::Trustee::Structure }

          # @!attribute individual
          #   Details of the individual trustee. Within the trustee object, this is required
          #   if `structure` is equal to `individual`.
          #
          #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual, nil]
          optional :individual, -> { Increase::EntityCreateParams::Trust::Trustee::Individual }

          # @!method initialize(structure:, individual: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::EntityCreateParams::Trust::Trustee} for more details.
          #
          #   @param structure [Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Structure] The structure of the trustee.
          #
          #   @param individual [Increase::Models::EntityCreateParams::Trust::Trustee::Individual] Details of the individual trustee. Within the trustee object, this is required i

          # The structure of the trustee.
          #
          # @see Increase::Models::EntityCreateParams::Trust::Trustee#structure
          module Structure
            extend Increase::Internal::Type::Enum

            # The trustee is an individual.
            INDIVIDUAL = :individual

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::EntityCreateParams::Trust::Trustee#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The individual's physical address. Mail receiving locations like PO Boxes and
            #   PMB's are disallowed.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address]
            required :address, -> { Increase::EntityCreateParams::Trust::Trustee::Individual::Address }

            # @!attribute date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :date_of_birth, Date

            # @!attribute identification
            #   A means of verifying the person's identity.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification]
            required :identification, -> { Increase::EntityCreateParams::Trust::Trustee::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!attribute confirmed_no_us_tax_id
            #   The identification method for an individual can only be a passport, driver's
            #   license, or other document if you've confirmed the individual does not have a US
            #   tax id (either a Social Security Number or Individual Taxpayer Identification
            #   Number).
            #
            #   @return [Boolean, nil]
            optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

            # @!method initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::EntityCreateParams::Trust::Trustee::Individual} for more
            #   details.
            #
            #   Details of the individual trustee. Within the trustee object, this is required
            #   if `structure` is equal to `individual`.
            #
            #   @param address [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address] The individual's physical address. Mail receiving locations like PO Boxes and PM
            #
            #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
            #
            #   @param identification [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification] A means of verifying the person's identity.
            #
            #   @param name [String] The person's legal name.
            #
            #   @param confirmed_no_us_tax_id [Boolean] The identification method for an individual can only be a passport, driver's lic

            # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual#address
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
              #   {Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address} for
              #   more details.
              #
              #   The individual's physical address. Mail receiving locations like PO Boxes and
              #   PMB's are disallowed.
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

            # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method]
              required :method_,
                       enum: -> {
                         Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method
                       },
                       api_name: :method

              # @!attribute number
              #   An identification number that can be used to verify the individual's identity,
              #   such as a social security number.
              #
              #   @return [String]
              required :number, String

              # @!attribute drivers_license
              #   Information about the United States driver's license used for identification.
              #   Required if `method` is equal to `drivers_license`.
              #
              #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense, nil]
              optional :drivers_license,
                       -> { Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense }

              # @!attribute other
              #   Information about the identification document provided. Required if `method` is
              #   equal to `other`.
              #
              #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other, nil]
              optional :other, -> { Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Other }

              # @!attribute passport
              #   Information about the passport used for identification. Required if `method` is
              #   equal to `passport`.
              #
              #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport, nil]
              optional :passport,
                       -> { Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport }

              # @!method initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification}
              #   for more details.
              #
              #   A means of verifying the person's identity.
              #
              #   @param method_ [Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method] A method that can be used to verify the individual's identity.
              #
              #   @param number [String] An identification number that can be used to verify the individual's identity, s
              #
              #   @param drivers_license [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense] Information about the United States driver's license used for identification. Re
              #
              #   @param other [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other] Information about the identification document provided. Required if `method` is
              #
              #   @param passport [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport] Information about the passport used for identification. Required if `method` is

              # A method that can be used to verify the individual's identity.
              #
              # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification#method_
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

              # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification#drivers_license
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

              # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification#other
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
                #   {Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other}
                #   for more details.
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

              # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification#passport
              class Passport < Increase::Internal::Type::BaseModel
                # @!attribute country
                #   The two-character ISO 3166-1 code representing the country that issued the
                #   passport (e.g., `US`).
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
                #   {Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport}
                #   for more details.
                #
                #   Information about the passport used for identification. Required if `method` is
                #   equal to `passport`.
                #
                #   @param country [String] The two-character ISO 3166-1 code representing the country that issued the passp
                #
                #   @param expiration_date [Date] The passport's expiration date in YYYY-MM-DD format.
                #
                #   @param file_id [String] The identifier of the File containing the passport.
              end
            end
          end
        end

        # @see Increase::Models::EntityCreateParams::Trust#grantor
        class Grantor < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The individual's physical address. Mail receiving locations like PO Boxes and
          #   PMB's are disallowed.
          #
          #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Address]
          required :address, -> { Increase::EntityCreateParams::Trust::Grantor::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification]
          required :identification, -> { Increase::EntityCreateParams::Trust::Grantor::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!attribute confirmed_no_us_tax_id
          #   The identification method for an individual can only be a passport, driver's
          #   license, or other document if you've confirmed the individual does not have a US
          #   tax id (either a Social Security Number or Individual Taxpayer Identification
          #   Number).
          #
          #   @return [Boolean, nil]
          optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

          # @!method initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::EntityCreateParams::Trust::Grantor} for more details.
          #
          #   The grantor of the trust. Required if `category` is equal to `revocable`.
          #
          #   @param address [Increase::Models::EntityCreateParams::Trust::Grantor::Address] The individual's physical address. Mail receiving locations like PO Boxes and PM
          #
          #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
          #
          #   @param identification [Increase::Models::EntityCreateParams::Trust::Grantor::Identification] A means of verifying the person's identity.
          #
          #   @param name [String] The person's legal name.
          #
          #   @param confirmed_no_us_tax_id [Boolean] The identification method for an individual can only be a passport, driver's lic

          # @see Increase::Models::EntityCreateParams::Trust::Grantor#address
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
            #   {Increase::Models::EntityCreateParams::Trust::Grantor::Address} for more
            #   details.
            #
            #   The individual's physical address. Mail receiving locations like PO Boxes and
            #   PMB's are disallowed.
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

          # @see Increase::Models::EntityCreateParams::Trust::Grantor#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method]
            required :method_,
                     enum: -> { Increase::EntityCreateParams::Trust::Grantor::Identification::Method },
                     api_name: :method

            # @!attribute number
            #   An identification number that can be used to verify the individual's identity,
            #   such as a social security number.
            #
            #   @return [String]
            required :number, String

            # @!attribute drivers_license
            #   Information about the United States driver's license used for identification.
            #   Required if `method` is equal to `drivers_license`.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense, nil]
            optional :drivers_license,
                     -> { Increase::EntityCreateParams::Trust::Grantor::Identification::DriversLicense }

            # @!attribute other
            #   Information about the identification document provided. Required if `method` is
            #   equal to `other`.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other, nil]
            optional :other, -> { Increase::EntityCreateParams::Trust::Grantor::Identification::Other }

            # @!attribute passport
            #   Information about the passport used for identification. Required if `method` is
            #   equal to `passport`.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport, nil]
            optional :passport, -> { Increase::EntityCreateParams::Trust::Grantor::Identification::Passport }

            # @!method initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::EntityCreateParams::Trust::Grantor::Identification} for more
            #   details.
            #
            #   A means of verifying the person's identity.
            #
            #   @param method_ [Symbol, Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method] A method that can be used to verify the individual's identity.
            #
            #   @param number [String] An identification number that can be used to verify the individual's identity, s
            #
            #   @param drivers_license [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense] Information about the United States driver's license used for identification. Re
            #
            #   @param other [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other] Information about the identification document provided. Required if `method` is
            #
            #   @param passport [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport] Information about the passport used for identification. Required if `method` is

            # A method that can be used to verify the individual's identity.
            #
            # @see Increase::Models::EntityCreateParams::Trust::Grantor::Identification#method_
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

            # @see Increase::Models::EntityCreateParams::Trust::Grantor::Identification#drivers_license
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

            # @see Increase::Models::EntityCreateParams::Trust::Grantor::Identification#other
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
              #   {Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other}
              #   for more details.
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

            # @see Increase::Models::EntityCreateParams::Trust::Grantor::Identification#passport
            class Passport < Increase::Internal::Type::BaseModel
              # @!attribute country
              #   The two-character ISO 3166-1 code representing the country that issued the
              #   passport (e.g., `US`).
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
              #   {Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport}
              #   for more details.
              #
              #   Information about the passport used for identification. Required if `method` is
              #   equal to `passport`.
              #
              #   @param country [String] The two-character ISO 3166-1 code representing the country that issued the passp
              #
              #   @param expiration_date [Date] The passport's expiration date in YYYY-MM-DD format.
              #
              #   @param file_id [String] The identifier of the File containing the passport.
            end
          end
        end
      end
    end
  end
end
