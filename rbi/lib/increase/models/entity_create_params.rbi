# typed: strong

module Increase
  module Models
    class EntityCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The type of Entity to create.
      sig { returns(Increase::Models::EntityCreateParams::Structure::OrSymbol) }
      attr_accessor :structure

      # Details of the corporation entity to create. Required if `structure` is equal to
      #   `corporation`.
      sig { returns(T.nilable(Increase::Models::EntityCreateParams::Corporation)) }
      attr_reader :corporation

      sig do
        params(corporation: T.any(Increase::Models::EntityCreateParams::Corporation, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :corporation

      # The description you choose to give the entity.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Details of the Government Authority entity to create. Required if `structure` is
      #   equal to `Government Authority`.
      sig { returns(T.nilable(Increase::Models::EntityCreateParams::GovernmentAuthority)) }
      attr_reader :government_authority

      sig do
        params(
          government_authority: T.any(Increase::Models::EntityCreateParams::GovernmentAuthority, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :government_authority

      # Details of the joint entity to create. Required if `structure` is equal to
      #   `joint`.
      sig { returns(T.nilable(Increase::Models::EntityCreateParams::Joint)) }
      attr_reader :joint

      sig { params(joint: T.any(Increase::Models::EntityCreateParams::Joint, Increase::Internal::AnyHash)).void }
      attr_writer :joint

      # Details of the natural person entity to create. Required if `structure` is equal
      #   to `natural_person`. Natural people entities should be submitted with
      #   `social_security_number` or `individual_taxpayer_identification_number`
      #   identification methods.
      sig { returns(T.nilable(Increase::Models::EntityCreateParams::NaturalPerson)) }
      attr_reader :natural_person

      sig do
        params(
          natural_person: T.any(Increase::Models::EntityCreateParams::NaturalPerson, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :natural_person

      # Additional documentation associated with the entity.
      sig { returns(T.nilable(T::Array[Increase::Models::EntityCreateParams::SupplementalDocument])) }
      attr_reader :supplemental_documents

      sig do
        params(
          supplemental_documents: T::Array[T.any(Increase::Models::EntityCreateParams::SupplementalDocument, Increase::Internal::AnyHash)]
        )
          .void
      end
      attr_writer :supplemental_documents

      # A reference to data stored in a third-party verification service. Your
      #   integration may or may not use this field.
      sig { returns(T.nilable(Increase::Models::EntityCreateParams::ThirdPartyVerification)) }
      attr_reader :third_party_verification

      sig do
        params(
          third_party_verification: T.any(Increase::Models::EntityCreateParams::ThirdPartyVerification, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :third_party_verification

      # Details of the trust entity to create. Required if `structure` is equal to
      #   `trust`.
      sig { returns(T.nilable(Increase::Models::EntityCreateParams::Trust)) }
      attr_reader :trust

      sig { params(trust: T.any(Increase::Models::EntityCreateParams::Trust, Increase::Internal::AnyHash)).void }
      attr_writer :trust

      sig do
        params(
          structure: Increase::Models::EntityCreateParams::Structure::OrSymbol,
          corporation: T.any(Increase::Models::EntityCreateParams::Corporation, Increase::Internal::AnyHash),
          description: String,
          government_authority: T.any(Increase::Models::EntityCreateParams::GovernmentAuthority, Increase::Internal::AnyHash),
          joint: T.any(Increase::Models::EntityCreateParams::Joint, Increase::Internal::AnyHash),
          natural_person: T.any(Increase::Models::EntityCreateParams::NaturalPerson, Increase::Internal::AnyHash),
          supplemental_documents: T::Array[T.any(Increase::Models::EntityCreateParams::SupplementalDocument, Increase::Internal::AnyHash)],
          third_party_verification: T.any(Increase::Models::EntityCreateParams::ThirdPartyVerification, Increase::Internal::AnyHash),
          trust: T.any(Increase::Models::EntityCreateParams::Trust, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        structure:,
        corporation: nil,
        description: nil,
        government_authority: nil,
        joint: nil,
        natural_person: nil,
        supplemental_documents: nil,
        third_party_verification: nil,
        trust: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              structure: Increase::Models::EntityCreateParams::Structure::OrSymbol,
              corporation: Increase::Models::EntityCreateParams::Corporation,
              description: String,
              government_authority: Increase::Models::EntityCreateParams::GovernmentAuthority,
              joint: Increase::Models::EntityCreateParams::Joint,
              natural_person: Increase::Models::EntityCreateParams::NaturalPerson,
              supplemental_documents: T::Array[Increase::Models::EntityCreateParams::SupplementalDocument],
              third_party_verification: Increase::Models::EntityCreateParams::ThirdPartyVerification,
              trust: Increase::Models::EntityCreateParams::Trust,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      # The type of Entity to create.
      module Structure
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::Structure) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::EntityCreateParams::Structure::TaggedSymbol) }

        # A corporation.
        CORPORATION = T.let(:corporation, Increase::Models::EntityCreateParams::Structure::TaggedSymbol)

        # An individual person.
        NATURAL_PERSON = T.let(:natural_person, Increase::Models::EntityCreateParams::Structure::TaggedSymbol)

        # Multiple individual people.
        JOINT = T.let(:joint, Increase::Models::EntityCreateParams::Structure::TaggedSymbol)

        # A trust.
        TRUST = T.let(:trust, Increase::Models::EntityCreateParams::Structure::TaggedSymbol)

        # A government authority.
        GOVERNMENT_AUTHORITY =
          T.let(:government_authority, Increase::Models::EntityCreateParams::Structure::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::EntityCreateParams::Structure::TaggedSymbol]) }
        def self.values
        end
      end

      class Corporation < Increase::Internal::Type::BaseModel
        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        sig { returns(Increase::Models::EntityCreateParams::Corporation::Address) }
        attr_reader :address

        sig do
          params(
            address: T.any(Increase::Models::EntityCreateParams::Corporation::Address, Increase::Internal::AnyHash)
          )
            .void
        end
        attr_writer :address

        # The identifying details of anyone controlling or owning 25% or more of the
        #   corporation.
        sig { returns(T::Array[Increase::Models::EntityCreateParams::Corporation::BeneficialOwner]) }
        attr_accessor :beneficial_owners

        # The legal name of the corporation.
        sig { returns(String) }
        attr_accessor :name

        # The Employer Identification Number (EIN) for the corporation.
        sig { returns(String) }
        attr_accessor :tax_identifier

        # The two-letter United States Postal Service (USPS) abbreviation for the
        #   corporation's state of incorporation.
        sig { returns(T.nilable(String)) }
        attr_reader :incorporation_state

        sig { params(incorporation_state: String).void }
        attr_writer :incorporation_state

        # The North American Industry Classification System (NAICS) code for the
        #   corporation's primary line of business. This is a number, like `5132` for
        #   `Software Publishers`. A full list of classification codes is available
        #   [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
        sig { returns(T.nilable(String)) }
        attr_reader :industry_code

        sig { params(industry_code: String).void }
        attr_writer :industry_code

        # The website of the corporation.
        sig { returns(T.nilable(String)) }
        attr_reader :website

        sig { params(website: String).void }
        attr_writer :website

        # Details of the corporation entity to create. Required if `structure` is equal to
        #   `corporation`.
        sig do
          params(
            address: T.any(Increase::Models::EntityCreateParams::Corporation::Address, Increase::Internal::AnyHash),
            beneficial_owners: T::Array[T.any(Increase::Models::EntityCreateParams::Corporation::BeneficialOwner, Increase::Internal::AnyHash)],
            name: String,
            tax_identifier: String,
            incorporation_state: String,
            industry_code: String,
            website: String
          )
            .returns(T.attached_class)
        end
        def self.new(
          address:,
          beneficial_owners:,
          name:,
          tax_identifier:,
          incorporation_state: nil,
          industry_code: nil,
          website: nil
        )
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::EntityCreateParams::Corporation::Address,
                beneficial_owners: T::Array[Increase::Models::EntityCreateParams::Corporation::BeneficialOwner],
                name: String,
                tax_identifier: String,
                incorporation_state: String,
                industry_code: String,
                website: String
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          #   the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The second line of the address. This might be the floor or room number.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          #   are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(city:, line1:, state:, zip:, line2: nil)
          end

          sig { override.returns({city: String, line1: String, state: String, zip: String, line2: String}) }
          def to_hash
          end
        end

        class BeneficialOwner < Increase::Internal::Type::BaseModel
          # Personal details for the beneficial owner.
          sig { returns(Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual) }
          attr_reader :individual

          sig do
            params(
              individual: T.any(
                Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual,
                Increase::Internal::AnyHash
              )
            )
              .void
          end
          attr_writer :individual

          # Why this person is considered a beneficial owner of the entity. At least one
          #   option is required, if a person is both a control person and owner, submit an
          #   array containing both.
          sig { returns(T::Array[Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong::OrSymbol]) }
          attr_accessor :prongs

          # This person's role or title within the entity.
          sig { returns(T.nilable(String)) }
          attr_reader :company_title

          sig { params(company_title: String).void }
          attr_writer :company_title

          sig do
            params(
              individual: T.any(
                Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual,
                Increase::Internal::AnyHash
              ),
              prongs: T::Array[Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong::OrSymbol],
              company_title: String
            )
              .returns(T.attached_class)
          end
          def self.new(individual:, prongs:, company_title: nil)
          end

          sig do
            override
              .returns(
                {
                  individual: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual,
                  prongs: T::Array[Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong::OrSymbol],
                  company_title: String
                }
              )
          end
          def to_hash
          end

          class Individual < Increase::Internal::Type::BaseModel
            # The individual's physical address. Mail receiving locations like PO Boxes and
            #   PMB's are disallowed.
            sig { returns(Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address) }
            attr_reader :address

            sig do
              params(
                address: T.any(
                  Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :address

            # The person's date of birth in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :date_of_birth

            # A means of verifying the person's identity.
            sig { returns(Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification) }
            attr_reader :identification

            sig do
              params(
                identification: T.any(
                  Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :identification

            # The person's legal name.
            sig { returns(String) }
            attr_accessor :name

            # The identification method for an individual can only be a passport, driver's
            #   license, or other document if you've confirmed the individual does not have a US
            #   tax id (either a Social Security Number or Individual Taxpayer Identification
            #   Number).
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :confirmed_no_us_tax_id

            sig { params(confirmed_no_us_tax_id: T::Boolean).void }
            attr_writer :confirmed_no_us_tax_id

            # Personal details for the beneficial owner.
            sig do
              params(
                address: T.any(
                  Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address,
                  Increase::Internal::AnyHash
                ),
                date_of_birth: Date,
                identification: T.any(
                  Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification,
                  Increase::Internal::AnyHash
                ),
                name: String,
                confirmed_no_us_tax_id: T::Boolean
              )
                .returns(T.attached_class)
            end
            def self.new(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
            end

            sig do
              override
                .returns(
                  {
                    address: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address,
                    date_of_birth: Date,
                    identification: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification,
                    name: String,
                    confirmed_no_us_tax_id: T::Boolean
                  }
                )
            end
            def to_hash
            end

            class Address < Increase::Internal::Type::BaseModel
              # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
              sig { returns(String) }
              attr_accessor :country

              # The first line of the address. This is usually the street number and street.
              sig { returns(String) }
              attr_accessor :line1

              # The city, district, town, or village of the address. Required in certain
              #   countries.
              sig { returns(T.nilable(String)) }
              attr_reader :city

              sig { params(city: String).void }
              attr_writer :city

              # The second line of the address. This might be the floor or room number.
              sig { returns(T.nilable(String)) }
              attr_reader :line2

              sig { params(line2: String).void }
              attr_writer :line2

              # The two-letter United States Postal Service (USPS) abbreviation for the US
              #   state, province, or region of the address. Required in certain countries.
              sig { returns(T.nilable(String)) }
              attr_reader :state

              sig { params(state: String).void }
              attr_writer :state

              # The ZIP or postal code of the address. Required in certain countries.
              sig { returns(T.nilable(String)) }
              attr_reader :zip

              sig { params(zip: String).void }
              attr_writer :zip

              # The individual's physical address. Mail receiving locations like PO Boxes and
              #   PMB's are disallowed.
              sig do
                params(
                  country: String,
                  line1: String,
                  city: String,
                  line2: String,
                  state: String,
                  zip: String
                )
                  .returns(T.attached_class)
              end
              def self.new(country:, line1:, city: nil, line2: nil, state: nil, zip: nil)
              end

              sig do
                override.returns(
                  {
                    country: String,
                    line1: String,
                    city: String,
                    line2: String,
                    state: String,
                    zip: String
                  }
                )
              end
              def to_hash
              end
            end

            class Identification < Increase::Internal::Type::BaseModel
              # A method that can be used to verify the individual's identity.
              sig do
                returns(
                  Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::OrSymbol
                )
              end
              attr_accessor :method_

              # An identification number that can be used to verify the individual's identity,
              #   such as a social security number.
              sig { returns(String) }
              attr_accessor :number

              # Information about the United States driver's license used for identification.
              #   Required if `method` is equal to `drivers_license`.
              sig do
                returns(
                  T.nilable(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense
                  )
                )
              end
              attr_reader :drivers_license

              sig do
                params(
                  drivers_license: T.any(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense,
                    Increase::Internal::AnyHash
                  )
                )
                  .void
              end
              attr_writer :drivers_license

              # Information about the identification document provided. Required if `method` is
              #   equal to `other`.
              sig do
                returns(
                  T.nilable(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other
                  )
                )
              end
              attr_reader :other

              sig do
                params(
                  other: T.any(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other,
                    Increase::Internal::AnyHash
                  )
                )
                  .void
              end
              attr_writer :other

              # Information about the passport used for identification. Required if `method` is
              #   equal to `passport`.
              sig do
                returns(
                  T.nilable(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport
                  )
                )
              end
              attr_reader :passport

              sig do
                params(
                  passport: T.any(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport,
                    Increase::Internal::AnyHash
                  )
                )
                  .void
              end
              attr_writer :passport

              # A means of verifying the person's identity.
              sig do
                params(
                  method_: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license: T.any(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense,
                    Increase::Internal::AnyHash
                  ),
                  other: T.any(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other,
                    Increase::Internal::AnyHash
                  ),
                  passport: T.any(
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport,
                    Increase::Internal::AnyHash
                  )
                )
                  .returns(T.attached_class)
              end
              def self.new(method_:, number:, drivers_license: nil, other: nil, passport: nil)
              end

              sig do
                override
                  .returns(
                    {
                      method_: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::OrSymbol,
                      number: String,
                      drivers_license: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense,
                      other: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other,
                      passport: Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport
                    }
                  )
              end
              def to_hash
              end

              # A method that can be used to verify the individual's identity.
              module Method
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method)
                  end
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                    )
                  end

                # A social security number.
                SOCIAL_SECURITY_NUMBER =
                  T.let(
                    :social_security_number,
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # An individual taxpayer identification number (ITIN).
                INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                  T.let(
                    :individual_taxpayer_identification_number,
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # A passport number.
                PASSPORT =
                  T.let(
                    :passport,
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # A driver's license number.
                DRIVERS_LICENSE =
                  T.let(
                    :drivers_license,
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # Another identifying document.
                OTHER =
                  T.let(
                    :other,
                    Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[
                      Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                      ]
                    )
                end
                def self.values
                end
              end

              class DriversLicense < Increase::Internal::Type::BaseModel
                # The driver's license's expiration date in YYYY-MM-DD format.
                sig { returns(Date) }
                attr_accessor :expiration_date

                # The identifier of the File containing the front of the driver's license.
                sig { returns(String) }
                attr_accessor :file_id

                # The state that issued the provided driver's license.
                sig { returns(String) }
                attr_accessor :state

                # The identifier of the File containing the back of the driver's license.
                sig { returns(T.nilable(String)) }
                attr_reader :back_file_id

                sig { params(back_file_id: String).void }
                attr_writer :back_file_id

                # Information about the United States driver's license used for identification.
                #   Required if `method` is equal to `drivers_license`.
                sig do
                  params(expiration_date: Date, file_id: String, state: String, back_file_id: String)
                    .returns(T.attached_class)
                end
                def self.new(expiration_date:, file_id:, state:, back_file_id: nil)
                end

                sig do
                  override.returns(
                    {
                      expiration_date: Date,
                      file_id: String,
                      state: String,
                      back_file_id: String
                    }
                  )
                end
                def to_hash
                end
              end

              class Other < Increase::Internal::Type::BaseModel
                # The two-character ISO 3166-1 code representing the country that issued the
                #   document.
                sig { returns(String) }
                attr_accessor :country

                # A description of the document submitted.
                sig { returns(String) }
                attr_accessor :description

                # The identifier of the File containing the front of the document.
                sig { returns(String) }
                attr_accessor :file_id

                # The identifier of the File containing the back of the document. Not every
                #   document has a reverse side.
                sig { returns(T.nilable(String)) }
                attr_reader :back_file_id

                sig { params(back_file_id: String).void }
                attr_writer :back_file_id

                # The document's expiration date in YYYY-MM-DD format.
                sig { returns(T.nilable(Date)) }
                attr_reader :expiration_date

                sig { params(expiration_date: Date).void }
                attr_writer :expiration_date

                # Information about the identification document provided. Required if `method` is
                #   equal to `other`.
                sig do
                  params(
                    country: String,
                    description: String,
                    file_id: String,
                    back_file_id: String,
                    expiration_date: Date
                  )
                    .returns(T.attached_class)
                end
                def self.new(country:, description:, file_id:, back_file_id: nil, expiration_date: nil)
                end

                sig do
                  override
                    .returns(
                      {
                        country: String,
                        description: String,
                        file_id: String,
                        back_file_id: String,
                        expiration_date: Date
                      }
                    )
                end
                def to_hash
                end
              end

              class Passport < Increase::Internal::Type::BaseModel
                # The country that issued the passport.
                sig { returns(String) }
                attr_accessor :country

                # The passport's expiration date in YYYY-MM-DD format.
                sig { returns(Date) }
                attr_accessor :expiration_date

                # The identifier of the File containing the passport.
                sig { returns(String) }
                attr_accessor :file_id

                # Information about the passport used for identification. Required if `method` is
                #   equal to `passport`.
                sig do
                  params(country: String, expiration_date: Date, file_id: String).returns(T.attached_class)
                end
                def self.new(country:, expiration_date:, file_id:)
                end

                sig { override.returns({country: String, expiration_date: Date, file_id: String}) }
                def to_hash
                end
              end
            end
          end

          module Prong
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong) }
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong::TaggedSymbol
                )
              end

            # A person with 25% or greater direct or indirect ownership of the entity.
            OWNERSHIP =
              T.let(:ownership, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong::TaggedSymbol)

            # A person who manages, directs, or has significant control of the entity.
            CONTROL =
              T.let(:control, Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Increase::Models::EntityCreateParams::Corporation::BeneficialOwner::Prong::TaggedSymbol])
            end
            def self.values
            end
          end
        end
      end

      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        sig { returns(Increase::Models::EntityCreateParams::GovernmentAuthority::Address) }
        attr_reader :address

        sig do
          params(
            address: T.any(Increase::Models::EntityCreateParams::GovernmentAuthority::Address, Increase::Internal::AnyHash)
          )
            .void
        end
        attr_writer :address

        # The identifying details of authorized officials acting on the entity's behalf.
        sig { returns(T::Array[Increase::Models::EntityCreateParams::GovernmentAuthority::AuthorizedPerson]) }
        attr_accessor :authorized_persons

        # The category of the government authority.
        sig { returns(Increase::Models::EntityCreateParams::GovernmentAuthority::Category::OrSymbol) }
        attr_accessor :category

        # The legal name of the government authority.
        sig { returns(String) }
        attr_accessor :name

        # The Employer Identification Number (EIN) for the government authority.
        sig { returns(String) }
        attr_accessor :tax_identifier

        # The website of the government authority.
        sig { returns(T.nilable(String)) }
        attr_reader :website

        sig { params(website: String).void }
        attr_writer :website

        # Details of the Government Authority entity to create. Required if `structure` is
        #   equal to `Government Authority`.
        sig do
          params(
            address: T.any(Increase::Models::EntityCreateParams::GovernmentAuthority::Address, Increase::Internal::AnyHash),
            authorized_persons: T::Array[
            T.any(
              Increase::Models::EntityCreateParams::GovernmentAuthority::AuthorizedPerson,
              Increase::Internal::AnyHash
            )
            ],
            category: Increase::Models::EntityCreateParams::GovernmentAuthority::Category::OrSymbol,
            name: String,
            tax_identifier: String,
            website: String
          )
            .returns(T.attached_class)
        end
        def self.new(address:, authorized_persons:, category:, name:, tax_identifier:, website: nil)
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::EntityCreateParams::GovernmentAuthority::Address,
                authorized_persons: T::Array[Increase::Models::EntityCreateParams::GovernmentAuthority::AuthorizedPerson],
                category: Increase::Models::EntityCreateParams::GovernmentAuthority::Category::OrSymbol,
                name: String,
                tax_identifier: String,
                website: String
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          #   the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The second line of the address. This might be the floor or room number.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          #   are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(city:, line1:, state:, zip:, line2: nil)
          end

          sig { override.returns({city: String, line1: String, state: String, zip: String, line2: String}) }
          def to_hash
          end
        end

        class AuthorizedPerson < Increase::Internal::Type::BaseModel
          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          sig { params(name: String).returns(T.attached_class) }
          def self.new(name:)
          end

          sig { override.returns({name: String}) }
          def to_hash
          end
        end

        # The category of the government authority.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::GovernmentAuthority::Category) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::EntityCreateParams::GovernmentAuthority::Category::TaggedSymbol) }

          # The Public Entity is a Municipality.
          MUNICIPALITY =
            T.let(:municipality, Increase::Models::EntityCreateParams::GovernmentAuthority::Category::TaggedSymbol)

          sig do
            override
              .returns(T::Array[Increase::Models::EntityCreateParams::GovernmentAuthority::Category::TaggedSymbol])
          end
          def self.values
          end
        end
      end

      class Joint < Increase::Internal::Type::BaseModel
        # The two individuals that share control of the entity.
        sig { returns(T::Array[Increase::Models::EntityCreateParams::Joint::Individual]) }
        attr_accessor :individuals

        # The name of the joint entity.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Details of the joint entity to create. Required if `structure` is equal to
        #   `joint`.
        sig do
          params(
            individuals: T::Array[T.any(Increase::Models::EntityCreateParams::Joint::Individual, Increase::Internal::AnyHash)],
            name: String
          )
            .returns(T.attached_class)
        end
        def self.new(individuals:, name: nil)
        end

        sig do
          override
            .returns({individuals: T::Array[Increase::Models::EntityCreateParams::Joint::Individual], name: String})
        end
        def to_hash
        end

        class Individual < Increase::Internal::Type::BaseModel
          # The individual's physical address. Mail receiving locations like PO Boxes and
          #   PMB's are disallowed.
          sig { returns(Increase::Models::EntityCreateParams::Joint::Individual::Address) }
          attr_reader :address

          sig do
            params(
              address: T.any(Increase::Models::EntityCreateParams::Joint::Individual::Address, Increase::Internal::AnyHash)
            )
              .void
          end
          attr_writer :address

          # The person's date of birth in YYYY-MM-DD format.
          sig { returns(Date) }
          attr_accessor :date_of_birth

          # A means of verifying the person's identity.
          sig { returns(Increase::Models::EntityCreateParams::Joint::Individual::Identification) }
          attr_reader :identification

          sig do
            params(
              identification: T.any(
                Increase::Models::EntityCreateParams::Joint::Individual::Identification,
                Increase::Internal::AnyHash
              )
            )
              .void
          end
          attr_writer :identification

          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          # The identification method for an individual can only be a passport, driver's
          #   license, or other document if you've confirmed the individual does not have a US
          #   tax id (either a Social Security Number or Individual Taxpayer Identification
          #   Number).
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :confirmed_no_us_tax_id

          sig { params(confirmed_no_us_tax_id: T::Boolean).void }
          attr_writer :confirmed_no_us_tax_id

          sig do
            params(
              address: T.any(Increase::Models::EntityCreateParams::Joint::Individual::Address, Increase::Internal::AnyHash),
              date_of_birth: Date,
              identification: T.any(
                Increase::Models::EntityCreateParams::Joint::Individual::Identification,
                Increase::Internal::AnyHash
              ),
              name: String,
              confirmed_no_us_tax_id: T::Boolean
            )
              .returns(T.attached_class)
          end
          def self.new(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
          end

          sig do
            override
              .returns(
                {
                  address: Increase::Models::EntityCreateParams::Joint::Individual::Address,
                  date_of_birth: Date,
                  identification: Increase::Models::EntityCreateParams::Joint::Individual::Identification,
                  name: String,
                  confirmed_no_us_tax_id: T::Boolean
                }
              )
          end
          def to_hash
          end

          class Address < Increase::Internal::Type::BaseModel
            # The city of the address.
            sig { returns(String) }
            attr_accessor :city

            # The first line of the address. This is usually the street number and street.
            sig { returns(String) }
            attr_accessor :line1

            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            #   the address.
            sig { returns(String) }
            attr_accessor :state

            # The ZIP code of the address.
            sig { returns(String) }
            attr_accessor :zip

            # The second line of the address. This might be the floor or room number.
            sig { returns(T.nilable(String)) }
            attr_reader :line2

            sig { params(line2: String).void }
            attr_writer :line2

            # The individual's physical address. Mail receiving locations like PO Boxes and
            #   PMB's are disallowed.
            sig do
              params(
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              ).returns(T.attached_class)
            end
            def self.new(city:, line1:, state:, zip:, line2: nil)
            end

            sig { override.returns({city: String, line1: String, state: String, zip: String, line2: String}) }
            def to_hash
            end
          end

          class Identification < Increase::Internal::Type::BaseModel
            # A method that can be used to verify the individual's identity.
            sig { returns(Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::OrSymbol) }
            attr_accessor :method_

            # An identification number that can be used to verify the individual's identity,
            #   such as a social security number.
            sig { returns(String) }
            attr_accessor :number

            # Information about the United States driver's license used for identification.
            #   Required if `method` is equal to `drivers_license`.
            sig do
              returns(
                T.nilable(Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense)
              )
            end
            attr_reader :drivers_license

            sig do
              params(
                drivers_license: T.any(
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :drivers_license

            # Information about the identification document provided. Required if `method` is
            #   equal to `other`.
            sig { returns(T.nilable(Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other)) }
            attr_reader :other

            sig do
              params(
                other: T.any(
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :other

            # Information about the passport used for identification. Required if `method` is
            #   equal to `passport`.
            sig { returns(T.nilable(Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport)) }
            attr_reader :passport

            sig do
              params(
                passport: T.any(
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :passport

            # A means of verifying the person's identity.
            sig do
              params(
                method_: Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::OrSymbol,
                number: String,
                drivers_license: T.any(
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense,
                  Increase::Internal::AnyHash
                ),
                other: T.any(
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other,
                  Increase::Internal::AnyHash
                ),
                passport: T.any(
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport,
                  Increase::Internal::AnyHash
                )
              )
                .returns(T.attached_class)
            end
            def self.new(method_:, number:, drivers_license: nil, other: nil, passport: nil)
            end

            sig do
              override
                .returns(
                  {
                    method_: Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::OrSymbol,
                    number: String,
                    drivers_license: Increase::Models::EntityCreateParams::Joint::Individual::Identification::DriversLicense,
                    other: Increase::Models::EntityCreateParams::Joint::Individual::Identification::Other,
                    passport: Increase::Models::EntityCreateParams::Joint::Individual::Identification::Passport
                  }
                )
            end
            def to_hash
            end

            # A method that can be used to verify the individual's identity.
            module Method
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method) }
              OrSymbol =
                T.type_alias do
                  T.any(
                    Symbol,
                    String,
                    Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                  )
                end

              # A social security number.
              SOCIAL_SECURITY_NUMBER =
                T.let(
                  :social_security_number,
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # An individual taxpayer identification number (ITIN).
              INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                T.let(
                  :individual_taxpayer_identification_number,
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # A passport number.
              PASSPORT =
                T.let(
                  :passport,
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # A driver's license number.
              DRIVERS_LICENSE =
                T.let(
                  :drivers_license,
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # Another identifying document.
              OTHER =
                T.let(
                  :other,
                  Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              sig do
                override
                  .returns(
                    T::Array[Increase::Models::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol]
                  )
              end
              def self.values
              end
            end

            class DriversLicense < Increase::Internal::Type::BaseModel
              # The driver's license's expiration date in YYYY-MM-DD format.
              sig { returns(Date) }
              attr_accessor :expiration_date

              # The identifier of the File containing the front of the driver's license.
              sig { returns(String) }
              attr_accessor :file_id

              # The state that issued the provided driver's license.
              sig { returns(String) }
              attr_accessor :state

              # The identifier of the File containing the back of the driver's license.
              sig { returns(T.nilable(String)) }
              attr_reader :back_file_id

              sig { params(back_file_id: String).void }
              attr_writer :back_file_id

              # Information about the United States driver's license used for identification.
              #   Required if `method` is equal to `drivers_license`.
              sig do
                params(expiration_date: Date, file_id: String, state: String, back_file_id: String)
                  .returns(T.attached_class)
              end
              def self.new(expiration_date:, file_id:, state:, back_file_id: nil)
              end

              sig do
                override.returns(
                  {
                    expiration_date: Date,
                    file_id: String,
                    state: String,
                    back_file_id: String
                  }
                )
              end
              def to_hash
              end
            end

            class Other < Increase::Internal::Type::BaseModel
              # The two-character ISO 3166-1 code representing the country that issued the
              #   document.
              sig { returns(String) }
              attr_accessor :country

              # A description of the document submitted.
              sig { returns(String) }
              attr_accessor :description

              # The identifier of the File containing the front of the document.
              sig { returns(String) }
              attr_accessor :file_id

              # The identifier of the File containing the back of the document. Not every
              #   document has a reverse side.
              sig { returns(T.nilable(String)) }
              attr_reader :back_file_id

              sig { params(back_file_id: String).void }
              attr_writer :back_file_id

              # The document's expiration date in YYYY-MM-DD format.
              sig { returns(T.nilable(Date)) }
              attr_reader :expiration_date

              sig { params(expiration_date: Date).void }
              attr_writer :expiration_date

              # Information about the identification document provided. Required if `method` is
              #   equal to `other`.
              sig do
                params(
                  country: String,
                  description: String,
                  file_id: String,
                  back_file_id: String,
                  expiration_date: Date
                )
                  .returns(T.attached_class)
              end
              def self.new(country:, description:, file_id:, back_file_id: nil, expiration_date: nil)
              end

              sig do
                override
                  .returns(
                    {
                      country: String,
                      description: String,
                      file_id: String,
                      back_file_id: String,
                      expiration_date: Date
                    }
                  )
              end
              def to_hash
              end
            end

            class Passport < Increase::Internal::Type::BaseModel
              # The country that issued the passport.
              sig { returns(String) }
              attr_accessor :country

              # The passport's expiration date in YYYY-MM-DD format.
              sig { returns(Date) }
              attr_accessor :expiration_date

              # The identifier of the File containing the passport.
              sig { returns(String) }
              attr_accessor :file_id

              # Information about the passport used for identification. Required if `method` is
              #   equal to `passport`.
              sig do
                params(country: String, expiration_date: Date, file_id: String).returns(T.attached_class)
              end
              def self.new(country:, expiration_date:, file_id:)
              end

              sig { override.returns({country: String, expiration_date: Date, file_id: String}) }
              def to_hash
              end
            end
          end
        end
      end

      class NaturalPerson < Increase::Internal::Type::BaseModel
        # The individual's physical address. Mail receiving locations like PO Boxes and
        #   PMB's are disallowed.
        sig { returns(Increase::Models::EntityCreateParams::NaturalPerson::Address) }
        attr_reader :address

        sig do
          params(
            address: T.any(Increase::Models::EntityCreateParams::NaturalPerson::Address, Increase::Internal::AnyHash)
          )
            .void
        end
        attr_writer :address

        # The person's date of birth in YYYY-MM-DD format.
        sig { returns(Date) }
        attr_accessor :date_of_birth

        # A means of verifying the person's identity.
        sig { returns(Increase::Models::EntityCreateParams::NaturalPerson::Identification) }
        attr_reader :identification

        sig do
          params(
            identification: T.any(Increase::Models::EntityCreateParams::NaturalPerson::Identification, Increase::Internal::AnyHash)
          )
            .void
        end
        attr_writer :identification

        # The person's legal name.
        sig { returns(String) }
        attr_accessor :name

        # The identification method for an individual can only be a passport, driver's
        #   license, or other document if you've confirmed the individual does not have a US
        #   tax id (either a Social Security Number or Individual Taxpayer Identification
        #   Number).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :confirmed_no_us_tax_id

        sig { params(confirmed_no_us_tax_id: T::Boolean).void }
        attr_writer :confirmed_no_us_tax_id

        # Details of the natural person entity to create. Required if `structure` is equal
        #   to `natural_person`. Natural people entities should be submitted with
        #   `social_security_number` or `individual_taxpayer_identification_number`
        #   identification methods.
        sig do
          params(
            address: T.any(Increase::Models::EntityCreateParams::NaturalPerson::Address, Increase::Internal::AnyHash),
            date_of_birth: Date,
            identification: T.any(Increase::Models::EntityCreateParams::NaturalPerson::Identification, Increase::Internal::AnyHash),
            name: String,
            confirmed_no_us_tax_id: T::Boolean
          )
            .returns(T.attached_class)
        end
        def self.new(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::EntityCreateParams::NaturalPerson::Address,
                date_of_birth: Date,
                identification: Increase::Models::EntityCreateParams::NaturalPerson::Identification,
                name: String,
                confirmed_no_us_tax_id: T::Boolean
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          #   the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The second line of the address. This might be the floor or room number.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The individual's physical address. Mail receiving locations like PO Boxes and
          #   PMB's are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(city:, line1:, state:, zip:, line2: nil)
          end

          sig { override.returns({city: String, line1: String, state: String, zip: String, line2: String}) }
          def to_hash
          end
        end

        class Identification < Increase::Internal::Type::BaseModel
          # A method that can be used to verify the individual's identity.
          sig { returns(Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::OrSymbol) }
          attr_accessor :method_

          # An identification number that can be used to verify the individual's identity,
          #   such as a social security number.
          sig { returns(String) }
          attr_accessor :number

          # Information about the United States driver's license used for identification.
          #   Required if `method` is equal to `drivers_license`.
          sig { returns(T.nilable(Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense)) }
          attr_reader :drivers_license

          sig do
            params(
              drivers_license: T.any(
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense,
                Increase::Internal::AnyHash
              )
            )
              .void
          end
          attr_writer :drivers_license

          # Information about the identification document provided. Required if `method` is
          #   equal to `other`.
          sig { returns(T.nilable(Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other)) }
          attr_reader :other

          sig do
            params(
              other: T.any(
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other,
                Increase::Internal::AnyHash
              )
            )
              .void
          end
          attr_writer :other

          # Information about the passport used for identification. Required if `method` is
          #   equal to `passport`.
          sig { returns(T.nilable(Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport)) }
          attr_reader :passport

          sig do
            params(
              passport: T.any(
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport,
                Increase::Internal::AnyHash
              )
            )
              .void
          end
          attr_writer :passport

          # A means of verifying the person's identity.
          sig do
            params(
              method_: Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::OrSymbol,
              number: String,
              drivers_license: T.any(
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense,
                Increase::Internal::AnyHash
              ),
              other: T.any(
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other,
                Increase::Internal::AnyHash
              ),
              passport: T.any(
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport,
                Increase::Internal::AnyHash
              )
            )
              .returns(T.attached_class)
          end
          def self.new(method_:, number:, drivers_license: nil, other: nil, passport: nil)
          end

          sig do
            override
              .returns(
                {
                  method_: Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license: Increase::Models::EntityCreateParams::NaturalPerson::Identification::DriversLicense,
                  other: Increase::Models::EntityCreateParams::NaturalPerson::Identification::Other,
                  passport: Increase::Models::EntityCreateParams::NaturalPerson::Identification::Passport
                }
              )
          end
          def to_hash
          end

          # A method that can be used to verify the individual's identity.
          module Method
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method) }
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
                )
              end

            # A social security number.
            SOCIAL_SECURITY_NUMBER =
              T.let(
                :social_security_number,
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # An individual taxpayer identification number (ITIN).
            INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
              T.let(
                :individual_taxpayer_identification_number,
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # A passport number.
            PASSPORT =
              T.let(
                :passport,
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # A driver's license number.
            DRIVERS_LICENSE =
              T.let(
                :drivers_license,
                Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # Another identifying document.
            OTHER =
              T.let(:other, Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol)

            sig do
              override
                .returns(
                  T::Array[Increase::Models::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol]
                )
            end
            def self.values
            end
          end

          class DriversLicense < Increase::Internal::Type::BaseModel
            # The driver's license's expiration date in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :expiration_date

            # The identifier of the File containing the front of the driver's license.
            sig { returns(String) }
            attr_accessor :file_id

            # The state that issued the provided driver's license.
            sig { returns(String) }
            attr_accessor :state

            # The identifier of the File containing the back of the driver's license.
            sig { returns(T.nilable(String)) }
            attr_reader :back_file_id

            sig { params(back_file_id: String).void }
            attr_writer :back_file_id

            # Information about the United States driver's license used for identification.
            #   Required if `method` is equal to `drivers_license`.
            sig do
              params(expiration_date: Date, file_id: String, state: String, back_file_id: String)
                .returns(T.attached_class)
            end
            def self.new(expiration_date:, file_id:, state:, back_file_id: nil)
            end

            sig do
              override.returns({expiration_date: Date, file_id: String, state: String, back_file_id: String})
            end
            def to_hash
            end
          end

          class Other < Increase::Internal::Type::BaseModel
            # The two-character ISO 3166-1 code representing the country that issued the
            #   document.
            sig { returns(String) }
            attr_accessor :country

            # A description of the document submitted.
            sig { returns(String) }
            attr_accessor :description

            # The identifier of the File containing the front of the document.
            sig { returns(String) }
            attr_accessor :file_id

            # The identifier of the File containing the back of the document. Not every
            #   document has a reverse side.
            sig { returns(T.nilable(String)) }
            attr_reader :back_file_id

            sig { params(back_file_id: String).void }
            attr_writer :back_file_id

            # The document's expiration date in YYYY-MM-DD format.
            sig { returns(T.nilable(Date)) }
            attr_reader :expiration_date

            sig { params(expiration_date: Date).void }
            attr_writer :expiration_date

            # Information about the identification document provided. Required if `method` is
            #   equal to `other`.
            sig do
              params(
                country: String,
                description: String,
                file_id: String,
                back_file_id: String,
                expiration_date: Date
              )
                .returns(T.attached_class)
            end
            def self.new(country:, description:, file_id:, back_file_id: nil, expiration_date: nil)
            end

            sig do
              override
                .returns(
                  {
                    country: String,
                    description: String,
                    file_id: String,
                    back_file_id: String,
                    expiration_date: Date
                  }
                )
            end
            def to_hash
            end
          end

          class Passport < Increase::Internal::Type::BaseModel
            # The country that issued the passport.
            sig { returns(String) }
            attr_accessor :country

            # The passport's expiration date in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :expiration_date

            # The identifier of the File containing the passport.
            sig { returns(String) }
            attr_accessor :file_id

            # Information about the passport used for identification. Required if `method` is
            #   equal to `passport`.
            sig { params(country: String, expiration_date: Date, file_id: String).returns(T.attached_class) }
            def self.new(country:, expiration_date:, file_id:)
            end

            sig { override.returns({country: String, expiration_date: Date, file_id: String}) }
            def to_hash
            end
          end
        end
      end

      class SupplementalDocument < Increase::Internal::Type::BaseModel
        # The identifier of the File containing the document.
        sig { returns(String) }
        attr_accessor :file_id

        sig { params(file_id: String).returns(T.attached_class) }
        def self.new(file_id:)
        end

        sig { override.returns({file_id: String}) }
        def to_hash
        end
      end

      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        # The reference identifier for the third party verification.
        sig { returns(String) }
        attr_accessor :reference

        # The vendor that was used to perform the verification.
        sig { returns(Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor::OrSymbol) }
        attr_accessor :vendor

        # A reference to data stored in a third-party verification service. Your
        #   integration may or may not use this field.
        sig do
          params(
            reference: String,
            vendor: Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor::OrSymbol
          )
            .returns(T.attached_class)
        end
        def self.new(reference:, vendor:)
        end

        sig do
          override
            .returns(
              {reference: String, vendor: Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor::OrSymbol}
            )
        end
        def to_hash
        end

        # The vendor that was used to perform the verification.
        module Vendor
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor::TaggedSymbol) }

          # Alloy. See https://alloy.com for more information.
          ALLOY = T.let(:alloy, Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor::TaggedSymbol)

          # Middesk. See https://middesk.com for more information.
          MIDDESK =
            T.let(:middesk, Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor::TaggedSymbol)

          sig do
            override
              .returns(T::Array[Increase::Models::EntityCreateParams::ThirdPartyVerification::Vendor::TaggedSymbol])
          end
          def self.values
          end
        end
      end

      class Trust < Increase::Internal::Type::BaseModel
        # The trust's physical address. Mail receiving locations like PO Boxes and PMB's
        #   are disallowed.
        sig { returns(Increase::Models::EntityCreateParams::Trust::Address) }
        attr_reader :address

        sig do
          params(address: T.any(Increase::Models::EntityCreateParams::Trust::Address, Increase::Internal::AnyHash))
            .void
        end
        attr_writer :address

        # Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
        #   their own Employer Identification Number. Revocable trusts require information
        #   about the individual `grantor` who created the trust.
        sig { returns(Increase::Models::EntityCreateParams::Trust::Category::OrSymbol) }
        attr_accessor :category

        # The legal name of the trust.
        sig { returns(String) }
        attr_accessor :name

        # The trustees of the trust.
        sig { returns(T::Array[Increase::Models::EntityCreateParams::Trust::Trustee]) }
        attr_accessor :trustees

        # The identifier of the File containing the formation document of the trust.
        sig { returns(T.nilable(String)) }
        attr_reader :formation_document_file_id

        sig { params(formation_document_file_id: String).void }
        attr_writer :formation_document_file_id

        # The two-letter United States Postal Service (USPS) abbreviation for the state in
        #   which the trust was formed.
        sig { returns(T.nilable(String)) }
        attr_reader :formation_state

        sig { params(formation_state: String).void }
        attr_writer :formation_state

        # The grantor of the trust. Required if `category` is equal to `revocable`.
        sig { returns(T.nilable(Increase::Models::EntityCreateParams::Trust::Grantor)) }
        attr_reader :grantor

        sig do
          params(grantor: T.any(Increase::Models::EntityCreateParams::Trust::Grantor, Increase::Internal::AnyHash))
            .void
        end
        attr_writer :grantor

        # The Employer Identification Number (EIN) for the trust. Required if `category`
        #   is equal to `irrevocable`.
        sig { returns(T.nilable(String)) }
        attr_reader :tax_identifier

        sig { params(tax_identifier: String).void }
        attr_writer :tax_identifier

        # Details of the trust entity to create. Required if `structure` is equal to
        #   `trust`.
        sig do
          params(
            address: T.any(Increase::Models::EntityCreateParams::Trust::Address, Increase::Internal::AnyHash),
            category: Increase::Models::EntityCreateParams::Trust::Category::OrSymbol,
            name: String,
            trustees: T::Array[T.any(Increase::Models::EntityCreateParams::Trust::Trustee, Increase::Internal::AnyHash)],
            formation_document_file_id: String,
            formation_state: String,
            grantor: T.any(Increase::Models::EntityCreateParams::Trust::Grantor, Increase::Internal::AnyHash),
            tax_identifier: String
          )
            .returns(T.attached_class)
        end
        def self.new(
          address:,
          category:,
          name:,
          trustees:,
          formation_document_file_id: nil,
          formation_state: nil,
          grantor: nil,
          tax_identifier: nil
        )
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::EntityCreateParams::Trust::Address,
                category: Increase::Models::EntityCreateParams::Trust::Category::OrSymbol,
                name: String,
                trustees: T::Array[Increase::Models::EntityCreateParams::Trust::Trustee],
                formation_document_file_id: String,
                formation_state: String,
                grantor: Increase::Models::EntityCreateParams::Trust::Grantor,
                tax_identifier: String
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          #   the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The second line of the address. This might be the floor or room number.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The trust's physical address. Mail receiving locations like PO Boxes and PMB's
          #   are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(city:, line1:, state:, zip:, line2: nil)
          end

          sig { override.returns({city: String, line1: String, state: String, zip: String, line2: String}) }
          def to_hash
          end
        end

        # Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
        #   their own Employer Identification Number. Revocable trusts require information
        #   about the individual `grantor` who created the trust.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::Trust::Category) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::EntityCreateParams::Trust::Category::TaggedSymbol) }

          # The trust is revocable by the grantor.
          REVOCABLE = T.let(:revocable, Increase::Models::EntityCreateParams::Trust::Category::TaggedSymbol)

          # The trust cannot be revoked.
          IRREVOCABLE = T.let(:irrevocable, Increase::Models::EntityCreateParams::Trust::Category::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::EntityCreateParams::Trust::Category::TaggedSymbol]) }
          def self.values
          end
        end

        class Trustee < Increase::Internal::Type::BaseModel
          # The structure of the trustee.
          sig { returns(Increase::Models::EntityCreateParams::Trust::Trustee::Structure::OrSymbol) }
          attr_accessor :structure

          # Details of the individual trustee. Required when the trustee `structure` is
          #   equal to `individual`.
          sig { returns(T.nilable(Increase::Models::EntityCreateParams::Trust::Trustee::Individual)) }
          attr_reader :individual

          sig do
            params(
              individual: T.any(Increase::Models::EntityCreateParams::Trust::Trustee::Individual, Increase::Internal::AnyHash)
            )
              .void
          end
          attr_writer :individual

          sig do
            params(
              structure: Increase::Models::EntityCreateParams::Trust::Trustee::Structure::OrSymbol,
              individual: T.any(Increase::Models::EntityCreateParams::Trust::Trustee::Individual, Increase::Internal::AnyHash)
            )
              .returns(T.attached_class)
          end
          def self.new(structure:, individual: nil)
          end

          sig do
            override
              .returns(
                {
                  structure: Increase::Models::EntityCreateParams::Trust::Trustee::Structure::OrSymbol,
                  individual: Increase::Models::EntityCreateParams::Trust::Trustee::Individual
                }
              )
          end
          def to_hash
          end

          # The structure of the trustee.
          module Structure
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Structure) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::EntityCreateParams::Trust::Trustee::Structure::TaggedSymbol) }

            # The trustee is an individual.
            INDIVIDUAL =
              T.let(:individual, Increase::Models::EntityCreateParams::Trust::Trustee::Structure::TaggedSymbol)

            sig { override.returns(T::Array[Increase::Models::EntityCreateParams::Trust::Trustee::Structure::TaggedSymbol]) }
            def self.values
            end
          end

          class Individual < Increase::Internal::Type::BaseModel
            # The individual's physical address. Mail receiving locations like PO Boxes and
            #   PMB's are disallowed.
            sig { returns(Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address) }
            attr_reader :address

            sig do
              params(
                address: T.any(
                  Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :address

            # The person's date of birth in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :date_of_birth

            # A means of verifying the person's identity.
            sig { returns(Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification) }
            attr_reader :identification

            sig do
              params(
                identification: T.any(
                  Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :identification

            # The person's legal name.
            sig { returns(String) }
            attr_accessor :name

            # The identification method for an individual can only be a passport, driver's
            #   license, or other document if you've confirmed the individual does not have a US
            #   tax id (either a Social Security Number or Individual Taxpayer Identification
            #   Number).
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :confirmed_no_us_tax_id

            sig { params(confirmed_no_us_tax_id: T::Boolean).void }
            attr_writer :confirmed_no_us_tax_id

            # Details of the individual trustee. Required when the trustee `structure` is
            #   equal to `individual`.
            sig do
              params(
                address: T.any(
                  Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address,
                  Increase::Internal::AnyHash
                ),
                date_of_birth: Date,
                identification: T.any(
                  Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification,
                  Increase::Internal::AnyHash
                ),
                name: String,
                confirmed_no_us_tax_id: T::Boolean
              )
                .returns(T.attached_class)
            end
            def self.new(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
            end

            sig do
              override
                .returns(
                  {
                    address: Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Address,
                    date_of_birth: Date,
                    identification: Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification,
                    name: String,
                    confirmed_no_us_tax_id: T::Boolean
                  }
                )
            end
            def to_hash
            end

            class Address < Increase::Internal::Type::BaseModel
              # The city of the address.
              sig { returns(String) }
              attr_accessor :city

              # The first line of the address. This is usually the street number and street.
              sig { returns(String) }
              attr_accessor :line1

              # The two-letter United States Postal Service (USPS) abbreviation for the state of
              #   the address.
              sig { returns(String) }
              attr_accessor :state

              # The ZIP code of the address.
              sig { returns(String) }
              attr_accessor :zip

              # The second line of the address. This might be the floor or room number.
              sig { returns(T.nilable(String)) }
              attr_reader :line2

              sig { params(line2: String).void }
              attr_writer :line2

              # The individual's physical address. Mail receiving locations like PO Boxes and
              #   PMB's are disallowed.
              sig do
                params(
                  city: String,
                  line1: String,
                  state: String,
                  zip: String,
                  line2: String
                ).returns(T.attached_class)
              end
              def self.new(city:, line1:, state:, zip:, line2: nil)
              end

              sig do
                override.returns({city: String, line1: String, state: String, zip: String, line2: String})
              end
              def to_hash
              end
            end

            class Identification < Increase::Internal::Type::BaseModel
              # A method that can be used to verify the individual's identity.
              sig do
                returns(
                  Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol
                )
              end
              attr_accessor :method_

              # An identification number that can be used to verify the individual's identity,
              #   such as a social security number.
              sig { returns(String) }
              attr_accessor :number

              # Information about the United States driver's license used for identification.
              #   Required if `method` is equal to `drivers_license`.
              sig do
                returns(
                  T.nilable(
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense
                  )
                )
              end
              attr_reader :drivers_license

              sig do
                params(
                  drivers_license: T.any(
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense,
                    Increase::Internal::AnyHash
                  )
                )
                  .void
              end
              attr_writer :drivers_license

              # Information about the identification document provided. Required if `method` is
              #   equal to `other`.
              sig do
                returns(
                  T.nilable(Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other)
                )
              end
              attr_reader :other

              sig do
                params(
                  other: T.any(
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other,
                    Increase::Internal::AnyHash
                  )
                )
                  .void
              end
              attr_writer :other

              # Information about the passport used for identification. Required if `method` is
              #   equal to `passport`.
              sig do
                returns(
                  T.nilable(Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport)
                )
              end
              attr_reader :passport

              sig do
                params(
                  passport: T.any(
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport,
                    Increase::Internal::AnyHash
                  )
                )
                  .void
              end
              attr_writer :passport

              # A means of verifying the person's identity.
              sig do
                params(
                  method_: Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license: T.any(
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense,
                    Increase::Internal::AnyHash
                  ),
                  other: T.any(
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other,
                    Increase::Internal::AnyHash
                  ),
                  passport: T.any(
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport,
                    Increase::Internal::AnyHash
                  )
                )
                  .returns(T.attached_class)
              end
              def self.new(method_:, number:, drivers_license: nil, other: nil, passport: nil)
              end

              sig do
                override
                  .returns(
                    {
                      method_: Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol,
                      number: String,
                      drivers_license: Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense,
                      other: Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Other,
                      passport: Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport
                    }
                  )
              end
              def to_hash
              end

              # A method that can be used to verify the individual's identity.
              module Method
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                    )
                  end

                # A social security number.
                SOCIAL_SECURITY_NUMBER =
                  T.let(
                    :social_security_number,
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # An individual taxpayer identification number (ITIN).
                INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                  T.let(
                    :individual_taxpayer_identification_number,
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # A passport number.
                PASSPORT =
                  T.let(
                    :passport,
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # A driver's license number.
                DRIVERS_LICENSE =
                  T.let(
                    :drivers_license,
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # Another identifying document.
                OTHER =
                  T.let(
                    :other,
                    Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[Increase::Models::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol]
                    )
                end
                def self.values
                end
              end

              class DriversLicense < Increase::Internal::Type::BaseModel
                # The driver's license's expiration date in YYYY-MM-DD format.
                sig { returns(Date) }
                attr_accessor :expiration_date

                # The identifier of the File containing the front of the driver's license.
                sig { returns(String) }
                attr_accessor :file_id

                # The state that issued the provided driver's license.
                sig { returns(String) }
                attr_accessor :state

                # The identifier of the File containing the back of the driver's license.
                sig { returns(T.nilable(String)) }
                attr_reader :back_file_id

                sig { params(back_file_id: String).void }
                attr_writer :back_file_id

                # Information about the United States driver's license used for identification.
                #   Required if `method` is equal to `drivers_license`.
                sig do
                  params(expiration_date: Date, file_id: String, state: String, back_file_id: String)
                    .returns(T.attached_class)
                end
                def self.new(expiration_date:, file_id:, state:, back_file_id: nil)
                end

                sig do
                  override.returns(
                    {
                      expiration_date: Date,
                      file_id: String,
                      state: String,
                      back_file_id: String
                    }
                  )
                end
                def to_hash
                end
              end

              class Other < Increase::Internal::Type::BaseModel
                # The two-character ISO 3166-1 code representing the country that issued the
                #   document.
                sig { returns(String) }
                attr_accessor :country

                # A description of the document submitted.
                sig { returns(String) }
                attr_accessor :description

                # The identifier of the File containing the front of the document.
                sig { returns(String) }
                attr_accessor :file_id

                # The identifier of the File containing the back of the document. Not every
                #   document has a reverse side.
                sig { returns(T.nilable(String)) }
                attr_reader :back_file_id

                sig { params(back_file_id: String).void }
                attr_writer :back_file_id

                # The document's expiration date in YYYY-MM-DD format.
                sig { returns(T.nilable(Date)) }
                attr_reader :expiration_date

                sig { params(expiration_date: Date).void }
                attr_writer :expiration_date

                # Information about the identification document provided. Required if `method` is
                #   equal to `other`.
                sig do
                  params(
                    country: String,
                    description: String,
                    file_id: String,
                    back_file_id: String,
                    expiration_date: Date
                  )
                    .returns(T.attached_class)
                end
                def self.new(country:, description:, file_id:, back_file_id: nil, expiration_date: nil)
                end

                sig do
                  override
                    .returns(
                      {
                        country: String,
                        description: String,
                        file_id: String,
                        back_file_id: String,
                        expiration_date: Date
                      }
                    )
                end
                def to_hash
                end
              end

              class Passport < Increase::Internal::Type::BaseModel
                # The country that issued the passport.
                sig { returns(String) }
                attr_accessor :country

                # The passport's expiration date in YYYY-MM-DD format.
                sig { returns(Date) }
                attr_accessor :expiration_date

                # The identifier of the File containing the passport.
                sig { returns(String) }
                attr_accessor :file_id

                # Information about the passport used for identification. Required if `method` is
                #   equal to `passport`.
                sig do
                  params(country: String, expiration_date: Date, file_id: String).returns(T.attached_class)
                end
                def self.new(country:, expiration_date:, file_id:)
                end

                sig { override.returns({country: String, expiration_date: Date, file_id: String}) }
                def to_hash
                end
              end
            end
          end
        end

        class Grantor < Increase::Internal::Type::BaseModel
          # The individual's physical address. Mail receiving locations like PO Boxes and
          #   PMB's are disallowed.
          sig { returns(Increase::Models::EntityCreateParams::Trust::Grantor::Address) }
          attr_reader :address

          sig do
            params(
              address: T.any(Increase::Models::EntityCreateParams::Trust::Grantor::Address, Increase::Internal::AnyHash)
            )
              .void
          end
          attr_writer :address

          # The person's date of birth in YYYY-MM-DD format.
          sig { returns(Date) }
          attr_accessor :date_of_birth

          # A means of verifying the person's identity.
          sig { returns(Increase::Models::EntityCreateParams::Trust::Grantor::Identification) }
          attr_reader :identification

          sig do
            params(
              identification: T.any(Increase::Models::EntityCreateParams::Trust::Grantor::Identification, Increase::Internal::AnyHash)
            )
              .void
          end
          attr_writer :identification

          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          # The identification method for an individual can only be a passport, driver's
          #   license, or other document if you've confirmed the individual does not have a US
          #   tax id (either a Social Security Number or Individual Taxpayer Identification
          #   Number).
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :confirmed_no_us_tax_id

          sig { params(confirmed_no_us_tax_id: T::Boolean).void }
          attr_writer :confirmed_no_us_tax_id

          # The grantor of the trust. Required if `category` is equal to `revocable`.
          sig do
            params(
              address: T.any(Increase::Models::EntityCreateParams::Trust::Grantor::Address, Increase::Internal::AnyHash),
              date_of_birth: Date,
              identification: T.any(Increase::Models::EntityCreateParams::Trust::Grantor::Identification, Increase::Internal::AnyHash),
              name: String,
              confirmed_no_us_tax_id: T::Boolean
            )
              .returns(T.attached_class)
          end
          def self.new(address:, date_of_birth:, identification:, name:, confirmed_no_us_tax_id: nil)
          end

          sig do
            override
              .returns(
                {
                  address: Increase::Models::EntityCreateParams::Trust::Grantor::Address,
                  date_of_birth: Date,
                  identification: Increase::Models::EntityCreateParams::Trust::Grantor::Identification,
                  name: String,
                  confirmed_no_us_tax_id: T::Boolean
                }
              )
          end
          def to_hash
          end

          class Address < Increase::Internal::Type::BaseModel
            # The city of the address.
            sig { returns(String) }
            attr_accessor :city

            # The first line of the address. This is usually the street number and street.
            sig { returns(String) }
            attr_accessor :line1

            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            #   the address.
            sig { returns(String) }
            attr_accessor :state

            # The ZIP code of the address.
            sig { returns(String) }
            attr_accessor :zip

            # The second line of the address. This might be the floor or room number.
            sig { returns(T.nilable(String)) }
            attr_reader :line2

            sig { params(line2: String).void }
            attr_writer :line2

            # The individual's physical address. Mail receiving locations like PO Boxes and
            #   PMB's are disallowed.
            sig do
              params(
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              ).returns(T.attached_class)
            end
            def self.new(city:, line1:, state:, zip:, line2: nil)
            end

            sig { override.returns({city: String, line1: String, state: String, zip: String, line2: String}) }
            def to_hash
            end
          end

          class Identification < Increase::Internal::Type::BaseModel
            # A method that can be used to verify the individual's identity.
            sig { returns(Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::OrSymbol) }
            attr_accessor :method_

            # An identification number that can be used to verify the individual's identity,
            #   such as a social security number.
            sig { returns(String) }
            attr_accessor :number

            # Information about the United States driver's license used for identification.
            #   Required if `method` is equal to `drivers_license`.
            sig { returns(T.nilable(Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense)) }
            attr_reader :drivers_license

            sig do
              params(
                drivers_license: T.any(
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :drivers_license

            # Information about the identification document provided. Required if `method` is
            #   equal to `other`.
            sig { returns(T.nilable(Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other)) }
            attr_reader :other

            sig do
              params(
                other: T.any(
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :other

            # Information about the passport used for identification. Required if `method` is
            #   equal to `passport`.
            sig { returns(T.nilable(Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport)) }
            attr_reader :passport

            sig do
              params(
                passport: T.any(
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :passport

            # A means of verifying the person's identity.
            sig do
              params(
                method_: Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::OrSymbol,
                number: String,
                drivers_license: T.any(
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense,
                  Increase::Internal::AnyHash
                ),
                other: T.any(
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other,
                  Increase::Internal::AnyHash
                ),
                passport: T.any(
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport,
                  Increase::Internal::AnyHash
                )
              )
                .returns(T.attached_class)
            end
            def self.new(method_:, number:, drivers_license: nil, other: nil, passport: nil)
            end

            sig do
              override
                .returns(
                  {
                    method_: Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::OrSymbol,
                    number: String,
                    drivers_license: Increase::Models::EntityCreateParams::Trust::Grantor::Identification::DriversLicense,
                    other: Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Other,
                    passport: Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Passport
                  }
                )
            end
            def to_hash
            end

            # A method that can be used to verify the individual's identity.
            module Method
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method) }
              OrSymbol =
                T.type_alias do
                  T.any(
                    Symbol,
                    String,
                    Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                  )
                end

              # A social security number.
              SOCIAL_SECURITY_NUMBER =
                T.let(
                  :social_security_number,
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # An individual taxpayer identification number (ITIN).
              INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                T.let(
                  :individual_taxpayer_identification_number,
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # A passport number.
              PASSPORT =
                T.let(
                  :passport,
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # A driver's license number.
              DRIVERS_LICENSE =
                T.let(
                  :drivers_license,
                  Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # Another identifying document.
              OTHER =
                T.let(:other, Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol)

              sig do
                override
                  .returns(
                    T::Array[Increase::Models::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol]
                  )
              end
              def self.values
              end
            end

            class DriversLicense < Increase::Internal::Type::BaseModel
              # The driver's license's expiration date in YYYY-MM-DD format.
              sig { returns(Date) }
              attr_accessor :expiration_date

              # The identifier of the File containing the front of the driver's license.
              sig { returns(String) }
              attr_accessor :file_id

              # The state that issued the provided driver's license.
              sig { returns(String) }
              attr_accessor :state

              # The identifier of the File containing the back of the driver's license.
              sig { returns(T.nilable(String)) }
              attr_reader :back_file_id

              sig { params(back_file_id: String).void }
              attr_writer :back_file_id

              # Information about the United States driver's license used for identification.
              #   Required if `method` is equal to `drivers_license`.
              sig do
                params(expiration_date: Date, file_id: String, state: String, back_file_id: String)
                  .returns(T.attached_class)
              end
              def self.new(expiration_date:, file_id:, state:, back_file_id: nil)
              end

              sig do
                override.returns(
                  {
                    expiration_date: Date,
                    file_id: String,
                    state: String,
                    back_file_id: String
                  }
                )
              end
              def to_hash
              end
            end

            class Other < Increase::Internal::Type::BaseModel
              # The two-character ISO 3166-1 code representing the country that issued the
              #   document.
              sig { returns(String) }
              attr_accessor :country

              # A description of the document submitted.
              sig { returns(String) }
              attr_accessor :description

              # The identifier of the File containing the front of the document.
              sig { returns(String) }
              attr_accessor :file_id

              # The identifier of the File containing the back of the document. Not every
              #   document has a reverse side.
              sig { returns(T.nilable(String)) }
              attr_reader :back_file_id

              sig { params(back_file_id: String).void }
              attr_writer :back_file_id

              # The document's expiration date in YYYY-MM-DD format.
              sig { returns(T.nilable(Date)) }
              attr_reader :expiration_date

              sig { params(expiration_date: Date).void }
              attr_writer :expiration_date

              # Information about the identification document provided. Required if `method` is
              #   equal to `other`.
              sig do
                params(
                  country: String,
                  description: String,
                  file_id: String,
                  back_file_id: String,
                  expiration_date: Date
                )
                  .returns(T.attached_class)
              end
              def self.new(country:, description:, file_id:, back_file_id: nil, expiration_date: nil)
              end

              sig do
                override
                  .returns(
                    {
                      country: String,
                      description: String,
                      file_id: String,
                      back_file_id: String,
                      expiration_date: Date
                    }
                  )
              end
              def to_hash
              end
            end

            class Passport < Increase::Internal::Type::BaseModel
              # The country that issued the passport.
              sig { returns(String) }
              attr_accessor :country

              # The passport's expiration date in YYYY-MM-DD format.
              sig { returns(Date) }
              attr_accessor :expiration_date

              # The identifier of the File containing the passport.
              sig { returns(String) }
              attr_accessor :file_id

              # Information about the passport used for identification. Required if `method` is
              #   equal to `passport`.
              sig do
                params(country: String, expiration_date: Date, file_id: String).returns(T.attached_class)
              end
              def self.new(country:, expiration_date:, file_id:)
              end

              sig { override.returns({country: String, expiration_date: Date, file_id: String}) }
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
