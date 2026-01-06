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
      #   @return [Increase::Models::Entity::Corporation, nil]
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
      #   @return [Increase::Models::Entity::GovernmentAuthority, nil]
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
      #   @return [Increase::Models::Entity::Joint, nil]
      required :joint, -> { Increase::Entity::Joint }, nil?: true

      # @!attribute natural_person
      #   Details of the natural person entity. Will be present if `structure` is equal to
      #   `natural_person`.
      #
      #   @return [Increase::Models::Entity::NaturalPerson, nil]
      required :natural_person, -> { Increase::Entity::NaturalPerson }, nil?: true

      # @!attribute risk_rating
      #   An assessment of the entity’s potential risk of involvement in financial crimes,
      #   such as money laundering.
      #
      #   @return [Increase::Models::Entity::RiskRating, nil]
      required :risk_rating, -> { Increase::Entity::RiskRating }, nil?: true

      # @!attribute status
      #   The status of the entity.
      #
      #   @return [Symbol, Increase::Models::Entity::Status]
      required :status, enum: -> { Increase::Entity::Status }

      # @!attribute structure
      #   The entity's legal structure.
      #
      #   @return [Symbol, Increase::Models::Entity::Structure]
      required :structure, enum: -> { Increase::Entity::Structure }

      # @!attribute supplemental_documents
      #   Additional documentation associated with the entity. This is limited to the
      #   first 10 documents for an entity. If an entity has more than 10 documents, use
      #   the GET /entity_supplemental_documents list endpoint to retrieve them.
      #
      #   @return [Array<Increase::Models::EntitySupplementalDocument>]
      required :supplemental_documents,
               -> { Increase::Internal::Type::ArrayOf[Increase::EntitySupplementalDocument] }

      # @!attribute terms_agreements
      #   The terms that the Entity agreed to. Not all programs are required to submit
      #   this data.
      #
      #   @return [Array<Increase::Models::Entity::TermsAgreement>]
      required :terms_agreements, -> { Increase::Internal::Type::ArrayOf[Increase::Entity::TermsAgreement] }

      # @!attribute third_party_verification
      #   If you are using a third-party service for identity verification, you can use
      #   this field to associate this Entity with the identifier that represents them in
      #   that service.
      #
      #   @return [Increase::Models::Entity::ThirdPartyVerification, nil]
      required :third_party_verification, -> { Increase::Entity::ThirdPartyVerification }, nil?: true

      # @!attribute trust
      #   Details of the trust entity. Will be present if `structure` is equal to `trust`.
      #
      #   @return [Increase::Models::Entity::Trust, nil]
      required :trust, -> { Increase::Entity::Trust }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `entity`.
      #
      #   @return [Symbol, Increase::Models::Entity::Type]
      required :type, enum: -> { Increase::Entity::Type }

      # @!method initialize(id:, corporation:, created_at:, description:, details_confirmed_at:, government_authority:, idempotency_key:, joint:, natural_person:, risk_rating:, status:, structure:, supplemental_documents:, terms_agreements:, third_party_verification:, trust:, type:)
      #   Some parameter documentations has been truncated, see {Increase::Models::Entity}
      #   for more details.
      #
      #   Entities are the legal entities that own accounts. They can be people,
      #   corporations, partnerships, government authorities, or trusts.
      #
      #   @param id [String] The entity's identifier.
      #
      #   @param corporation [Increase::Models::Entity::Corporation, nil] Details of the corporation entity. Will be present if `structure` is equal to `c
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity
      #
      #   @param description [String, nil] The entity's description for display purposes.
      #
      #   @param details_confirmed_at [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity'
      #
      #   @param government_authority [Increase::Models::Entity::GovernmentAuthority, nil] Details of the government authority entity. Will be present if `structure` is eq
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param joint [Increase::Models::Entity::Joint, nil] Details of the joint entity. Will be present if `structure` is equal to `joint`.
      #
      #   @param natural_person [Increase::Models::Entity::NaturalPerson, nil] Details of the natural person entity. Will be present if `structure` is equal to
      #
      #   @param risk_rating [Increase::Models::Entity::RiskRating, nil] An assessment of the entity’s potential risk of involvement in financial crimes,
      #
      #   @param status [Symbol, Increase::Models::Entity::Status] The status of the entity.
      #
      #   @param structure [Symbol, Increase::Models::Entity::Structure] The entity's legal structure.
      #
      #   @param supplemental_documents [Array<Increase::Models::EntitySupplementalDocument>] Additional documentation associated with the entity. This is limited to the firs
      #
      #   @param terms_agreements [Array<Increase::Models::Entity::TermsAgreement>] The terms that the Entity agreed to. Not all programs are required to submit thi
      #
      #   @param third_party_verification [Increase::Models::Entity::ThirdPartyVerification, nil] If you are using a third-party service for identity verification, you can use th
      #
      #   @param trust [Increase::Models::Entity::Trust, nil] Details of the trust entity. Will be present if `structure` is equal to `trust`.
      #
      #   @param type [Symbol, Increase::Models::Entity::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::Entity#corporation
      class Corporation < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The corporation's address.
        #
        #   @return [Increase::Models::Entity::Corporation::Address]
        required :address, -> { Increase::Entity::Corporation::Address }

        # @!attribute beneficial_owners
        #   The identifying details of anyone controlling or owning 25% or more of the
        #   corporation.
        #
        #   @return [Array<Increase::Models::Entity::Corporation::BeneficialOwner>]
        required :beneficial_owners,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Entity::Corporation::BeneficialOwner] }

        # @!attribute email
        #   An email address for the business.
        #
        #   @return [String, nil]
        required :email, String, nil?: true

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

        # @!method initialize(address:, beneficial_owners:, email:, incorporation_state:, industry_code:, name:, tax_identifier:, website:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Entity::Corporation} for more details.
        #
        #   Details of the corporation entity. Will be present if `structure` is equal to
        #   `corporation`.
        #
        #   @param address [Increase::Models::Entity::Corporation::Address] The corporation's address.
        #
        #   @param beneficial_owners [Array<Increase::Models::Entity::Corporation::BeneficialOwner>] The identifying details of anyone controlling or owning 25% or more of the corpo
        #
        #   @param email [String, nil] An email address for the business.
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
          #   {Increase::Models::Entity::Corporation::Address} for more details.
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
          #   @return [Increase::Models::Entity::Corporation::BeneficialOwner::Individual]
          required :individual, -> { Increase::Entity::Corporation::BeneficialOwner::Individual }

          # @!attribute prong
          #   Why this person is considered a beneficial owner of the entity.
          #
          #   @return [Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Prong]
          required :prong, enum: -> { Increase::Entity::Corporation::BeneficialOwner::Prong }

          # @!method initialize(beneficial_owner_id:, company_title:, individual:, prong:)
          #   @param beneficial_owner_id [String] The identifier of this beneficial owner.
          #
          #   @param company_title [String, nil] This person's role or title within the entity.
          #
          #   @param individual [Increase::Models::Entity::Corporation::BeneficialOwner::Individual] Personal details for the beneficial owner.
          #
          #   @param prong [Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Prong] Why this person is considered a beneficial owner of the entity.

          # @see Increase::Models::Entity::Corporation::BeneficialOwner#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The person's address.
            #
            #   @return [Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address]
            required :address, -> { Increase::Entity::Corporation::BeneficialOwner::Individual::Address }

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
                     -> { Increase::Entity::Corporation::BeneficialOwner::Individual::Identification }

            # @!attribute name
            #   The person's legal name.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(address:, date_of_birth:, identification:, name:)
            #   Personal details for the beneficial owner.
            #
            #   @param address [Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address] The person's address.
            #
            #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
            #
            #   @param identification [Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification] A means of verifying the person's identity.
            #
            #   @param name [String] The person's legal name.

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
              #   {Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address}
              #   for more details.
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

            # @see Increase::Models::Entity::Corporation::BeneficialOwner::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method]
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
              #   {Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification}
              #   for more details.
              #
              #   A means of verifying the person's identity.
              #
              #   @param method_ [Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method] A method that can be used to verify the individual's identity.
              #
              #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

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

                # @!method self.values
                #   @return [Array<Symbol>]
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

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see Increase::Models::Entity#government_authority
      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The government authority's address.
        #
        #   @return [Increase::Models::Entity::GovernmentAuthority::Address]
        required :address, -> { Increase::Entity::GovernmentAuthority::Address }

        # @!attribute authorized_persons
        #   The identifying details of authorized persons of the government authority.
        #
        #   @return [Array<Increase::Models::Entity::GovernmentAuthority::AuthorizedPerson>]
        required :authorized_persons,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Entity::GovernmentAuthority::AuthorizedPerson] }

        # @!attribute category
        #   The category of the government authority.
        #
        #   @return [Symbol, Increase::Models::Entity::GovernmentAuthority::Category]
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
        #   @param address [Increase::Models::Entity::GovernmentAuthority::Address] The government authority's address.
        #
        #   @param authorized_persons [Array<Increase::Models::Entity::GovernmentAuthority::AuthorizedPerson>] The identifying details of authorized persons of the government authority.
        #
        #   @param category [Symbol, Increase::Models::Entity::GovernmentAuthority::Category] The category of the government authority.
        #
        #   @param name [String] The government authority's name.
        #
        #   @param tax_identifier [String, nil] The Employer Identification Number (EIN) of the government authority.
        #
        #   @param website [String, nil] The government authority's website.

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
          #   {Increase::Models::Entity::GovernmentAuthority::Address} for more details.
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
        # @see Increase::Models::Entity::GovernmentAuthority#category
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

      # @see Increase::Models::Entity#joint
      class Joint < Increase::Internal::Type::BaseModel
        # @!attribute individuals
        #   The two individuals that share control of the entity.
        #
        #   @return [Array<Increase::Models::Entity::Joint::Individual>]
        required :individuals, -> { Increase::Internal::Type::ArrayOf[Increase::Entity::Joint::Individual] }

        # @!attribute name
        #   The entity's name.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(individuals:, name:)
        #   Details of the joint entity. Will be present if `structure` is equal to `joint`.
        #
        #   @param individuals [Array<Increase::Models::Entity::Joint::Individual>] The two individuals that share control of the entity.
        #
        #   @param name [String] The entity's name.

        class Individual < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The person's address.
          #
          #   @return [Increase::Models::Entity::Joint::Individual::Address]
          required :address, -> { Increase::Entity::Joint::Individual::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::Entity::Joint::Individual::Identification]
          required :identification, -> { Increase::Entity::Joint::Individual::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(address:, date_of_birth:, identification:, name:)
          #   @param address [Increase::Models::Entity::Joint::Individual::Address] The person's address.
          #
          #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
          #
          #   @param identification [Increase::Models::Entity::Joint::Individual::Identification] A means of verifying the person's identity.
          #
          #   @param name [String] The person's legal name.

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
            #   {Increase::Models::Entity::Joint::Individual::Address} for more details.
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

          # @see Increase::Models::Entity::Joint::Individual#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::Entity::Joint::Individual::Identification::Method]
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
            #   {Increase::Models::Entity::Joint::Individual::Identification} for more details.
            #
            #   A means of verifying the person's identity.
            #
            #   @param method_ [Symbol, Increase::Models::Entity::Joint::Individual::Identification::Method] A method that can be used to verify the individual's identity.
            #
            #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

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

              # @!method self.values
              #   @return [Array<Symbol>]
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
        required :address, -> { Increase::Entity::NaturalPerson::Address }

        # @!attribute date_of_birth
        #   The person's date of birth in YYYY-MM-DD format.
        #
        #   @return [Date]
        required :date_of_birth, Date

        # @!attribute identification
        #   A means of verifying the person's identity.
        #
        #   @return [Increase::Models::Entity::NaturalPerson::Identification]
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
        #   @param address [Increase::Models::Entity::NaturalPerson::Address] The person's address.
        #
        #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
        #
        #   @param identification [Increase::Models::Entity::NaturalPerson::Identification] A means of verifying the person's identity.
        #
        #   @param name [String] The person's legal name.

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
          #   {Increase::Models::Entity::NaturalPerson::Address} for more details.
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

        # @see Increase::Models::Entity::NaturalPerson#identification
        class Identification < Increase::Internal::Type::BaseModel
          # @!attribute method_
          #   A method that can be used to verify the individual's identity.
          #
          #   @return [Symbol, Increase::Models::Entity::NaturalPerson::Identification::Method]
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
          #   {Increase::Models::Entity::NaturalPerson::Identification} for more details.
          #
          #   A means of verifying the person's identity.
          #
          #   @param method_ [Symbol, Increase::Models::Entity::NaturalPerson::Identification::Method] A method that can be used to verify the individual's identity.
          #
          #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

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

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see Increase::Models::Entity#risk_rating
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
        #   @return [Symbol, Increase::Models::Entity::RiskRating::Rating]
        required :rating, enum: -> { Increase::Entity::RiskRating::Rating }

        # @!method initialize(rated_at:, rating:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Entity::RiskRating} for more details.
        #
        #   An assessment of the entity’s potential risk of involvement in financial crimes,
        #   such as money laundering.
        #
        #   @param rated_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk ra
        #
        #   @param rating [Symbol, Increase::Models::Entity::RiskRating::Rating] The rating given to this entity.

        # The rating given to this entity.
        #
        # @see Increase::Models::Entity::RiskRating#rating
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

        # @!method self.values
        #   @return [Array<Symbol>]
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

        # @!method self.values
        #   @return [Array<Symbol>]
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
        #   {Increase::Models::Entity::TermsAgreement} for more details.
        #
        #   @param agreed_at [Time] The timestamp of when the Entity agreed to the terms.
        #
        #   @param ip_address [String] The IP address the Entity accessed reviewed the terms from.
        #
        #   @param terms_url [String] The URL of the terms agreement. This link will be provided by your bank partner.
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
        required :vendor, enum: -> { Increase::Entity::ThirdPartyVerification::Vendor }

        # @!method initialize(reference:, vendor:)
        #   If you are using a third-party service for identity verification, you can use
        #   this field to associate this Entity with the identifier that represents them in
        #   that service.
        #
        #   @param reference [String] The reference identifier for the third party verification.
        #
        #   @param vendor [Symbol, Increase::Models::Entity::ThirdPartyVerification::Vendor] The vendor that was used to perform the verification.

        # The vendor that was used to perform the verification.
        #
        # @see Increase::Models::Entity::ThirdPartyVerification#vendor
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

      # @see Increase::Models::Entity#trust
      class Trust < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The trust's address.
        #
        #   @return [Increase::Models::Entity::Trust::Address]
        required :address, -> { Increase::Entity::Trust::Address }

        # @!attribute category
        #   Whether the trust is `revocable` or `irrevocable`.
        #
        #   @return [Symbol, Increase::Models::Entity::Trust::Category]
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
        #   @return [Increase::Models::Entity::Trust::Grantor, nil]
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
        #   @return [Array<Increase::Models::Entity::Trust::Trustee>]
        required :trustees, -> { Increase::Internal::Type::ArrayOf[Increase::Entity::Trust::Trustee] }

        # @!method initialize(address:, category:, formation_document_file_id:, formation_state:, grantor:, name:, tax_identifier:, trustees:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Entity::Trust} for more details.
        #
        #   Details of the trust entity. Will be present if `structure` is equal to `trust`.
        #
        #   @param address [Increase::Models::Entity::Trust::Address] The trust's address.
        #
        #   @param category [Symbol, Increase::Models::Entity::Trust::Category] Whether the trust is `revocable` or `irrevocable`.
        #
        #   @param formation_document_file_id [String, nil] The ID for the File containing the formation document of the trust.
        #
        #   @param formation_state [String, nil] The two-letter United States Postal Service (USPS) abbreviation for the state in
        #
        #   @param grantor [Increase::Models::Entity::Trust::Grantor, nil] The grantor of the trust. Will be present if the `category` is `revocable`.
        #
        #   @param name [String] The trust's name.
        #
        #   @param tax_identifier [String, nil] The Employer Identification Number (EIN) of the trust itself.
        #
        #   @param trustees [Array<Increase::Models::Entity::Trust::Trustee>] The trustees of the trust.

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
          #   {Increase::Models::Entity::Trust::Address} for more details.
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
        # @see Increase::Models::Entity::Trust#category
        module Category
          extend Increase::Internal::Type::Enum

          # The trust is revocable by the grantor.
          REVOCABLE = :revocable

          # The trust cannot be revoked.
          IRREVOCABLE = :irrevocable

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::Entity::Trust#grantor
        class Grantor < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The person's address.
          #
          #   @return [Increase::Models::Entity::Trust::Grantor::Address]
          required :address, -> { Increase::Entity::Trust::Grantor::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::Entity::Trust::Grantor::Identification]
          required :identification, -> { Increase::Entity::Trust::Grantor::Identification }

          # @!attribute name
          #   The person's legal name.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(address:, date_of_birth:, identification:, name:)
          #   The grantor of the trust. Will be present if the `category` is `revocable`.
          #
          #   @param address [Increase::Models::Entity::Trust::Grantor::Address] The person's address.
          #
          #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
          #
          #   @param identification [Increase::Models::Entity::Trust::Grantor::Identification] A means of verifying the person's identity.
          #
          #   @param name [String] The person's legal name.

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
            #   {Increase::Models::Entity::Trust::Grantor::Address} for more details.
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

          # @see Increase::Models::Entity::Trust::Grantor#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::Entity::Trust::Grantor::Identification::Method]
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
            #   {Increase::Models::Entity::Trust::Grantor::Identification} for more details.
            #
            #   A means of verifying the person's identity.
            #
            #   @param method_ [Symbol, Increase::Models::Entity::Trust::Grantor::Identification::Method] A method that can be used to verify the individual's identity.
            #
            #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

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
          #   @return [Increase::Models::Entity::Trust::Trustee::Individual, nil]
          required :individual, -> { Increase::Entity::Trust::Trustee::Individual }, nil?: true

          # @!attribute structure
          #   The structure of the trustee. Will always be equal to `individual`.
          #
          #   @return [Symbol, Increase::Models::Entity::Trust::Trustee::Structure]
          required :structure, enum: -> { Increase::Entity::Trust::Trustee::Structure }

          # @!method initialize(individual:, structure:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Entity::Trust::Trustee} for more details.
          #
          #   @param individual [Increase::Models::Entity::Trust::Trustee::Individual, nil] The individual trustee of the trust. Will be present if the trustee's `structure
          #
          #   @param structure [Symbol, Increase::Models::Entity::Trust::Trustee::Structure] The structure of the trustee. Will always be equal to `individual`.

          # @see Increase::Models::Entity::Trust::Trustee#individual
          class Individual < Increase::Internal::Type::BaseModel
            # @!attribute address
            #   The person's address.
            #
            #   @return [Increase::Models::Entity::Trust::Trustee::Individual::Address]
            required :address, -> { Increase::Entity::Trust::Trustee::Individual::Address }

            # @!attribute date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #
            #   @return [Date]
            required :date_of_birth, Date

            # @!attribute identification
            #   A means of verifying the person's identity.
            #
            #   @return [Increase::Models::Entity::Trust::Trustee::Individual::Identification]
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
            #   @param address [Increase::Models::Entity::Trust::Trustee::Individual::Address] The person's address.
            #
            #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
            #
            #   @param identification [Increase::Models::Entity::Trust::Trustee::Individual::Identification] A means of verifying the person's identity.
            #
            #   @param name [String] The person's legal name.

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
              #   {Increase::Models::Entity::Trust::Trustee::Individual::Address} for more
              #   details.
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

            # @see Increase::Models::Entity::Trust::Trustee::Individual#identification
            class Identification < Increase::Internal::Type::BaseModel
              # @!attribute method_
              #   A method that can be used to verify the individual's identity.
              #
              #   @return [Symbol, Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method]
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
              #   {Increase::Models::Entity::Trust::Trustee::Individual::Identification} for more
              #   details.
              #
              #   A means of verifying the person's identity.
              #
              #   @param method_ [Symbol, Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method] A method that can be used to verify the individual's identity.
              #
              #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

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

                # @!method self.values
                #   @return [Array<Symbol>]
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

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `entity`.
      #
      # @see Increase::Models::Entity#type
      module Type
        extend Increase::Internal::Type::Enum

        ENTITY = :entity

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
