# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#create_beneficial_owner
    class EntityCreateBeneficialOwnerParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute beneficial_owner
      #   The identifying details of anyone controlling or owning 25% or more of the
      #     corporation.
      #
      #   @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner]
      required :beneficial_owner, -> { Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner }

      # @!parse
      #   # @param beneficial_owner [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(beneficial_owner:, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class BeneficialOwner < Increase::Internal::Type::BaseModel
        # @!attribute individual
        #   Personal details for the beneficial owner.
        #
        #   @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual]
        required :individual,
                 -> { Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual }

        # @!attribute prongs
        #   Why this person is considered a beneficial owner of the entity. At least one
        #     option is required, if a person is both a control person and owner, submit an
        #     array containing both.
        #
        #   @return [Array<Symbol, Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Prong>]
        required :prongs,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Prong] }

        # @!attribute [r] company_title
        #   This person's role or title within the entity.
        #
        #   @return [String, nil]
        optional :company_title, String

        # @!parse
        #   # @return [String]
        #   attr_writer :company_title

        # @!parse
        #   # The identifying details of anyone controlling or owning 25% or more of the
        #   #   corporation.
        #   #
        #   # @param individual [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual]
        #   # @param prongs [Array<Symbol, Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Prong>]
        #   # @param company_title [String]
        #   #
        #   def initialize(individual:, prongs:, company_title: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner#individual
        class Individual < Increase::Internal::Type::BaseModel
          # @!attribute address
          #   The individual's physical address. Mail receiving locations like PO Boxes and
          #     PMB's are disallowed.
          #
          #   @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Address]
          required :address,
                   -> { Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Address }

          # @!attribute date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #
          #   @return [Date]
          required :date_of_birth, Date

          # @!attribute identification
          #   A means of verifying the person's identity.
          #
          #   @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification]
          required :identification,
                   -> { Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification }

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
          optional :confirmed_no_us_tax_id, Increase::Internal::Type::BooleanModel

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :confirmed_no_us_tax_id

          # @!parse
          #   # Personal details for the beneficial owner.
          #   #
          #   # @param address [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Address]
          #   # @param date_of_birth [Date]
          #   # @param identification [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification]
          #   # @param name [String]
          #   # @param confirmed_no_us_tax_id [Boolean]
          #   #
          #   def initialize(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # @see Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual#address
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

          # @see Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual#identification
          class Identification < Increase::Internal::Type::BaseModel
            # @!attribute method_
            #   A method that can be used to verify the individual's identity.
            #
            #   @return [Symbol, Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Method]
            required :method_,
                     enum: -> { Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Method },
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
            #   @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::DriversLicense, nil]
            optional :drivers_license,
                     -> { Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::DriversLicense }

            # @!parse
            #   # @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::DriversLicense]
            #   attr_writer :drivers_license

            # @!attribute [r] other
            #   Information about the identification document provided. Required if `method` is
            #     equal to `other`.
            #
            #   @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Other, nil]
            optional :other,
                     -> { Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Other }

            # @!parse
            #   # @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Other]
            #   attr_writer :other

            # @!attribute [r] passport
            #   Information about the passport used for identification. Required if `method` is
            #     equal to `passport`.
            #
            #   @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Passport, nil]
            optional :passport,
                     -> { Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Passport }

            # @!parse
            #   # @return [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Passport]
            #   attr_writer :passport

            # @!parse
            #   # A means of verifying the person's identity.
            #   #
            #   # @param method_ [Symbol, Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Method]
            #   # @param number [String]
            #   # @param drivers_license [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::DriversLicense]
            #   # @param other [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Other]
            #   # @param passport [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification::Passport]
            #   #
            #   def initialize(method_:, number:, drivers_license: nil, other: nil, passport: nil, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

            # A method that can be used to verify the individual's identity.
            #
            # @see Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification#method_
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

            # @see Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification#drivers_license
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

            # @see Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification#other
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

            # @see Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner::Individual::Identification#passport
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
  end
end
