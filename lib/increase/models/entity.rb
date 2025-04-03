# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#create
    class Entity < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The entity's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute corporation
      #   Details of the corporation entity. Will be present if `structure` is equal to
      #     `corporation`.
      #
      #   @return [Increase::Models::Entity::Corporation, nil]
      required :corporation, -> { Increase::Models::Entity::Corporation }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity
      #     was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute description
      #   The entity's description for display purposes.
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute details_confirmed_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
      #     Entity's details were most recently confirmed.
      #
      #   @return [Time, nil]
      required :details_confirmed_at, Time, nil?: true

      # @!attribute government_authority
      #   Details of the government authority entity. Will be present if `structure` is
      #     equal to `government_authority`.
      #
      #   @return [Increase::Models::Entity::GovernmentAuthority, nil]
      required :government_authority, -> { Increase::Models::Entity::GovernmentAuthority }, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute joint
      #   Details of the joint entity. Will be present if `structure` is equal to `joint`.
      #
      #   @return [Increase::Models::Entity::Joint, nil]
      required :joint, -> { Increase::Models::Entity::Joint }, nil?: true

      # @!attribute natural_person
      #   Details of the natural person entity. Will be present if `structure` is equal to
      #     `natural_person`.
      #
      #   @return [Increase::Models::Entity::NaturalPerson, nil]
      required :natural_person, -> { Increase::Models::Entity::NaturalPerson }, nil?: true

      # @!attribute status
      #   The status of the entity.
      #
      #   @return [Symbol, Increase::Models::Entity::Status]
      required :status, enum: -> { Increase::Models::Entity::Status }

      # @!attribute structure
      #   The entity's legal structure.
      #
      #   @return [Symbol, Increase::Models::Entity::Structure]
      required :structure, enum: -> { Increase::Models::Entity::Structure }

      # @!attribute supplemental_documents
      #   Additional documentation associated with the entity. This is limited to the
      #     first 10 documents for an entity. If an entity has more than 10 documents, use
      #     the GET /entity_supplemental_documents list endpoint to retrieve them.
      #
      #   @return [Array<Increase::Models::EntitySupplementalDocument>]
      required :supplemental_documents,
               -> { Increase::Internal::Type::ArrayOf[Increase::Models::EntitySupplementalDocument] }

      # @!attribute third_party_verification
      #   A reference to data stored in a third-party verification service. Your
      #     integration may or may not use this field.
      #
      #   @return [Increase::Models::Entity::ThirdPartyVerification, nil]
      required :third_party_verification, -> { Increase::Models::Entity::ThirdPartyVerification }, nil?: true

      # @!attribute trust
      #   Details of the trust entity. Will be present if `structure` is equal to `trust`.
      #
      #   @return [Increase::Models::Entity::Trust, nil]
      required :trust, -> { Increase::Models::Entity::Trust }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `entity`.
      #
      #   @return [Symbol, Increase::Models::Entity::Type]
      required :type, enum: -> { Increase::Models::Entity::Type }

      # @!parse
      #   # Entities are the legal entities that own accounts. They can be people,
      #   #   corporations, partnerships, government authorities, or trusts.
      #   #
      #   # @param id [String]
      #   # @param corporation [Increase::Models::Entity::Corporation, nil]
      #   # @param created_at [Time]
      #   # @param description [String, nil]
      #   # @param details_confirmed_at [Time, nil]
      #   # @param government_authority [Increase::Models::Entity::GovernmentAuthority, nil]
      #   # @param idempotency_key [String, nil]
      #   # @param joint [Increase::Models::Entity::Joint, nil]
      #   # @param natural_person [Increase::Models::Entity::NaturalPerson, nil]
      #   # @param status [Symbol, Increase::Models::Entity::Status]
      #   # @param structure [Symbol, Increase::Models::Entity::Structure]
      #   # @param supplemental_documents [Array<Increase::Models::EntitySupplementalDocument>]
      #   # @param third_party_verification [Increase::Models::Entity::ThirdPartyVerification, nil]
      #   # @param trust [Increase::Models::Entity::Trust, nil]
      #   # @param type [Symbol, Increase::Models::Entity::Type]
      #   #
      #   def initialize(
      #     id:,
      #     corporation:,
      #     created_at:,
      #     description:,
      #     details_confirmed_at:,
      #     government_authority:,
      #     idempotency_key:,
      #     joint:,
      #     natural_person:,
      #     status:,
      #     structure:,
      #     supplemental_documents:,
      #     third_party_verification:,
      #     trust:,
      #     type:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # @see Increase::Models::Entity#corporation
      class Corporation < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The corporation's address.
        #
        #   @return [Increase::Models::Entity::Corporation::Address]
        required :address, -> { Increase::Models::Entity::Corporation::Address }

        # @!attribute beneficial_owners
        #   The identifying details of anyone controlling or owning 25% or more of the
        #     corporation.
        #
        #   @return [Array<Increase::Models::Entity::Corporation::BeneficialOwner>]
        required :beneficial_owners,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Models::Entity::Corporation::BeneficialOwner] }

        # @!attribute incorporation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the
        #     corporation's state of incorporation.
        #
        #   @return [String, nil]
        required :incorporation_state, String, nil?: true

        # @!attribute industry_code
        #   The numeric North American Industry Classification System (NAICS) code submitted
        #     for the corporation.
        #
        #   @return [String, nil]
        required :industry_code, String, nil?: true

        # @!attribute name
        #   The legal name of the corporation.
        #
        #   @return [String]
        required :name, String

        # @!attribute tax_identifier
        #   The Employer Identification Number (EIN) for the corporation.
        #
        #   @return [String, nil]
        required :tax_identifier, String, nil?: true

        # @!attribute website
        #   The website of the corporation.
        #
        #   @return [String, nil]
        required :website, String, nil?: true

        # @!parse
        #   # Details of the corporation entity. Will be present if `structure` is equal to
        #   #   `corporation`.
        #   #
        #   # @param address [Increase::Models::Entity::Corporation::Address]
        #   # @param beneficial_owners [Array<Increase::Models::Entity::Corporation::BeneficialOwner>]
        #   # @param incorporation_state [String, nil]
        #   # @param industry_code [String, nil]
        #   # @param name [String]
        #   # @param tax_identifier [String, nil]
        #   # @param website [String, nil]
        #   #
        #   def initialize(address:, beneficial_owners:, incorporation_state:, industry_code:, name:, tax_identifier:, website:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::Entity::Corporation#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the address.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The first line of the address.
          #
          #   @return [String]
          required :line1, String

          # @!attribute line2
          #   The second line of the address.
          #
          #   @return [String, nil]
          required :line2, String, nil?: true

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

          # @!parse
          #   # The corporation's address.
          #   #
          #   # @param city [String]
          #   # @param line1 [String]
          #   # @param line2 [String, nil]
          #   # @param state [String]
          #   # @param zip [String]
          #   #
          #   def initialize(city:, line1:, line2:, state:, zip:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        class BeneficialOwner < Increase::Internal::Type::BaseModel
          # @!attribute beneficial_owner_id
          #   The identifier of this beneficial owner.
          #
          #   @return [String]
          required :beneficial_owner_id, String

          # @!attribute company_title
          #   This person's role or title within the entity.
          #
          #   @return [String, nil]
          required :company_title, String, nil?: true

          # @!attribute individual
          #   Personal details for the beneficial owner.
          #
          #   @return [Increase::Models::Entity::Corporation::BeneficialOwner::Individual]
          required :individual, -> { Increase::Models::Entity::Corporation::BeneficialOwner::Individual }

          # @!attribute prong
          #   Why this person is considered a beneficial owner of the entity.
          #
          #   @return [Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Prong]
          required :prong, enum: -> { Increase::Models::Entity::Corporation::BeneficialOwner::Prong }

          # @!parse
          #   # @param beneficial_owner_id [String]
          #   # @param company_title [String, nil]
          #   # @param individual [Increase::Models::Entity::Corporation::BeneficialOwner::Individual]
          #   # @param prong [Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Prong]
          #   #
          #   def initialize(beneficial_owner_id:, company_title:, individual:, prong:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # @see Increase::Models::Entity::Corporation::BeneficialOwner#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The person's address.
            #
            #   @return [Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address]
            required :address, -> { Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address }

            # @!attribute date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :date_of_birth, Date

            # @!attribute identification
            #   A means of verifying the person's identity.
            #
            #   @return [Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification]
            required :identification,
                     -> { Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!parse
            #   # Personal details for the beneficial owner.
            #   #
            #   # @param address [Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address]
            #   # @param date_of_birth [Date]
            #   # @param identification [Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification]
            #   # @param name [String]
            #   #
            #   def initialize(address:, date_of_birth:, identification:, name:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

            # @see Increase::Models::Entity::Corporation::BeneficialOwner::Individual#address
            class Address < Increase::Internal::Type::BaseModel
              # @!attribute city
              #   The city, district, town, or village of the address.
              #
              #   @return [String, nil]
              required :city, String, nil?: true

              # @!attribute country
              #   The two-letter ISO 3166-1 alpha-2 code for the country of the address.
              #
              #   @return [String]
              required :country, String

              # @!attribute line1
              #   The first line of the address.
              #
              #   @return [String]
              required :line1, String

              # @!attribute line2
              #   The second line of the address.
              #
              #   @return [String, nil]
              required :line2, String, nil?: true

              # @!attribute state
              #   The two-letter United States Postal Service (USPS) abbreviation for the US
              #     state, province, or region of the address.
              #
              #   @return [String, nil]
              required :state, String, nil?: true

              # @!attribute zip
              #   The ZIP or postal code of the address.
              #
              #   @return [String, nil]
              required :zip, String, nil?: true

              # @!parse
              #   # The person's address.
              #   #
              #   # @param city [String, nil]
              #   # @param country [String]
              #   # @param line1 [String]
              #   # @param line2 [String, nil]
              #   # @param state [String, nil]
              #   # @param zip [String, nil]
              #   #
              #   def initialize(city:, country:, line1:, line2:, state:, zip:, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
            end

            # @see Increase::Models::Entity::Corporation::BeneficialOwner::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method]
              required :method_,
                       enum: -> { Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method },
                       api_name: :method

              # @!attribute number_last4
              #   The last 4 digits of the identification number that can be used to verify the
              #     individual's identity.
              #
              #   @return [String]
              required :number_last4, String

              # @!parse
              #   # A means of verifying the person's identity.
              #   #
              #   # @param method_ [Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method]
              #   # @param number_last4 [String]
              #   #
              #   def initialize(method_:, number_last4:, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

              # A method that can be used to verify the individual's identity.
              #
              # @see Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification#method_
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
            end
          end

          # Why this person is considered a beneficial owner of the entity.
          #
          # @see Increase::Models::Entity::Corporation::BeneficialOwner#prong
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

      # @see Increase::Models::Entity#government_authority
      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The government authority's address.
        #
        #   @return [Increase::Models::Entity::GovernmentAuthority::Address]
        required :address, -> { Increase::Models::Entity::GovernmentAuthority::Address }

        # @!attribute authorized_persons
        #   The identifying details of authorized persons of the government authority.
        #
        #   @return [Array<Increase::Models::Entity::GovernmentAuthority::AuthorizedPerson>]
        required :authorized_persons,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Models::Entity::GovernmentAuthority::AuthorizedPerson] }

        # @!attribute category
        #   The category of the government authority.
        #
        #   @return [Symbol, Increase::Models::Entity::GovernmentAuthority::Category]
        required :category, enum: -> { Increase::Models::Entity::GovernmentAuthority::Category }

        # @!attribute name
        #   The government authority's name.
        #
        #   @return [String]
        required :name, String

        # @!attribute tax_identifier
        #   The Employer Identification Number (EIN) of the government authority.
        #
        #   @return [String, nil]
        required :tax_identifier, String, nil?: true

        # @!attribute website
        #   The government authority's website.
        #
        #   @return [String, nil]
        required :website, String, nil?: true

        # @!parse
        #   # Details of the government authority entity. Will be present if `structure` is
        #   #   equal to `government_authority`.
        #   #
        #   # @param address [Increase::Models::Entity::GovernmentAuthority::Address]
        #   # @param authorized_persons [Array<Increase::Models::Entity::GovernmentAuthority::AuthorizedPerson>]
        #   # @param category [Symbol, Increase::Models::Entity::GovernmentAuthority::Category]
        #   # @param name [String]
        #   # @param tax_identifier [String, nil]
        #   # @param website [String, nil]
        #   #
        #   def initialize(address:, authorized_persons:, category:, name:, tax_identifier:, website:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::Entity::GovernmentAuthority#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the address.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The first line of the address.
          #
          #   @return [String]
          required :line1, String

          # @!attribute line2
          #   The second line of the address.
          #
          #   @return [String, nil]
          required :line2, String, nil?: true

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

          # @!parse
          #   # The government authority's address.
          #   #
          #   # @param city [String]
          #   # @param line1 [String]
          #   # @param line2 [String, nil]
          #   # @param state [String]
          #   # @param zip [String]
          #   #
          #   def initialize(city:, line1:, line2:, state:, zip:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        class AuthorizedPerson < Increase::Internal::Type::BaseModel
          # @!attribute authorized_person_id
          #   The identifier of this authorized person.
          #
          #   @return [String]
          required :authorized_person_id, String

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!parse
          #   # @param authorized_person_id [String]
          #   # @param name [String]
          #   #
          #   def initialize(authorized_person_id:, name:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # The category of the government authority.
        #
        # @see Increase::Models::Entity::GovernmentAuthority#category
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

      # @see Increase::Models::Entity#joint
      class Joint < Increase::Internal::Type::BaseModel
        # @!attribute individuals
        #   The two individuals that share control of the entity.
        #
        #   @return [Array<Increase::Models::Entity::Joint::Individual>]
        required :individuals,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Models::Entity::Joint::Individual] }

        # @!attribute name
        #   The entity's name.
        #
        #   @return [String]
        required :name, String

        # @!parse
        #   # Details of the joint entity. Will be present if `structure` is equal to `joint`.
        #   #
        #   # @param individuals [Array<Increase::Models::Entity::Joint::Individual>]
        #   # @param name [String]
        #   #
        #   def initialize(individuals:, name:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        class Individual < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The person's address.
          #
          #   @return [Increase::Models::Entity::Joint::Individual::Address]
          required :address, -> { Increase::Models::Entity::Joint::Individual::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::Entity::Joint::Individual::Identification]
          required :identification, -> { Increase::Models::Entity::Joint::Individual::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!parse
          #   # @param address [Increase::Models::Entity::Joint::Individual::Address]
          #   # @param date_of_birth [Date]
          #   # @param identification [Increase::Models::Entity::Joint::Individual::Identification]
          #   # @param name [String]
          #   #
          #   def initialize(address:, date_of_birth:, identification:, name:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # @see Increase::Models::Entity::Joint::Individual#address
          class Address < Increase::Internal::Type::BaseModel
            # @!attribute city
            #   The city of the address.
            #
            #   @return [String]
            required :city, String

            # @!attribute line1
            #   The first line of the address.
            #
            #   @return [String]
            required :line1, String

            # @!attribute line2
            #   The second line of the address.
            #
            #   @return [String, nil]
            required :line2, String, nil?: true

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

            # @!parse
            #   # The person's address.
            #   #
            #   # @param city [String]
            #   # @param line1 [String]
            #   # @param line2 [String, nil]
            #   # @param state [String]
            #   # @param zip [String]
            #   #
            #   def initialize(city:, line1:, line2:, state:, zip:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
          end

          # @see Increase::Models::Entity::Joint::Individual#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::Entity::Joint::Individual::Identification::Method]
            required :method_,
                     enum: -> { Increase::Models::Entity::Joint::Individual::Identification::Method },
                     api_name: :method

            # @!attribute number_last4
            #   The last 4 digits of the identification number that can be used to verify the
            #     individual's identity.
            #
            #   @return [String]
            required :number_last4, String

            # @!parse
            #   # A means of verifying the person's identity.
            #   #
            #   # @param method_ [Symbol, Increase::Models::Entity::Joint::Individual::Identification::Method]
            #   # @param number_last4 [String]
            #   #
            #   def initialize(method_:, number_last4:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

            # A method that can be used to verify the individual's identity.
            #
            # @see Increase::Models::Entity::Joint::Individual::Identification#method_
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
          end
        end
      end

      # @see Increase::Models::Entity#natural_person
      class NaturalPerson < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The person's address.
        #
        #   @return [Increase::Models::Entity::NaturalPerson::Address]
        required :address, -> { Increase::Models::Entity::NaturalPerson::Address }

        # @!attribute date_of_birth
        #   The person's date of birth in YYYY-MM-DD format.
        #
        #   @return [Date]
        required :date_of_birth, Date

        # @!attribute identification
        #   A means of verifying the person's identity.
        #
        #   @return [Increase::Models::Entity::NaturalPerson::Identification]
        required :identification, -> { Increase::Models::Entity::NaturalPerson::Identification }

        # @!attribute name
        #   The person's legal name.
        #
        #   @return [String]
        required :name, String

        # @!parse
        #   # Details of the natural person entity. Will be present if `structure` is equal to
        #   #   `natural_person`.
        #   #
        #   # @param address [Increase::Models::Entity::NaturalPerson::Address]
        #   # @param date_of_birth [Date]
        #   # @param identification [Increase::Models::Entity::NaturalPerson::Identification]
        #   # @param name [String]
        #   #
        #   def initialize(address:, date_of_birth:, identification:, name:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::Entity::NaturalPerson#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the address.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The first line of the address.
          #
          #   @return [String]
          required :line1, String

          # @!attribute line2
          #   The second line of the address.
          #
          #   @return [String, nil]
          required :line2, String, nil?: true

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

          # @!parse
          #   # The person's address.
          #   #
          #   # @param city [String]
          #   # @param line1 [String]
          #   # @param line2 [String, nil]
          #   # @param state [String]
          #   # @param zip [String]
          #   #
          #   def initialize(city:, line1:, line2:, state:, zip:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # @see Increase::Models::Entity::NaturalPerson#identification
        class Identification < Increase::Internal::Type::BaseModel
          # @!attribute method_
          #   A method that can be used to verify the individual's identity.
          #
          #   @return [Symbol, Increase::Models::Entity::NaturalPerson::Identification::Method]
          required :method_,
                   enum: -> { Increase::Models::Entity::NaturalPerson::Identification::Method },
                   api_name: :method

          # @!attribute number_last4
          #   The last 4 digits of the identification number that can be used to verify the
          #     individual's identity.
          #
          #   @return [String]
          required :number_last4, String

          # @!parse
          #   # A means of verifying the person's identity.
          #   #
          #   # @param method_ [Symbol, Increase::Models::Entity::NaturalPerson::Identification::Method]
          #   # @param number_last4 [String]
          #   #
          #   def initialize(method_:, number_last4:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # A method that can be used to verify the individual's identity.
          #
          # @see Increase::Models::Entity::NaturalPerson::Identification#method_
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
        end
      end

      # The status of the entity.
      #
      # @see Increase::Models::Entity#status
      module Status
        extend Increase::Internal::Type::Enum

        # The entity is active.
        ACTIVE = :active

        # The entity is archived, and can no longer be used to create accounts.
        ARCHIVED = :archived

        # The entity is temporarily disabled and cannot be used for financial activity.
        DISABLED = :disabled

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The entity's legal structure.
      #
      # @see Increase::Models::Entity#structure
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

      # @see Increase::Models::Entity#third_party_verification
      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        # @!attribute reference
        #   The reference identifier for the third party verification.
        #
        #   @return [String]
        required :reference, String

        # @!attribute vendor
        #   The vendor that was used to perform the verification.
        #
        #   @return [Symbol, Increase::Models::Entity::ThirdPartyVerification::Vendor]
        required :vendor, enum: -> { Increase::Models::Entity::ThirdPartyVerification::Vendor }

        # @!parse
        #   # A reference to data stored in a third-party verification service. Your
        #   #   integration may or may not use this field.
        #   #
        #   # @param reference [String]
        #   # @param vendor [Symbol, Increase::Models::Entity::ThirdPartyVerification::Vendor]
        #   #
        #   def initialize(reference:, vendor:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # The vendor that was used to perform the verification.
        #
        # @see Increase::Models::Entity::ThirdPartyVerification#vendor
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

      # @see Increase::Models::Entity#trust
      class Trust < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The trust's address.
        #
        #   @return [Increase::Models::Entity::Trust::Address]
        required :address, -> { Increase::Models::Entity::Trust::Address }

        # @!attribute category
        #   Whether the trust is `revocable` or `irrevocable`.
        #
        #   @return [Symbol, Increase::Models::Entity::Trust::Category]
        required :category, enum: -> { Increase::Models::Entity::Trust::Category }

        # @!attribute formation_document_file_id
        #   The ID for the File containing the formation document of the trust.
        #
        #   @return [String, nil]
        required :formation_document_file_id, String, nil?: true

        # @!attribute formation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the state in
        #     which the trust was formed.
        #
        #   @return [String, nil]
        required :formation_state, String, nil?: true

        # @!attribute grantor
        #   The grantor of the trust. Will be present if the `category` is `revocable`.
        #
        #   @return [Increase::Models::Entity::Trust::Grantor, nil]
        required :grantor, -> { Increase::Models::Entity::Trust::Grantor }, nil?: true

        # @!attribute name
        #   The trust's name.
        #
        #   @return [String]
        required :name, String

        # @!attribute tax_identifier
        #   The Employer Identification Number (EIN) of the trust itself.
        #
        #   @return [String, nil]
        required :tax_identifier, String, nil?: true

        # @!attribute trustees
        #   The trustees of the trust.
        #
        #   @return [Array<Increase::Models::Entity::Trust::Trustee>]
        required :trustees, -> { Increase::Internal::Type::ArrayOf[Increase::Models::Entity::Trust::Trustee] }

        # @!parse
        #   # Details of the trust entity. Will be present if `structure` is equal to `trust`.
        #   #
        #   # @param address [Increase::Models::Entity::Trust::Address]
        #   # @param category [Symbol, Increase::Models::Entity::Trust::Category]
        #   # @param formation_document_file_id [String, nil]
        #   # @param formation_state [String, nil]
        #   # @param grantor [Increase::Models::Entity::Trust::Grantor, nil]
        #   # @param name [String]
        #   # @param tax_identifier [String, nil]
        #   # @param trustees [Array<Increase::Models::Entity::Trust::Trustee>]
        #   #
        #   def initialize(
        #     address:,
        #     category:,
        #     formation_document_file_id:,
        #     formation_state:,
        #     grantor:,
        #     name:,
        #     tax_identifier:,
        #     trustees:,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::Entity::Trust#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the address.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The first line of the address.
          #
          #   @return [String]
          required :line1, String

          # @!attribute line2
          #   The second line of the address.
          #
          #   @return [String, nil]
          required :line2, String, nil?: true

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

          # @!parse
          #   # The trust's address.
          #   #
          #   # @param city [String]
          #   # @param line1 [String]
          #   # @param line2 [String, nil]
          #   # @param state [String]
          #   # @param zip [String]
          #   #
          #   def initialize(city:, line1:, line2:, state:, zip:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # Whether the trust is `revocable` or `irrevocable`.
        #
        # @see Increase::Models::Entity::Trust#category
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

        # @see Increase::Models::Entity::Trust#grantor
        class Grantor < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The person's address.
          #
          #   @return [Increase::Models::Entity::Trust::Grantor::Address]
          required :address, -> { Increase::Models::Entity::Trust::Grantor::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::Entity::Trust::Grantor::Identification]
          required :identification, -> { Increase::Models::Entity::Trust::Grantor::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!parse
          #   # The grantor of the trust. Will be present if the `category` is `revocable`.
          #   #
          #   # @param address [Increase::Models::Entity::Trust::Grantor::Address]
          #   # @param date_of_birth [Date]
          #   # @param identification [Increase::Models::Entity::Trust::Grantor::Identification]
          #   # @param name [String]
          #   #
          #   def initialize(address:, date_of_birth:, identification:, name:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # @see Increase::Models::Entity::Trust::Grantor#address
          class Address < Increase::Internal::Type::BaseModel
            # @!attribute city
            #   The city of the address.
            #
            #   @return [String]
            required :city, String

            # @!attribute line1
            #   The first line of the address.
            #
            #   @return [String]
            required :line1, String

            # @!attribute line2
            #   The second line of the address.
            #
            #   @return [String, nil]
            required :line2, String, nil?: true

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

            # @!parse
            #   # The person's address.
            #   #
            #   # @param city [String]
            #   # @param line1 [String]
            #   # @param line2 [String, nil]
            #   # @param state [String]
            #   # @param zip [String]
            #   #
            #   def initialize(city:, line1:, line2:, state:, zip:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
          end

          # @see Increase::Models::Entity::Trust::Grantor#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::Entity::Trust::Grantor::Identification::Method]
            required :method_,
                     enum: -> { Increase::Models::Entity::Trust::Grantor::Identification::Method },
                     api_name: :method

            # @!attribute number_last4
            #   The last 4 digits of the identification number that can be used to verify the
            #     individual's identity.
            #
            #   @return [String]
            required :number_last4, String

            # @!parse
            #   # A means of verifying the person's identity.
            #   #
            #   # @param method_ [Symbol, Increase::Models::Entity::Trust::Grantor::Identification::Method]
            #   # @param number_last4 [String]
            #   #
            #   def initialize(method_:, number_last4:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

            # A method that can be used to verify the individual's identity.
            #
            # @see Increase::Models::Entity::Trust::Grantor::Identification#method_
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
          end
        end

        class Trustee < Increase::Internal::Type::BaseModel
          # @!attribute individual
          #   The individual trustee of the trust. Will be present if the trustee's
          #     `structure` is equal to `individual`.
          #
          #   @return [Increase::Models::Entity::Trust::Trustee::Individual, nil]
          required :individual, -> { Increase::Models::Entity::Trust::Trustee::Individual }, nil?: true

          # @!attribute structure
          #   The structure of the trustee. Will always be equal to `individual`.
          #
          #   @return [Symbol, Increase::Models::Entity::Trust::Trustee::Structure]
          required :structure, enum: -> { Increase::Models::Entity::Trust::Trustee::Structure }

          # @!parse
          #   # @param individual [Increase::Models::Entity::Trust::Trustee::Individual, nil]
          #   # @param structure [Symbol, Increase::Models::Entity::Trust::Trustee::Structure]
          #   #
          #   def initialize(individual:, structure:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # @see Increase::Models::Entity::Trust::Trustee#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The person's address.
            #
            #   @return [Increase::Models::Entity::Trust::Trustee::Individual::Address]
            required :address, -> { Increase::Models::Entity::Trust::Trustee::Individual::Address }

            # @!attribute date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :date_of_birth, Date

            # @!attribute identification
            #   A means of verifying the person's identity.
            #
            #   @return [Increase::Models::Entity::Trust::Trustee::Individual::Identification]
            required :identification, -> { Increase::Models::Entity::Trust::Trustee::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!parse
            #   # The individual trustee of the trust. Will be present if the trustee's
            #   #   `structure` is equal to `individual`.
            #   #
            #   # @param address [Increase::Models::Entity::Trust::Trustee::Individual::Address]
            #   # @param date_of_birth [Date]
            #   # @param identification [Increase::Models::Entity::Trust::Trustee::Individual::Identification]
            #   # @param name [String]
            #   #
            #   def initialize(address:, date_of_birth:, identification:, name:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

            # @see Increase::Models::Entity::Trust::Trustee::Individual#address
            class Address < Increase::Internal::Type::BaseModel
              # @!attribute city
              #   The city of the address.
              #
              #   @return [String]
              required :city, String

              # @!attribute line1
              #   The first line of the address.
              #
              #   @return [String]
              required :line1, String

              # @!attribute line2
              #   The second line of the address.
              #
              #   @return [String, nil]
              required :line2, String, nil?: true

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

              # @!parse
              #   # The person's address.
              #   #
              #   # @param city [String]
              #   # @param line1 [String]
              #   # @param line2 [String, nil]
              #   # @param state [String]
              #   # @param zip [String]
              #   #
              #   def initialize(city:, line1:, line2:, state:, zip:, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
            end

            # @see Increase::Models::Entity::Trust::Trustee::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method]
              required :method_,
                       enum: -> { Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method },
                       api_name: :method

              # @!attribute number_last4
              #   The last 4 digits of the identification number that can be used to verify the
              #     individual's identity.
              #
              #   @return [String]
              required :number_last4, String

              # @!parse
              #   # A means of verifying the person's identity.
              #   #
              #   # @param method_ [Symbol, Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method]
              #   # @param number_last4 [String]
              #   #
              #   def initialize(method_:, number_last4:, **) = super

              # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

              # A method that can be used to verify the individual's identity.
              #
              # @see Increase::Models::Entity::Trust::Trustee::Individual::Identification#method_
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
            end
          end

          # The structure of the trustee. Will always be equal to `individual`.
          #
          # @see Increase::Models::Entity::Trust::Trustee#structure
          module Structure
            extend Increase::Internal::Type::Enum

            # The trustee is an individual.
            INDIVIDUAL = :individual

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `entity`.
      #
      # @see Increase::Models::Entity#type
      module Type
        extend Increase::Internal::Type::Enum

        ENTITY = :entity

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
