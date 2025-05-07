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
      #   `corporation`.
      #
      #   @return [Increase::Entity::Corporation, nil]
      required :corporation, -> { Increase::Entity::Corporation }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity
      #   was created.
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
      #   Entity's details were most recently confirmed.
      #
      #   @return [Time, nil]
      required :details_confirmed_at, Time, nil?: true

      # @!attribute government_authority
      #   Details of the government authority entity. Will be present if `structure` is
      #   equal to `government_authority`.
      #
      #   @return [Increase::Entity::GovernmentAuthority, nil]
      required :government_authority, -> { Increase::Entity::GovernmentAuthority }, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute joint
      #   Details of the joint entity. Will be present if `structure` is equal to `joint`.
      #
      #   @return [Increase::Entity::Joint, nil]
      required :joint, -> { Increase::Entity::Joint }, nil?: true

      # @!attribute natural_person
      #   Details of the natural person entity. Will be present if `structure` is equal to
      #   `natural_person`.
      #
      #   @return [Increase::Entity::NaturalPerson, nil]
      required :natural_person, -> { Increase::Entity::NaturalPerson }, nil?: true

      # @!attribute status
      #   The status of the entity.
      #
      #   @return [Symbol, Increase::Entity::Status]
      required :status, enum: -> { Increase::Entity::Status }

      # @!attribute structure
      #   The entity's legal structure.
      #
      #   @return [Symbol, Increase::Entity::Structure]
      required :structure, enum: -> { Increase::Entity::Structure }

      # @!attribute supplemental_documents
      #   Additional documentation associated with the entity. This is limited to the
      #   first 10 documents for an entity. If an entity has more than 10 documents, use
      #   the GET /entity_supplemental_documents list endpoint to retrieve them.
      #
      #   @return [Array<Increase::EntitySupplementalDocument>]
      required :supplemental_documents,
               -> { Increase::Internal::Type::ArrayOf[Increase::EntitySupplementalDocument] }

      # @!attribute third_party_verification
      #   A reference to data stored in a third-party verification service. Your
      #   integration may or may not use this field.
      #
      #   @return [Increase::Entity::ThirdPartyVerification, nil]
      required :third_party_verification, -> { Increase::Entity::ThirdPartyVerification }, nil?: true

      # @!attribute trust
      #   Details of the trust entity. Will be present if `structure` is equal to `trust`.
      #
      #   @return [Increase::Entity::Trust, nil]
      required :trust, -> { Increase::Entity::Trust }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `entity`.
      #
      #   @return [Symbol, Increase::Entity::Type]
      required :type, enum: -> { Increase::Entity::Type }

      # @!method initialize(id:, corporation:, created_at:, description:, details_confirmed_at:, government_authority:, idempotency_key:, joint:, natural_person:, status:, structure:, supplemental_documents:, third_party_verification:, trust:, type:)
      #   Some parameter documentations has been truncated, see {Increase::Entity} for
      #   more details.
      #
      #   Entities are the legal entities that own accounts. They can be people,
      #   corporations, partnerships, government authorities, or trusts.
      #
      #   @param id [String] The entity's identifier.
      #
      #   @param corporation [Increase::Entity::Corporation, nil] Details of the corporation entity. Will be present if `structure` is equal to `c
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity
      #
      #   @param description [String, nil] The entity's description for display purposes.
      #
      #   @param details_confirmed_at [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity'
      #
      #   @param government_authority [Increase::Entity::GovernmentAuthority, nil] Details of the government authority entity. Will be present if `structure` is eq
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param joint [Increase::Entity::Joint, nil] Details of the joint entity. Will be present if `structure` is equal to `joint`.
      #
      #   @param natural_person [Increase::Entity::NaturalPerson, nil] Details of the natural person entity. Will be present if `structure` is equal to
      #
      #   @param status [Symbol, Increase::Entity::Status] The status of the entity.
      #
      #   @param structure [Symbol, Increase::Entity::Structure] The entity's legal structure.
      #
      #   @param supplemental_documents [Array<Increase::EntitySupplementalDocument>] Additional documentation associated with the entity. This is limited to the firs
      #
      #   @param third_party_verification [Increase::Entity::ThirdPartyVerification, nil] A reference to data stored in a third-party verification service. Your integrati
      #
      #   @param trust [Increase::Entity::Trust, nil] Details of the trust entity. Will be present if `structure` is equal to `trust`.
      #
      #   @param type [Symbol, Increase::Entity::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Entity#corporation
      class Corporation < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The corporation's address.
        #
        #   @return [Increase::Entity::Corporation::Address]
        required :address, -> { Increase::Entity::Corporation::Address }

        # @!attribute beneficial_owners
        #   The identifying details of anyone controlling or owning 25% or more of the
        #   corporation.
        #
        #   @return [Array<Increase::Entity::Corporation::BeneficialOwner>]
        required :beneficial_owners,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Entity::Corporation::BeneficialOwner] }

        # @!attribute incorporation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the
        #   corporation's state of incorporation.
        #
        #   @return [String, nil]
        required :incorporation_state, String, nil?: true

        # @!attribute industry_code
        #   The numeric North American Industry Classification System (NAICS) code submitted
        #   for the corporation.
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

        # @!method initialize(address:, beneficial_owners:, incorporation_state:, industry_code:, name:, tax_identifier:, website:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Entity::Corporation} for more details.
        #
        #   Details of the corporation entity. Will be present if `structure` is equal to
        #   `corporation`.
        #
        #   @param address [Increase::Entity::Corporation::Address] The corporation's address.
        #
        #   @param beneficial_owners [Array<Increase::Entity::Corporation::BeneficialOwner>] The identifying details of anyone controlling or owning 25% or more of the corpo
        #
        #   @param incorporation_state [String, nil] The two-letter United States Postal Service (USPS) abbreviation for the corporat
        #
        #   @param industry_code [String, nil] The numeric North American Industry Classification System (NAICS) code submitted
        #
        #   @param name [String] The legal name of the corporation.
        #
        #   @param tax_identifier [String, nil] The Employer Identification Number (EIN) for the corporation.
        #
        #   @param website [String, nil] The website of the corporation.

        # @see Increase::Entity::Corporation#address
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
          #   the address.
          #
          #   @return [String]
          required :state, String

          # @!attribute zip
          #   The ZIP code of the address.
          #
          #   @return [String]
          required :zip, String

          # @!method initialize(city:, line1:, line2:, state:, zip:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Entity::Corporation::Address} for more details.
          #
          #   The corporation's address.
          #
          #   @param city [String] The city of the address.
          #
          #   @param line1 [String] The first line of the address.
          #
          #   @param line2 [String, nil] The second line of the address.
          #
          #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
          #
          #   @param zip [String] The ZIP code of the address.
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
          #   @return [Increase::Entity::Corporation::BeneficialOwner::Individual]
          required :individual, -> { Increase::Entity::Corporation::BeneficialOwner::Individual }

          # @!attribute prong
          #   Why this person is considered a beneficial owner of the entity.
          #
          #   @return [Symbol, Increase::Entity::Corporation::BeneficialOwner::Prong]
          required :prong, enum: -> { Increase::Entity::Corporation::BeneficialOwner::Prong }

          # @!method initialize(beneficial_owner_id:, company_title:, individual:, prong:)
          #   @param beneficial_owner_id [String] The identifier of this beneficial owner.
          #
          #   @param company_title [String, nil] This person's role or title within the entity.
          #
          #   @param individual [Increase::Entity::Corporation::BeneficialOwner::Individual] Personal details for the beneficial owner.
          #
          #   @param prong [Symbol, Increase::Entity::Corporation::BeneficialOwner::Prong] Why this person is considered a beneficial owner of the entity.

          # @see Increase::Entity::Corporation::BeneficialOwner#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The person's address.
            #
            #   @return [Increase::Entity::Corporation::BeneficialOwner::Individual::Address]
            required :address, -> { Increase::Entity::Corporation::BeneficialOwner::Individual::Address }

            # @!attribute date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :date_of_birth, Date

            # @!attribute identification
            #   A means of verifying the person's identity.
            #
            #   @return [Increase::Entity::Corporation::BeneficialOwner::Individual::Identification]
            required :identification,
                     -> { Increase::Entity::Corporation::BeneficialOwner::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(address:, date_of_birth:, identification:, name:)
            #   Personal details for the beneficial owner.
            #
            #   @param address [Increase::Entity::Corporation::BeneficialOwner::Individual::Address] The person's address.
            #
            #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
            #
            #   @param identification [Increase::Entity::Corporation::BeneficialOwner::Individual::Identification] A means of verifying the person's identity.
            #
            #   @param name [String] The person's legal name.

            # @see Increase::Entity::Corporation::BeneficialOwner::Individual#address
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
              #   state, province, or region of the address.
              #
              #   @return [String, nil]
              required :state, String, nil?: true

              # @!attribute zip
              #   The ZIP or postal code of the address.
              #
              #   @return [String, nil]
              required :zip, String, nil?: true

              # @!method initialize(city:, country:, line1:, line2:, state:, zip:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Entity::Corporation::BeneficialOwner::Individual::Address} for more
              #   details.
              #
              #   The person's address.
              #
              #   @param city [String, nil] The city, district, town, or village of the address.
              #
              #   @param country [String] The two-letter ISO 3166-1 alpha-2 code for the country of the address.
              #
              #   @param line1 [String] The first line of the address.
              #
              #   @param line2 [String, nil] The second line of the address.
              #
              #   @param state [String, nil] The two-letter United States Postal Service (USPS) abbreviation for the US state
              #
              #   @param zip [String, nil] The ZIP or postal code of the address.
            end

            # @see Increase::Entity::Corporation::BeneficialOwner::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Entity::Corporation::BeneficialOwner::Individual::Identification::Method]
              required :method_,
                       enum: -> {
                         Increase::Entity::Corporation::BeneficialOwner::Individual::Identification::Method
                       },
                       api_name: :method

              # @!attribute number_last4
              #   The last 4 digits of the identification number that can be used to verify the
              #   individual's identity.
              #
              #   @return [String]
              required :number_last4, String

              # @!method initialize(method_:, number_last4:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Entity::Corporation::BeneficialOwner::Individual::Identification} for
              #   more details.
              #
              #   A means of verifying the person's identity.
              #
              #   @param method_ [Symbol, Increase::Entity::Corporation::BeneficialOwner::Individual::Identification::Method] A method that can be used to verify the individual's identity.
              #
              #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

              # A method that can be used to verify the individual's identity.
              #
              # @see Increase::Entity::Corporation::BeneficialOwner::Individual::Identification#method_
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
            end
          end

          # Why this person is considered a beneficial owner of the entity.
          #
          # @see Increase::Entity::Corporation::BeneficialOwner#prong
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
      end

      # @see Increase::Entity#government_authority
      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The government authority's address.
        #
        #   @return [Increase::Entity::GovernmentAuthority::Address]
        required :address, -> { Increase::Entity::GovernmentAuthority::Address }

        # @!attribute authorized_persons
        #   The identifying details of authorized persons of the government authority.
        #
        #   @return [Array<Increase::Entity::GovernmentAuthority::AuthorizedPerson>]
        required :authorized_persons,
                 -> {
                   Increase::Internal::Type::ArrayOf[Increase::Entity::GovernmentAuthority::AuthorizedPerson]
                 }

        # @!attribute category
        #   The category of the government authority.
        #
        #   @return [Symbol, Increase::Entity::GovernmentAuthority::Category]
        required :category, enum: -> { Increase::Entity::GovernmentAuthority::Category }

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

        # @!method initialize(address:, authorized_persons:, category:, name:, tax_identifier:, website:)
        #   Details of the government authority entity. Will be present if `structure` is
        #   equal to `government_authority`.
        #
        #   @param address [Increase::Entity::GovernmentAuthority::Address] The government authority's address.
        #
        #   @param authorized_persons [Array<Increase::Entity::GovernmentAuthority::AuthorizedPerson>] The identifying details of authorized persons of the government authority.
        #
        #   @param category [Symbol, Increase::Entity::GovernmentAuthority::Category] The category of the government authority.
        #
        #   @param name [String] The government authority's name.
        #
        #   @param tax_identifier [String, nil] The Employer Identification Number (EIN) of the government authority.
        #
        #   @param website [String, nil] The government authority's website.

        # @see Increase::Entity::GovernmentAuthority#address
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
          #   the address.
          #
          #   @return [String]
          required :state, String

          # @!attribute zip
          #   The ZIP code of the address.
          #
          #   @return [String]
          required :zip, String

          # @!method initialize(city:, line1:, line2:, state:, zip:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Entity::GovernmentAuthority::Address} for more details.
          #
          #   The government authority's address.
          #
          #   @param city [String] The city of the address.
          #
          #   @param line1 [String] The first line of the address.
          #
          #   @param line2 [String, nil] The second line of the address.
          #
          #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
          #
          #   @param zip [String] The ZIP code of the address.
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

          # @!method initialize(authorized_person_id:, name:)
          #   @param authorized_person_id [String] The identifier of this authorized person.
          #
          #   @param name [String] The person's legal name.
        end

        # The category of the government authority.
        #
        # @see Increase::Entity::GovernmentAuthority#category
        module Category
          extend Increase::Internal::Type::Enum

          # The Public Entity is a Municipality.
          MUNICIPALITY = :municipality

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Entity#joint
      class Joint < Increase::Internal::Type::BaseModel
        # @!attribute individuals
        #   The two individuals that share control of the entity.
        #
        #   @return [Array<Increase::Entity::Joint::Individual>]
        required :individuals, -> { Increase::Internal::Type::ArrayOf[Increase::Entity::Joint::Individual] }

        # @!attribute name
        #   The entity's name.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(individuals:, name:)
        #   Details of the joint entity. Will be present if `structure` is equal to `joint`.
        #
        #   @param individuals [Array<Increase::Entity::Joint::Individual>] The two individuals that share control of the entity.
        #
        #   @param name [String] The entity's name.

        class Individual < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The person's address.
          #
          #   @return [Increase::Entity::Joint::Individual::Address]
          required :address, -> { Increase::Entity::Joint::Individual::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Entity::Joint::Individual::Identification]
          required :identification, -> { Increase::Entity::Joint::Individual::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(address:, date_of_birth:, identification:, name:)
          #   @param address [Increase::Entity::Joint::Individual::Address] The person's address.
          #
          #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
          #
          #   @param identification [Increase::Entity::Joint::Individual::Identification] A means of verifying the person's identity.
          #
          #   @param name [String] The person's legal name.

          # @see Increase::Entity::Joint::Individual#address
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
            #   the address.
            #
            #   @return [String]
            required :state, String

            # @!attribute zip
            #   The ZIP code of the address.
            #
            #   @return [String]
            required :zip, String

            # @!method initialize(city:, line1:, line2:, state:, zip:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Entity::Joint::Individual::Address} for more details.
            #
            #   The person's address.
            #
            #   @param city [String] The city of the address.
            #
            #   @param line1 [String] The first line of the address.
            #
            #   @param line2 [String, nil] The second line of the address.
            #
            #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
            #
            #   @param zip [String] The ZIP code of the address.
          end

          # @see Increase::Entity::Joint::Individual#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Entity::Joint::Individual::Identification::Method]
            required :method_,
                     enum: -> { Increase::Entity::Joint::Individual::Identification::Method },
                     api_name: :method

            # @!attribute number_last4
            #   The last 4 digits of the identification number that can be used to verify the
            #   individual's identity.
            #
            #   @return [String]
            required :number_last4, String

            # @!method initialize(method_:, number_last4:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Entity::Joint::Individual::Identification} for more details.
            #
            #   A means of verifying the person's identity.
            #
            #   @param method_ [Symbol, Increase::Entity::Joint::Individual::Identification::Method] A method that can be used to verify the individual's identity.
            #
            #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

            # A method that can be used to verify the individual's identity.
            #
            # @see Increase::Entity::Joint::Individual::Identification#method_
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
          end
        end
      end

      # @see Increase::Entity#natural_person
      class NaturalPerson < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The person's address.
        #
        #   @return [Increase::Entity::NaturalPerson::Address]
        required :address, -> { Increase::Entity::NaturalPerson::Address }

        # @!attribute date_of_birth
        #   The person's date of birth in YYYY-MM-DD format.
        #
        #   @return [Date]
        required :date_of_birth, Date

        # @!attribute identification
        #   A means of verifying the person's identity.
        #
        #   @return [Increase::Entity::NaturalPerson::Identification]
        required :identification, -> { Increase::Entity::NaturalPerson::Identification }

        # @!attribute name
        #   The person's legal name.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(address:, date_of_birth:, identification:, name:)
        #   Details of the natural person entity. Will be present if `structure` is equal to
        #   `natural_person`.
        #
        #   @param address [Increase::Entity::NaturalPerson::Address] The person's address.
        #
        #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
        #
        #   @param identification [Increase::Entity::NaturalPerson::Identification] A means of verifying the person's identity.
        #
        #   @param name [String] The person's legal name.

        # @see Increase::Entity::NaturalPerson#address
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
          #   the address.
          #
          #   @return [String]
          required :state, String

          # @!attribute zip
          #   The ZIP code of the address.
          #
          #   @return [String]
          required :zip, String

          # @!method initialize(city:, line1:, line2:, state:, zip:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Entity::NaturalPerson::Address} for more details.
          #
          #   The person's address.
          #
          #   @param city [String] The city of the address.
          #
          #   @param line1 [String] The first line of the address.
          #
          #   @param line2 [String, nil] The second line of the address.
          #
          #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
          #
          #   @param zip [String] The ZIP code of the address.
        end

        # @see Increase::Entity::NaturalPerson#identification
        class Identification < Increase::Internal::Type::BaseModel
          # @!attribute method_
          #   A method that can be used to verify the individual's identity.
          #
          #   @return [Symbol, Increase::Entity::NaturalPerson::Identification::Method]
          required :method_,
                   enum: -> {
                     Increase::Entity::NaturalPerson::Identification::Method
                   },
                   api_name: :method

          # @!attribute number_last4
          #   The last 4 digits of the identification number that can be used to verify the
          #   individual's identity.
          #
          #   @return [String]
          required :number_last4, String

          # @!method initialize(method_:, number_last4:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Entity::NaturalPerson::Identification} for more details.
          #
          #   A means of verifying the person's identity.
          #
          #   @param method_ [Symbol, Increase::Entity::NaturalPerson::Identification::Method] A method that can be used to verify the individual's identity.
          #
          #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

          # A method that can be used to verify the individual's identity.
          #
          # @see Increase::Entity::NaturalPerson::Identification#method_
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
        end
      end

      # The status of the entity.
      #
      # @see Increase::Entity#status
      module Status
        extend Increase::Internal::Type::Enum

        # The entity is active.
        ACTIVE = :active

        # The entity is archived, and can no longer be used to create accounts.
        ARCHIVED = :archived

        # The entity is temporarily disabled and cannot be used for financial activity.
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The entity's legal structure.
      #
      # @see Increase::Entity#structure
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

      # @see Increase::Entity#third_party_verification
      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        # @!attribute reference
        #   The reference identifier for the third party verification.
        #
        #   @return [String]
        required :reference, String

        # @!attribute vendor
        #   The vendor that was used to perform the verification.
        #
        #   @return [Symbol, Increase::Entity::ThirdPartyVerification::Vendor]
        required :vendor, enum: -> { Increase::Entity::ThirdPartyVerification::Vendor }

        # @!method initialize(reference:, vendor:)
        #   A reference to data stored in a third-party verification service. Your
        #   integration may or may not use this field.
        #
        #   @param reference [String] The reference identifier for the third party verification.
        #
        #   @param vendor [Symbol, Increase::Entity::ThirdPartyVerification::Vendor] The vendor that was used to perform the verification.

        # The vendor that was used to perform the verification.
        #
        # @see Increase::Entity::ThirdPartyVerification#vendor
        module Vendor
          extend Increase::Internal::Type::Enum

          # Alloy. See https://alloy.com for more information.
          ALLOY = :alloy

          # Middesk. See https://middesk.com for more information.
          MIDDESK = :middesk

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Entity#trust
      class Trust < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The trust's address.
        #
        #   @return [Increase::Entity::Trust::Address]
        required :address, -> { Increase::Entity::Trust::Address }

        # @!attribute category
        #   Whether the trust is `revocable` or `irrevocable`.
        #
        #   @return [Symbol, Increase::Entity::Trust::Category]
        required :category, enum: -> { Increase::Entity::Trust::Category }

        # @!attribute formation_document_file_id
        #   The ID for the File containing the formation document of the trust.
        #
        #   @return [String, nil]
        required :formation_document_file_id, String, nil?: true

        # @!attribute formation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the state in
        #   which the trust was formed.
        #
        #   @return [String, nil]
        required :formation_state, String, nil?: true

        # @!attribute grantor
        #   The grantor of the trust. Will be present if the `category` is `revocable`.
        #
        #   @return [Increase::Entity::Trust::Grantor, nil]
        required :grantor, -> { Increase::Entity::Trust::Grantor }, nil?: true

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
        #   @return [Array<Increase::Entity::Trust::Trustee>]
        required :trustees, -> { Increase::Internal::Type::ArrayOf[Increase::Entity::Trust::Trustee] }

        # @!method initialize(address:, category:, formation_document_file_id:, formation_state:, grantor:, name:, tax_identifier:, trustees:)
        #   Some parameter documentations has been truncated, see {Increase::Entity::Trust}
        #   for more details.
        #
        #   Details of the trust entity. Will be present if `structure` is equal to `trust`.
        #
        #   @param address [Increase::Entity::Trust::Address] The trust's address.
        #
        #   @param category [Symbol, Increase::Entity::Trust::Category] Whether the trust is `revocable` or `irrevocable`.
        #
        #   @param formation_document_file_id [String, nil] The ID for the File containing the formation document of the trust.
        #
        #   @param formation_state [String, nil] The two-letter United States Postal Service (USPS) abbreviation for the state in
        #
        #   @param grantor [Increase::Entity::Trust::Grantor, nil] The grantor of the trust. Will be present if the `category` is `revocable`.
        #
        #   @param name [String] The trust's name.
        #
        #   @param tax_identifier [String, nil] The Employer Identification Number (EIN) of the trust itself.
        #
        #   @param trustees [Array<Increase::Entity::Trust::Trustee>] The trustees of the trust.

        # @see Increase::Entity::Trust#address
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
          #   the address.
          #
          #   @return [String]
          required :state, String

          # @!attribute zip
          #   The ZIP code of the address.
          #
          #   @return [String]
          required :zip, String

          # @!method initialize(city:, line1:, line2:, state:, zip:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Entity::Trust::Address} for more details.
          #
          #   The trust's address.
          #
          #   @param city [String] The city of the address.
          #
          #   @param line1 [String] The first line of the address.
          #
          #   @param line2 [String, nil] The second line of the address.
          #
          #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
          #
          #   @param zip [String] The ZIP code of the address.
        end

        # Whether the trust is `revocable` or `irrevocable`.
        #
        # @see Increase::Entity::Trust#category
        module Category
          extend Increase::Internal::Type::Enum

          # The trust is revocable by the grantor.
          REVOCABLE = :revocable

          # The trust cannot be revoked.
          IRREVOCABLE = :irrevocable

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Entity::Trust#grantor
        class Grantor < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The person's address.
          #
          #   @return [Increase::Entity::Trust::Grantor::Address]
          required :address, -> { Increase::Entity::Trust::Grantor::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Entity::Trust::Grantor::Identification]
          required :identification, -> { Increase::Entity::Trust::Grantor::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(address:, date_of_birth:, identification:, name:)
          #   The grantor of the trust. Will be present if the `category` is `revocable`.
          #
          #   @param address [Increase::Entity::Trust::Grantor::Address] The person's address.
          #
          #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
          #
          #   @param identification [Increase::Entity::Trust::Grantor::Identification] A means of verifying the person's identity.
          #
          #   @param name [String] The person's legal name.

          # @see Increase::Entity::Trust::Grantor#address
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
            #   the address.
            #
            #   @return [String]
            required :state, String

            # @!attribute zip
            #   The ZIP code of the address.
            #
            #   @return [String]
            required :zip, String

            # @!method initialize(city:, line1:, line2:, state:, zip:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Entity::Trust::Grantor::Address} for more details.
            #
            #   The person's address.
            #
            #   @param city [String] The city of the address.
            #
            #   @param line1 [String] The first line of the address.
            #
            #   @param line2 [String, nil] The second line of the address.
            #
            #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
            #
            #   @param zip [String] The ZIP code of the address.
          end

          # @see Increase::Entity::Trust::Grantor#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Entity::Trust::Grantor::Identification::Method]
            required :method_,
                     enum: -> { Increase::Entity::Trust::Grantor::Identification::Method },
                     api_name: :method

            # @!attribute number_last4
            #   The last 4 digits of the identification number that can be used to verify the
            #   individual's identity.
            #
            #   @return [String]
            required :number_last4, String

            # @!method initialize(method_:, number_last4:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Entity::Trust::Grantor::Identification} for more details.
            #
            #   A means of verifying the person's identity.
            #
            #   @param method_ [Symbol, Increase::Entity::Trust::Grantor::Identification::Method] A method that can be used to verify the individual's identity.
            #
            #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

            # A method that can be used to verify the individual's identity.
            #
            # @see Increase::Entity::Trust::Grantor::Identification#method_
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
          end
        end

        class Trustee < Increase::Internal::Type::BaseModel
          # @!attribute individual
          #   The individual trustee of the trust. Will be present if the trustee's
          #   `structure` is equal to `individual`.
          #
          #   @return [Increase::Entity::Trust::Trustee::Individual, nil]
          required :individual, -> { Increase::Entity::Trust::Trustee::Individual }, nil?: true

          # @!attribute structure
          #   The structure of the trustee. Will always be equal to `individual`.
          #
          #   @return [Symbol, Increase::Entity::Trust::Trustee::Structure]
          required :structure, enum: -> { Increase::Entity::Trust::Trustee::Structure }

          # @!method initialize(individual:, structure:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Entity::Trust::Trustee} for more details.
          #
          #   @param individual [Increase::Entity::Trust::Trustee::Individual, nil] The individual trustee of the trust. Will be present if the trustee's `structure
          #
          #   @param structure [Symbol, Increase::Entity::Trust::Trustee::Structure] The structure of the trustee. Will always be equal to `individual`.

          # @see Increase::Entity::Trust::Trustee#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The person's address.
            #
            #   @return [Increase::Entity::Trust::Trustee::Individual::Address]
            required :address, -> { Increase::Entity::Trust::Trustee::Individual::Address }

            # @!attribute date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :date_of_birth, Date

            # @!attribute identification
            #   A means of verifying the person's identity.
            #
            #   @return [Increase::Entity::Trust::Trustee::Individual::Identification]
            required :identification, -> { Increase::Entity::Trust::Trustee::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(address:, date_of_birth:, identification:, name:)
            #   The individual trustee of the trust. Will be present if the trustee's
            #   `structure` is equal to `individual`.
            #
            #   @param address [Increase::Entity::Trust::Trustee::Individual::Address] The person's address.
            #
            #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
            #
            #   @param identification [Increase::Entity::Trust::Trustee::Individual::Identification] A means of verifying the person's identity.
            #
            #   @param name [String] The person's legal name.

            # @see Increase::Entity::Trust::Trustee::Individual#address
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
              #   the address.
              #
              #   @return [String]
              required :state, String

              # @!attribute zip
              #   The ZIP code of the address.
              #
              #   @return [String]
              required :zip, String

              # @!method initialize(city:, line1:, line2:, state:, zip:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Entity::Trust::Trustee::Individual::Address} for more details.
              #
              #   The person's address.
              #
              #   @param city [String] The city of the address.
              #
              #   @param line1 [String] The first line of the address.
              #
              #   @param line2 [String, nil] The second line of the address.
              #
              #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
              #
              #   @param zip [String] The ZIP code of the address.
            end

            # @see Increase::Entity::Trust::Trustee::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Entity::Trust::Trustee::Individual::Identification::Method]
              required :method_,
                       enum: -> { Increase::Entity::Trust::Trustee::Individual::Identification::Method },
                       api_name: :method

              # @!attribute number_last4
              #   The last 4 digits of the identification number that can be used to verify the
              #   individual's identity.
              #
              #   @return [String]
              required :number_last4, String

              # @!method initialize(method_:, number_last4:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Entity::Trust::Trustee::Individual::Identification} for more details.
              #
              #   A means of verifying the person's identity.
              #
              #   @param method_ [Symbol, Increase::Entity::Trust::Trustee::Individual::Identification::Method] A method that can be used to verify the individual's identity.
              #
              #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

              # A method that can be used to verify the individual's identity.
              #
              # @see Increase::Entity::Trust::Trustee::Individual::Identification#method_
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
            end
          end

          # The structure of the trustee. Will always be equal to `individual`.
          #
          # @see Increase::Entity::Trust::Trustee#structure
          module Structure
            extend Increase::Internal::Type::Enum

            # The trustee is an individual.
            INDIVIDUAL = :individual

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `entity`.
      #
      # @see Increase::Entity#type
      module Type
        extend Increase::Internal::Type::Enum

        ENTITY = :entity

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
