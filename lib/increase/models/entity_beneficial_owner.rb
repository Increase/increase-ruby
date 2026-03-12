# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BeneficialOwners#create
    class EntityBeneficialOwner < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The identifier of this beneficial owner.
      #
      #   @return [String]
      required :id, String

      # @!attribute company_title
      #   This person's role or title within the entity.
      #
      #   @return [String, nil]
      required :company_title, String, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
      #   Beneficial Owner was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute entity_id
      #   The identifier of the Entity to which this beneficial owner belongs.
      #
      #   @return [String]
      required :entity_id, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute individual
      #   Personal details for the beneficial owner.
      #
      #   @return [Increase::Models::EntityBeneficialOwner::Individual]
      required :individual, -> { Increase::EntityBeneficialOwner::Individual }

      # @!attribute prongs
      #   Why this person is considered a beneficial owner of the entity.
      #
      #   @return [Array<Symbol, Increase::Models::EntityBeneficialOwner::Prong>]
      required :prongs, -> { Increase::Internal::Type::ArrayOf[enum: Increase::EntityBeneficialOwner::Prong] }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `entity_beneficial_owner`.
      #
      #   @return [Symbol, Increase::Models::EntityBeneficialOwner::Type]
      required :type, enum: -> { Increase::EntityBeneficialOwner::Type }

      # @!method initialize(id:, company_title:, created_at:, entity_id:, idempotency_key:, individual:, prongs:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityBeneficialOwner} for more details.
      #
      #   Beneficial owners are the individuals who control or own 25% or more of a
      #   `corporation` entity. Beneficial owners are always people, and never
      #   organizations. Generally, you will need to submit between 1 and 5 beneficial
      #   owners for every `corporation` entity. You should update and archive beneficial
      #   owners for a corporation entity as their details change.
      #
      #   @param id [String] The identifier of this beneficial owner.
      #
      #   @param company_title [String, nil] This person's role or title within the entity.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Benefic
      #
      #   @param entity_id [String] The identifier of the Entity to which this beneficial owner belongs.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param individual [Increase::Models::EntityBeneficialOwner::Individual] Personal details for the beneficial owner.
      #
      #   @param prongs [Array<Symbol, Increase::Models::EntityBeneficialOwner::Prong>] Why this person is considered a beneficial owner of the entity.
      #
      #   @param type [Symbol, Increase::Models::EntityBeneficialOwner::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::EntityBeneficialOwner#individual
      class Individual < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The person's address.
        #
        #   @return [Increase::Models::EntityBeneficialOwner::Individual::Address]
        required :address, -> { Increase::EntityBeneficialOwner::Individual::Address }

        # @!attribute date_of_birth
        #   The person's date of birth in YYYY-MM-DD format.
        #
        #   @return [Date]
        required :date_of_birth, Date

        # @!attribute identification
        #   A means of verifying the person's identity.
        #
        #   @return [Increase::Models::EntityBeneficialOwner::Individual::Identification]
        required :identification, -> { Increase::EntityBeneficialOwner::Individual::Identification }

        # @!attribute name
        #   The person's legal name.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(address:, date_of_birth:, identification:, name:)
        #   Personal details for the beneficial owner.
        #
        #   @param address [Increase::Models::EntityBeneficialOwner::Individual::Address] The person's address.
        #
        #   @param date_of_birth [Date] The person's date of birth in YYYY-MM-DD format.
        #
        #   @param identification [Increase::Models::EntityBeneficialOwner::Individual::Identification] A means of verifying the person's identity.
        #
        #   @param name [String] The person's legal name.

        # @see Increase::Models::EntityBeneficialOwner::Individual#address
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
          #   {Increase::Models::EntityBeneficialOwner::Individual::Address} for more details.
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

        # @see Increase::Models::EntityBeneficialOwner::Individual#identification
        class Identification < Increase::Internal::Type::BaseModel
          # @!attribute method_
          #   A method that can be used to verify the individual's identity.
          #
          #   @return [Symbol, Increase::Models::EntityBeneficialOwner::Individual::Identification::Method]
          required :method_,
                   enum: -> { Increase::EntityBeneficialOwner::Individual::Identification::Method },
                   api_name: :method

          # @!attribute number_last4
          #   The last 4 digits of the identification number that can be used to verify the
          #   individual's identity.
          #
          #   @return [String]
          required :number_last4, String

          # @!method initialize(method_:, number_last4:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::EntityBeneficialOwner::Individual::Identification} for more
          #   details.
          #
          #   A means of verifying the person's identity.
          #
          #   @param method_ [Symbol, Increase::Models::EntityBeneficialOwner::Individual::Identification::Method] A method that can be used to verify the individual's identity.
          #
          #   @param number_last4 [String] The last 4 digits of the identification number that can be used to verify the in

          # A method that can be used to verify the individual's identity.
          #
          # @see Increase::Models::EntityBeneficialOwner::Individual::Identification#method_
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

      module Prong
        extend Increase::Internal::Type::Enum

        # A person with 25% or greater direct or indirect ownership of the entity.
        OWNERSHIP = :ownership

        # A person who manages, directs, or has significant control of the entity.
        CONTROL = :control

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `entity_beneficial_owner`.
      #
      # @see Increase::Models::EntityBeneficialOwner#type
      module Type
        extend Increase::Internal::Type::Enum

        ENTITY_BENEFICIAL_OWNER = :entity_beneficial_owner

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
