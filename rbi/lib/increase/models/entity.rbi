# typed: strong

module Increase
  module Models
    class Entity < Increase::Internal::Type::BaseModel
      # The entity's identifier.
      sig { returns(String) }
      attr_accessor :id

      # Details of the corporation entity. Will be present if `structure` is equal to
      #   `corporation`.
      sig { returns(T.nilable(Increase::Models::Entity::Corporation)) }
      attr_reader :corporation

      sig do
        params(corporation: T.nilable(T.any(Increase::Models::Entity::Corporation, Increase::Internal::AnyHash)))
          .void
      end
      attr_writer :corporation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity
      #   was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The entity's description for display purposes.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
      #   Entity's details were most recently confirmed.
      sig { returns(T.nilable(Time)) }
      attr_accessor :details_confirmed_at

      # Details of the government authority entity. Will be present if `structure` is
      #   equal to `government_authority`.
      sig { returns(T.nilable(Increase::Models::Entity::GovernmentAuthority)) }
      attr_reader :government_authority

      sig do
        params(
          government_authority: T.nilable(T.any(Increase::Models::Entity::GovernmentAuthority, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :government_authority

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # Details of the joint entity. Will be present if `structure` is equal to `joint`.
      sig { returns(T.nilable(Increase::Models::Entity::Joint)) }
      attr_reader :joint

      sig { params(joint: T.nilable(T.any(Increase::Models::Entity::Joint, Increase::Internal::AnyHash))).void }
      attr_writer :joint

      # Details of the natural person entity. Will be present if `structure` is equal to
      #   `natural_person`.
      sig { returns(T.nilable(Increase::Models::Entity::NaturalPerson)) }
      attr_reader :natural_person

      sig do
        params(
          natural_person: T.nilable(T.any(Increase::Models::Entity::NaturalPerson, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :natural_person

      # The status of the entity.
      sig { returns(Increase::Models::Entity::Status::TaggedSymbol) }
      attr_accessor :status

      # The entity's legal structure.
      sig { returns(Increase::Models::Entity::Structure::TaggedSymbol) }
      attr_accessor :structure

      # Additional documentation associated with the entity. This is limited to the
      #   first 10 documents for an entity. If an entity has more than 10 documents, use
      #   the GET /entity_supplemental_documents list endpoint to retrieve them.
      sig { returns(T::Array[Increase::Models::EntitySupplementalDocument]) }
      attr_accessor :supplemental_documents

      # A reference to data stored in a third-party verification service. Your
      #   integration may or may not use this field.
      sig { returns(T.nilable(Increase::Models::Entity::ThirdPartyVerification)) }
      attr_reader :third_party_verification

      sig do
        params(
          third_party_verification: T.nilable(T.any(Increase::Models::Entity::ThirdPartyVerification, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :third_party_verification

      # Details of the trust entity. Will be present if `structure` is equal to `trust`.
      sig { returns(T.nilable(Increase::Models::Entity::Trust)) }
      attr_reader :trust

      sig { params(trust: T.nilable(T.any(Increase::Models::Entity::Trust, Increase::Internal::AnyHash))).void }
      attr_writer :trust

      # A constant representing the object's type. For this resource it will always be
      #   `entity`.
      sig { returns(Increase::Models::Entity::Type::TaggedSymbol) }
      attr_accessor :type

      # Entities are the legal entities that own accounts. They can be people,
      #   corporations, partnerships, government authorities, or trusts.
      sig do
        params(
          id: String,
          corporation: T.nilable(T.any(Increase::Models::Entity::Corporation, Increase::Internal::AnyHash)),
          created_at: Time,
          description: T.nilable(String),
          details_confirmed_at: T.nilable(Time),
          government_authority: T.nilable(T.any(Increase::Models::Entity::GovernmentAuthority, Increase::Internal::AnyHash)),
          idempotency_key: T.nilable(String),
          joint: T.nilable(T.any(Increase::Models::Entity::Joint, Increase::Internal::AnyHash)),
          natural_person: T.nilable(T.any(Increase::Models::Entity::NaturalPerson, Increase::Internal::AnyHash)),
          status: Increase::Models::Entity::Status::OrSymbol,
          structure: Increase::Models::Entity::Structure::OrSymbol,
          supplemental_documents: T::Array[T.any(Increase::Models::EntitySupplementalDocument, Increase::Internal::AnyHash)],
          third_party_verification: T.nilable(T.any(Increase::Models::Entity::ThirdPartyVerification, Increase::Internal::AnyHash)),
          trust: T.nilable(T.any(Increase::Models::Entity::Trust, Increase::Internal::AnyHash)),
          type: Increase::Models::Entity::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        corporation:,
        created_at:,
        description:,
        details_confirmed_at:,
        government_authority:,
        idempotency_key:,
        joint:,
        natural_person:,
        status:,
        structure:,
        supplemental_documents:,
        third_party_verification:,
        trust:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              corporation: T.nilable(Increase::Models::Entity::Corporation),
              created_at: Time,
              description: T.nilable(String),
              details_confirmed_at: T.nilable(Time),
              government_authority: T.nilable(Increase::Models::Entity::GovernmentAuthority),
              idempotency_key: T.nilable(String),
              joint: T.nilable(Increase::Models::Entity::Joint),
              natural_person: T.nilable(Increase::Models::Entity::NaturalPerson),
              status: Increase::Models::Entity::Status::TaggedSymbol,
              structure: Increase::Models::Entity::Structure::TaggedSymbol,
              supplemental_documents: T::Array[Increase::Models::EntitySupplementalDocument],
              third_party_verification: T.nilable(Increase::Models::Entity::ThirdPartyVerification),
              trust: T.nilable(Increase::Models::Entity::Trust),
              type: Increase::Models::Entity::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      class Corporation < Increase::Internal::Type::BaseModel
        # The corporation's address.
        sig { returns(Increase::Models::Entity::Corporation::Address) }
        attr_reader :address

        sig { params(address: T.any(Increase::Models::Entity::Corporation::Address, Increase::Internal::AnyHash)).void }
        attr_writer :address

        # The identifying details of anyone controlling or owning 25% or more of the
        #   corporation.
        sig { returns(T::Array[Increase::Models::Entity::Corporation::BeneficialOwner]) }
        attr_accessor :beneficial_owners

        # The two-letter United States Postal Service (USPS) abbreviation for the
        #   corporation's state of incorporation.
        sig { returns(T.nilable(String)) }
        attr_accessor :incorporation_state

        # The numeric North American Industry Classification System (NAICS) code submitted
        #   for the corporation.
        sig { returns(T.nilable(String)) }
        attr_accessor :industry_code

        # The legal name of the corporation.
        sig { returns(String) }
        attr_accessor :name

        # The Employer Identification Number (EIN) for the corporation.
        sig { returns(T.nilable(String)) }
        attr_accessor :tax_identifier

        # The website of the corporation.
        sig { returns(T.nilable(String)) }
        attr_accessor :website

        # Details of the corporation entity. Will be present if `structure` is equal to
        #   `corporation`.
        sig do
          params(
            address: T.any(Increase::Models::Entity::Corporation::Address, Increase::Internal::AnyHash),
            beneficial_owners: T::Array[T.any(Increase::Models::Entity::Corporation::BeneficialOwner, Increase::Internal::AnyHash)],
            incorporation_state: T.nilable(String),
            industry_code: T.nilable(String),
            name: String,
            tax_identifier: T.nilable(String),
            website: T.nilable(String)
          )
            .returns(T.attached_class)
        end
        def self.new(
          address:,
          beneficial_owners:,
          incorporation_state:,
          industry_code:,
          name:,
          tax_identifier:,
          website:
        )
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::Entity::Corporation::Address,
                beneficial_owners: T::Array[Increase::Models::Entity::Corporation::BeneficialOwner],
                incorporation_state: T.nilable(String),
                industry_code: T.nilable(String),
                name: String,
                tax_identifier: T.nilable(String),
                website: T.nilable(String)
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address.
          sig { returns(String) }
          attr_accessor :line1

          # The second line of the address.
          sig { returns(T.nilable(String)) }
          attr_accessor :line2

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          #   the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The corporation's address.
          sig do
            params(city: String, line1: String, line2: T.nilable(String), state: String, zip: String)
              .returns(T.attached_class)
          end
          def self.new(city:, line1:, line2:, state:, zip:)
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                line2: T.nilable(String),
                state: String,
                zip: String
              }
            )
          end
          def to_hash
          end
        end

        class BeneficialOwner < Increase::Internal::Type::BaseModel
          # The identifier of this beneficial owner.
          sig { returns(String) }
          attr_accessor :beneficial_owner_id

          # This person's role or title within the entity.
          sig { returns(T.nilable(String)) }
          attr_accessor :company_title

          # Personal details for the beneficial owner.
          sig { returns(Increase::Models::Entity::Corporation::BeneficialOwner::Individual) }
          attr_reader :individual

          sig do
            params(
              individual: T.any(Increase::Models::Entity::Corporation::BeneficialOwner::Individual, Increase::Internal::AnyHash)
            )
              .void
          end
          attr_writer :individual

          # Why this person is considered a beneficial owner of the entity.
          sig { returns(Increase::Models::Entity::Corporation::BeneficialOwner::Prong::TaggedSymbol) }
          attr_accessor :prong

          sig do
            params(
              beneficial_owner_id: String,
              company_title: T.nilable(String),
              individual: T.any(Increase::Models::Entity::Corporation::BeneficialOwner::Individual, Increase::Internal::AnyHash),
              prong: Increase::Models::Entity::Corporation::BeneficialOwner::Prong::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(beneficial_owner_id:, company_title:, individual:, prong:)
          end

          sig do
            override
              .returns(
                {
                  beneficial_owner_id: String,
                  company_title: T.nilable(String),
                  individual: Increase::Models::Entity::Corporation::BeneficialOwner::Individual,
                  prong: Increase::Models::Entity::Corporation::BeneficialOwner::Prong::TaggedSymbol
                }
              )
          end
          def to_hash
          end

          class Individual < Increase::Internal::Type::BaseModel
            # The person's address.
            sig { returns(Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address) }
            attr_reader :address

            sig do
              params(
                address: T.any(
                  Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address,
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
            sig { returns(Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification) }
            attr_reader :identification

            sig do
              params(
                identification: T.any(
                  Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :identification

            # The person's legal name.
            sig { returns(String) }
            attr_accessor :name

            # Personal details for the beneficial owner.
            sig do
              params(
                address: T.any(
                  Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address,
                  Increase::Internal::AnyHash
                ),
                date_of_birth: Date,
                identification: T.any(
                  Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification,
                  Increase::Internal::AnyHash
                ),
                name: String
              )
                .returns(T.attached_class)
            end
            def self.new(address:, date_of_birth:, identification:, name:)
            end

            sig do
              override
                .returns(
                  {
                    address: Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Address,
                    date_of_birth: Date,
                    identification: Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification,
                    name: String
                  }
                )
            end
            def to_hash
            end

            class Address < Increase::Internal::Type::BaseModel
              # The city, district, town, or village of the address.
              sig { returns(T.nilable(String)) }
              attr_accessor :city

              # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
              sig { returns(String) }
              attr_accessor :country

              # The first line of the address.
              sig { returns(String) }
              attr_accessor :line1

              # The second line of the address.
              sig { returns(T.nilable(String)) }
              attr_accessor :line2

              # The two-letter United States Postal Service (USPS) abbreviation for the US
              #   state, province, or region of the address.
              sig { returns(T.nilable(String)) }
              attr_accessor :state

              # The ZIP or postal code of the address.
              sig { returns(T.nilable(String)) }
              attr_accessor :zip

              # The person's address.
              sig do
                params(
                  city: T.nilable(String),
                  country: String,
                  line1: String,
                  line2: T.nilable(String),
                  state: T.nilable(String),
                  zip: T.nilable(String)
                )
                  .returns(T.attached_class)
              end
              def self.new(city:, country:, line1:, line2:, state:, zip:)
              end

              sig do
                override
                  .returns(
                    {
                      city: T.nilable(String),
                      country: String,
                      line1: String,
                      line2: T.nilable(String),
                      state: T.nilable(String),
                      zip: T.nilable(String)
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
                  Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                )
              end
              attr_accessor :method_

              # The last 4 digits of the identification number that can be used to verify the
              #   individual's identity.
              sig { returns(String) }
              attr_accessor :number_last4

              # A means of verifying the person's identity.
              sig do
                params(
                  method_: Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::OrSymbol,
                  number_last4: String
                )
                  .returns(T.attached_class)
              end
              def self.new(method_:, number_last4:)
              end

              sig do
                override
                  .returns(
                    {
                      method_: Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol,
                      number_last4: String
                    }
                  )
              end
              def to_hash
              end

              # A method that can be used to verify the individual's identity.
              module Method
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                    )
                  end

                # A social security number.
                SOCIAL_SECURITY_NUMBER =
                  T.let(
                    :social_security_number,
                    Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # An individual taxpayer identification number (ITIN).
                INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                  T.let(
                    :individual_taxpayer_identification_number,
                    Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # A passport number.
                PASSPORT =
                  T.let(
                    :passport,
                    Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # A driver's license number.
                DRIVERS_LICENSE =
                  T.let(
                    :drivers_license,
                    Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                # Another identifying document.
                OTHER =
                  T.let(
                    :other,
                    Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[Increase::Models::Entity::Corporation::BeneficialOwner::Individual::Identification::Method::TaggedSymbol]
                    )
                end
                def self.values
                end
              end
            end
          end

          # Why this person is considered a beneficial owner of the entity.
          module Prong
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::Entity::Corporation::BeneficialOwner::Prong) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::Entity::Corporation::BeneficialOwner::Prong::TaggedSymbol) }

            # A person with 25% or greater direct or indirect ownership of the entity.
            OWNERSHIP =
              T.let(:ownership, Increase::Models::Entity::Corporation::BeneficialOwner::Prong::TaggedSymbol)

            # A person who manages, directs, or has significant control of the entity.
            CONTROL = T.let(:control, Increase::Models::Entity::Corporation::BeneficialOwner::Prong::TaggedSymbol)

            sig { override.returns(T::Array[Increase::Models::Entity::Corporation::BeneficialOwner::Prong::TaggedSymbol]) }
            def self.values
            end
          end
        end
      end

      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        # The government authority's address.
        sig { returns(Increase::Models::Entity::GovernmentAuthority::Address) }
        attr_reader :address

        sig do
          params(
            address: T.any(Increase::Models::Entity::GovernmentAuthority::Address, Increase::Internal::AnyHash)
          )
            .void
        end
        attr_writer :address

        # The identifying details of authorized persons of the government authority.
        sig { returns(T::Array[Increase::Models::Entity::GovernmentAuthority::AuthorizedPerson]) }
        attr_accessor :authorized_persons

        # The category of the government authority.
        sig { returns(Increase::Models::Entity::GovernmentAuthority::Category::TaggedSymbol) }
        attr_accessor :category

        # The government authority's name.
        sig { returns(String) }
        attr_accessor :name

        # The Employer Identification Number (EIN) of the government authority.
        sig { returns(T.nilable(String)) }
        attr_accessor :tax_identifier

        # The government authority's website.
        sig { returns(T.nilable(String)) }
        attr_accessor :website

        # Details of the government authority entity. Will be present if `structure` is
        #   equal to `government_authority`.
        sig do
          params(
            address: T.any(Increase::Models::Entity::GovernmentAuthority::Address, Increase::Internal::AnyHash),
            authorized_persons: T::Array[T.any(Increase::Models::Entity::GovernmentAuthority::AuthorizedPerson, Increase::Internal::AnyHash)],
            category: Increase::Models::Entity::GovernmentAuthority::Category::OrSymbol,
            name: String,
            tax_identifier: T.nilable(String),
            website: T.nilable(String)
          )
            .returns(T.attached_class)
        end
        def self.new(address:, authorized_persons:, category:, name:, tax_identifier:, website:)
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::Entity::GovernmentAuthority::Address,
                authorized_persons: T::Array[Increase::Models::Entity::GovernmentAuthority::AuthorizedPerson],
                category: Increase::Models::Entity::GovernmentAuthority::Category::TaggedSymbol,
                name: String,
                tax_identifier: T.nilable(String),
                website: T.nilable(String)
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address.
          sig { returns(String) }
          attr_accessor :line1

          # The second line of the address.
          sig { returns(T.nilable(String)) }
          attr_accessor :line2

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          #   the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The government authority's address.
          sig do
            params(city: String, line1: String, line2: T.nilable(String), state: String, zip: String)
              .returns(T.attached_class)
          end
          def self.new(city:, line1:, line2:, state:, zip:)
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                line2: T.nilable(String),
                state: String,
                zip: String
              }
            )
          end
          def to_hash
          end
        end

        class AuthorizedPerson < Increase::Internal::Type::BaseModel
          # The identifier of this authorized person.
          sig { returns(String) }
          attr_accessor :authorized_person_id

          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          sig { params(authorized_person_id: String, name: String).returns(T.attached_class) }
          def self.new(authorized_person_id:, name:)
          end

          sig { override.returns({authorized_person_id: String, name: String}) }
          def to_hash
          end
        end

        # The category of the government authority.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Entity::GovernmentAuthority::Category) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::Entity::GovernmentAuthority::Category::TaggedSymbol) }

          # The Public Entity is a Municipality.
          MUNICIPALITY =
            T.let(:municipality, Increase::Models::Entity::GovernmentAuthority::Category::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::Entity::GovernmentAuthority::Category::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class Joint < Increase::Internal::Type::BaseModel
        # The two individuals that share control of the entity.
        sig { returns(T::Array[Increase::Models::Entity::Joint::Individual]) }
        attr_accessor :individuals

        # The entity's name.
        sig { returns(String) }
        attr_accessor :name

        # Details of the joint entity. Will be present if `structure` is equal to `joint`.
        sig do
          params(
            individuals: T::Array[T.any(Increase::Models::Entity::Joint::Individual, Increase::Internal::AnyHash)],
            name: String
          )
            .returns(T.attached_class)
        end
        def self.new(individuals:, name:)
        end

        sig { override.returns({individuals: T::Array[Increase::Models::Entity::Joint::Individual], name: String}) }
        def to_hash
        end

        class Individual < Increase::Internal::Type::BaseModel
          # The person's address.
          sig { returns(Increase::Models::Entity::Joint::Individual::Address) }
          attr_reader :address

          sig do
            params(address: T.any(Increase::Models::Entity::Joint::Individual::Address, Increase::Internal::AnyHash))
              .void
          end
          attr_writer :address

          # The person's date of birth in YYYY-MM-DD format.
          sig { returns(Date) }
          attr_accessor :date_of_birth

          # A means of verifying the person's identity.
          sig { returns(Increase::Models::Entity::Joint::Individual::Identification) }
          attr_reader :identification

          sig do
            params(
              identification: T.any(Increase::Models::Entity::Joint::Individual::Identification, Increase::Internal::AnyHash)
            )
              .void
          end
          attr_writer :identification

          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          sig do
            params(
              address: T.any(Increase::Models::Entity::Joint::Individual::Address, Increase::Internal::AnyHash),
              date_of_birth: Date,
              identification: T.any(Increase::Models::Entity::Joint::Individual::Identification, Increase::Internal::AnyHash),
              name: String
            )
              .returns(T.attached_class)
          end
          def self.new(address:, date_of_birth:, identification:, name:)
          end

          sig do
            override
              .returns(
                {
                  address: Increase::Models::Entity::Joint::Individual::Address,
                  date_of_birth: Date,
                  identification: Increase::Models::Entity::Joint::Individual::Identification,
                  name: String
                }
              )
          end
          def to_hash
          end

          class Address < Increase::Internal::Type::BaseModel
            # The city of the address.
            sig { returns(String) }
            attr_accessor :city

            # The first line of the address.
            sig { returns(String) }
            attr_accessor :line1

            # The second line of the address.
            sig { returns(T.nilable(String)) }
            attr_accessor :line2

            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            #   the address.
            sig { returns(String) }
            attr_accessor :state

            # The ZIP code of the address.
            sig { returns(String) }
            attr_accessor :zip

            # The person's address.
            sig do
              params(city: String, line1: String, line2: T.nilable(String), state: String, zip: String)
                .returns(T.attached_class)
            end
            def self.new(city:, line1:, line2:, state:, zip:)
            end

            sig do
              override.returns(
                {
                  city: String,
                  line1: String,
                  line2: T.nilable(String),
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
            sig { returns(Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol) }
            attr_accessor :method_

            # The last 4 digits of the identification number that can be used to verify the
            #   individual's identity.
            sig { returns(String) }
            attr_accessor :number_last4

            # A means of verifying the person's identity.
            sig do
              params(
                method_: Increase::Models::Entity::Joint::Individual::Identification::Method::OrSymbol,
                number_last4: String
              )
                .returns(T.attached_class)
            end
            def self.new(method_:, number_last4:)
            end

            sig do
              override
                .returns(
                  {
                    method_: Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol,
                    number_last4: String
                  }
                )
            end
            def to_hash
            end

            # A method that can be used to verify the individual's identity.
            module Method
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Increase::Models::Entity::Joint::Individual::Identification::Method) }
              OrSymbol =
                T.type_alias { T.any(Symbol, String, Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol) }

              # A social security number.
              SOCIAL_SECURITY_NUMBER =
                T.let(
                  :social_security_number,
                  Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # An individual taxpayer identification number (ITIN).
              INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                T.let(
                  :individual_taxpayer_identification_number,
                  Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol
                )

              # A passport number.
              PASSPORT =
                T.let(:passport, Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol)

              # A driver's license number.
              DRIVERS_LICENSE =
                T.let(:drivers_license, Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol)

              # Another identifying document.
              OTHER = T.let(:other, Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol)

              sig do
                override
                  .returns(T::Array[Increase::Models::Entity::Joint::Individual::Identification::Method::TaggedSymbol])
              end
              def self.values
              end
            end
          end
        end
      end

      class NaturalPerson < Increase::Internal::Type::BaseModel
        # The person's address.
        sig { returns(Increase::Models::Entity::NaturalPerson::Address) }
        attr_reader :address

        sig { params(address: T.any(Increase::Models::Entity::NaturalPerson::Address, Increase::Internal::AnyHash)).void }
        attr_writer :address

        # The person's date of birth in YYYY-MM-DD format.
        sig { returns(Date) }
        attr_accessor :date_of_birth

        # A means of verifying the person's identity.
        sig { returns(Increase::Models::Entity::NaturalPerson::Identification) }
        attr_reader :identification

        sig do
          params(
            identification: T.any(Increase::Models::Entity::NaturalPerson::Identification, Increase::Internal::AnyHash)
          )
            .void
        end
        attr_writer :identification

        # The person's legal name.
        sig { returns(String) }
        attr_accessor :name

        # Details of the natural person entity. Will be present if `structure` is equal to
        #   `natural_person`.
        sig do
          params(
            address: T.any(Increase::Models::Entity::NaturalPerson::Address, Increase::Internal::AnyHash),
            date_of_birth: Date,
            identification: T.any(Increase::Models::Entity::NaturalPerson::Identification, Increase::Internal::AnyHash),
            name: String
          )
            .returns(T.attached_class)
        end
        def self.new(address:, date_of_birth:, identification:, name:)
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::Entity::NaturalPerson::Address,
                date_of_birth: Date,
                identification: Increase::Models::Entity::NaturalPerson::Identification,
                name: String
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address.
          sig { returns(String) }
          attr_accessor :line1

          # The second line of the address.
          sig { returns(T.nilable(String)) }
          attr_accessor :line2

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          #   the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The person's address.
          sig do
            params(city: String, line1: String, line2: T.nilable(String), state: String, zip: String)
              .returns(T.attached_class)
          end
          def self.new(city:, line1:, line2:, state:, zip:)
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                line2: T.nilable(String),
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
          sig { returns(Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol) }
          attr_accessor :method_

          # The last 4 digits of the identification number that can be used to verify the
          #   individual's identity.
          sig { returns(String) }
          attr_accessor :number_last4

          # A means of verifying the person's identity.
          sig do
            params(
              method_: Increase::Models::Entity::NaturalPerson::Identification::Method::OrSymbol,
              number_last4: String
            )
              .returns(T.attached_class)
          end
          def self.new(method_:, number_last4:)
          end

          sig do
            override
              .returns(
                {method_: Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol, number_last4: String}
              )
          end
          def to_hash
          end

          # A method that can be used to verify the individual's identity.
          module Method
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::Entity::NaturalPerson::Identification::Method) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol) }

            # A social security number.
            SOCIAL_SECURITY_NUMBER =
              T.let(
                :social_security_number,
                Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # An individual taxpayer identification number (ITIN).
            INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
              T.let(
                :individual_taxpayer_identification_number,
                Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # A passport number.
            PASSPORT =
              T.let(:passport, Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol)

            # A driver's license number.
            DRIVERS_LICENSE =
              T.let(:drivers_license, Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol)

            # Another identifying document.
            OTHER = T.let(:other, Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol)

            sig { override.returns(T::Array[Increase::Models::Entity::NaturalPerson::Identification::Method::TaggedSymbol]) }
            def self.values
            end
          end
        end
      end

      # The status of the entity.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Entity::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::Entity::Status::TaggedSymbol) }

        # The entity is active.
        ACTIVE = T.let(:active, Increase::Models::Entity::Status::TaggedSymbol)

        # The entity is archived, and can no longer be used to create accounts.
        ARCHIVED = T.let(:archived, Increase::Models::Entity::Status::TaggedSymbol)

        # The entity is temporarily disabled and cannot be used for financial activity.
        DISABLED = T.let(:disabled, Increase::Models::Entity::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::Entity::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # The entity's legal structure.
      module Structure
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Entity::Structure) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::Entity::Structure::TaggedSymbol) }

        # A corporation.
        CORPORATION = T.let(:corporation, Increase::Models::Entity::Structure::TaggedSymbol)

        # An individual person.
        NATURAL_PERSON = T.let(:natural_person, Increase::Models::Entity::Structure::TaggedSymbol)

        # Multiple individual people.
        JOINT = T.let(:joint, Increase::Models::Entity::Structure::TaggedSymbol)

        # A trust.
        TRUST = T.let(:trust, Increase::Models::Entity::Structure::TaggedSymbol)

        # A government authority.
        GOVERNMENT_AUTHORITY = T.let(:government_authority, Increase::Models::Entity::Structure::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::Entity::Structure::TaggedSymbol]) }
        def self.values
        end
      end

      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        # The reference identifier for the third party verification.
        sig { returns(String) }
        attr_accessor :reference

        # The vendor that was used to perform the verification.
        sig { returns(Increase::Models::Entity::ThirdPartyVerification::Vendor::TaggedSymbol) }
        attr_accessor :vendor

        # A reference to data stored in a third-party verification service. Your
        #   integration may or may not use this field.
        sig do
          params(reference: String, vendor: Increase::Models::Entity::ThirdPartyVerification::Vendor::OrSymbol)
            .returns(T.attached_class)
        end
        def self.new(reference:, vendor:)
        end

        sig do
          override
            .returns(
              {reference: String, vendor: Increase::Models::Entity::ThirdPartyVerification::Vendor::TaggedSymbol}
            )
        end
        def to_hash
        end

        # The vendor that was used to perform the verification.
        module Vendor
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Entity::ThirdPartyVerification::Vendor) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::Entity::ThirdPartyVerification::Vendor::TaggedSymbol) }

          # Alloy. See https://alloy.com for more information.
          ALLOY = T.let(:alloy, Increase::Models::Entity::ThirdPartyVerification::Vendor::TaggedSymbol)

          # Middesk. See https://middesk.com for more information.
          MIDDESK = T.let(:middesk, Increase::Models::Entity::ThirdPartyVerification::Vendor::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::Entity::ThirdPartyVerification::Vendor::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class Trust < Increase::Internal::Type::BaseModel
        # The trust's address.
        sig { returns(Increase::Models::Entity::Trust::Address) }
        attr_reader :address

        sig { params(address: T.any(Increase::Models::Entity::Trust::Address, Increase::Internal::AnyHash)).void }
        attr_writer :address

        # Whether the trust is `revocable` or `irrevocable`.
        sig { returns(Increase::Models::Entity::Trust::Category::TaggedSymbol) }
        attr_accessor :category

        # The ID for the File containing the formation document of the trust.
        sig { returns(T.nilable(String)) }
        attr_accessor :formation_document_file_id

        # The two-letter United States Postal Service (USPS) abbreviation for the state in
        #   which the trust was formed.
        sig { returns(T.nilable(String)) }
        attr_accessor :formation_state

        # The grantor of the trust. Will be present if the `category` is `revocable`.
        sig { returns(T.nilable(Increase::Models::Entity::Trust::Grantor)) }
        attr_reader :grantor

        sig do
          params(grantor: T.nilable(T.any(Increase::Models::Entity::Trust::Grantor, Increase::Internal::AnyHash)))
            .void
        end
        attr_writer :grantor

        # The trust's name.
        sig { returns(String) }
        attr_accessor :name

        # The Employer Identification Number (EIN) of the trust itself.
        sig { returns(T.nilable(String)) }
        attr_accessor :tax_identifier

        # The trustees of the trust.
        sig { returns(T::Array[Increase::Models::Entity::Trust::Trustee]) }
        attr_accessor :trustees

        # Details of the trust entity. Will be present if `structure` is equal to `trust`.
        sig do
          params(
            address: T.any(Increase::Models::Entity::Trust::Address, Increase::Internal::AnyHash),
            category: Increase::Models::Entity::Trust::Category::OrSymbol,
            formation_document_file_id: T.nilable(String),
            formation_state: T.nilable(String),
            grantor: T.nilable(T.any(Increase::Models::Entity::Trust::Grantor, Increase::Internal::AnyHash)),
            name: String,
            tax_identifier: T.nilable(String),
            trustees: T::Array[T.any(Increase::Models::Entity::Trust::Trustee, Increase::Internal::AnyHash)]
          )
            .returns(T.attached_class)
        end
        def self.new(
          address:,
          category:,
          formation_document_file_id:,
          formation_state:,
          grantor:,
          name:,
          tax_identifier:,
          trustees:
        )
        end

        sig do
          override
            .returns(
              {
                address: Increase::Models::Entity::Trust::Address,
                category: Increase::Models::Entity::Trust::Category::TaggedSymbol,
                formation_document_file_id: T.nilable(String),
                formation_state: T.nilable(String),
                grantor: T.nilable(Increase::Models::Entity::Trust::Grantor),
                name: String,
                tax_identifier: T.nilable(String),
                trustees: T::Array[Increase::Models::Entity::Trust::Trustee]
              }
            )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address.
          sig { returns(String) }
          attr_accessor :line1

          # The second line of the address.
          sig { returns(T.nilable(String)) }
          attr_accessor :line2

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          #   the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The trust's address.
          sig do
            params(city: String, line1: String, line2: T.nilable(String), state: String, zip: String)
              .returns(T.attached_class)
          end
          def self.new(city:, line1:, line2:, state:, zip:)
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                line2: T.nilable(String),
                state: String,
                zip: String
              }
            )
          end
          def to_hash
          end
        end

        # Whether the trust is `revocable` or `irrevocable`.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Entity::Trust::Category) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::Entity::Trust::Category::TaggedSymbol) }

          # The trust is revocable by the grantor.
          REVOCABLE = T.let(:revocable, Increase::Models::Entity::Trust::Category::TaggedSymbol)

          # The trust cannot be revoked.
          IRREVOCABLE = T.let(:irrevocable, Increase::Models::Entity::Trust::Category::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::Entity::Trust::Category::TaggedSymbol]) }
          def self.values
          end
        end

        class Grantor < Increase::Internal::Type::BaseModel
          # The person's address.
          sig { returns(Increase::Models::Entity::Trust::Grantor::Address) }
          attr_reader :address

          sig { params(address: T.any(Increase::Models::Entity::Trust::Grantor::Address, Increase::Internal::AnyHash)).void }
          attr_writer :address

          # The person's date of birth in YYYY-MM-DD format.
          sig { returns(Date) }
          attr_accessor :date_of_birth

          # A means of verifying the person's identity.
          sig { returns(Increase::Models::Entity::Trust::Grantor::Identification) }
          attr_reader :identification

          sig do
            params(
              identification: T.any(Increase::Models::Entity::Trust::Grantor::Identification, Increase::Internal::AnyHash)
            )
              .void
          end
          attr_writer :identification

          # The person's legal name.
          sig { returns(String) }
          attr_accessor :name

          # The grantor of the trust. Will be present if the `category` is `revocable`.
          sig do
            params(
              address: T.any(Increase::Models::Entity::Trust::Grantor::Address, Increase::Internal::AnyHash),
              date_of_birth: Date,
              identification: T.any(Increase::Models::Entity::Trust::Grantor::Identification, Increase::Internal::AnyHash),
              name: String
            )
              .returns(T.attached_class)
          end
          def self.new(address:, date_of_birth:, identification:, name:)
          end

          sig do
            override
              .returns(
                {
                  address: Increase::Models::Entity::Trust::Grantor::Address,
                  date_of_birth: Date,
                  identification: Increase::Models::Entity::Trust::Grantor::Identification,
                  name: String
                }
              )
          end
          def to_hash
          end

          class Address < Increase::Internal::Type::BaseModel
            # The city of the address.
            sig { returns(String) }
            attr_accessor :city

            # The first line of the address.
            sig { returns(String) }
            attr_accessor :line1

            # The second line of the address.
            sig { returns(T.nilable(String)) }
            attr_accessor :line2

            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            #   the address.
            sig { returns(String) }
            attr_accessor :state

            # The ZIP code of the address.
            sig { returns(String) }
            attr_accessor :zip

            # The person's address.
            sig do
              params(city: String, line1: String, line2: T.nilable(String), state: String, zip: String)
                .returns(T.attached_class)
            end
            def self.new(city:, line1:, line2:, state:, zip:)
            end

            sig do
              override.returns(
                {
                  city: String,
                  line1: String,
                  line2: T.nilable(String),
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
            sig { returns(Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol) }
            attr_accessor :method_

            # The last 4 digits of the identification number that can be used to verify the
            #   individual's identity.
            sig { returns(String) }
            attr_accessor :number_last4

            # A means of verifying the person's identity.
            sig do
              params(
                method_: Increase::Models::Entity::Trust::Grantor::Identification::Method::OrSymbol,
                number_last4: String
              )
                .returns(T.attached_class)
            end
            def self.new(method_:, number_last4:)
            end

            sig do
              override
                .returns(
                  {
                    method_: Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol,
                    number_last4: String
                  }
                )
            end
            def to_hash
            end

            # A method that can be used to verify the individual's identity.
            module Method
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Increase::Models::Entity::Trust::Grantor::Identification::Method) }
              OrSymbol =
                T.type_alias { T.any(Symbol, String, Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol) }

              # A social security number.
              SOCIAL_SECURITY_NUMBER =
                T.let(
                  :social_security_number,
                  Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # An individual taxpayer identification number (ITIN).
              INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                T.let(
                  :individual_taxpayer_identification_number,
                  Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # A passport number.
              PASSPORT =
                T.let(:passport, Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol)

              # A driver's license number.
              DRIVERS_LICENSE =
                T.let(:drivers_license, Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol)

              # Another identifying document.
              OTHER = T.let(:other, Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol)

              sig { override.returns(T::Array[Increase::Models::Entity::Trust::Grantor::Identification::Method::TaggedSymbol]) }
              def self.values
              end
            end
          end
        end

        class Trustee < Increase::Internal::Type::BaseModel
          # The individual trustee of the trust. Will be present if the trustee's
          #   `structure` is equal to `individual`.
          sig { returns(T.nilable(Increase::Models::Entity::Trust::Trustee::Individual)) }
          attr_reader :individual

          sig do
            params(
              individual: T.nilable(T.any(Increase::Models::Entity::Trust::Trustee::Individual, Increase::Internal::AnyHash))
            )
              .void
          end
          attr_writer :individual

          # The structure of the trustee. Will always be equal to `individual`.
          sig { returns(Increase::Models::Entity::Trust::Trustee::Structure::TaggedSymbol) }
          attr_accessor :structure

          sig do
            params(
              individual: T.nilable(T.any(Increase::Models::Entity::Trust::Trustee::Individual, Increase::Internal::AnyHash)),
              structure: Increase::Models::Entity::Trust::Trustee::Structure::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(individual:, structure:)
          end

          sig do
            override
              .returns(
                {
                  individual: T.nilable(Increase::Models::Entity::Trust::Trustee::Individual),
                  structure: Increase::Models::Entity::Trust::Trustee::Structure::TaggedSymbol
                }
              )
          end
          def to_hash
          end

          class Individual < Increase::Internal::Type::BaseModel
            # The person's address.
            sig { returns(Increase::Models::Entity::Trust::Trustee::Individual::Address) }
            attr_reader :address

            sig do
              params(
                address: T.any(Increase::Models::Entity::Trust::Trustee::Individual::Address, Increase::Internal::AnyHash)
              )
                .void
            end
            attr_writer :address

            # The person's date of birth in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :date_of_birth

            # A means of verifying the person's identity.
            sig { returns(Increase::Models::Entity::Trust::Trustee::Individual::Identification) }
            attr_reader :identification

            sig do
              params(
                identification: T.any(Increase::Models::Entity::Trust::Trustee::Individual::Identification, Increase::Internal::AnyHash)
              )
                .void
            end
            attr_writer :identification

            # The person's legal name.
            sig { returns(String) }
            attr_accessor :name

            # The individual trustee of the trust. Will be present if the trustee's
            #   `structure` is equal to `individual`.
            sig do
              params(
                address: T.any(Increase::Models::Entity::Trust::Trustee::Individual::Address, Increase::Internal::AnyHash),
                date_of_birth: Date,
                identification: T.any(Increase::Models::Entity::Trust::Trustee::Individual::Identification, Increase::Internal::AnyHash),
                name: String
              )
                .returns(T.attached_class)
            end
            def self.new(address:, date_of_birth:, identification:, name:)
            end

            sig do
              override
                .returns(
                  {
                    address: Increase::Models::Entity::Trust::Trustee::Individual::Address,
                    date_of_birth: Date,
                    identification: Increase::Models::Entity::Trust::Trustee::Individual::Identification,
                    name: String
                  }
                )
            end
            def to_hash
            end

            class Address < Increase::Internal::Type::BaseModel
              # The city of the address.
              sig { returns(String) }
              attr_accessor :city

              # The first line of the address.
              sig { returns(String) }
              attr_accessor :line1

              # The second line of the address.
              sig { returns(T.nilable(String)) }
              attr_accessor :line2

              # The two-letter United States Postal Service (USPS) abbreviation for the state of
              #   the address.
              sig { returns(String) }
              attr_accessor :state

              # The ZIP code of the address.
              sig { returns(String) }
              attr_accessor :zip

              # The person's address.
              sig do
                params(city: String, line1: String, line2: T.nilable(String), state: String, zip: String)
                  .returns(T.attached_class)
              end
              def self.new(city:, line1:, line2:, state:, zip:)
              end

              sig do
                override.returns(
                  {
                    city: String,
                    line1: String,
                    line2: T.nilable(String),
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
              sig { returns(Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol) }
              attr_accessor :method_

              # The last 4 digits of the identification number that can be used to verify the
              #   individual's identity.
              sig { returns(String) }
              attr_accessor :number_last4

              # A means of verifying the person's identity.
              sig do
                params(
                  method_: Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::OrSymbol,
                  number_last4: String
                )
                  .returns(T.attached_class)
              end
              def self.new(method_:, number_last4:)
              end

              sig do
                override
                  .returns(
                    {
                      method_: Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol,
                      number_last4: String
                    }
                  )
              end
              def to_hash
              end

              # A method that can be used to verify the individual's identity.
              module Method
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                    )
                  end

                # A social security number.
                SOCIAL_SECURITY_NUMBER =
                  T.let(
                    :social_security_number,
                    Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # An individual taxpayer identification number (ITIN).
                INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                  T.let(
                    :individual_taxpayer_identification_number,
                    Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # A passport number.
                PASSPORT =
                  T.let(
                    :passport,
                    Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # A driver's license number.
                DRIVERS_LICENSE =
                  T.let(
                    :drivers_license,
                    Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # Another identifying document.
                OTHER =
                  T.let(:other, Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol)

                sig do
                  override
                    .returns(
                      T::Array[Increase::Models::Entity::Trust::Trustee::Individual::Identification::Method::TaggedSymbol]
                    )
                end
                def self.values
                end
              end
            end
          end

          # The structure of the trustee. Will always be equal to `individual`.
          module Structure
            extend Increase::Internal::Type::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Entity::Trust::Trustee::Structure) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::Entity::Trust::Trustee::Structure::TaggedSymbol) }

            # The trustee is an individual.
            INDIVIDUAL = T.let(:individual, Increase::Models::Entity::Trust::Trustee::Structure::TaggedSymbol)

            sig { override.returns(T::Array[Increase::Models::Entity::Trust::Trustee::Structure::TaggedSymbol]) }
            def self.values
            end
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `entity`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Entity::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::Entity::Type::TaggedSymbol) }

        ENTITY = T.let(:entity, Increase::Models::Entity::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::Entity::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
