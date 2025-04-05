# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#create
    class EntityCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute structure
      #   The type of Entity to create.
      #
      #   @return [Symbol, Increase::Models::EntityCreateParams::Structure]
      required :structure, enum: -> { Increase::Models::EntityCreateParams::Structure }

      # @!attribute [r] corporation
      #   Details of the corporation entity to create. Required if `structure` is equal to
      #     `corporation`.
      #
      #   @return [Increase::Models::EntityCreateParams::Corporation, nil]
      optional :corporation, -> { Increase::Models::EntityCreateParams::Corporation }

      # @!parse
      #   # @return [Increase::Models::EntityCreateParams::Corporation]
      #   attr_writer :corporation

      # @!attribute [r] description
      #   The description you choose to give the entity.
      #
      #   @return [String, nil]
      optional :description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :description

      # @!attribute [r] government_authority
      #   Details of the Government Authority entity to create. Required if `structure` is
      #     equal to `Government Authority`.
      #
      #   @return [Increase::Models::EntityCreateParams::GovernmentAuthority, nil]
      optional :government_authority, -> { Increase::Models::EntityCreateParams::GovernmentAuthority }

      # @!parse
      #   # @return [Increase::Models::EntityCreateParams::GovernmentAuthority]
      #   attr_writer :government_authority

      # @!attribute [r] joint
      #   Details of the joint entity to create. Required if `structure` is equal to
      #     `joint`.
      #
      #   @return [Increase::Models::EntityCreateParams::Joint, nil]
      optional :joint, -> { Increase::Models::EntityCreateParams::Joint }

      # @!parse
      #   # @return [Increase::Models::EntityCreateParams::Joint]
      #   attr_writer :joint

      # @!attribute [r] natural_person
      #   Details of the natural person entity to create. Required if `structure` is equal
      #     to `natural_person`. Natural people entities should be submitted with
      #     `social_security_number` or `individual_taxpayer_identification_number`
      #     identification methods.
      #
      #   @return [Increase::Models::EntityCreateParams::NaturalPerson, nil]
      optional :natural_person, -> { Increase::Models::EntityCreateParams::NaturalPerson }

      # @!parse
      #   # @return [Increase::Models::EntityCreateParams::NaturalPerson]
      #   attr_writer :natural_person

      # @!attribute [r] supplemental_documents
      #   Additional documentation associated with the entity.
      #
      #   @return [Array<Increase::Models::EntityCreateParams::SupplementalDocument>, nil]
      optional :supplemental_documents,
               -> { Increase::Internal::Type::ArrayOf[Increase::Models::EntityCreateParams::SupplementalDocument] }

      # @!parse
      #   # @return [Array<Increase::Models::EntityCreateParams::SupplementalDocument>]
      #   attr_writer :supplemental_documents

      # @!attribute [r] third_party_verification
      #   A reference to data stored in a third-party verification service. Your
      #     integration may or may not use this field.
      #
      #   @return [Increase::Models::EntityCreateParams::ThirdPartyVerification, nil]
      optional :third_party_verification, -> { Increase::Models::EntityCreateParams::ThirdPartyVerification }

      # @!parse
      #   # @return [Increase::Models::EntityCreateParams::ThirdPartyVerification]
      #   attr_writer :third_party_verification

      # @!attribute [r] trust
      #   Details of the trust entity to create. Required if `structure` is equal to
      #     `trust`.
      #
      #   @return [Increase::Models::EntityCreateParams::Trust, nil]
      optional :trust, -> { Increase::Models::EntityCreateParams::Trust }

      # @!parse
      #   # @return [Increase::Models::EntityCreateParams::Trust]
      #   attr_writer :trust

      # @!parse
      #   # @param structure [Symbol, Increase::Models::EntityCreateParams::Structure]
      #   # @param corporation [Increase::Models::EntityCreateParams::Corporation]
      #   # @param description [String]
      #   # @param government_authority [Increase::Models::EntityCreateParams::GovernmentAuthority]
      #   # @param joint [Increase::Models::EntityCreateParams::Joint]
      #   # @param natural_person [Increase::Models::EntityCreateParams::NaturalPerson]
      #   # @param supplemental_documents [Array<Increase::Models::EntityCreateParams::SupplementalDocument>]
      #   # @param third_party_verification [Increase::Models::EntityCreateParams::ThirdPartyVerification]
      #   # @param trust [Increase::Models::EntityCreateParams::Trust]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     structure:,
      #     corporation: nil,
      #     description: nil,
      #     government_authority: nil,
      #     joint: nil,
      #     natural_person: nil,
      #     supplemental_documents: nil,
      #     third_party_verification: nil,
      #     trust: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      class Corporation < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #     are disallowed.
        #
        #   @return [Increase::Models::EntityCreateParams::Corporation::Address]
        required :address, -> { Increase::Models::EntityCreateParams::Corporation::Address }

        # @!attribute beneficial_owners
        #   The identifying details of anyone controlling or owning 25% or more of the
        #     corporation.
        #
        #   @return [Array<Increase::Models::EntityCreateParams::Corporation::BeneficialOwner>]
        required :beneficial_owners,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Models::EntityCreateParams::Corporation::BeneficialOwner] }

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

        # @!attribute [r] incorporation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the
        #     corporation's state of incorporation.
        #
        #   @return [String, nil]
        optional :incorporation_state, String

        # @!parse
        #   # @return [String]
        #   attr_writer :incorporation_state

        # @!attribute [r] industry_code
        #   The North American Industry Classification System (NAICS) code for the
        #     corporation's primary line of business. This is a number, like `5132` for
        #     `Software Publishers`. A full list of classification codes is available
        #     [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
        #
        #   @return [String, nil]
        optional :industry_code, String

        # @!parse
        #   # @return [String]
        #   attr_writer :industry_code

        # @!attribute [r] website
        #   The website of the corporation.
        #
        #   @return [String, nil]
        optional :website, String

        # @!parse
        #   # @return [String]
        #   attr_writer :website

        # @!parse
        #   # Details of the corporation entity to create. Required if `structure` is equal to
        #   #   `corporation`.
        #   #
        #   # @param address [Increase::Models::EntityCreateParams::Corporation::Address]
        #   # @param beneficial_owners [Array<Increase::Models::EntityCreateParams::Corporation::BeneficialOwner>]
        #   # @param name [String]
        #   # @param tax_identifier [String]
        #   # @param incorporation_state [String]
        #   # @param industry_code [String]
        #   # @param website [String]
        #   #
        #   def initialize(
        #     address:,
        #     beneficial_owners:,
        #     name:,
        #     tax_identifier:,
        #     incorporation_state: nil,
        #     industry_code: nil,
        #     website: nil,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

        class BeneficialOwner < Increase::Internal::Type::BaseModel
          # @!attribute individual
          #   Personal details for the beneficial owner.
          #
          #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual]
          required :individual,
                   -> { Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual }

          # @!attribute prongs
          #   Why this person is considered a beneficial owner of the entity. At least one
          #     option is required, if a person is both a control person and owner, submit an
          #     array containing both.
          #
          #   @return [Array<Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong>]
          required :prongs,
                   -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong] }

          # @!attribute [r] company_title
          #   This person's role or title within the entity.
          #
          #   @return [String, nil]
          optional :company_title, String

          # @!parse
          #   # @return [String]
          #   attr_writer :company_title

          # @!parse
          #   # @param individual [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual]
          #   # @param prongs [Array<Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong>]
          #   # @param company_title [String]
          #   #
          #   def initialize(individual:, prongs:, company_title: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The individual's physical address. Mail receiving locations like PO Boxes and
            #     PMB's are disallowed.
            #
            #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address]
            required :address,
                     -> { Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address }

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
                     -> { Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!attribute [r] confirmed_no_us_tax_id
            #   The identification method for an individual can only be a passport, driver's
            #     license, or other document if you've confirmed the individual does not have a US
            #     tax id (either a Social Security Number or Individual Taxpayer Identification
            #     Number).
            #
            #   @return [Boolean, nil]
            optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

            # @!parse
            #   # @return [Boolean]
            #   attr_writer :confirmed_no_us_tax_id

            # @!parse
            #   # Personal details for the beneficial owner.
            #   #
            #   # @param address [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address]
            #   # @param date_of_birth [Date]
            #   # @param identification [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification]
            #   # @param name [String]
            #   # @param confirmed_no_us_tax_id [Boolean]
            #   #
            #   def initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

            # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual#address
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

            # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method]
              required :method_,
                       enum: -> { Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method },
                       api_name: :method

              # @!attribute number
              #   An identification number that can be used to verify the individual's identity,
              #     such as a social security number.
              #
              #   @return [String]
              required :number, String

              # @!attribute [r] drivers_license
              #   Information about the United States driver's license used for identification.
              #     Required if `method` is equal to `drivers_license`.
              #
              #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense, nil]
              optional :drivers_license,
                       -> { Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense }

              # @!parse
              #   # @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense]
              #   attr_writer :drivers_license

              # @!attribute [r] other
              #   Information about the identification document provided. Required if `method` is
              #     equal to `other`.
              #
              #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other, nil]
              optional :other,
                       -> { Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other }

              # @!parse
              #   # @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other]
              #   attr_writer :other

              # @!attribute [r] passport
              #   Information about the passport used for identification. Required if `method` is
              #     equal to `passport`.
              #
              #   @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport, nil]
              optional :passport,
                       -> { Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport }

              # @!parse
              #   # @return [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport]
              #   attr_writer :passport

              # @!parse
              #   # A means of verifying the person's identity.
              #   #
              #   # @param method_ [Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method]
              #   # @param number [String]
              #   # @param drivers_license [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense]
              #   # @param other [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other]
              #   # @param passport [Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport]
              #   #
              #   def initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
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

                # @!attribute [r] back_file_id
                #   The identifier of the File containing the back of the driver's license.
                #
                #   @return [String, nil]
                optional :back_file_id, String

                # @!parse
                #   # @return [String]
                #   attr_writer :back_file_id

                # @!parse
                #   # Information about the United States driver's license used for identification.
                #   #   Required if `method` is equal to `drivers_license`.
                #   #
                #   # @param expiration_date [Date]
                #   # @param file_id [String]
                #   # @param state [String]
                #   # @param back_file_id [String]
                #   #
                #   def initialize(expiration_date:, file_id:, state:, back_file_id: nil, **) = super

                # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
              end

              # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification#other
              class Other < Increase::Internal::Type::BaseModel
                # @!attribute country
                #   The two-character ISO 3166-1 code representing the country that issued the
                #     document.
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

                # @!attribute [r] back_file_id
                #   The identifier of the File containing the back of the document. Not every
                #     document has a reverse side.
                #
                #   @return [String, nil]
                optional :back_file_id, String

                # @!parse
                #   # @return [String]
                #   attr_writer :back_file_id

                # @!attribute [r] expiration_date
                #   The document's expiration date in YYYY-MM-DD format.
                #
                #   @return [Date, nil]
                optional :expiration_date, Date

                # @!parse
                #   # @return [Date]
                #   attr_writer :expiration_date

                # @!parse
                #   # Information about the identification document provided. Required if `method` is
                #   #   equal to `other`.
                #   #
                #   # @param country [String]
                #   # @param description [String]
                #   # @param file_id [String]
                #   # @param back_file_id [String]
                #   # @param expiration_date [Date]
                #   #
                #   def initialize(country:, description:, file_id:, back_file_id: nil, expiration_date: nil, **) = super

                # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
              end

              # @see Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification#passport
              class Passport < Increase::Internal::Type::BaseModel
                # @!attribute country
                #   The country that issued the passport.
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

                # @!parse
                #   # Information about the passport used for identification. Required if `method` is
                #   #   equal to `passport`.
                #   #
                #   # @param country [String]
                #   # @param expiration_date [Date]
                #   # @param file_id [String]
                #   #
                #   def initialize(country:, expiration_date:, file_id:, **) = super

                # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
              end
            end
          end

          module Prong
            extend Increase::Internal::Type::Enum

            # A person with 25% or greater direct or indirect ownership of the entity.
            OWNERSHIP = :ownership

            # A person who manages, directs, or has significant control of the entity.
            CONTROL = :control

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end
      end

      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #     are disallowed.
        #
        #   @return [Increase::Models::EntityCreateParams::GovernmentAuthority::Address]
        required :address, -> { Increase::Models::EntityCreateParams::GovernmentAuthority::Address }

        # @!attribute authorized_persons
        #   The identifying details of authorized officials acting on the entity's behalf.
        #
        #   @return [Array<Increase::Models::EntityCreateParams::GovernmentAuthority::AuthorizedPerson>]
        required :authorized_persons,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Models::EntityCreateParams::GovernmentAuthority::AuthorizedPerson] }

        # @!attribute category
        #   The category of the government authority.
        #
        #   @return [Symbol, Increase::Models::EntityCreateParams::GovernmentAuthority::Category]
        required :category, enum: -> { Increase::Models::EntityCreateParams::GovernmentAuthority::Category }

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

        # @!attribute [r] website
        #   The website of the government authority.
        #
        #   @return [String, nil]
        optional :website, String

        # @!parse
        #   # @return [String]
        #   attr_writer :website

        # @!parse
        #   # Details of the Government Authority entity to create. Required if `structure` is
        #   #   equal to `Government Authority`.
        #   #
        #   # @param address [Increase::Models::EntityCreateParams::GovernmentAuthority::Address]
        #   # @param authorized_persons [Array<Increase::Models::EntityCreateParams::GovernmentAuthority::AuthorizedPerson>]
        #   # @param category [Symbol, Increase::Models::EntityCreateParams::GovernmentAuthority::Category]
        #   # @param name [String]
        #   # @param tax_identifier [String]
        #   # @param website [String]
        #   #
        #   def initialize(address:, authorized_persons:, category:, name:, tax_identifier:, website: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

        class AuthorizedPerson < Increase::Internal::Type::BaseModel
          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!parse
          #   # @param name [String]
          #   #
          #   def initialize(name:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # The category of the government authority.
        #
        # @see Increase::Models::EntityCreateParams::GovernmentAuthority#category
        module Category
          extend Increase::Internal::Type::Enum

          # The Public Entity is a Municipality.
          MUNICIPALITY = :municipality

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      class Joint < Increase::Internal::Type::BaseModel
        # @!attribute individuals
        #   The two individuals that share control of the entity.
        #
        #   @return [Array<Increase::Models::EntityCreateParams::Joint::Individual>]
        required :individuals,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Models::EntityCreateParams::Joint::Individual] }

        # @!attribute [r] name
        #   The name of the joint entity.
        #
        #   @return [String, nil]
        optional :name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :name

        # @!parse
        #   # Details of the joint entity to create. Required if `structure` is equal to
        #   #   `joint`.
        #   #
        #   # @param individuals [Array<Increase::Models::EntityCreateParams::Joint::Individual>]
        #   # @param name [String]
        #   #
        #   def initialize(individuals:, name: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        class Individual < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The individual's physical address. Mail receiving locations like PO Boxes and
          #     PMB's are disallowed.
          #
          #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Address]
          required :address, -> { Increase::Models::EntityCreateParams::Joint::Individual::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification]
          required :identification, -> { Increase::Models::EntityCreateParams::Joint::Individual::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!attribute [r] confirmed_no_us_tax_id
          #   The identification method for an individual can only be a passport, driver's
          #     license, or other document if you've confirmed the individual does not have a US
          #     tax id (either a Social Security Number or Individual Taxpayer Identification
          #     Number).
          #
          #   @return [Boolean, nil]
          optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :confirmed_no_us_tax_id

          # @!parse
          #   # @param address [Increase::Models::EntityCreateParams::Joint::Individual::Address]
          #   # @param date_of_birth [Date]
          #   # @param identification [Increase::Models::EntityCreateParams::Joint::Individual::Identification]
          #   # @param name [String]
          #   # @param confirmed_no_us_tax_id [Boolean]
          #   #
          #   def initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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
            #   # The individual's physical address. Mail receiving locations like PO Boxes and
            #   #   PMB's are disallowed.
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

          # @see Increase::Models::EntityCreateParams::Joint::Individual#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method]
            required :method_,
                     enum: -> { Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method },
                     api_name: :method

            # @!attribute number
            #   An identification number that can be used to verify the individual's identity,
            #     such as a social security number.
            #
            #   @return [String]
            required :number, String

            # @!attribute [r] drivers_license
            #   Information about the United States driver's license used for identification.
            #     Required if `method` is equal to `drivers_license`.
            #
            #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense, nil]
            optional :drivers_license,
                     -> { Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense }

            # @!parse
            #   # @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense]
            #   attr_writer :drivers_license

            # @!attribute [r] other
            #   Information about the identification document provided. Required if `method` is
            #     equal to `other`.
            #
            #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other, nil]
            optional :other, -> { Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other }

            # @!parse
            #   # @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other]
            #   attr_writer :other

            # @!attribute [r] passport
            #   Information about the passport used for identification. Required if `method` is
            #     equal to `passport`.
            #
            #   @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport, nil]
            optional :passport,
                     -> { Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport }

            # @!parse
            #   # @return [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport]
            #   attr_writer :passport

            # @!parse
            #   # A means of verifying the person's identity.
            #   #
            #   # @param method_ [Symbol, Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method]
            #   # @param number [String]
            #   # @param drivers_license [Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense]
            #   # @param other [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other]
            #   # @param passport [Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport]
            #   #
            #   def initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

              finalize!

              # @!parse
              #   # @return [Array<Symbol>]
              #   def self.values; end
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

              # @!attribute [r] back_file_id
              #   The identifier of the File containing the back of the driver's license.
              #
              #   @return [String, nil]
              optional :back_file_id, String

              # @!parse
              #   # @return [String]
              #   attr_writer :back_file_id

              # @!parse
              #   # Information about the United States driver's license used for identification.
              #   #   Required if `method` is equal to `drivers_license`.
              #   #
              #   # @param expiration_date [Date]
              #   # @param file_id [String]
              #   # @param state [String]
              #   # @param back_file_id [String]
              #   #
              #   def initialize(expiration_date:, file_id:, state:, back_file_id: nil, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
            end

            # @see Increase::Models::EntityCreateParams::Joint::Individual::Identification#other
            class Other < Increase::Internal::Type::BaseModel
              # @!attribute country
              #   The two-character ISO 3166-1 code representing the country that issued the
              #     document.
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

              # @!attribute [r] back_file_id
              #   The identifier of the File containing the back of the document. Not every
              #     document has a reverse side.
              #
              #   @return [String, nil]
              optional :back_file_id, String

              # @!parse
              #   # @return [String]
              #   attr_writer :back_file_id

              # @!attribute [r] expiration_date
              #   The document's expiration date in YYYY-MM-DD format.
              #
              #   @return [Date, nil]
              optional :expiration_date, Date

              # @!parse
              #   # @return [Date]
              #   attr_writer :expiration_date

              # @!parse
              #   # Information about the identification document provided. Required if `method` is
              #   #   equal to `other`.
              #   #
              #   # @param country [String]
              #   # @param description [String]
              #   # @param file_id [String]
              #   # @param back_file_id [String]
              #   # @param expiration_date [Date]
              #   #
              #   def initialize(country:, description:, file_id:, back_file_id: nil, expiration_date: nil, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
            end

            # @see Increase::Models::EntityCreateParams::Joint::Individual::Identification#passport
            class Passport < Increase::Internal::Type::BaseModel
              # @!attribute country
              #   The country that issued the passport.
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

              # @!parse
              #   # Information about the passport used for identification. Required if `method` is
              #   #   equal to `passport`.
              #   #
              #   # @param country [String]
              #   # @param expiration_date [Date]
              #   # @param file_id [String]
              #   #
              #   def initialize(country:, expiration_date:, file_id:, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
            end
          end
        end
      end

      class NaturalPerson < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The individual's physical address. Mail receiving locations like PO Boxes and
        #     PMB's are disallowed.
        #
        #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Address]
        required :address, -> { Increase::Models::EntityCreateParams::NaturalPerson::Address }

        # @!attribute date_of_birth
        #   The person's date of birth in YYYY-MM-DD format.
        #
        #   @return [Date]
        required :date_of_birth, Date

        # @!attribute identification
        #   A means of verifying the person's identity.
        #
        #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification]
        required :identification, -> { Increase::Models::EntityCreateParams::NaturalPerson::Identification }

        # @!attribute name
        #   The person's legal name.
        #
        #   @return [String]
        required :name, String

        # @!attribute [r] confirmed_no_us_tax_id
        #   The identification method for an individual can only be a passport, driver's
        #     license, or other document if you've confirmed the individual does not have a US
        #     tax id (either a Social Security Number or Individual Taxpayer Identification
        #     Number).
        #
        #   @return [Boolean, nil]
        optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

        # @!parse
        #   # @return [Boolean]
        #   attr_writer :confirmed_no_us_tax_id

        # @!parse
        #   # Details of the natural person entity to create. Required if `structure` is equal
        #   #   to `natural_person`. Natural people entities should be submitted with
        #   #   `social_security_number` or `individual_taxpayer_identification_number`
        #   #   identification methods.
        #   #
        #   # @param address [Increase::Models::EntityCreateParams::NaturalPerson::Address]
        #   # @param date_of_birth [Date]
        #   # @param identification [Increase::Models::EntityCreateParams::NaturalPerson::Identification]
        #   # @param name [String]
        #   # @param confirmed_no_us_tax_id [Boolean]
        #   #
        #   def initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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
          #   # The individual's physical address. Mail receiving locations like PO Boxes and
          #   #   PMB's are disallowed.
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

        # @see Increase::Models::EntityCreateParams::NaturalPerson#identification
        class Identification < Increase::Internal::Type::BaseModel
          # @!attribute method_
          #   A method that can be used to verify the individual's identity.
          #
          #   @return [Symbol, Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method]
          required :method_,
                   enum: -> { Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method },
                   api_name: :method

          # @!attribute number
          #   An identification number that can be used to verify the individual's identity,
          #     such as a social security number.
          #
          #   @return [String]
          required :number, String

          # @!attribute [r] drivers_license
          #   Information about the United States driver's license used for identification.
          #     Required if `method` is equal to `drivers_license`.
          #
          #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense, nil]
          optional :drivers_license,
                   -> { Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense }

          # @!parse
          #   # @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense]
          #   attr_writer :drivers_license

          # @!attribute [r] other
          #   Information about the identification document provided. Required if `method` is
          #     equal to `other`.
          #
          #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other, nil]
          optional :other, -> { Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other }

          # @!parse
          #   # @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other]
          #   attr_writer :other

          # @!attribute [r] passport
          #   Information about the passport used for identification. Required if `method` is
          #     equal to `passport`.
          #
          #   @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport, nil]
          optional :passport, -> { Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport }

          # @!parse
          #   # @return [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport]
          #   attr_writer :passport

          # @!parse
          #   # A means of verifying the person's identity.
          #   #
          #   # @param method_ [Symbol, Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method]
          #   # @param number [String]
          #   # @param drivers_license [Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense]
          #   # @param other [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other]
          #   # @param passport [Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport]
          #   #
          #   def initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
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

            # @!attribute [r] back_file_id
            #   The identifier of the File containing the back of the driver's license.
            #
            #   @return [String, nil]
            optional :back_file_id, String

            # @!parse
            #   # @return [String]
            #   attr_writer :back_file_id

            # @!parse
            #   # Information about the United States driver's license used for identification.
            #   #   Required if `method` is equal to `drivers_license`.
            #   #
            #   # @param expiration_date [Date]
            #   # @param file_id [String]
            #   # @param state [String]
            #   # @param back_file_id [String]
            #   #
            #   def initialize(expiration_date:, file_id:, state:, back_file_id: nil, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
          end

          # @see Increase::Models::EntityCreateParams::NaturalPerson::Identification#other
          class Other < Increase::Internal::Type::BaseModel
            # @!attribute country
            #   The two-character ISO 3166-1 code representing the country that issued the
            #     document.
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

            # @!attribute [r] back_file_id
            #   The identifier of the File containing the back of the document. Not every
            #     document has a reverse side.
            #
            #   @return [String, nil]
            optional :back_file_id, String

            # @!parse
            #   # @return [String]
            #   attr_writer :back_file_id

            # @!attribute [r] expiration_date
            #   The document's expiration date in YYYY-MM-DD format.
            #
            #   @return [Date, nil]
            optional :expiration_date, Date

            # @!parse
            #   # @return [Date]
            #   attr_writer :expiration_date

            # @!parse
            #   # Information about the identification document provided. Required if `method` is
            #   #   equal to `other`.
            #   #
            #   # @param country [String]
            #   # @param description [String]
            #   # @param file_id [String]
            #   # @param back_file_id [String]
            #   # @param expiration_date [Date]
            #   #
            #   def initialize(country:, description:, file_id:, back_file_id: nil, expiration_date: nil, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
          end

          # @see Increase::Models::EntityCreateParams::NaturalPerson::Identification#passport
          class Passport < Increase::Internal::Type::BaseModel
            # @!attribute country
            #   The country that issued the passport.
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

            # @!parse
            #   # Information about the passport used for identification. Required if `method` is
            #   #   equal to `passport`.
            #   #
            #   # @param country [String]
            #   # @param expiration_date [Date]
            #   # @param file_id [String]
            #   #
            #   def initialize(country:, expiration_date:, file_id:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
          end
        end
      end

      class SupplementalDocument < Increase::Internal::Type::BaseModel
        # @!attribute file_id
        #   The identifier of the File containing the document.
        #
        #   @return [String]
        required :file_id, String

        # @!parse
        #   # @param file_id [String]
        #   #
        #   def initialize(file_id:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
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
        required :vendor, enum: -> { Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor }

        # @!parse
        #   # A reference to data stored in a third-party verification service. Your
        #   #   integration may or may not use this field.
        #   #
        #   # @param reference [String]
        #   # @param vendor [Symbol, Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor]
        #   #
        #   def initialize(reference:, vendor:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # The vendor that was used to perform the verification.
        #
        # @see Increase::Models::EntityCreateParams::ThirdPartyVerification#vendor
        module Vendor
          extend Increase::Internal::Type::Enum

          # Alloy. See https://alloy.com for more information.
          ALLOY = :alloy

          # Middesk. See https://middesk.com for more information.
          MIDDESK = :middesk

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      class Trust < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The trust's physical address. Mail receiving locations like PO Boxes and PMB's
        #     are disallowed.
        #
        #   @return [Increase::Models::EntityCreateParams::Trust::Address]
        required :address, -> { Increase::Models::EntityCreateParams::Trust::Address }

        # @!attribute category
        #   Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
        #     their own Employer Identification Number. Revocable trusts require information
        #     about the individual `grantor` who created the trust.
        #
        #   @return [Symbol, Increase::Models::EntityCreateParams::Trust::Category]
        required :category, enum: -> { Increase::Models::EntityCreateParams::Trust::Category }

        # @!attribute name
        #   The legal name of the trust.
        #
        #   @return [String]
        required :name, String

        # @!attribute trustees
        #   The trustees of the trust.
        #
        #   @return [Array<Increase::Models::EntityCreateParams::Trust::Trustee>]
        required :trustees,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Models::EntityCreateParams::Trust::Trustee] }

        # @!attribute [r] formation_document_file_id
        #   The identifier of the File containing the formation document of the trust.
        #
        #   @return [String, nil]
        optional :formation_document_file_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :formation_document_file_id

        # @!attribute [r] formation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the state in
        #     which the trust was formed.
        #
        #   @return [String, nil]
        optional :formation_state, String

        # @!parse
        #   # @return [String]
        #   attr_writer :formation_state

        # @!attribute [r] grantor
        #   The grantor of the trust. Required if `category` is equal to `revocable`.
        #
        #   @return [Increase::Models::EntityCreateParams::Trust::Grantor, nil]
        optional :grantor, -> { Increase::Models::EntityCreateParams::Trust::Grantor }

        # @!parse
        #   # @return [Increase::Models::EntityCreateParams::Trust::Grantor]
        #   attr_writer :grantor

        # @!attribute [r] tax_identifier
        #   The Employer Identification Number (EIN) for the trust. Required if `category`
        #     is equal to `irrevocable`.
        #
        #   @return [String, nil]
        optional :tax_identifier, String

        # @!parse
        #   # @return [String]
        #   attr_writer :tax_identifier

        # @!parse
        #   # Details of the trust entity to create. Required if `structure` is equal to
        #   #   `trust`.
        #   #
        #   # @param address [Increase::Models::EntityCreateParams::Trust::Address]
        #   # @param category [Symbol, Increase::Models::EntityCreateParams::Trust::Category]
        #   # @param name [String]
        #   # @param trustees [Array<Increase::Models::EntityCreateParams::Trust::Trustee>]
        #   # @param formation_document_file_id [String]
        #   # @param formation_state [String]
        #   # @param grantor [Increase::Models::EntityCreateParams::Trust::Grantor]
        #   # @param tax_identifier [String]
        #   #
        #   def initialize(
        #     address:,
        #     category:,
        #     name:,
        #     trustees:,
        #     formation_document_file_id: nil,
        #     formation_state: nil,
        #     grantor: nil,
        #     tax_identifier: nil,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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
          #   # The trust's physical address. Mail receiving locations like PO Boxes and PMB's
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

        # Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
        #   their own Employer Identification Number. Revocable trusts require information
        #   about the individual `grantor` who created the trust.
        #
        # @see Increase::Models::EntityCreateParams::Trust#category
        module Category
          extend Increase::Internal::Type::Enum

          # The trust is revocable by the grantor.
          REVOCABLE = :revocable

          # The trust cannot be revoked.
          IRREVOCABLE = :irrevocable

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        class Trustee < Increase::Internal::Type::BaseModel
          # @!attribute structure
          #   The structure of the trustee.
          #
          #   @return [Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Structure]
          required :structure, enum: -> { Increase::Models::EntityCreateParams::Trust::Trustee::Structure }

          # @!attribute [r] individual
          #   Details of the individual trustee. Required when the trustee `structure` is
          #     equal to `individual`.
          #
          #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual, nil]
          optional :individual, -> { Increase::Models::EntityCreateParams::Trust::Trustee::Individual }

          # @!parse
          #   # @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual]
          #   attr_writer :individual

          # @!parse
          #   # @param structure [Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Structure]
          #   # @param individual [Increase::Models::EntityCreateParams::Trust::Trustee::Individual]
          #   #
          #   def initialize(structure:, individual: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # The structure of the trustee.
          #
          # @see Increase::Models::EntityCreateParams::Trust::Trustee#structure
          module Structure
            extend Increase::Internal::Type::Enum

            # The trustee is an individual.
            INDIVIDUAL = :individual

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end

          # @see Increase::Models::EntityCreateParams::Trust::Trustee#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The individual's physical address. Mail receiving locations like PO Boxes and
            #     PMB's are disallowed.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address]
            required :address, -> { Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address }

            # @!attribute date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :date_of_birth, Date

            # @!attribute identification
            #   A means of verifying the person's identity.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification]
            required :identification,
                     -> { Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!attribute [r] confirmed_no_us_tax_id
            #   The identification method for an individual can only be a passport, driver's
            #     license, or other document if you've confirmed the individual does not have a US
            #     tax id (either a Social Security Number or Individual Taxpayer Identification
            #     Number).
            #
            #   @return [Boolean, nil]
            optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

            # @!parse
            #   # @return [Boolean]
            #   attr_writer :confirmed_no_us_tax_id

            # @!parse
            #   # Details of the individual trustee. Required when the trustee `structure` is
            #   #   equal to `individual`.
            #   #
            #   # @param address [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address]
            #   # @param date_of_birth [Date]
            #   # @param identification [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification]
            #   # @param name [String]
            #   # @param confirmed_no_us_tax_id [Boolean]
            #   #
            #   def initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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
              #   # The individual's physical address. Mail receiving locations like PO Boxes and
              #   #   PMB's are disallowed.
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

            # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method]
              required :method_,
                       enum: -> { Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method },
                       api_name: :method

              # @!attribute number
              #   An identification number that can be used to verify the individual's identity,
              #     such as a social security number.
              #
              #   @return [String]
              required :number, String

              # @!attribute [r] drivers_license
              #   Information about the United States driver's license used for identification.
              #     Required if `method` is equal to `drivers_license`.
              #
              #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense, nil]
              optional :drivers_license,
                       -> { Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense }

              # @!parse
              #   # @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense]
              #   attr_writer :drivers_license

              # @!attribute [r] other
              #   Information about the identification document provided. Required if `method` is
              #     equal to `other`.
              #
              #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other, nil]
              optional :other,
                       -> { Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other }

              # @!parse
              #   # @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other]
              #   attr_writer :other

              # @!attribute [r] passport
              #   Information about the passport used for identification. Required if `method` is
              #     equal to `passport`.
              #
              #   @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport, nil]
              optional :passport,
                       -> { Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport }

              # @!parse
              #   # @return [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport]
              #   attr_writer :passport

              # @!parse
              #   # A means of verifying the person's identity.
              #   #
              #   # @param method_ [Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method]
              #   # @param number [String]
              #   # @param drivers_license [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense]
              #   # @param other [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other]
              #   # @param passport [Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport]
              #   #
              #   def initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
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

                # @!attribute [r] back_file_id
                #   The identifier of the File containing the back of the driver's license.
                #
                #   @return [String, nil]
                optional :back_file_id, String

                # @!parse
                #   # @return [String]
                #   attr_writer :back_file_id

                # @!parse
                #   # Information about the United States driver's license used for identification.
                #   #   Required if `method` is equal to `drivers_license`.
                #   #
                #   # @param expiration_date [Date]
                #   # @param file_id [String]
                #   # @param state [String]
                #   # @param back_file_id [String]
                #   #
                #   def initialize(expiration_date:, file_id:, state:, back_file_id: nil, **) = super

                # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
              end

              # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification#other
              class Other < Increase::Internal::Type::BaseModel
                # @!attribute country
                #   The two-character ISO 3166-1 code representing the country that issued the
                #     document.
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

                # @!attribute [r] back_file_id
                #   The identifier of the File containing the back of the document. Not every
                #     document has a reverse side.
                #
                #   @return [String, nil]
                optional :back_file_id, String

                # @!parse
                #   # @return [String]
                #   attr_writer :back_file_id

                # @!attribute [r] expiration_date
                #   The document's expiration date in YYYY-MM-DD format.
                #
                #   @return [Date, nil]
                optional :expiration_date, Date

                # @!parse
                #   # @return [Date]
                #   attr_writer :expiration_date

                # @!parse
                #   # Information about the identification document provided. Required if `method` is
                #   #   equal to `other`.
                #   #
                #   # @param country [String]
                #   # @param description [String]
                #   # @param file_id [String]
                #   # @param back_file_id [String]
                #   # @param expiration_date [Date]
                #   #
                #   def initialize(country:, description:, file_id:, back_file_id: nil, expiration_date: nil, **) = super

                # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
              end

              # @see Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification#passport
              class Passport < Increase::Internal::Type::BaseModel
                # @!attribute country
                #   The country that issued the passport.
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

                # @!parse
                #   # Information about the passport used for identification. Required if `method` is
                #   #   equal to `passport`.
                #   #
                #   # @param country [String]
                #   # @param expiration_date [Date]
                #   # @param file_id [String]
                #   #
                #   def initialize(country:, expiration_date:, file_id:, **) = super

                # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
              end
            end
          end
        end

        # @see Increase::Models::EntityCreateParams::Trust#grantor
        class Grantor < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The individual's physical address. Mail receiving locations like PO Boxes and
          #     PMB's are disallowed.
          #
          #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Address]
          required :address, -> { Increase::Models::EntityCreateParams::Trust::Grantor::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification]
          required :identification, -> { Increase::Models::EntityCreateParams::Trust::Grantor::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!attribute [r] confirmed_no_us_tax_id
          #   The identification method for an individual can only be a passport, driver's
          #     license, or other document if you've confirmed the individual does not have a US
          #     tax id (either a Social Security Number or Individual Taxpayer Identification
          #     Number).
          #
          #   @return [Boolean, nil]
          optional :confirmed_no_us_tax_id, Increase::Internal::Type::Boolean

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :confirmed_no_us_tax_id

          # @!parse
          #   # The grantor of the trust. Required if `category` is equal to `revocable`.
          #   #
          #   # @param address [Increase::Models::EntityCreateParams::Trust::Grantor::Address]
          #   # @param date_of_birth [Date]
          #   # @param identification [Increase::Models::EntityCreateParams::Trust::Grantor::Identification]
          #   # @param name [String]
          #   # @param confirmed_no_us_tax_id [Boolean]
          #   #
          #   def initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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
            #   # The individual's physical address. Mail receiving locations like PO Boxes and
            #   #   PMB's are disallowed.
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

          # @see Increase::Models::EntityCreateParams::Trust::Grantor#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method]
            required :method_,
                     enum: -> { Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method },
                     api_name: :method

            # @!attribute number
            #   An identification number that can be used to verify the individual's identity,
            #     such as a social security number.
            #
            #   @return [String]
            required :number, String

            # @!attribute [r] drivers_license
            #   Information about the United States driver's license used for identification.
            #     Required if `method` is equal to `drivers_license`.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense, nil]
            optional :drivers_license,
                     -> { Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense }

            # @!parse
            #   # @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense]
            #   attr_writer :drivers_license

            # @!attribute [r] other
            #   Information about the identification document provided. Required if `method` is
            #     equal to `other`.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other, nil]
            optional :other, -> { Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other }

            # @!parse
            #   # @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other]
            #   attr_writer :other

            # @!attribute [r] passport
            #   Information about the passport used for identification. Required if `method` is
            #     equal to `passport`.
            #
            #   @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport, nil]
            optional :passport, -> { Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport }

            # @!parse
            #   # @return [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport]
            #   attr_writer :passport

            # @!parse
            #   # A means of verifying the person's identity.
            #   #
            #   # @param method_ [Symbol, Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method]
            #   # @param number [String]
            #   # @param drivers_license [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense]
            #   # @param other [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other]
            #   # @param passport [Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport]
            #   #
            #   def initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

              finalize!

              # @!parse
              #   # @return [Array<Symbol>]
              #   def self.values; end
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

              # @!attribute [r] back_file_id
              #   The identifier of the File containing the back of the driver's license.
              #
              #   @return [String, nil]
              optional :back_file_id, String

              # @!parse
              #   # @return [String]
              #   attr_writer :back_file_id

              # @!parse
              #   # Information about the United States driver's license used for identification.
              #   #   Required if `method` is equal to `drivers_license`.
              #   #
              #   # @param expiration_date [Date]
              #   # @param file_id [String]
              #   # @param state [String]
              #   # @param back_file_id [String]
              #   #
              #   def initialize(expiration_date:, file_id:, state:, back_file_id: nil, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
            end

            # @see Increase::Models::EntityCreateParams::Trust::Grantor::Identification#other
            class Other < Increase::Internal::Type::BaseModel
              # @!attribute country
              #   The two-character ISO 3166-1 code representing the country that issued the
              #     document.
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

              # @!attribute [r] back_file_id
              #   The identifier of the File containing the back of the document. Not every
              #     document has a reverse side.
              #
              #   @return [String, nil]
              optional :back_file_id, String

              # @!parse
              #   # @return [String]
              #   attr_writer :back_file_id

              # @!attribute [r] expiration_date
              #   The document's expiration date in YYYY-MM-DD format.
              #
              #   @return [Date, nil]
              optional :expiration_date, Date

              # @!parse
              #   # @return [Date]
              #   attr_writer :expiration_date

              # @!parse
              #   # Information about the identification document provided. Required if `method` is
              #   #   equal to `other`.
              #   #
              #   # @param country [String]
              #   # @param description [String]
              #   # @param file_id [String]
              #   # @param back_file_id [String]
              #   # @param expiration_date [Date]
              #   #
              #   def initialize(country:, description:, file_id:, back_file_id: nil, expiration_date: nil, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
            end

            # @see Increase::Models::EntityCreateParams::Trust::Grantor::Identification#passport
            class Passport < Increase::Internal::Type::BaseModel
              # @!attribute country
              #   The country that issued the passport.
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

              # @!parse
              #   # Information about the passport used for identification. Required if `method` is
              #   #   equal to `passport`.
              #   #
              #   # @param country [String]
              #   # @param expiration_date [Date]
              #   # @param file_id [String]
              #   #
              #   def initialize(country:, expiration_date:, file_id:, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
            end
          end
        end
      end
    end
  end
end
