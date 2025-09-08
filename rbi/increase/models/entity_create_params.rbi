# typed: strong

module Increase
  module Models
    class EntityCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::EntityCreateParams, Increase::Internal::AnyHash)
        end

      # The type of Entity to create.
      sig { returns(Increase::EntityCreateParams::Structure::OrSymbol) }
      attr_accessor :structure

      # Details of the corporation entity to create. Required if `structure` is equal to
      # `corporation`.
      sig { returns(T.nilable(Increase::EntityCreateParams::Corporation)) }
      attr_reader :corporation

      sig do
        params(
          corporation: Increase::EntityCreateParams::Corporation::OrHash
        ).void
      end
      attr_writer :corporation

      # The description you choose to give the entity.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Details of the Government Authority entity to create. Required if `structure` is
      # equal to `government_authority`.
      sig do
        returns(T.nilable(Increase::EntityCreateParams::GovernmentAuthority))
      end
      attr_reader :government_authority

      sig do
        params(
          government_authority:
            Increase::EntityCreateParams::GovernmentAuthority::OrHash
        ).void
      end
      attr_writer :government_authority

      # Details of the joint entity to create. Required if `structure` is equal to
      # `joint`.
      sig { returns(T.nilable(Increase::EntityCreateParams::Joint)) }
      attr_reader :joint

      sig { params(joint: Increase::EntityCreateParams::Joint::OrHash).void }
      attr_writer :joint

      # Details of the natural person entity to create. Required if `structure` is equal
      # to `natural_person`. Natural people entities should be submitted with
      # `social_security_number` or `individual_taxpayer_identification_number`
      # identification methods.
      sig { returns(T.nilable(Increase::EntityCreateParams::NaturalPerson)) }
      attr_reader :natural_person

      sig do
        params(
          natural_person: Increase::EntityCreateParams::NaturalPerson::OrHash
        ).void
      end
      attr_writer :natural_person

      # An assessment of the entity’s potential risk of involvement in financial crimes,
      # such as money laundering.
      sig { returns(T.nilable(Increase::EntityCreateParams::RiskRating)) }
      attr_reader :risk_rating

      sig do
        params(
          risk_rating: Increase::EntityCreateParams::RiskRating::OrHash
        ).void
      end
      attr_writer :risk_rating

      # Additional documentation associated with the entity.
      sig do
        returns(
          T.nilable(
            T::Array[Increase::EntityCreateParams::SupplementalDocument]
          )
        )
      end
      attr_reader :supplemental_documents

      sig do
        params(
          supplemental_documents:
            T::Array[Increase::EntityCreateParams::SupplementalDocument::OrHash]
        ).void
      end
      attr_writer :supplemental_documents

      # If you are using a third-party service for identity verification, you can use
      # this field to associate this Entity with the identifier that represents them in
      # that service.
      sig do
        returns(T.nilable(Increase::EntityCreateParams::ThirdPartyVerification))
      end
      attr_reader :third_party_verification

      sig do
        params(
          third_party_verification:
            Increase::EntityCreateParams::ThirdPartyVerification::OrHash
        ).void
      end
      attr_writer :third_party_verification

      # Details of the trust entity to create. Required if `structure` is equal to
      # `trust`.
      sig { returns(T.nilable(Increase::EntityCreateParams::Trust)) }
      attr_reader :trust

      sig { params(trust: Increase::EntityCreateParams::Trust::OrHash).void }
      attr_writer :trust

      sig do
        params(
          structure: Increase::EntityCreateParams::Structure::OrSymbol,
          corporation: Increase::EntityCreateParams::Corporation::OrHash,
          description: String,
          government_authority:
            Increase::EntityCreateParams::GovernmentAuthority::OrHash,
          joint: Increase::EntityCreateParams::Joint::OrHash,
          natural_person: Increase::EntityCreateParams::NaturalPerson::OrHash,
          risk_rating: Increase::EntityCreateParams::RiskRating::OrHash,
          supplemental_documents:
            T::Array[
              Increase::EntityCreateParams::SupplementalDocument::OrHash
            ],
          third_party_verification:
            Increase::EntityCreateParams::ThirdPartyVerification::OrHash,
          trust: Increase::EntityCreateParams::Trust::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The type of Entity to create.
        structure:,
        # Details of the corporation entity to create. Required if `structure` is equal to
        # `corporation`.
        corporation: nil,
        # The description you choose to give the entity.
        description: nil,
        # Details of the Government Authority entity to create. Required if `structure` is
        # equal to `government_authority`.
        government_authority: nil,
        # Details of the joint entity to create. Required if `structure` is equal to
        # `joint`.
        joint: nil,
        # Details of the natural person entity to create. Required if `structure` is equal
        # to `natural_person`. Natural people entities should be submitted with
        # `social_security_number` or `individual_taxpayer_identification_number`
        # identification methods.
        natural_person: nil,
        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        risk_rating: nil,
        # Additional documentation associated with the entity.
        supplemental_documents: nil,
        # If you are using a third-party service for identity verification, you can use
        # this field to associate this Entity with the identifier that represents them in
        # that service.
        third_party_verification: nil,
        # Details of the trust entity to create. Required if `structure` is equal to
        # `trust`.
        trust: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            structure: Increase::EntityCreateParams::Structure::OrSymbol,
            corporation: Increase::EntityCreateParams::Corporation,
            description: String,
            government_authority:
              Increase::EntityCreateParams::GovernmentAuthority,
            joint: Increase::EntityCreateParams::Joint,
            natural_person: Increase::EntityCreateParams::NaturalPerson,
            risk_rating: Increase::EntityCreateParams::RiskRating,
            supplemental_documents:
              T::Array[Increase::EntityCreateParams::SupplementalDocument],
            third_party_verification:
              Increase::EntityCreateParams::ThirdPartyVerification,
            trust: Increase::EntityCreateParams::Trust,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The type of Entity to create.
      module Structure
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::EntityCreateParams::Structure)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A corporation.
        CORPORATION =
          T.let(
            :corporation,
            Increase::EntityCreateParams::Structure::TaggedSymbol
          )

        # An individual person.
        NATURAL_PERSON =
          T.let(
            :natural_person,
            Increase::EntityCreateParams::Structure::TaggedSymbol
          )

        # Multiple individual people.
        JOINT =
          T.let(:joint, Increase::EntityCreateParams::Structure::TaggedSymbol)

        # A trust.
        TRUST =
          T.let(:trust, Increase::EntityCreateParams::Structure::TaggedSymbol)

        # A government authority.
        GOVERNMENT_AUTHORITY =
          T.let(
            :government_authority,
            Increase::EntityCreateParams::Structure::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::EntityCreateParams::Structure::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Corporation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityCreateParams::Corporation,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig { returns(Increase::EntityCreateParams::Corporation::Address) }
        attr_reader :address

        sig do
          params(
            address: Increase::EntityCreateParams::Corporation::Address::OrHash
          ).void
        end
        attr_writer :address

        # The identifying details of each person who owns 25% or more of the business and
        # one control person, like the CEO, CFO, or other executive. You can submit
        # between 1 and 5 people to this list.
        sig do
          returns(
            T::Array[Increase::EntityCreateParams::Corporation::BeneficialOwner]
          )
        end
        attr_accessor :beneficial_owners

        # The legal name of the corporation.
        sig { returns(String) }
        attr_accessor :name

        # The Employer Identification Number (EIN) for the corporation.
        sig { returns(String) }
        attr_accessor :tax_identifier

        # If the entity is exempt from the requirement to submit beneficial owners,
        # provide the justification. If a reason is provided, you do not need to submit a
        # list of beneficial owners.
        sig do
          returns(
            T.nilable(
              Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason::OrSymbol
            )
          )
        end
        attr_reader :beneficial_ownership_exemption_reason

        sig do
          params(
            beneficial_ownership_exemption_reason:
              Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason::OrSymbol
          ).void
        end
        attr_writer :beneficial_ownership_exemption_reason

        # The two-letter United States Postal Service (USPS) abbreviation for the
        # corporation's state of incorporation.
        sig { returns(T.nilable(String)) }
        attr_reader :incorporation_state

        sig { params(incorporation_state: String).void }
        attr_writer :incorporation_state

        # The North American Industry Classification System (NAICS) code for the
        # corporation's primary line of business. This is a number, like `5132` for
        # `Software Publishers`. A full list of classification codes is available
        # [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
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
        # `corporation`.
        sig do
          params(
            address: Increase::EntityCreateParams::Corporation::Address::OrHash,
            beneficial_owners:
              T::Array[
                Increase::EntityCreateParams::Corporation::BeneficialOwner::OrHash
              ],
            name: String,
            tax_identifier: String,
            beneficial_ownership_exemption_reason:
              Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason::OrSymbol,
            incorporation_state: String,
            industry_code: String,
            website: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address:,
          # The identifying details of each person who owns 25% or more of the business and
          # one control person, like the CEO, CFO, or other executive. You can submit
          # between 1 and 5 people to this list.
          beneficial_owners:,
          # The legal name of the corporation.
          name:,
          # The Employer Identification Number (EIN) for the corporation.
          tax_identifier:,
          # If the entity is exempt from the requirement to submit beneficial owners,
          # provide the justification. If a reason is provided, you do not need to submit a
          # list of beneficial owners.
          beneficial_ownership_exemption_reason: nil,
          # The two-letter United States Postal Service (USPS) abbreviation for the
          # corporation's state of incorporation.
          incorporation_state: nil,
          # The North American Industry Classification System (NAICS) code for the
          # corporation's primary line of business. This is a number, like `5132` for
          # `Software Publishers`. A full list of classification codes is available
          # [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
          industry_code: nil,
          # The website of the corporation.
          website: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityCreateParams::Corporation::Address,
              beneficial_owners:
                T::Array[
                  Increase::EntityCreateParams::Corporation::BeneficialOwner
                ],
              name: String,
              tax_identifier: String,
              beneficial_ownership_exemption_reason:
                Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason::OrSymbol,
              incorporation_state: String,
              industry_code: String,
              website: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::Corporation::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
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
          # are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the address.
            city:,
            # The first line of the address. This is usually the street number and street.
            line1:,
            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
            state:,
            # The ZIP code of the address.
            zip:,
            # The second line of the address. This might be the floor or room number.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end

        class BeneficialOwner < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::Corporation::BeneficialOwner,
                Increase::Internal::AnyHash
              )
            end

          # Personal details for the beneficial owner.
          sig do
            returns(
              Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual
            )
          end
          attr_reader :individual

          sig do
            params(
              individual:
                Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::OrHash
            ).void
          end
          attr_writer :individual

          # Why this person is considered a beneficial owner of the entity. At least one
          # option is required, if a person is both a control person and owner, submit an
          # array containing both.
          sig do
            returns(
              T::Array[
                Increase::EntityCreateParams::Corporation::BeneficialOwner::Prong::OrSymbol
              ]
            )
          end
          attr_accessor :prongs

          # This person's role or title within the entity.
          sig { returns(T.nilable(String)) }
          attr_reader :company_title

          sig { params(company_title: String).void }
          attr_writer :company_title

          sig do
            params(
              individual:
                Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::OrHash,
              prongs:
                T::Array[
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Prong::OrSymbol
                ],
              company_title: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Personal details for the beneficial owner.
            individual:,
            # Why this person is considered a beneficial owner of the entity. At least one
            # option is required, if a person is both a control person and owner, submit an
            # array containing both.
            prongs:,
            # This person's role or title within the entity.
            company_title: nil
          )
          end

          sig do
            override.returns(
              {
                individual:
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual,
                prongs:
                  T::Array[
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Prong::OrSymbol
                  ],
                company_title: String
              }
            )
          end
          def to_hash
          end

          class Individual < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual,
                  Increase::Internal::AnyHash
                )
              end

            # The individual's physical address. Mail receiving locations like PO Boxes and
            # PMB's are disallowed.
            sig do
              returns(
                Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address
              )
            end
            attr_reader :address

            sig do
              params(
                address:
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address::OrHash
              ).void
            end
            attr_writer :address

            # The person's date of birth in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :date_of_birth

            # A means of verifying the person's identity.
            sig do
              returns(
                Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification
              )
            end
            attr_reader :identification

            sig do
              params(
                identification:
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::OrHash
              ).void
            end
            attr_writer :identification

            # The person's legal name.
            sig { returns(String) }
            attr_accessor :name

            # The identification method for an individual can only be a passport, driver's
            # license, or other document if you've confirmed the individual does not have a US
            # tax id (either a Social Security Number or Individual Taxpayer Identification
            # Number).
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :confirmed_no_us_tax_id

            sig { params(confirmed_no_us_tax_id: T::Boolean).void }
            attr_writer :confirmed_no_us_tax_id

            # Personal details for the beneficial owner.
            sig do
              params(
                address:
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address::OrHash,
                date_of_birth: Date,
                identification:
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::OrHash,
                name: String,
                confirmed_no_us_tax_id: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(
              # The individual's physical address. Mail receiving locations like PO Boxes and
              # PMB's are disallowed.
              address:,
              # The person's date of birth in YYYY-MM-DD format.
              date_of_birth:,
              # A means of verifying the person's identity.
              identification:,
              # The person's legal name.
              name:,
              # The identification method for an individual can only be a passport, driver's
              # license, or other document if you've confirmed the individual does not have a US
              # tax id (either a Social Security Number or Individual Taxpayer Identification
              # Number).
              confirmed_no_us_tax_id: nil
            )
            end

            sig do
              override.returns(
                {
                  address:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address,
                  date_of_birth: Date,
                  identification:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification,
                  name: String,
                  confirmed_no_us_tax_id: T::Boolean
                }
              )
            end
            def to_hash
            end

            class Address < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Address,
                    Increase::Internal::AnyHash
                  )
                end

              # The city, district, town, or village of the address.
              sig { returns(String) }
              attr_accessor :city

              # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
              sig { returns(String) }
              attr_accessor :country

              # The first line of the address. This is usually the street number and street.
              sig { returns(String) }
              attr_accessor :line1

              # The second line of the address. This might be the floor or room number.
              sig { returns(T.nilable(String)) }
              attr_reader :line2

              sig { params(line2: String).void }
              attr_writer :line2

              # The two-letter United States Postal Service (USPS) abbreviation for the US
              # state, province, or region of the address. Required in certain countries.
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
              # PMB's are disallowed.
              sig do
                params(
                  city: String,
                  country: String,
                  line1: String,
                  line2: String,
                  state: String,
                  zip: String
                ).returns(T.attached_class)
              end
              def self.new(
                # The city, district, town, or village of the address.
                city:,
                # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
                country:,
                # The first line of the address. This is usually the street number and street.
                line1:,
                # The second line of the address. This might be the floor or room number.
                line2: nil,
                # The two-letter United States Postal Service (USPS) abbreviation for the US
                # state, province, or region of the address. Required in certain countries.
                state: nil,
                # The ZIP or postal code of the address. Required in certain countries.
                zip: nil
              )
              end

              sig do
                override.returns(
                  {
                    city: String,
                    country: String,
                    line1: String,
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
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification,
                    Increase::Internal::AnyHash
                  )
                end

              # A method that can be used to verify the individual's identity.
              sig do
                returns(
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::OrSymbol
                )
              end
              attr_accessor :method_

              # An identification number that can be used to verify the individual's identity,
              # such as a social security number.
              sig { returns(String) }
              attr_accessor :number

              # Information about the United States driver's license used for identification.
              # Required if `method` is equal to `drivers_license`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense
                  )
                )
              end
              attr_reader :drivers_license

              sig do
                params(
                  drivers_license:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense::OrHash
                ).void
              end
              attr_writer :drivers_license

              # Information about the identification document provided. Required if `method` is
              # equal to `other`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other
                  )
                )
              end
              attr_reader :other

              sig do
                params(
                  other:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other::OrHash
                ).void
              end
              attr_writer :other

              # Information about the passport used for identification. Required if `method` is
              # equal to `passport`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport
                  )
                )
              end
              attr_reader :passport

              sig do
                params(
                  passport:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport::OrHash
                ).void
              end
              attr_writer :passport

              # A means of verifying the person's identity.
              sig do
                params(
                  method_:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense::OrHash,
                  other:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other::OrHash,
                  passport:
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # A method that can be used to verify the individual's identity.
                method_:,
                # An identification number that can be used to verify the individual's identity,
                # such as a social security number.
                number:,
                # Information about the United States driver's license used for identification.
                # Required if `method` is equal to `drivers_license`.
                drivers_license: nil,
                # Information about the identification document provided. Required if `method` is
                # equal to `other`.
                other: nil,
                # Information about the passport used for identification. Required if `method` is
                # equal to `passport`.
                passport: nil
              )
              end

              sig do
                override.returns(
                  {
                    method_:
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::OrSymbol,
                    number: String,
                    drivers_license:
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense,
                    other:
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other,
                    passport:
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport
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
                    T.all(
                      Symbol,
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # A social security number.
                SOCIAL_SECURITY_NUMBER =
                  T.let(
                    :social_security_number,
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # An individual taxpayer identification number (ITIN).
                INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                  T.let(
                    :individual_taxpayer_identification_number,
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # A passport number.
                PASSPORT =
                  T.let(
                    :passport,
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # A driver's license number.
                DRIVERS_LICENSE =
                  T.let(
                    :drivers_license,
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # Another identifying document.
                OTHER =
                  T.let(
                    :other,
                    Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class DriversLicense < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::DriversLicense,
                      Increase::Internal::AnyHash
                    )
                  end

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
                # Required if `method` is equal to `drivers_license`.
                sig do
                  params(
                    expiration_date: Date,
                    file_id: String,
                    state: String,
                    back_file_id: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The driver's license's expiration date in YYYY-MM-DD format.
                  expiration_date:,
                  # The identifier of the File containing the front of the driver's license.
                  file_id:,
                  # The state that issued the provided driver's license.
                  state:,
                  # The identifier of the File containing the back of the driver's license.
                  back_file_id: nil
                )
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
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Other,
                      Increase::Internal::AnyHash
                    )
                  end

                # The two-character ISO 3166-1 code representing the country that issued the
                # document (e.g., `US`).
                sig { returns(String) }
                attr_accessor :country

                # A description of the document submitted.
                sig { returns(String) }
                attr_accessor :description

                # The identifier of the File containing the front of the document.
                sig { returns(String) }
                attr_accessor :file_id

                # The identifier of the File containing the back of the document. Not every
                # document has a reverse side.
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
                # equal to `other`.
                sig do
                  params(
                    country: String,
                    description: String,
                    file_id: String,
                    back_file_id: String,
                    expiration_date: Date
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The two-character ISO 3166-1 code representing the country that issued the
                  # document (e.g., `US`).
                  country:,
                  # A description of the document submitted.
                  description:,
                  # The identifier of the File containing the front of the document.
                  file_id:,
                  # The identifier of the File containing the back of the document. Not every
                  # document has a reverse side.
                  back_file_id: nil,
                  # The document's expiration date in YYYY-MM-DD format.
                  expiration_date: nil
                )
                end

                sig do
                  override.returns(
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
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::EntityCreateParams::Corporation::BeneficialOwner::Individual::Identification::Passport,
                      Increase::Internal::AnyHash
                    )
                  end

                # The two-character ISO 3166-1 code representing the country that issued the
                # document (e.g., `US`).
                sig { returns(String) }
                attr_accessor :country

                # The passport's expiration date in YYYY-MM-DD format.
                sig { returns(Date) }
                attr_accessor :expiration_date

                # The identifier of the File containing the passport.
                sig { returns(String) }
                attr_accessor :file_id

                # Information about the passport used for identification. Required if `method` is
                # equal to `passport`.
                sig do
                  params(
                    country: String,
                    expiration_date: Date,
                    file_id: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The two-character ISO 3166-1 code representing the country that issued the
                  # document (e.g., `US`).
                  country:,
                  # The passport's expiration date in YYYY-MM-DD format.
                  expiration_date:,
                  # The identifier of the File containing the passport.
                  file_id:
                )
                end

                sig do
                  override.returns(
                    { country: String, expiration_date: Date, file_id: String }
                  )
                end
                def to_hash
                end
              end
            end
          end

          module Prong
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Prong
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A person with 25% or greater direct or indirect ownership of the entity.
            OWNERSHIP =
              T.let(
                :ownership,
                Increase::EntityCreateParams::Corporation::BeneficialOwner::Prong::TaggedSymbol
              )

            # A person who manages, directs, or has significant control of the entity.
            CONTROL =
              T.let(
                :control,
                Increase::EntityCreateParams::Corporation::BeneficialOwner::Prong::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::EntityCreateParams::Corporation::BeneficialOwner::Prong::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # If the entity is exempt from the requirement to submit beneficial owners,
        # provide the justification. If a reason is provided, you do not need to submit a
        # list of beneficial owners.
        module BeneficialOwnershipExemptionReason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A regulated financial institution.
          REGULATED_FINANCIAL_INSTITUTION =
            T.let(
              :regulated_financial_institution,
              Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason::TaggedSymbol
            )

          # A publicly traded company.
          PUBLICLY_TRADED_COMPANY =
            T.let(
              :publicly_traded_company,
              Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason::TaggedSymbol
            )

          # A public entity acting on behalf of the federal or a state government.
          PUBLIC_ENTITY =
            T.let(
              :public_entity,
              Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityCreateParams::Corporation::BeneficialOwnershipExemptionReason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityCreateParams::GovernmentAuthority,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig do
          returns(Increase::EntityCreateParams::GovernmentAuthority::Address)
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::EntityCreateParams::GovernmentAuthority::Address::OrHash
          ).void
        end
        attr_writer :address

        # The identifying details of authorized officials acting on the entity's behalf.
        sig do
          returns(
            T::Array[
              Increase::EntityCreateParams::GovernmentAuthority::AuthorizedPerson
            ]
          )
        end
        attr_accessor :authorized_persons

        # The category of the government authority.
        sig do
          returns(
            Increase::EntityCreateParams::GovernmentAuthority::Category::OrSymbol
          )
        end
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
        # equal to `government_authority`.
        sig do
          params(
            address:
              Increase::EntityCreateParams::GovernmentAuthority::Address::OrHash,
            authorized_persons:
              T::Array[
                Increase::EntityCreateParams::GovernmentAuthority::AuthorizedPerson::OrHash
              ],
            category:
              Increase::EntityCreateParams::GovernmentAuthority::Category::OrSymbol,
            name: String,
            tax_identifier: String,
            website: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address:,
          # The identifying details of authorized officials acting on the entity's behalf.
          authorized_persons:,
          # The category of the government authority.
          category:,
          # The legal name of the government authority.
          name:,
          # The Employer Identification Number (EIN) for the government authority.
          tax_identifier:,
          # The website of the government authority.
          website: nil
        )
        end

        sig do
          override.returns(
            {
              address:
                Increase::EntityCreateParams::GovernmentAuthority::Address,
              authorized_persons:
                T::Array[
                  Increase::EntityCreateParams::GovernmentAuthority::AuthorizedPerson
                ],
              category:
                Increase::EntityCreateParams::GovernmentAuthority::Category::OrSymbol,
              name: String,
              tax_identifier: String,
              website: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::GovernmentAuthority::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
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
          # are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the address.
            city:,
            # The first line of the address. This is usually the street number and street.
            line1:,
            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
            state:,
            # The ZIP code of the address.
            zip:,
            # The second line of the address. This might be the floor or room number.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end

        class AuthorizedPerson < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::GovernmentAuthority::AuthorizedPerson,
                Increase::Internal::AnyHash
              )
            end

          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          sig { params(name: String).returns(T.attached_class) }
          def self.new(
            # The person's legal name.
            name:
          )
          end

          sig { override.returns({ name: String }) }
          def to_hash
          end
        end

        # The category of the government authority.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::EntityCreateParams::GovernmentAuthority::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A municipality.
          MUNICIPALITY =
            T.let(
              :municipality,
              Increase::EntityCreateParams::GovernmentAuthority::Category::TaggedSymbol
            )

          # A state agency.
          STATE_AGENCY =
            T.let(
              :state_agency,
              Increase::EntityCreateParams::GovernmentAuthority::Category::TaggedSymbol
            )

          # A state government.
          STATE_GOVERNMENT =
            T.let(
              :state_government,
              Increase::EntityCreateParams::GovernmentAuthority::Category::TaggedSymbol
            )

          # A federal agency.
          FEDERAL_AGENCY =
            T.let(
              :federal_agency,
              Increase::EntityCreateParams::GovernmentAuthority::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityCreateParams::GovernmentAuthority::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Joint < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityCreateParams::Joint,
              Increase::Internal::AnyHash
            )
          end

        # The two individuals that share control of the entity.
        sig do
          returns(T::Array[Increase::EntityCreateParams::Joint::Individual])
        end
        attr_accessor :individuals

        # Details of the joint entity to create. Required if `structure` is equal to
        # `joint`.
        sig do
          params(
            individuals:
              T::Array[Increase::EntityCreateParams::Joint::Individual::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # The two individuals that share control of the entity.
          individuals:
        )
        end

        sig do
          override.returns(
            {
              individuals:
                T::Array[Increase::EntityCreateParams::Joint::Individual]
            }
          )
        end
        def to_hash
        end

        class Individual < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::Joint::Individual,
                Increase::Internal::AnyHash
              )
            end

          # The individual's physical address. Mail receiving locations like PO Boxes and
          # PMB's are disallowed.
          sig do
            returns(Increase::EntityCreateParams::Joint::Individual::Address)
          end
          attr_reader :address

          sig do
            params(
              address:
                Increase::EntityCreateParams::Joint::Individual::Address::OrHash
            ).void
          end
          attr_writer :address

          # The person's date of birth in YYYY-MM-DD format.
          sig { returns(Date) }
          attr_accessor :date_of_birth

          # A means of verifying the person's identity.
          sig do
            returns(
              Increase::EntityCreateParams::Joint::Individual::Identification
            )
          end
          attr_reader :identification

          sig do
            params(
              identification:
                Increase::EntityCreateParams::Joint::Individual::Identification::OrHash
            ).void
          end
          attr_writer :identification

          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          # The identification method for an individual can only be a passport, driver's
          # license, or other document if you've confirmed the individual does not have a US
          # tax id (either a Social Security Number or Individual Taxpayer Identification
          # Number).
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :confirmed_no_us_tax_id

          sig { params(confirmed_no_us_tax_id: T::Boolean).void }
          attr_writer :confirmed_no_us_tax_id

          sig do
            params(
              address:
                Increase::EntityCreateParams::Joint::Individual::Address::OrHash,
              date_of_birth: Date,
              identification:
                Increase::EntityCreateParams::Joint::Individual::Identification::OrHash,
              name: String,
              confirmed_no_us_tax_id: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # The individual's physical address. Mail receiving locations like PO Boxes and
            # PMB's are disallowed.
            address:,
            # The person's date of birth in YYYY-MM-DD format.
            date_of_birth:,
            # A means of verifying the person's identity.
            identification:,
            # The person's legal name.
            name:,
            # The identification method for an individual can only be a passport, driver's
            # license, or other document if you've confirmed the individual does not have a US
            # tax id (either a Social Security Number or Individual Taxpayer Identification
            # Number).
            confirmed_no_us_tax_id: nil
          )
          end

          sig do
            override.returns(
              {
                address:
                  Increase::EntityCreateParams::Joint::Individual::Address,
                date_of_birth: Date,
                identification:
                  Increase::EntityCreateParams::Joint::Individual::Identification,
                name: String,
                confirmed_no_us_tax_id: T::Boolean
              }
            )
          end
          def to_hash
          end

          class Address < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::Joint::Individual::Address,
                  Increase::Internal::AnyHash
                )
              end

            # The city of the address.
            sig { returns(String) }
            attr_accessor :city

            # The first line of the address. This is usually the street number and street.
            sig { returns(String) }
            attr_accessor :line1

            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
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
            # PMB's are disallowed.
            sig do
              params(
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The city of the address.
              city:,
              # The first line of the address. This is usually the street number and street.
              line1:,
              # The two-letter United States Postal Service (USPS) abbreviation for the state of
              # the address.
              state:,
              # The ZIP code of the address.
              zip:,
              # The second line of the address. This might be the floor or room number.
              line2: nil
            )
            end

            sig do
              override.returns(
                {
                  city: String,
                  line1: String,
                  state: String,
                  zip: String,
                  line2: String
                }
              )
            end
            def to_hash
            end
          end

          class Identification < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::Joint::Individual::Identification,
                  Increase::Internal::AnyHash
                )
              end

            # A method that can be used to verify the individual's identity.
            sig do
              returns(
                Increase::EntityCreateParams::Joint::Individual::Identification::Method::OrSymbol
              )
            end
            attr_accessor :method_

            # An identification number that can be used to verify the individual's identity,
            # such as a social security number.
            sig { returns(String) }
            attr_accessor :number

            # Information about the United States driver's license used for identification.
            # Required if `method` is equal to `drivers_license`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityCreateParams::Joint::Individual::Identification::DriversLicense
                )
              )
            end
            attr_reader :drivers_license

            sig do
              params(
                drivers_license:
                  Increase::EntityCreateParams::Joint::Individual::Identification::DriversLicense::OrHash
              ).void
            end
            attr_writer :drivers_license

            # Information about the identification document provided. Required if `method` is
            # equal to `other`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityCreateParams::Joint::Individual::Identification::Other
                )
              )
            end
            attr_reader :other

            sig do
              params(
                other:
                  Increase::EntityCreateParams::Joint::Individual::Identification::Other::OrHash
              ).void
            end
            attr_writer :other

            # Information about the passport used for identification. Required if `method` is
            # equal to `passport`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityCreateParams::Joint::Individual::Identification::Passport
                )
              )
            end
            attr_reader :passport

            sig do
              params(
                passport:
                  Increase::EntityCreateParams::Joint::Individual::Identification::Passport::OrHash
              ).void
            end
            attr_writer :passport

            # A means of verifying the person's identity.
            sig do
              params(
                method_:
                  Increase::EntityCreateParams::Joint::Individual::Identification::Method::OrSymbol,
                number: String,
                drivers_license:
                  Increase::EntityCreateParams::Joint::Individual::Identification::DriversLicense::OrHash,
                other:
                  Increase::EntityCreateParams::Joint::Individual::Identification::Other::OrHash,
                passport:
                  Increase::EntityCreateParams::Joint::Individual::Identification::Passport::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # A method that can be used to verify the individual's identity.
              method_:,
              # An identification number that can be used to verify the individual's identity,
              # such as a social security number.
              number:,
              # Information about the United States driver's license used for identification.
              # Required if `method` is equal to `drivers_license`.
              drivers_license: nil,
              # Information about the identification document provided. Required if `method` is
              # equal to `other`.
              other: nil,
              # Information about the passport used for identification. Required if `method` is
              # equal to `passport`.
              passport: nil
            )
            end

            sig do
              override.returns(
                {
                  method_:
                    Increase::EntityCreateParams::Joint::Individual::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license:
                    Increase::EntityCreateParams::Joint::Individual::Identification::DriversLicense,
                  other:
                    Increase::EntityCreateParams::Joint::Individual::Identification::Other,
                  passport:
                    Increase::EntityCreateParams::Joint::Individual::Identification::Passport
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
                  T.all(
                    Symbol,
                    Increase::EntityCreateParams::Joint::Individual::Identification::Method
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # A social security number.
              SOCIAL_SECURITY_NUMBER =
                T.let(
                  :social_security_number,
                  Increase::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # An individual taxpayer identification number (ITIN).
              INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                T.let(
                  :individual_taxpayer_identification_number,
                  Increase::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # A passport number.
              PASSPORT =
                T.let(
                  :passport,
                  Increase::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # A driver's license number.
              DRIVERS_LICENSE =
                T.let(
                  :drivers_license,
                  Increase::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # Another identifying document.
              OTHER =
                T.let(
                  :other,
                  Increase::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::EntityCreateParams::Joint::Individual::Identification::Method::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class DriversLicense < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Joint::Individual::Identification::DriversLicense,
                    Increase::Internal::AnyHash
                  )
                end

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
              # Required if `method` is equal to `drivers_license`.
              sig do
                params(
                  expiration_date: Date,
                  file_id: String,
                  state: String,
                  back_file_id: String
                ).returns(T.attached_class)
              end
              def self.new(
                # The driver's license's expiration date in YYYY-MM-DD format.
                expiration_date:,
                # The identifier of the File containing the front of the driver's license.
                file_id:,
                # The state that issued the provided driver's license.
                state:,
                # The identifier of the File containing the back of the driver's license.
                back_file_id: nil
              )
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
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Joint::Individual::Identification::Other,
                    Increase::Internal::AnyHash
                  )
                end

              # The two-character ISO 3166-1 code representing the country that issued the
              # document (e.g., `US`).
              sig { returns(String) }
              attr_accessor :country

              # A description of the document submitted.
              sig { returns(String) }
              attr_accessor :description

              # The identifier of the File containing the front of the document.
              sig { returns(String) }
              attr_accessor :file_id

              # The identifier of the File containing the back of the document. Not every
              # document has a reverse side.
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
              # equal to `other`.
              sig do
                params(
                  country: String,
                  description: String,
                  file_id: String,
                  back_file_id: String,
                  expiration_date: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # The two-character ISO 3166-1 code representing the country that issued the
                # document (e.g., `US`).
                country:,
                # A description of the document submitted.
                description:,
                # The identifier of the File containing the front of the document.
                file_id:,
                # The identifier of the File containing the back of the document. Not every
                # document has a reverse side.
                back_file_id: nil,
                # The document's expiration date in YYYY-MM-DD format.
                expiration_date: nil
              )
              end

              sig do
                override.returns(
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
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Joint::Individual::Identification::Passport,
                    Increase::Internal::AnyHash
                  )
                end

              # The two-character ISO 3166-1 code representing the country that issued the
              # passport (e.g., `US`).
              sig { returns(String) }
              attr_accessor :country

              # The passport's expiration date in YYYY-MM-DD format.
              sig { returns(Date) }
              attr_accessor :expiration_date

              # The identifier of the File containing the passport.
              sig { returns(String) }
              attr_accessor :file_id

              # Information about the passport used for identification. Required if `method` is
              # equal to `passport`.
              sig do
                params(
                  country: String,
                  expiration_date: Date,
                  file_id: String
                ).returns(T.attached_class)
              end
              def self.new(
                # The two-character ISO 3166-1 code representing the country that issued the
                # passport (e.g., `US`).
                country:,
                # The passport's expiration date in YYYY-MM-DD format.
                expiration_date:,
                # The identifier of the File containing the passport.
                file_id:
              )
              end

              sig do
                override.returns(
                  { country: String, expiration_date: Date, file_id: String }
                )
              end
              def to_hash
              end
            end
          end
        end
      end

      class NaturalPerson < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityCreateParams::NaturalPerson,
              Increase::Internal::AnyHash
            )
          end

        # The individual's physical address. Mail receiving locations like PO Boxes and
        # PMB's are disallowed.
        sig { returns(Increase::EntityCreateParams::NaturalPerson::Address) }
        attr_reader :address

        sig do
          params(
            address:
              Increase::EntityCreateParams::NaturalPerson::Address::OrHash
          ).void
        end
        attr_writer :address

        # The person's date of birth in YYYY-MM-DD format.
        sig { returns(Date) }
        attr_accessor :date_of_birth

        # A means of verifying the person's identity.
        sig do
          returns(Increase::EntityCreateParams::NaturalPerson::Identification)
        end
        attr_reader :identification

        sig do
          params(
            identification:
              Increase::EntityCreateParams::NaturalPerson::Identification::OrHash
          ).void
        end
        attr_writer :identification

        # The person's legal name.
        sig { returns(String) }
        attr_accessor :name

        # The identification method for an individual can only be a passport, driver's
        # license, or other document if you've confirmed the individual does not have a US
        # tax id (either a Social Security Number or Individual Taxpayer Identification
        # Number).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :confirmed_no_us_tax_id

        sig { params(confirmed_no_us_tax_id: T::Boolean).void }
        attr_writer :confirmed_no_us_tax_id

        # Details of the natural person entity to create. Required if `structure` is equal
        # to `natural_person`. Natural people entities should be submitted with
        # `social_security_number` or `individual_taxpayer_identification_number`
        # identification methods.
        sig do
          params(
            address:
              Increase::EntityCreateParams::NaturalPerson::Address::OrHash,
            date_of_birth: Date,
            identification:
              Increase::EntityCreateParams::NaturalPerson::Identification::OrHash,
            name: String,
            confirmed_no_us_tax_id: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # The individual's physical address. Mail receiving locations like PO Boxes and
          # PMB's are disallowed.
          address:,
          # The person's date of birth in YYYY-MM-DD format.
          date_of_birth:,
          # A means of verifying the person's identity.
          identification:,
          # The person's legal name.
          name:,
          # The identification method for an individual can only be a passport, driver's
          # license, or other document if you've confirmed the individual does not have a US
          # tax id (either a Social Security Number or Individual Taxpayer Identification
          # Number).
          confirmed_no_us_tax_id: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityCreateParams::NaturalPerson::Address,
              date_of_birth: Date,
              identification:
                Increase::EntityCreateParams::NaturalPerson::Identification,
              name: String,
              confirmed_no_us_tax_id: T::Boolean
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::NaturalPerson::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
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
          # PMB's are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the address.
            city:,
            # The first line of the address. This is usually the street number and street.
            line1:,
            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
            state:,
            # The ZIP code of the address.
            zip:,
            # The second line of the address. This might be the floor or room number.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end

        class Identification < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::NaturalPerson::Identification,
                Increase::Internal::AnyHash
              )
            end

          # A method that can be used to verify the individual's identity.
          sig do
            returns(
              Increase::EntityCreateParams::NaturalPerson::Identification::Method::OrSymbol
            )
          end
          attr_accessor :method_

          # An identification number that can be used to verify the individual's identity,
          # such as a social security number.
          sig { returns(String) }
          attr_accessor :number

          # Information about the United States driver's license used for identification.
          # Required if `method` is equal to `drivers_license`.
          sig do
            returns(
              T.nilable(
                Increase::EntityCreateParams::NaturalPerson::Identification::DriversLicense
              )
            )
          end
          attr_reader :drivers_license

          sig do
            params(
              drivers_license:
                Increase::EntityCreateParams::NaturalPerson::Identification::DriversLicense::OrHash
            ).void
          end
          attr_writer :drivers_license

          # Information about the identification document provided. Required if `method` is
          # equal to `other`.
          sig do
            returns(
              T.nilable(
                Increase::EntityCreateParams::NaturalPerson::Identification::Other
              )
            )
          end
          attr_reader :other

          sig do
            params(
              other:
                Increase::EntityCreateParams::NaturalPerson::Identification::Other::OrHash
            ).void
          end
          attr_writer :other

          # Information about the passport used for identification. Required if `method` is
          # equal to `passport`.
          sig do
            returns(
              T.nilable(
                Increase::EntityCreateParams::NaturalPerson::Identification::Passport
              )
            )
          end
          attr_reader :passport

          sig do
            params(
              passport:
                Increase::EntityCreateParams::NaturalPerson::Identification::Passport::OrHash
            ).void
          end
          attr_writer :passport

          # A means of verifying the person's identity.
          sig do
            params(
              method_:
                Increase::EntityCreateParams::NaturalPerson::Identification::Method::OrSymbol,
              number: String,
              drivers_license:
                Increase::EntityCreateParams::NaturalPerson::Identification::DriversLicense::OrHash,
              other:
                Increase::EntityCreateParams::NaturalPerson::Identification::Other::OrHash,
              passport:
                Increase::EntityCreateParams::NaturalPerson::Identification::Passport::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # A method that can be used to verify the individual's identity.
            method_:,
            # An identification number that can be used to verify the individual's identity,
            # such as a social security number.
            number:,
            # Information about the United States driver's license used for identification.
            # Required if `method` is equal to `drivers_license`.
            drivers_license: nil,
            # Information about the identification document provided. Required if `method` is
            # equal to `other`.
            other: nil,
            # Information about the passport used for identification. Required if `method` is
            # equal to `passport`.
            passport: nil
          )
          end

          sig do
            override.returns(
              {
                method_:
                  Increase::EntityCreateParams::NaturalPerson::Identification::Method::OrSymbol,
                number: String,
                drivers_license:
                  Increase::EntityCreateParams::NaturalPerson::Identification::DriversLicense,
                other:
                  Increase::EntityCreateParams::NaturalPerson::Identification::Other,
                passport:
                  Increase::EntityCreateParams::NaturalPerson::Identification::Passport
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
                T.all(
                  Symbol,
                  Increase::EntityCreateParams::NaturalPerson::Identification::Method
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A social security number.
            SOCIAL_SECURITY_NUMBER =
              T.let(
                :social_security_number,
                Increase::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # An individual taxpayer identification number (ITIN).
            INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
              T.let(
                :individual_taxpayer_identification_number,
                Increase::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # A passport number.
            PASSPORT =
              T.let(
                :passport,
                Increase::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # A driver's license number.
            DRIVERS_LICENSE =
              T.let(
                :drivers_license,
                Increase::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # Another identifying document.
            OTHER =
              T.let(
                :other,
                Increase::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::EntityCreateParams::NaturalPerson::Identification::Method::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class DriversLicense < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::NaturalPerson::Identification::DriversLicense,
                  Increase::Internal::AnyHash
                )
              end

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
            # Required if `method` is equal to `drivers_license`.
            sig do
              params(
                expiration_date: Date,
                file_id: String,
                state: String,
                back_file_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The driver's license's expiration date in YYYY-MM-DD format.
              expiration_date:,
              # The identifier of the File containing the front of the driver's license.
              file_id:,
              # The state that issued the provided driver's license.
              state:,
              # The identifier of the File containing the back of the driver's license.
              back_file_id: nil
            )
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
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::NaturalPerson::Identification::Other,
                  Increase::Internal::AnyHash
                )
              end

            # The two-character ISO 3166-1 code representing the country that issued the
            # document (e.g., `US`).
            sig { returns(String) }
            attr_accessor :country

            # A description of the document submitted.
            sig { returns(String) }
            attr_accessor :description

            # The identifier of the File containing the front of the document.
            sig { returns(String) }
            attr_accessor :file_id

            # The identifier of the File containing the back of the document. Not every
            # document has a reverse side.
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
            # equal to `other`.
            sig do
              params(
                country: String,
                description: String,
                file_id: String,
                back_file_id: String,
                expiration_date: Date
              ).returns(T.attached_class)
            end
            def self.new(
              # The two-character ISO 3166-1 code representing the country that issued the
              # document (e.g., `US`).
              country:,
              # A description of the document submitted.
              description:,
              # The identifier of the File containing the front of the document.
              file_id:,
              # The identifier of the File containing the back of the document. Not every
              # document has a reverse side.
              back_file_id: nil,
              # The document's expiration date in YYYY-MM-DD format.
              expiration_date: nil
            )
            end

            sig do
              override.returns(
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
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::NaturalPerson::Identification::Passport,
                  Increase::Internal::AnyHash
                )
              end

            # The two-character ISO 3166-1 code representing the country that issued the
            # passport (e.g., `US`).
            sig { returns(String) }
            attr_accessor :country

            # The passport's expiration date in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :expiration_date

            # The identifier of the File containing the passport.
            sig { returns(String) }
            attr_accessor :file_id

            # Information about the passport used for identification. Required if `method` is
            # equal to `passport`.
            sig do
              params(
                country: String,
                expiration_date: Date,
                file_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The two-character ISO 3166-1 code representing the country that issued the
              # passport (e.g., `US`).
              country:,
              # The passport's expiration date in YYYY-MM-DD format.
              expiration_date:,
              # The identifier of the File containing the passport.
              file_id:
            )
            end

            sig do
              override.returns(
                { country: String, expiration_date: Date, file_id: String }
              )
            end
            def to_hash
            end
          end
        end
      end

      class RiskRating < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityCreateParams::RiskRating,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk
        # rating was performed.
        sig { returns(Time) }
        attr_accessor :rated_at

        # The rating given to this entity.
        sig do
          returns(Increase::EntityCreateParams::RiskRating::Rating::OrSymbol)
        end
        attr_accessor :rating

        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        sig do
          params(
            rated_at: Time,
            rating: Increase::EntityCreateParams::RiskRating::Rating::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk
          # rating was performed.
          rated_at:,
          # The rating given to this entity.
          rating:
        )
        end

        sig do
          override.returns(
            {
              rated_at: Time,
              rating: Increase::EntityCreateParams::RiskRating::Rating::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The rating given to this entity.
        module Rating
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::EntityCreateParams::RiskRating::Rating)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Minimal risk of involvement in financial crime.
          LOW =
            T.let(
              :low,
              Increase::EntityCreateParams::RiskRating::Rating::TaggedSymbol
            )

          # Moderate risk of involvement in financial crime.
          MEDIUM =
            T.let(
              :medium,
              Increase::EntityCreateParams::RiskRating::Rating::TaggedSymbol
            )

          # Elevated risk of involvement in financial crime.
          HIGH =
            T.let(
              :high,
              Increase::EntityCreateParams::RiskRating::Rating::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityCreateParams::RiskRating::Rating::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class SupplementalDocument < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityCreateParams::SupplementalDocument,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the File containing the document.
        sig { returns(String) }
        attr_accessor :file_id

        sig { params(file_id: String).returns(T.attached_class) }
        def self.new(
          # The identifier of the File containing the document.
          file_id:
        )
        end

        sig { override.returns({ file_id: String }) }
        def to_hash
        end
      end

      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityCreateParams::ThirdPartyVerification,
              Increase::Internal::AnyHash
            )
          end

        # The reference identifier for the third party verification.
        sig { returns(String) }
        attr_accessor :reference

        # The vendor that was used to perform the verification.
        sig do
          returns(
            Increase::EntityCreateParams::ThirdPartyVerification::Vendor::OrSymbol
          )
        end
        attr_accessor :vendor

        # If you are using a third-party service for identity verification, you can use
        # this field to associate this Entity with the identifier that represents them in
        # that service.
        sig do
          params(
            reference: String,
            vendor:
              Increase::EntityCreateParams::ThirdPartyVerification::Vendor::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The reference identifier for the third party verification.
          reference:,
          # The vendor that was used to perform the verification.
          vendor:
        )
        end

        sig do
          override.returns(
            {
              reference: String,
              vendor:
                Increase::EntityCreateParams::ThirdPartyVerification::Vendor::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The vendor that was used to perform the verification.
        module Vendor
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::EntityCreateParams::ThirdPartyVerification::Vendor
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Alloy. See https://alloy.com for more information.
          ALLOY =
            T.let(
              :alloy,
              Increase::EntityCreateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          # Middesk. See https://middesk.com for more information.
          MIDDESK =
            T.let(
              :middesk,
              Increase::EntityCreateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          # Oscilar. See https://oscilar.com for more information.
          OSCILAR =
            T.let(
              :oscilar,
              Increase::EntityCreateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityCreateParams::ThirdPartyVerification::Vendor::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Trust < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityCreateParams::Trust,
              Increase::Internal::AnyHash
            )
          end

        # The trust's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig { returns(Increase::EntityCreateParams::Trust::Address) }
        attr_reader :address

        sig do
          params(
            address: Increase::EntityCreateParams::Trust::Address::OrHash
          ).void
        end
        attr_writer :address

        # Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
        # their own Employer Identification Number. Revocable trusts require information
        # about the individual `grantor` who created the trust.
        sig { returns(Increase::EntityCreateParams::Trust::Category::OrSymbol) }
        attr_accessor :category

        # The legal name of the trust.
        sig { returns(String) }
        attr_accessor :name

        # The trustees of the trust.
        sig { returns(T::Array[Increase::EntityCreateParams::Trust::Trustee]) }
        attr_accessor :trustees

        # The identifier of the File containing the formation document of the trust.
        sig { returns(T.nilable(String)) }
        attr_reader :formation_document_file_id

        sig { params(formation_document_file_id: String).void }
        attr_writer :formation_document_file_id

        # The two-letter United States Postal Service (USPS) abbreviation for the state in
        # which the trust was formed.
        sig { returns(T.nilable(String)) }
        attr_reader :formation_state

        sig { params(formation_state: String).void }
        attr_writer :formation_state

        # The grantor of the trust. Required if `category` is equal to `revocable`.
        sig { returns(T.nilable(Increase::EntityCreateParams::Trust::Grantor)) }
        attr_reader :grantor

        sig do
          params(
            grantor: Increase::EntityCreateParams::Trust::Grantor::OrHash
          ).void
        end
        attr_writer :grantor

        # The Employer Identification Number (EIN) for the trust. Required if `category`
        # is equal to `irrevocable`.
        sig { returns(T.nilable(String)) }
        attr_reader :tax_identifier

        sig { params(tax_identifier: String).void }
        attr_writer :tax_identifier

        # Details of the trust entity to create. Required if `structure` is equal to
        # `trust`.
        sig do
          params(
            address: Increase::EntityCreateParams::Trust::Address::OrHash,
            category: Increase::EntityCreateParams::Trust::Category::OrSymbol,
            name: String,
            trustees:
              T::Array[Increase::EntityCreateParams::Trust::Trustee::OrHash],
            formation_document_file_id: String,
            formation_state: String,
            grantor: Increase::EntityCreateParams::Trust::Grantor::OrHash,
            tax_identifier: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The trust's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address:,
          # Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
          # their own Employer Identification Number. Revocable trusts require information
          # about the individual `grantor` who created the trust.
          category:,
          # The legal name of the trust.
          name:,
          # The trustees of the trust.
          trustees:,
          # The identifier of the File containing the formation document of the trust.
          formation_document_file_id: nil,
          # The two-letter United States Postal Service (USPS) abbreviation for the state in
          # which the trust was formed.
          formation_state: nil,
          # The grantor of the trust. Required if `category` is equal to `revocable`.
          grantor: nil,
          # The Employer Identification Number (EIN) for the trust. Required if `category`
          # is equal to `irrevocable`.
          tax_identifier: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityCreateParams::Trust::Address,
              category: Increase::EntityCreateParams::Trust::Category::OrSymbol,
              name: String,
              trustees: T::Array[Increase::EntityCreateParams::Trust::Trustee],
              formation_document_file_id: String,
              formation_state: String,
              grantor: Increase::EntityCreateParams::Trust::Grantor,
              tax_identifier: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::Trust::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
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
          # are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the address.
            city:,
            # The first line of the address. This is usually the street number and street.
            line1:,
            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
            state:,
            # The ZIP code of the address.
            zip:,
            # The second line of the address. This might be the floor or room number.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end

        # Whether the trust is `revocable` or `irrevocable`. Irrevocable trusts require
        # their own Employer Identification Number. Revocable trusts require information
        # about the individual `grantor` who created the trust.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::EntityCreateParams::Trust::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The trust is revocable by the grantor.
          REVOCABLE =
            T.let(
              :revocable,
              Increase::EntityCreateParams::Trust::Category::TaggedSymbol
            )

          # The trust cannot be revoked.
          IRREVOCABLE =
            T.let(
              :irrevocable,
              Increase::EntityCreateParams::Trust::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityCreateParams::Trust::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Trustee < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::Trust::Trustee,
                Increase::Internal::AnyHash
              )
            end

          # The structure of the trustee.
          sig do
            returns(
              Increase::EntityCreateParams::Trust::Trustee::Structure::OrSymbol
            )
          end
          attr_accessor :structure

          # Details of the individual trustee. Within the trustee object, this is required
          # if `structure` is equal to `individual`.
          sig do
            returns(
              T.nilable(
                Increase::EntityCreateParams::Trust::Trustee::Individual
              )
            )
          end
          attr_reader :individual

          sig do
            params(
              individual:
                Increase::EntityCreateParams::Trust::Trustee::Individual::OrHash
            ).void
          end
          attr_writer :individual

          sig do
            params(
              structure:
                Increase::EntityCreateParams::Trust::Trustee::Structure::OrSymbol,
              individual:
                Increase::EntityCreateParams::Trust::Trustee::Individual::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The structure of the trustee.
            structure:,
            # Details of the individual trustee. Within the trustee object, this is required
            # if `structure` is equal to `individual`.
            individual: nil
          )
          end

          sig do
            override.returns(
              {
                structure:
                  Increase::EntityCreateParams::Trust::Trustee::Structure::OrSymbol,
                individual:
                  Increase::EntityCreateParams::Trust::Trustee::Individual
              }
            )
          end
          def to_hash
          end

          # The structure of the trustee.
          module Structure
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::EntityCreateParams::Trust::Trustee::Structure
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The trustee is an individual.
            INDIVIDUAL =
              T.let(
                :individual,
                Increase::EntityCreateParams::Trust::Trustee::Structure::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::EntityCreateParams::Trust::Trustee::Structure::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Individual < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::Trust::Trustee::Individual,
                  Increase::Internal::AnyHash
                )
              end

            # The individual's physical address. Mail receiving locations like PO Boxes and
            # PMB's are disallowed.
            sig do
              returns(
                Increase::EntityCreateParams::Trust::Trustee::Individual::Address
              )
            end
            attr_reader :address

            sig do
              params(
                address:
                  Increase::EntityCreateParams::Trust::Trustee::Individual::Address::OrHash
              ).void
            end
            attr_writer :address

            # The person's date of birth in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :date_of_birth

            # A means of verifying the person's identity.
            sig do
              returns(
                Increase::EntityCreateParams::Trust::Trustee::Individual::Identification
              )
            end
            attr_reader :identification

            sig do
              params(
                identification:
                  Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::OrHash
              ).void
            end
            attr_writer :identification

            # The person's legal name.
            sig { returns(String) }
            attr_accessor :name

            # The identification method for an individual can only be a passport, driver's
            # license, or other document if you've confirmed the individual does not have a US
            # tax id (either a Social Security Number or Individual Taxpayer Identification
            # Number).
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :confirmed_no_us_tax_id

            sig { params(confirmed_no_us_tax_id: T::Boolean).void }
            attr_writer :confirmed_no_us_tax_id

            # Details of the individual trustee. Within the trustee object, this is required
            # if `structure` is equal to `individual`.
            sig do
              params(
                address:
                  Increase::EntityCreateParams::Trust::Trustee::Individual::Address::OrHash,
                date_of_birth: Date,
                identification:
                  Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::OrHash,
                name: String,
                confirmed_no_us_tax_id: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(
              # The individual's physical address. Mail receiving locations like PO Boxes and
              # PMB's are disallowed.
              address:,
              # The person's date of birth in YYYY-MM-DD format.
              date_of_birth:,
              # A means of verifying the person's identity.
              identification:,
              # The person's legal name.
              name:,
              # The identification method for an individual can only be a passport, driver's
              # license, or other document if you've confirmed the individual does not have a US
              # tax id (either a Social Security Number or Individual Taxpayer Identification
              # Number).
              confirmed_no_us_tax_id: nil
            )
            end

            sig do
              override.returns(
                {
                  address:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Address,
                  date_of_birth: Date,
                  identification:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification,
                  name: String,
                  confirmed_no_us_tax_id: T::Boolean
                }
              )
            end
            def to_hash
            end

            class Address < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Address,
                    Increase::Internal::AnyHash
                  )
                end

              # The city of the address.
              sig { returns(String) }
              attr_accessor :city

              # The first line of the address. This is usually the street number and street.
              sig { returns(String) }
              attr_accessor :line1

              # The two-letter United States Postal Service (USPS) abbreviation for the state of
              # the address.
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
              # PMB's are disallowed.
              sig do
                params(
                  city: String,
                  line1: String,
                  state: String,
                  zip: String,
                  line2: String
                ).returns(T.attached_class)
              end
              def self.new(
                # The city of the address.
                city:,
                # The first line of the address. This is usually the street number and street.
                line1:,
                # The two-letter United States Postal Service (USPS) abbreviation for the state of
                # the address.
                state:,
                # The ZIP code of the address.
                zip:,
                # The second line of the address. This might be the floor or room number.
                line2: nil
              )
              end

              sig do
                override.returns(
                  {
                    city: String,
                    line1: String,
                    state: String,
                    zip: String,
                    line2: String
                  }
                )
              end
              def to_hash
              end
            end

            class Identification < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification,
                    Increase::Internal::AnyHash
                  )
                end

              # A method that can be used to verify the individual's identity.
              sig do
                returns(
                  Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol
                )
              end
              attr_accessor :method_

              # An identification number that can be used to verify the individual's identity,
              # such as a social security number.
              sig { returns(String) }
              attr_accessor :number

              # Information about the United States driver's license used for identification.
              # Required if `method` is equal to `drivers_license`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense
                  )
                )
              end
              attr_reader :drivers_license

              sig do
                params(
                  drivers_license:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense::OrHash
                ).void
              end
              attr_writer :drivers_license

              # Information about the identification document provided. Required if `method` is
              # equal to `other`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Other
                  )
                )
              end
              attr_reader :other

              sig do
                params(
                  other:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Other::OrHash
                ).void
              end
              attr_writer :other

              # Information about the passport used for identification. Required if `method` is
              # equal to `passport`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport
                  )
                )
              end
              attr_reader :passport

              sig do
                params(
                  passport:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport::OrHash
                ).void
              end
              attr_writer :passport

              # A means of verifying the person's identity.
              sig do
                params(
                  method_:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense::OrHash,
                  other:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Other::OrHash,
                  passport:
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # A method that can be used to verify the individual's identity.
                method_:,
                # An identification number that can be used to verify the individual's identity,
                # such as a social security number.
                number:,
                # Information about the United States driver's license used for identification.
                # Required if `method` is equal to `drivers_license`.
                drivers_license: nil,
                # Information about the identification document provided. Required if `method` is
                # equal to `other`.
                other: nil,
                # Information about the passport used for identification. Required if `method` is
                # equal to `passport`.
                passport: nil
              )
              end

              sig do
                override.returns(
                  {
                    method_:
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol,
                    number: String,
                    drivers_license:
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense,
                    other:
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Other,
                    passport:
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport
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
                    T.all(
                      Symbol,
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # A social security number.
                SOCIAL_SECURITY_NUMBER =
                  T.let(
                    :social_security_number,
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # An individual taxpayer identification number (ITIN).
                INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                  T.let(
                    :individual_taxpayer_identification_number,
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # A passport number.
                PASSPORT =
                  T.let(
                    :passport,
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # A driver's license number.
                DRIVERS_LICENSE =
                  T.let(
                    :drivers_license,
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # Another identifying document.
                OTHER =
                  T.let(
                    :other,
                    Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class DriversLicense < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::DriversLicense,
                      Increase::Internal::AnyHash
                    )
                  end

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
                # Required if `method` is equal to `drivers_license`.
                sig do
                  params(
                    expiration_date: Date,
                    file_id: String,
                    state: String,
                    back_file_id: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The driver's license's expiration date in YYYY-MM-DD format.
                  expiration_date:,
                  # The identifier of the File containing the front of the driver's license.
                  file_id:,
                  # The state that issued the provided driver's license.
                  state:,
                  # The identifier of the File containing the back of the driver's license.
                  back_file_id: nil
                )
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
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Other,
                      Increase::Internal::AnyHash
                    )
                  end

                # The two-character ISO 3166-1 code representing the country that issued the
                # document (e.g., `US`).
                sig { returns(String) }
                attr_accessor :country

                # A description of the document submitted.
                sig { returns(String) }
                attr_accessor :description

                # The identifier of the File containing the front of the document.
                sig { returns(String) }
                attr_accessor :file_id

                # The identifier of the File containing the back of the document. Not every
                # document has a reverse side.
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
                # equal to `other`.
                sig do
                  params(
                    country: String,
                    description: String,
                    file_id: String,
                    back_file_id: String,
                    expiration_date: Date
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The two-character ISO 3166-1 code representing the country that issued the
                  # document (e.g., `US`).
                  country:,
                  # A description of the document submitted.
                  description:,
                  # The identifier of the File containing the front of the document.
                  file_id:,
                  # The identifier of the File containing the back of the document. Not every
                  # document has a reverse side.
                  back_file_id: nil,
                  # The document's expiration date in YYYY-MM-DD format.
                  expiration_date: nil
                )
                end

                sig do
                  override.returns(
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
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::EntityCreateParams::Trust::Trustee::Individual::Identification::Passport,
                      Increase::Internal::AnyHash
                    )
                  end

                # The two-character ISO 3166-1 code representing the country that issued the
                # passport (e.g., `US`).
                sig { returns(String) }
                attr_accessor :country

                # The passport's expiration date in YYYY-MM-DD format.
                sig { returns(Date) }
                attr_accessor :expiration_date

                # The identifier of the File containing the passport.
                sig { returns(String) }
                attr_accessor :file_id

                # Information about the passport used for identification. Required if `method` is
                # equal to `passport`.
                sig do
                  params(
                    country: String,
                    expiration_date: Date,
                    file_id: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The two-character ISO 3166-1 code representing the country that issued the
                  # passport (e.g., `US`).
                  country:,
                  # The passport's expiration date in YYYY-MM-DD format.
                  expiration_date:,
                  # The identifier of the File containing the passport.
                  file_id:
                )
                end

                sig do
                  override.returns(
                    { country: String, expiration_date: Date, file_id: String }
                  )
                end
                def to_hash
                end
              end
            end
          end
        end

        class Grantor < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityCreateParams::Trust::Grantor,
                Increase::Internal::AnyHash
              )
            end

          # The individual's physical address. Mail receiving locations like PO Boxes and
          # PMB's are disallowed.
          sig { returns(Increase::EntityCreateParams::Trust::Grantor::Address) }
          attr_reader :address

          sig do
            params(
              address:
                Increase::EntityCreateParams::Trust::Grantor::Address::OrHash
            ).void
          end
          attr_writer :address

          # The person's date of birth in YYYY-MM-DD format.
          sig { returns(Date) }
          attr_accessor :date_of_birth

          # A means of verifying the person's identity.
          sig do
            returns(
              Increase::EntityCreateParams::Trust::Grantor::Identification
            )
          end
          attr_reader :identification

          sig do
            params(
              identification:
                Increase::EntityCreateParams::Trust::Grantor::Identification::OrHash
            ).void
          end
          attr_writer :identification

          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          # The identification method for an individual can only be a passport, driver's
          # license, or other document if you've confirmed the individual does not have a US
          # tax id (either a Social Security Number or Individual Taxpayer Identification
          # Number).
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :confirmed_no_us_tax_id

          sig { params(confirmed_no_us_tax_id: T::Boolean).void }
          attr_writer :confirmed_no_us_tax_id

          # The grantor of the trust. Required if `category` is equal to `revocable`.
          sig do
            params(
              address:
                Increase::EntityCreateParams::Trust::Grantor::Address::OrHash,
              date_of_birth: Date,
              identification:
                Increase::EntityCreateParams::Trust::Grantor::Identification::OrHash,
              name: String,
              confirmed_no_us_tax_id: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # The individual's physical address. Mail receiving locations like PO Boxes and
            # PMB's are disallowed.
            address:,
            # The person's date of birth in YYYY-MM-DD format.
            date_of_birth:,
            # A means of verifying the person's identity.
            identification:,
            # The person's legal name.
            name:,
            # The identification method for an individual can only be a passport, driver's
            # license, or other document if you've confirmed the individual does not have a US
            # tax id (either a Social Security Number or Individual Taxpayer Identification
            # Number).
            confirmed_no_us_tax_id: nil
          )
          end

          sig do
            override.returns(
              {
                address: Increase::EntityCreateParams::Trust::Grantor::Address,
                date_of_birth: Date,
                identification:
                  Increase::EntityCreateParams::Trust::Grantor::Identification,
                name: String,
                confirmed_no_us_tax_id: T::Boolean
              }
            )
          end
          def to_hash
          end

          class Address < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::Trust::Grantor::Address,
                  Increase::Internal::AnyHash
                )
              end

            # The city of the address.
            sig { returns(String) }
            attr_accessor :city

            # The first line of the address. This is usually the street number and street.
            sig { returns(String) }
            attr_accessor :line1

            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
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
            # PMB's are disallowed.
            sig do
              params(
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The city of the address.
              city:,
              # The first line of the address. This is usually the street number and street.
              line1:,
              # The two-letter United States Postal Service (USPS) abbreviation for the state of
              # the address.
              state:,
              # The ZIP code of the address.
              zip:,
              # The second line of the address. This might be the floor or room number.
              line2: nil
            )
            end

            sig do
              override.returns(
                {
                  city: String,
                  line1: String,
                  state: String,
                  zip: String,
                  line2: String
                }
              )
            end
            def to_hash
            end
          end

          class Identification < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::EntityCreateParams::Trust::Grantor::Identification,
                  Increase::Internal::AnyHash
                )
              end

            # A method that can be used to verify the individual's identity.
            sig do
              returns(
                Increase::EntityCreateParams::Trust::Grantor::Identification::Method::OrSymbol
              )
            end
            attr_accessor :method_

            # An identification number that can be used to verify the individual's identity,
            # such as a social security number.
            sig { returns(String) }
            attr_accessor :number

            # Information about the United States driver's license used for identification.
            # Required if `method` is equal to `drivers_license`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityCreateParams::Trust::Grantor::Identification::DriversLicense
                )
              )
            end
            attr_reader :drivers_license

            sig do
              params(
                drivers_license:
                  Increase::EntityCreateParams::Trust::Grantor::Identification::DriversLicense::OrHash
              ).void
            end
            attr_writer :drivers_license

            # Information about the identification document provided. Required if `method` is
            # equal to `other`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Other
                )
              )
            end
            attr_reader :other

            sig do
              params(
                other:
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Other::OrHash
              ).void
            end
            attr_writer :other

            # Information about the passport used for identification. Required if `method` is
            # equal to `passport`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Passport
                )
              )
            end
            attr_reader :passport

            sig do
              params(
                passport:
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Passport::OrHash
              ).void
            end
            attr_writer :passport

            # A means of verifying the person's identity.
            sig do
              params(
                method_:
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Method::OrSymbol,
                number: String,
                drivers_license:
                  Increase::EntityCreateParams::Trust::Grantor::Identification::DriversLicense::OrHash,
                other:
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Other::OrHash,
                passport:
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Passport::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # A method that can be used to verify the individual's identity.
              method_:,
              # An identification number that can be used to verify the individual's identity,
              # such as a social security number.
              number:,
              # Information about the United States driver's license used for identification.
              # Required if `method` is equal to `drivers_license`.
              drivers_license: nil,
              # Information about the identification document provided. Required if `method` is
              # equal to `other`.
              other: nil,
              # Information about the passport used for identification. Required if `method` is
              # equal to `passport`.
              passport: nil
            )
            end

            sig do
              override.returns(
                {
                  method_:
                    Increase::EntityCreateParams::Trust::Grantor::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license:
                    Increase::EntityCreateParams::Trust::Grantor::Identification::DriversLicense,
                  other:
                    Increase::EntityCreateParams::Trust::Grantor::Identification::Other,
                  passport:
                    Increase::EntityCreateParams::Trust::Grantor::Identification::Passport
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
                  T.all(
                    Symbol,
                    Increase::EntityCreateParams::Trust::Grantor::Identification::Method
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # A social security number.
              SOCIAL_SECURITY_NUMBER =
                T.let(
                  :social_security_number,
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # An individual taxpayer identification number (ITIN).
              INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                T.let(
                  :individual_taxpayer_identification_number,
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # A passport number.
              PASSPORT =
                T.let(
                  :passport,
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # A driver's license number.
              DRIVERS_LICENSE =
                T.let(
                  :drivers_license,
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # Another identifying document.
              OTHER =
                T.let(
                  :other,
                  Increase::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::EntityCreateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class DriversLicense < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Trust::Grantor::Identification::DriversLicense,
                    Increase::Internal::AnyHash
                  )
                end

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
              # Required if `method` is equal to `drivers_license`.
              sig do
                params(
                  expiration_date: Date,
                  file_id: String,
                  state: String,
                  back_file_id: String
                ).returns(T.attached_class)
              end
              def self.new(
                # The driver's license's expiration date in YYYY-MM-DD format.
                expiration_date:,
                # The identifier of the File containing the front of the driver's license.
                file_id:,
                # The state that issued the provided driver's license.
                state:,
                # The identifier of the File containing the back of the driver's license.
                back_file_id: nil
              )
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
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Trust::Grantor::Identification::Other,
                    Increase::Internal::AnyHash
                  )
                end

              # The two-character ISO 3166-1 code representing the country that issued the
              # document (e.g., `US`).
              sig { returns(String) }
              attr_accessor :country

              # A description of the document submitted.
              sig { returns(String) }
              attr_accessor :description

              # The identifier of the File containing the front of the document.
              sig { returns(String) }
              attr_accessor :file_id

              # The identifier of the File containing the back of the document. Not every
              # document has a reverse side.
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
              # equal to `other`.
              sig do
                params(
                  country: String,
                  description: String,
                  file_id: String,
                  back_file_id: String,
                  expiration_date: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # The two-character ISO 3166-1 code representing the country that issued the
                # document (e.g., `US`).
                country:,
                # A description of the document submitted.
                description:,
                # The identifier of the File containing the front of the document.
                file_id:,
                # The identifier of the File containing the back of the document. Not every
                # document has a reverse side.
                back_file_id: nil,
                # The document's expiration date in YYYY-MM-DD format.
                expiration_date: nil
              )
              end

              sig do
                override.returns(
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
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::EntityCreateParams::Trust::Grantor::Identification::Passport,
                    Increase::Internal::AnyHash
                  )
                end

              # The two-character ISO 3166-1 code representing the country that issued the
              # passport (e.g., `US`).
              sig { returns(String) }
              attr_accessor :country

              # The passport's expiration date in YYYY-MM-DD format.
              sig { returns(Date) }
              attr_accessor :expiration_date

              # The identifier of the File containing the passport.
              sig { returns(String) }
              attr_accessor :file_id

              # Information about the passport used for identification. Required if `method` is
              # equal to `passport`.
              sig do
                params(
                  country: String,
                  expiration_date: Date,
                  file_id: String
                ).returns(T.attached_class)
              end
              def self.new(
                # The two-character ISO 3166-1 code representing the country that issued the
                # passport (e.g., `US`).
                country:,
                # The passport's expiration date in YYYY-MM-DD format.
                expiration_date:,
                # The identifier of the File containing the passport.
                file_id:
              )
              end

              sig do
                override.returns(
                  { country: String, expiration_date: Date, file_id: String }
                )
              end
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
