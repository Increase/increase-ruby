# typed: strong

module Increase
  module Models
    class EntityBeneficialOwner < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::EntityBeneficialOwner, Increase::Internal::AnyHash)
        end

      # The identifier of this beneficial owner.
      sig { returns(String) }
      attr_accessor :id

      # This person's role or title within the entity.
      sig { returns(T.nilable(String)) }
      attr_accessor :company_title

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
      # Beneficial Owner was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Personal details for the beneficial owner.
      sig { returns(Increase::EntityBeneficialOwner::Individual) }
      attr_reader :individual

      sig do
        params(
          individual: Increase::EntityBeneficialOwner::Individual::OrHash
        ).void
      end
      attr_writer :individual

      # Why this person is considered a beneficial owner of the entity.
      sig do
        returns(T::Array[Increase::EntityBeneficialOwner::Prong::TaggedSymbol])
      end
      attr_accessor :prongs

      # A constant representing the object's type. For this resource it will always be
      # `entity_beneficial_owner`.
      sig { returns(Increase::EntityBeneficialOwner::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          company_title: T.nilable(String),
          created_at: Time,
          individual: Increase::EntityBeneficialOwner::Individual::OrHash,
          prongs: T::Array[Increase::EntityBeneficialOwner::Prong::OrSymbol],
          type: Increase::EntityBeneficialOwner::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of this beneficial owner.
        id:,
        # This person's role or title within the entity.
        company_title:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
        # Beneficial Owner was created.
        created_at:,
        # Personal details for the beneficial owner.
        individual:,
        # Why this person is considered a beneficial owner of the entity.
        prongs:,
        # A constant representing the object's type. For this resource it will always be
        # `entity_beneficial_owner`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            company_title: T.nilable(String),
            created_at: Time,
            individual: Increase::EntityBeneficialOwner::Individual,
            prongs:
              T::Array[Increase::EntityBeneficialOwner::Prong::TaggedSymbol],
            type: Increase::EntityBeneficialOwner::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Individual < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityBeneficialOwner::Individual,
              Increase::Internal::AnyHash
            )
          end

        # The person's address.
        sig { returns(Increase::EntityBeneficialOwner::Individual::Address) }
        attr_reader :address

        sig do
          params(
            address:
              Increase::EntityBeneficialOwner::Individual::Address::OrHash
          ).void
        end
        attr_writer :address

        # The person's date of birth in YYYY-MM-DD format.
        sig { returns(Date) }
        attr_accessor :date_of_birth

        # A means of verifying the person's identity.
        sig do
          returns(Increase::EntityBeneficialOwner::Individual::Identification)
        end
        attr_reader :identification

        sig do
          params(
            identification:
              Increase::EntityBeneficialOwner::Individual::Identification::OrHash
          ).void
        end
        attr_writer :identification

        # The person's legal name.
        sig { returns(String) }
        attr_accessor :name

        # Personal details for the beneficial owner.
        sig do
          params(
            address:
              Increase::EntityBeneficialOwner::Individual::Address::OrHash,
            date_of_birth: Date,
            identification:
              Increase::EntityBeneficialOwner::Individual::Identification::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The person's address.
          address:,
          # The person's date of birth in YYYY-MM-DD format.
          date_of_birth:,
          # A means of verifying the person's identity.
          identification:,
          # The person's legal name.
          name:
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityBeneficialOwner::Individual::Address,
              date_of_birth: Date,
              identification:
                Increase::EntityBeneficialOwner::Individual::Identification,
              name: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityBeneficialOwner::Individual::Address,
                Increase::Internal::AnyHash
              )
            end

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
          # state, province, or region of the address.
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
            ).returns(T.attached_class)
          end
          def self.new(
            # The city, district, town, or village of the address.
            city:,
            # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
            country:,
            # The first line of the address.
            line1:,
            # The second line of the address.
            line2:,
            # The two-letter United States Postal Service (USPS) abbreviation for the US
            # state, province, or region of the address.
            state:,
            # The ZIP or postal code of the address.
            zip:
          )
          end

          sig do
            override.returns(
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
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityBeneficialOwner::Individual::Identification,
                Increase::Internal::AnyHash
              )
            end

          # A method that can be used to verify the individual's identity.
          sig do
            returns(
              Increase::EntityBeneficialOwner::Individual::Identification::Method::TaggedSymbol
            )
          end
          attr_accessor :method_

          # The last 4 digits of the identification number that can be used to verify the
          # individual's identity.
          sig { returns(String) }
          attr_accessor :number_last4

          # A means of verifying the person's identity.
          sig do
            params(
              method_:
                Increase::EntityBeneficialOwner::Individual::Identification::Method::OrSymbol,
              number_last4: String
            ).returns(T.attached_class)
          end
          def self.new(
            # A method that can be used to verify the individual's identity.
            method_:,
            # The last 4 digits of the identification number that can be used to verify the
            # individual's identity.
            number_last4:
          )
          end

          sig do
            override.returns(
              {
                method_:
                  Increase::EntityBeneficialOwner::Individual::Identification::Method::TaggedSymbol,
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
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::EntityBeneficialOwner::Individual::Identification::Method
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A social security number.
            SOCIAL_SECURITY_NUMBER =
              T.let(
                :social_security_number,
                Increase::EntityBeneficialOwner::Individual::Identification::Method::TaggedSymbol
              )

            # An individual taxpayer identification number (ITIN).
            INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
              T.let(
                :individual_taxpayer_identification_number,
                Increase::EntityBeneficialOwner::Individual::Identification::Method::TaggedSymbol
              )

            # A passport number.
            PASSPORT =
              T.let(
                :passport,
                Increase::EntityBeneficialOwner::Individual::Identification::Method::TaggedSymbol
              )

            # A driver's license number.
            DRIVERS_LICENSE =
              T.let(
                :drivers_license,
                Increase::EntityBeneficialOwner::Individual::Identification::Method::TaggedSymbol
              )

            # Another identifying document.
            OTHER =
              T.let(
                :other,
                Increase::EntityBeneficialOwner::Individual::Identification::Method::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::EntityBeneficialOwner::Individual::Identification::Method::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      module Prong
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::EntityBeneficialOwner::Prong) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A person with 25% or greater direct or indirect ownership of the entity.
        OWNERSHIP =
          T.let(
            :ownership,
            Increase::EntityBeneficialOwner::Prong::TaggedSymbol
          )

        # A person who manages, directs, or has significant control of the entity.
        CONTROL =
          T.let(:control, Increase::EntityBeneficialOwner::Prong::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::EntityBeneficialOwner::Prong::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `entity_beneficial_owner`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::EntityBeneficialOwner::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENTITY_BENEFICIAL_OWNER =
          T.let(
            :entity_beneficial_owner,
            Increase::EntityBeneficialOwner::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::EntityBeneficialOwner::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
