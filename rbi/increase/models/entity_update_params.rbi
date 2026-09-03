# typed: strong

module Increase
  module Models
    class EntityUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::EntityUpdateParams, Increase::Internal::AnyHash)
        end

      # The entity identifier.
      sig { returns(String) }
      attr_accessor :entity_id

      # Details of the corporation entity to update. If you specify this parameter and
      # the entity is not a corporation, the request will fail.
      sig { returns(T.nilable(Increase::EntityUpdateParams::Corporation)) }
      attr_reader :corporation

      sig do
        params(
          corporation: Increase::EntityUpdateParams::Corporation::OrHash
        ).void
      end
      attr_writer :corporation

      # When your user last confirmed the Entity's details. Depending on your program,
      # you may be required to affirmatively confirm details with your users on an
      # annual basis.
      sig { returns(T.nilable(Time)) }
      attr_reader :details_confirmed_at

      sig { params(details_confirmed_at: Time).void }
      attr_writer :details_confirmed_at

      # Details of the government authority entity to update. If you specify this
      # parameter and the entity is not a government authority, the request will fail.
      sig do
        returns(T.nilable(Increase::EntityUpdateParams::GovernmentAuthority))
      end
      attr_reader :government_authority

      sig do
        params(
          government_authority:
            Increase::EntityUpdateParams::GovernmentAuthority::OrHash
        ).void
      end
      attr_writer :government_authority

      # Details of the natural person entity to update. If you specify this parameter
      # and the entity is not a natural person, the request will fail.
      sig { returns(T.nilable(Increase::EntityUpdateParams::NaturalPerson)) }
      attr_reader :natural_person

      sig do
        params(
          natural_person: Increase::EntityUpdateParams::NaturalPerson::OrHash
        ).void
      end
      attr_writer :natural_person

      # An assessment of the entity’s potential risk of involvement in financial crimes,
      # such as money laundering.
      sig { returns(T.nilable(Increase::EntityUpdateParams::RiskRating)) }
      attr_reader :risk_rating

      sig do
        params(
          risk_rating: Increase::EntityUpdateParams::RiskRating::OrHash
        ).void
      end
      attr_writer :risk_rating

      # Details of the sole proprietorship entity to update. If you specify this
      # parameter and the entity is not a sole proprietorship, the request will fail.
      sig do
        returns(T.nilable(Increase::EntityUpdateParams::SoleProprietorship))
      end
      attr_reader :sole_proprietorship

      sig do
        params(
          sole_proprietorship:
            Increase::EntityUpdateParams::SoleProprietorship::OrHash
        ).void
      end
      attr_writer :sole_proprietorship

      # New terms that the Entity agreed to. Not all programs are required to submit
      # this data. This will not archive previously submitted terms.
      sig do
        returns(
          T.nilable(T::Array[Increase::EntityUpdateParams::TermsAgreement])
        )
      end
      attr_reader :terms_agreements

      sig do
        params(
          terms_agreements:
            T::Array[Increase::EntityUpdateParams::TermsAgreement::OrHash]
        ).void
      end
      attr_writer :terms_agreements

      # If you are using a third-party service for identity verification, you can use
      # this field to associate this Entity with the identifier that represents them in
      # that service.
      sig do
        returns(T.nilable(Increase::EntityUpdateParams::ThirdPartyVerification))
      end
      attr_reader :third_party_verification

      sig do
        params(
          third_party_verification:
            Increase::EntityUpdateParams::ThirdPartyVerification::OrHash
        ).void
      end
      attr_writer :third_party_verification

      # Details of the trust entity to update. If you specify this parameter and the
      # entity is not a trust, the request will fail.
      sig { returns(T.nilable(Increase::EntityUpdateParams::Trust)) }
      attr_reader :trust

      sig { params(trust: Increase::EntityUpdateParams::Trust::OrHash).void }
      attr_writer :trust

      sig do
        params(
          entity_id: String,
          corporation: Increase::EntityUpdateParams::Corporation::OrHash,
          details_confirmed_at: Time,
          government_authority:
            Increase::EntityUpdateParams::GovernmentAuthority::OrHash,
          natural_person: Increase::EntityUpdateParams::NaturalPerson::OrHash,
          risk_rating: Increase::EntityUpdateParams::RiskRating::OrHash,
          sole_proprietorship:
            Increase::EntityUpdateParams::SoleProprietorship::OrHash,
          terms_agreements:
            T::Array[Increase::EntityUpdateParams::TermsAgreement::OrHash],
          third_party_verification:
            Increase::EntityUpdateParams::ThirdPartyVerification::OrHash,
          trust: Increase::EntityUpdateParams::Trust::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The entity identifier.
        entity_id:,
        # Details of the corporation entity to update. If you specify this parameter and
        # the entity is not a corporation, the request will fail.
        corporation: nil,
        # When your user last confirmed the Entity's details. Depending on your program,
        # you may be required to affirmatively confirm details with your users on an
        # annual basis.
        details_confirmed_at: nil,
        # Details of the government authority entity to update. If you specify this
        # parameter and the entity is not a government authority, the request will fail.
        government_authority: nil,
        # Details of the natural person entity to update. If you specify this parameter
        # and the entity is not a natural person, the request will fail.
        natural_person: nil,
        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        risk_rating: nil,
        # Details of the sole proprietorship entity to update. If you specify this
        # parameter and the entity is not a sole proprietorship, the request will fail.
        sole_proprietorship: nil,
        # New terms that the Entity agreed to. Not all programs are required to submit
        # this data. This will not archive previously submitted terms.
        terms_agreements: nil,
        # If you are using a third-party service for identity verification, you can use
        # this field to associate this Entity with the identifier that represents them in
        # that service.
        third_party_verification: nil,
        # Details of the trust entity to update. If you specify this parameter and the
        # entity is not a trust, the request will fail.
        trust: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            entity_id: String,
            corporation: Increase::EntityUpdateParams::Corporation,
            details_confirmed_at: Time,
            government_authority:
              Increase::EntityUpdateParams::GovernmentAuthority,
            natural_person: Increase::EntityUpdateParams::NaturalPerson,
            risk_rating: Increase::EntityUpdateParams::RiskRating,
            sole_proprietorship:
              Increase::EntityUpdateParams::SoleProprietorship,
            terms_agreements:
              T::Array[Increase::EntityUpdateParams::TermsAgreement],
            third_party_verification:
              Increase::EntityUpdateParams::ThirdPartyVerification,
            trust: Increase::EntityUpdateParams::Trust,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Corporation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::Corporation,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig do
          returns(T.nilable(Increase::EntityUpdateParams::Corporation::Address))
        end
        attr_reader :address

        sig do
          params(
            address: Increase::EntityUpdateParams::Corporation::Address::OrHash
          ).void
        end
        attr_writer :address

        # An email address for the business. Not every program requires an email for
        # submitted Entities.
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

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

        # The legal identifier of the corporation. This is usually the Employer
        # Identification Number (EIN).
        sig do
          returns(
            T.nilable(
              Increase::EntityUpdateParams::Corporation::LegalIdentifier
            )
          )
        end
        attr_reader :legal_identifier

        sig do
          params(
            legal_identifier:
              Increase::EntityUpdateParams::Corporation::LegalIdentifier::OrHash
          ).void
        end
        attr_writer :legal_identifier

        # The legal name of the corporation.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # A website for the business. Not every program requires a website for submitted
        # Entities.
        sig { returns(T.nilable(String)) }
        attr_reader :website

        sig { params(website: String).void }
        attr_writer :website

        # Details of the corporation entity to update. If you specify this parameter and
        # the entity is not a corporation, the request will fail.
        sig do
          params(
            address: Increase::EntityUpdateParams::Corporation::Address::OrHash,
            email: String,
            incorporation_state: String,
            industry_code: String,
            legal_identifier:
              Increase::EntityUpdateParams::Corporation::LegalIdentifier::OrHash,
            name: String,
            website: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address: nil,
          # An email address for the business. Not every program requires an email for
          # submitted Entities.
          email: nil,
          # The two-letter United States Postal Service (USPS) abbreviation for the
          # corporation's state of incorporation.
          incorporation_state: nil,
          # The North American Industry Classification System (NAICS) code for the
          # corporation's primary line of business. This is a number, like `5132` for
          # `Software Publishers`. A full list of classification codes is available
          # [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
          industry_code: nil,
          # The legal identifier of the corporation. This is usually the Employer
          # Identification Number (EIN).
          legal_identifier: nil,
          # The legal name of the corporation.
          name: nil,
          # A website for the business. Not every program requires a website for submitted
          # Entities.
          website: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityUpdateParams::Corporation::Address,
              email: String,
              incorporation_state: String,
              industry_code: String,
              legal_identifier:
                Increase::EntityUpdateParams::Corporation::LegalIdentifier,
              name: String,
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
                Increase::EntityUpdateParams::Corporation::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city, district, town, or village of the address.
          sig { returns(String) }
          attr_accessor :city

          # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
          #
          # Defaults to `US`.
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

          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
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
            #
            # Defaults to `US`.
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

        class LegalIdentifier < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::Corporation::LegalIdentifier,
                Increase::Internal::AnyHash
              )
            end

          # The legal identifier itself. For US Employer Identification Numbers, submit nine
          # digits with no dashes or other separators.
          sig { returns(String) }
          attr_accessor :value

          # The category of the legal identifier.
          #
          # Defaults to `us_employer_identification_number`.
          sig do
            returns(
              T.nilable(
                Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category::OrSymbol
              )
            )
          end
          attr_reader :category

          sig do
            params(
              category:
                Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category::OrSymbol
            ).void
          end
          attr_writer :category

          # The legal identifier of the corporation. This is usually the Employer
          # Identification Number (EIN).
          sig do
            params(
              value: String,
              category:
                Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The legal identifier itself. For US Employer Identification Numbers, submit nine
            # digits with no dashes or other separators.
            value:,
            # The category of the legal identifier.
            #
            # Defaults to `us_employer_identification_number`.
            category: nil
          )
          end

          sig do
            override.returns(
              {
                value: String,
                category:
                  Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category::OrSymbol
              }
            )
          end
          def to_hash
          end

          # The category of the legal identifier.
          #
          # Defaults to `us_employer_identification_number`.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The Employer Identification Number (EIN) for the company. The EIN is a 9-digit number assigned by the IRS; submit it as nine digits with no dashes or other separators.
            US_EMPLOYER_IDENTIFICATION_NUMBER =
              T.let(
                :us_employer_identification_number,
                Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category::TaggedSymbol
              )

            # A legal identifier issued by a foreign government, like a tax identification number or registration number.
            OTHER =
              T.let(
                :other,
                Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::EntityUpdateParams::Corporation::LegalIdentifier::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::GovernmentAuthority,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig do
          returns(
            T.nilable(
              Increase::EntityUpdateParams::GovernmentAuthority::Address
            )
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::EntityUpdateParams::GovernmentAuthority::Address::OrHash
          ).void
        end
        attr_writer :address

        # The legal name of the government authority.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Details of the government authority entity to update. If you specify this
        # parameter and the entity is not a government authority, the request will fail.
        sig do
          params(
            address:
              Increase::EntityUpdateParams::GovernmentAuthority::Address::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address: nil,
          # The legal name of the government authority.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              address:
                Increase::EntityUpdateParams::GovernmentAuthority::Address,
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
                Increase::EntityUpdateParams::GovernmentAuthority::Address,
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
      end

      class NaturalPerson < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::NaturalPerson,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig do
          returns(
            T.nilable(Increase::EntityUpdateParams::NaturalPerson::Address)
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::EntityUpdateParams::NaturalPerson::Address::OrHash
          ).void
        end
        attr_writer :address

        # The identification method for an individual can only be a passport, driver's
        # license, or other document if you've confirmed the individual does not have a US
        # tax id (either a Social Security Number or Individual Taxpayer Identification
        # Number).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :confirmed_no_us_tax_id

        sig { params(confirmed_no_us_tax_id: T::Boolean).void }
        attr_writer :confirmed_no_us_tax_id

        # A means of verifying the person's identity.
        sig do
          returns(
            T.nilable(
              Increase::EntityUpdateParams::NaturalPerson::Identification
            )
          )
        end
        attr_reader :identification

        sig do
          params(
            identification:
              Increase::EntityUpdateParams::NaturalPerson::Identification::OrHash
          ).void
        end
        attr_writer :identification

        # The legal name of the natural person.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Details of the natural person entity to update. If you specify this parameter
        # and the entity is not a natural person, the request will fail.
        sig do
          params(
            address:
              Increase::EntityUpdateParams::NaturalPerson::Address::OrHash,
            confirmed_no_us_tax_id: T::Boolean,
            identification:
              Increase::EntityUpdateParams::NaturalPerson::Identification::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address: nil,
          # The identification method for an individual can only be a passport, driver's
          # license, or other document if you've confirmed the individual does not have a US
          # tax id (either a Social Security Number or Individual Taxpayer Identification
          # Number).
          confirmed_no_us_tax_id: nil,
          # A means of verifying the person's identity.
          identification: nil,
          # The legal name of the natural person.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityUpdateParams::NaturalPerson::Address,
              confirmed_no_us_tax_id: T::Boolean,
              identification:
                Increase::EntityUpdateParams::NaturalPerson::Identification,
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
                Increase::EntityUpdateParams::NaturalPerson::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city, district, town, or village of the address.
          sig { returns(String) }
          attr_accessor :city

          # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
          #
          # Defaults to `US`.
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

          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
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
            #
            # Defaults to `US`.
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
                Increase::EntityUpdateParams::NaturalPerson::Identification,
                Increase::Internal::AnyHash
              )
            end

          # A method that can be used to verify the individual's identity.
          #
          # Defaults to `social_security_number`.
          sig do
            returns(
              Increase::EntityUpdateParams::NaturalPerson::Identification::Method::OrSymbol
            )
          end
          attr_accessor :method_

          # An identification number that can be used to verify the individual's identity,
          # such as a social security number. For Social Security Numbers and Individual
          # Taxpayer Identification Numbers, submit nine digits with no dashes or other
          # separators.
          sig { returns(String) }
          attr_accessor :number

          # Information about the United States driver's license used for identification.
          # Required if `method` is equal to `drivers_license`.
          sig do
            returns(
              T.nilable(
                Increase::EntityUpdateParams::NaturalPerson::Identification::DriversLicense
              )
            )
          end
          attr_reader :drivers_license

          sig do
            params(
              drivers_license:
                Increase::EntityUpdateParams::NaturalPerson::Identification::DriversLicense::OrHash
            ).void
          end
          attr_writer :drivers_license

          # Information about the identification document provided. Required if `method` is
          # equal to `other`.
          sig do
            returns(
              T.nilable(
                Increase::EntityUpdateParams::NaturalPerson::Identification::Other
              )
            )
          end
          attr_reader :other

          sig do
            params(
              other:
                Increase::EntityUpdateParams::NaturalPerson::Identification::Other::OrHash
            ).void
          end
          attr_writer :other

          # Information about the passport used for identification. Required if `method` is
          # equal to `passport`.
          sig do
            returns(
              T.nilable(
                Increase::EntityUpdateParams::NaturalPerson::Identification::Passport
              )
            )
          end
          attr_reader :passport

          sig do
            params(
              passport:
                Increase::EntityUpdateParams::NaturalPerson::Identification::Passport::OrHash
            ).void
          end
          attr_writer :passport

          # A means of verifying the person's identity.
          sig do
            params(
              method_:
                Increase::EntityUpdateParams::NaturalPerson::Identification::Method::OrSymbol,
              number: String,
              drivers_license:
                Increase::EntityUpdateParams::NaturalPerson::Identification::DriversLicense::OrHash,
              other:
                Increase::EntityUpdateParams::NaturalPerson::Identification::Other::OrHash,
              passport:
                Increase::EntityUpdateParams::NaturalPerson::Identification::Passport::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # A method that can be used to verify the individual's identity.
            #
            # Defaults to `social_security_number`.
            method_:,
            # An identification number that can be used to verify the individual's identity,
            # such as a social security number. For Social Security Numbers and Individual
            # Taxpayer Identification Numbers, submit nine digits with no dashes or other
            # separators.
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
                  Increase::EntityUpdateParams::NaturalPerson::Identification::Method::OrSymbol,
                number: String,
                drivers_license:
                  Increase::EntityUpdateParams::NaturalPerson::Identification::DriversLicense,
                other:
                  Increase::EntityUpdateParams::NaturalPerson::Identification::Other,
                passport:
                  Increase::EntityUpdateParams::NaturalPerson::Identification::Passport
              }
            )
          end
          def to_hash
          end

          # A method that can be used to verify the individual's identity.
          #
          # Defaults to `social_security_number`.
          module Method
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::EntityUpdateParams::NaturalPerson::Identification::Method
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A social security number.
            SOCIAL_SECURITY_NUMBER =
              T.let(
                :social_security_number,
                Increase::EntityUpdateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # An individual taxpayer identification number (ITIN).
            INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
              T.let(
                :individual_taxpayer_identification_number,
                Increase::EntityUpdateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # A passport number.
            PASSPORT =
              T.let(
                :passport,
                Increase::EntityUpdateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # A driver's license number.
            DRIVERS_LICENSE =
              T.let(
                :drivers_license,
                Increase::EntityUpdateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            # Another identifying document.
            OTHER =
              T.let(
                :other,
                Increase::EntityUpdateParams::NaturalPerson::Identification::Method::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::EntityUpdateParams::NaturalPerson::Identification::Method::TaggedSymbol
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
                  Increase::EntityUpdateParams::NaturalPerson::Identification::DriversLicense,
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
                  Increase::EntityUpdateParams::NaturalPerson::Identification::Other,
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
                  Increase::EntityUpdateParams::NaturalPerson::Identification::Passport,
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

      class RiskRating < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::RiskRating,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk
        # rating was performed.
        sig { returns(Time) }
        attr_accessor :rated_at

        # The rating given to this entity.
        sig do
          returns(Increase::EntityUpdateParams::RiskRating::Rating::OrSymbol)
        end
        attr_accessor :rating

        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        sig do
          params(
            rated_at: Time,
            rating: Increase::EntityUpdateParams::RiskRating::Rating::OrSymbol
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
              rating: Increase::EntityUpdateParams::RiskRating::Rating::OrSymbol
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
              T.all(Symbol, Increase::EntityUpdateParams::RiskRating::Rating)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Minimal risk of involvement in financial crime.
          LOW =
            T.let(
              :low,
              Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
            )

          # Moderate risk of involvement in financial crime.
          MEDIUM =
            T.let(
              :medium,
              Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
            )

          # Elevated risk of involvement in financial crime.
          HIGH =
            T.let(
              :high,
              Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class SoleProprietorship < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::SoleProprietorship,
              Increase::Internal::AnyHash
            )
          end

        # The sole proprietorship's business address. Mail receiving locations like PO
        # Boxes and PMB's are disallowed.
        sig do
          returns(
            T.nilable(Increase::EntityUpdateParams::SoleProprietorship::Address)
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::EntityUpdateParams::SoleProprietorship::Address::OrHash
          ).void
        end
        attr_writer :address

        # An email address for the sole proprietorship. Not every program requires an
        # email for submitted Entities.
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # Details of the individual who operates the sole proprietorship.
        sig do
          returns(
            T.nilable(
              Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor
            )
          )
        end
        attr_reader :sole_proprietor

        sig do
          params(
            sole_proprietor:
              Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::OrHash
          ).void
        end
        attr_writer :sole_proprietor

        # The United States Employer Identification Number (EIN) for the sole
        # proprietorship. Submit nine digits with no dashes or other separators.
        sig { returns(T.nilable(String)) }
        attr_reader :tax_identifier

        sig { params(tax_identifier: String).void }
        attr_writer :tax_identifier

        # A website for the sole proprietorship. Not every program requires a website for
        # submitted Entities.
        sig { returns(T.nilable(String)) }
        attr_reader :website

        sig { params(website: String).void }
        attr_writer :website

        # Details of the sole proprietorship entity to update. If you specify this
        # parameter and the entity is not a sole proprietorship, the request will fail.
        sig do
          params(
            address:
              Increase::EntityUpdateParams::SoleProprietorship::Address::OrHash,
            email: String,
            sole_proprietor:
              Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::OrHash,
            tax_identifier: String,
            website: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The sole proprietorship's business address. Mail receiving locations like PO
          # Boxes and PMB's are disallowed.
          address: nil,
          # An email address for the sole proprietorship. Not every program requires an
          # email for submitted Entities.
          email: nil,
          # Details of the individual who operates the sole proprietorship.
          sole_proprietor: nil,
          # The United States Employer Identification Number (EIN) for the sole
          # proprietorship. Submit nine digits with no dashes or other separators.
          tax_identifier: nil,
          # A website for the sole proprietorship. Not every program requires a website for
          # submitted Entities.
          website: nil
        )
        end

        sig do
          override.returns(
            {
              address:
                Increase::EntityUpdateParams::SoleProprietorship::Address,
              email: String,
              sole_proprietor:
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor,
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
                Increase::EntityUpdateParams::SoleProprietorship::Address,
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

          # The sole proprietorship's business address. Mail receiving locations like PO
          # Boxes and PMB's are disallowed.
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

        class SoleProprietor < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor,
                Increase::Internal::AnyHash
              )
            end

          # The sole proprietor's physical address. Mail receiving locations like PO Boxes
          # and PMB's are disallowed.
          sig do
            returns(
              T.nilable(
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Address
              )
            )
          end
          attr_reader :address

          sig do
            params(
              address:
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Address::OrHash
            ).void
          end
          attr_writer :address

          # A means of verifying the sole proprietor's identity. Unlike at creation, an
          # identity document is accepted here.
          sig do
            returns(
              T.nilable(
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification
              )
            )
          end
          attr_reader :identification

          sig do
            params(
              identification:
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::OrHash
            ).void
          end
          attr_writer :identification

          # The sole proprietor's legal name.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Details of the individual who operates the sole proprietorship.
          sig do
            params(
              address:
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Address::OrHash,
              identification:
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::OrHash,
              name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The sole proprietor's physical address. Mail receiving locations like PO Boxes
            # and PMB's are disallowed.
            address: nil,
            # A means of verifying the sole proprietor's identity. Unlike at creation, an
            # identity document is accepted here.
            identification: nil,
            # The sole proprietor's legal name.
            name: nil
          )
          end

          sig do
            override.returns(
              {
                address:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Address,
                identification:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification,
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
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Address,
                  Increase::Internal::AnyHash
                )
              end

            # The city, district, town, or village of the address.
            sig { returns(String) }
            attr_accessor :city

            # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
            #
            # Defaults to `US`.
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

            # The sole proprietor's physical address. Mail receiving locations like PO Boxes
            # and PMB's are disallowed.
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
              #
              # Defaults to `US`.
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
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification,
                  Increase::Internal::AnyHash
                )
              end

            # A method that can be used to verify the individual's identity.
            #
            # Defaults to `social_security_number`.
            sig do
              returns(
                Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::OrSymbol
              )
            end
            attr_accessor :method_

            # An identification number that can be used to verify the individual's identity,
            # such as a social security number. For Social Security Numbers and Individual
            # Taxpayer Identification Numbers, submit nine digits with no dashes or other
            # separators.
            sig { returns(String) }
            attr_accessor :number

            # Information about the United States driver's license used for identification.
            # Required if `method` is equal to `drivers_license`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::DriversLicense
                )
              )
            end
            attr_reader :drivers_license

            sig do
              params(
                drivers_license:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::DriversLicense::OrHash
              ).void
            end
            attr_writer :drivers_license

            # Information about the identification document provided. Required if `method` is
            # equal to `other`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Other
                )
              )
            end
            attr_reader :other

            sig do
              params(
                other:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Other::OrHash
              ).void
            end
            attr_writer :other

            # Information about the passport used for identification. Required if `method` is
            # equal to `passport`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Passport
                )
              )
            end
            attr_reader :passport

            sig do
              params(
                passport:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Passport::OrHash
              ).void
            end
            attr_writer :passport

            # A means of verifying the sole proprietor's identity. Unlike at creation, an
            # identity document is accepted here.
            sig do
              params(
                method_:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::OrSymbol,
                number: String,
                drivers_license:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::DriversLicense::OrHash,
                other:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Other::OrHash,
                passport:
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Passport::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # A method that can be used to verify the individual's identity.
              #
              # Defaults to `social_security_number`.
              method_:,
              # An identification number that can be used to verify the individual's identity,
              # such as a social security number. For Social Security Numbers and Individual
              # Taxpayer Identification Numbers, submit nine digits with no dashes or other
              # separators.
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
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license:
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::DriversLicense,
                  other:
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Other,
                  passport:
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Passport
                }
              )
            end
            def to_hash
            end

            # A method that can be used to verify the individual's identity.
            #
            # Defaults to `social_security_number`.
            module Method
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # A social security number.
              SOCIAL_SECURITY_NUMBER =
                T.let(
                  :social_security_number,
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::TaggedSymbol
                )

              # An individual taxpayer identification number (ITIN).
              INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                T.let(
                  :individual_taxpayer_identification_number,
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::TaggedSymbol
                )

              # A passport number.
              PASSPORT =
                T.let(
                  :passport,
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::TaggedSymbol
                )

              # A driver's license number.
              DRIVERS_LICENSE =
                T.let(
                  :drivers_license,
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::TaggedSymbol
                )

              # Another identifying document.
              OTHER =
                T.let(
                  :other,
                  Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Method::TaggedSymbol
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
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::DriversLicense,
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
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Other,
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
                    Increase::EntityUpdateParams::SoleProprietorship::SoleProprietor::Identification::Passport,
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
      end

      class TermsAgreement < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::TermsAgreement,
              Increase::Internal::AnyHash
            )
          end

        # The timestamp of when the Entity agreed to the terms.
        sig { returns(Time) }
        attr_accessor :agreed_at

        # The IP address the Entity reviewed the terms from.
        sig { returns(String) }
        attr_accessor :ip_address

        # The URL of the terms agreement. This link will be provided by your bank partner.
        sig { returns(String) }
        attr_accessor :terms_url

        sig do
          params(
            agreed_at: Time,
            ip_address: String,
            terms_url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The timestamp of when the Entity agreed to the terms.
          agreed_at:,
          # The IP address the Entity reviewed the terms from.
          ip_address:,
          # The URL of the terms agreement. This link will be provided by your bank partner.
          terms_url:
        )
        end

        sig do
          override.returns(
            { agreed_at: Time, ip_address: String, terms_url: String }
          )
        end
        def to_hash
        end
      end

      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::ThirdPartyVerification,
              Increase::Internal::AnyHash
            )
          end

        # The reference identifier for the third party verification.
        sig { returns(String) }
        attr_accessor :reference

        # The vendor that was used to perform the verification.
        sig do
          returns(
            Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::OrSymbol
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
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::OrSymbol
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
                Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::OrSymbol
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
                Increase::EntityUpdateParams::ThirdPartyVerification::Vendor
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Alloy. See https://alloy.com for more information.
          ALLOY =
            T.let(
              :alloy,
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          # Middesk. See https://middesk.com for more information.
          MIDDESK =
            T.let(
              :middesk,
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          # Oscilar. See https://oscilar.com for more information.
          OSCILAR =
            T.let(
              :oscilar,
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          # Persona. See https://withpersona.com for more information.
          PERSONA =
            T.let(
              :persona,
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          # Taktile. See https://taktile.com for more information.
          TAKTILE =
            T.let(
              :taktile,
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
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
              Increase::EntityUpdateParams::Trust,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig { returns(T.nilable(Increase::EntityUpdateParams::Trust::Address)) }
        attr_reader :address

        sig do
          params(
            address: Increase::EntityUpdateParams::Trust::Address::OrHash
          ).void
        end
        attr_writer :address

        # The grantor of the trust. If you specify this parameter, the trust's existing
        # grantor will be archived and replaced with the grantor you provide.
        sig { returns(T.nilable(Increase::EntityUpdateParams::Trust::Grantor)) }
        attr_reader :grantor

        sig do
          params(
            grantor: Increase::EntityUpdateParams::Trust::Grantor::OrHash
          ).void
        end
        attr_writer :grantor

        # The legal name of the trust.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # The trustees of the trust. If you specify this parameter, the trust's existing
        # trustees will be archived and replaced with the trustees you provide.
        sig do
          returns(
            T.nilable(T::Array[Increase::EntityUpdateParams::Trust::Trustee])
          )
        end
        attr_reader :trustees

        sig do
          params(
            trustees:
              T::Array[Increase::EntityUpdateParams::Trust::Trustee::OrHash]
          ).void
        end
        attr_writer :trustees

        # Details of the trust entity to update. If you specify this parameter and the
        # entity is not a trust, the request will fail.
        sig do
          params(
            address: Increase::EntityUpdateParams::Trust::Address::OrHash,
            grantor: Increase::EntityUpdateParams::Trust::Grantor::OrHash,
            name: String,
            trustees:
              T::Array[Increase::EntityUpdateParams::Trust::Trustee::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address: nil,
          # The grantor of the trust. If you specify this parameter, the trust's existing
          # grantor will be archived and replaced with the grantor you provide.
          grantor: nil,
          # The legal name of the trust.
          name: nil,
          # The trustees of the trust. If you specify this parameter, the trust's existing
          # trustees will be archived and replaced with the trustees you provide.
          trustees: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityUpdateParams::Trust::Address,
              grantor: Increase::EntityUpdateParams::Trust::Grantor,
              name: String,
              trustees: T::Array[Increase::EntityUpdateParams::Trust::Trustee]
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::Trust::Address,
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

        class Grantor < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::Trust::Grantor,
                Increase::Internal::AnyHash
              )
            end

          # The grantor's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          sig { returns(Increase::EntityUpdateParams::Trust::Grantor::Address) }
          attr_reader :address

          sig do
            params(
              address:
                Increase::EntityUpdateParams::Trust::Grantor::Address::OrHash
            ).void
          end
          attr_writer :address

          # The grantor's date of birth in YYYY-MM-DD format.
          sig { returns(Date) }
          attr_accessor :date_of_birth

          # A means of verifying the person's identity.
          sig do
            returns(
              Increase::EntityUpdateParams::Trust::Grantor::Identification
            )
          end
          attr_reader :identification

          sig do
            params(
              identification:
                Increase::EntityUpdateParams::Trust::Grantor::Identification::OrHash
            ).void
          end
          attr_writer :identification

          # The grantor's legal name.
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

          # The grantor of the trust. If you specify this parameter, the trust's existing
          # grantor will be archived and replaced with the grantor you provide.
          sig do
            params(
              address:
                Increase::EntityUpdateParams::Trust::Grantor::Address::OrHash,
              date_of_birth: Date,
              identification:
                Increase::EntityUpdateParams::Trust::Grantor::Identification::OrHash,
              name: String,
              confirmed_no_us_tax_id: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # The grantor's physical address. Mail receiving locations like PO Boxes and PMB's
            # are disallowed.
            address:,
            # The grantor's date of birth in YYYY-MM-DD format.
            date_of_birth:,
            # A means of verifying the person's identity.
            identification:,
            # The grantor's legal name.
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
                address: Increase::EntityUpdateParams::Trust::Grantor::Address,
                date_of_birth: Date,
                identification:
                  Increase::EntityUpdateParams::Trust::Grantor::Identification,
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
                  Increase::EntityUpdateParams::Trust::Grantor::Address,
                  Increase::Internal::AnyHash
                )
              end

            # The city, district, town, or village of the address.
            sig { returns(String) }
            attr_accessor :city

            # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
            #
            # Defaults to `US`.
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

            # The grantor's physical address. Mail receiving locations like PO Boxes and PMB's
            # are disallowed.
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
              #
              # Defaults to `US`.
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
                  Increase::EntityUpdateParams::Trust::Grantor::Identification,
                  Increase::Internal::AnyHash
                )
              end

            # A method that can be used to verify the individual's identity.
            #
            # Defaults to `social_security_number`.
            sig do
              returns(
                Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::OrSymbol
              )
            end
            attr_accessor :method_

            # An identification number that can be used to verify the individual's identity,
            # such as a social security number. For Social Security Numbers and Individual
            # Taxpayer Identification Numbers, submit nine digits with no dashes or other
            # separators.
            sig { returns(String) }
            attr_accessor :number

            # Information about the United States driver's license used for identification.
            # Required if `method` is equal to `drivers_license`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::DriversLicense
                )
              )
            end
            attr_reader :drivers_license

            sig do
              params(
                drivers_license:
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::DriversLicense::OrHash
              ).void
            end
            attr_writer :drivers_license

            # Information about the identification document provided. Required if `method` is
            # equal to `other`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Other
                )
              )
            end
            attr_reader :other

            sig do
              params(
                other:
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Other::OrHash
              ).void
            end
            attr_writer :other

            # Information about the passport used for identification. Required if `method` is
            # equal to `passport`.
            sig do
              returns(
                T.nilable(
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Passport
                )
              )
            end
            attr_reader :passport

            sig do
              params(
                passport:
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Passport::OrHash
              ).void
            end
            attr_writer :passport

            # A means of verifying the person's identity.
            sig do
              params(
                method_:
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::OrSymbol,
                number: String,
                drivers_license:
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::DriversLicense::OrHash,
                other:
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Other::OrHash,
                passport:
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Passport::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # A method that can be used to verify the individual's identity.
              #
              # Defaults to `social_security_number`.
              method_:,
              # An identification number that can be used to verify the individual's identity,
              # such as a social security number. For Social Security Numbers and Individual
              # Taxpayer Identification Numbers, submit nine digits with no dashes or other
              # separators.
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
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license:
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::DriversLicense,
                  other:
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::Other,
                  passport:
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::Passport
                }
              )
            end
            def to_hash
            end

            # A method that can be used to verify the individual's identity.
            #
            # Defaults to `social_security_number`.
            module Method
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::Method
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # A social security number.
              SOCIAL_SECURITY_NUMBER =
                T.let(
                  :social_security_number,
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # An individual taxpayer identification number (ITIN).
              INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                T.let(
                  :individual_taxpayer_identification_number,
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # A passport number.
              PASSPORT =
                T.let(
                  :passport,
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # A driver's license number.
              DRIVERS_LICENSE =
                T.let(
                  :drivers_license,
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              # Another identifying document.
              OTHER =
                T.let(
                  :other,
                  Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::Method::TaggedSymbol
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
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::DriversLicense,
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
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::Other,
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
                    Increase::EntityUpdateParams::Trust::Grantor::Identification::Passport,
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

        class Trustee < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::Trust::Trustee,
                Increase::Internal::AnyHash
              )
            end

          # The structure of the trustee.
          sig do
            returns(
              Increase::EntityUpdateParams::Trust::Trustee::Structure::OrSymbol
            )
          end
          attr_accessor :structure

          # Details of the individual trustee. Within the trustee object, this is required
          # if `structure` is equal to `individual`.
          sig do
            returns(
              T.nilable(
                Increase::EntityUpdateParams::Trust::Trustee::Individual
              )
            )
          end
          attr_reader :individual

          sig do
            params(
              individual:
                Increase::EntityUpdateParams::Trust::Trustee::Individual::OrHash
            ).void
          end
          attr_writer :individual

          sig do
            params(
              structure:
                Increase::EntityUpdateParams::Trust::Trustee::Structure::OrSymbol,
              individual:
                Increase::EntityUpdateParams::Trust::Trustee::Individual::OrHash
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
                  Increase::EntityUpdateParams::Trust::Trustee::Structure::OrSymbol,
                individual:
                  Increase::EntityUpdateParams::Trust::Trustee::Individual
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
                  Increase::EntityUpdateParams::Trust::Trustee::Structure
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The trustee is an individual.
            INDIVIDUAL =
              T.let(
                :individual,
                Increase::EntityUpdateParams::Trust::Trustee::Structure::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::EntityUpdateParams::Trust::Trustee::Structure::TaggedSymbol
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
                  Increase::EntityUpdateParams::Trust::Trustee::Individual,
                  Increase::Internal::AnyHash
                )
              end

            # The individual's physical address. Mail receiving locations like PO Boxes and
            # PMB's are disallowed.
            sig do
              returns(
                Increase::EntityUpdateParams::Trust::Trustee::Individual::Address
              )
            end
            attr_reader :address

            sig do
              params(
                address:
                  Increase::EntityUpdateParams::Trust::Trustee::Individual::Address::OrHash
              ).void
            end
            attr_writer :address

            # The person's date of birth in YYYY-MM-DD format.
            sig { returns(Date) }
            attr_accessor :date_of_birth

            # A means of verifying the person's identity.
            sig do
              returns(
                Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification
              )
            end
            attr_reader :identification

            sig do
              params(
                identification:
                  Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::OrHash
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
                  Increase::EntityUpdateParams::Trust::Trustee::Individual::Address::OrHash,
                date_of_birth: Date,
                identification:
                  Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::OrHash,
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
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Address,
                  date_of_birth: Date,
                  identification:
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification,
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
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Address,
                    Increase::Internal::AnyHash
                  )
                end

              # The city, district, town, or village of the address.
              sig { returns(String) }
              attr_accessor :city

              # The two-letter ISO 3166-1 alpha-2 code for the country of the address.
              #
              # Defaults to `US`.
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
                #
                # Defaults to `US`.
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
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification,
                    Increase::Internal::AnyHash
                  )
                end

              # A method that can be used to verify the individual's identity.
              #
              # Defaults to `social_security_number`.
              sig do
                returns(
                  Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol
                )
              end
              attr_accessor :method_

              # An identification number that can be used to verify the individual's identity,
              # such as a social security number. For Social Security Numbers and Individual
              # Taxpayer Identification Numbers, submit nine digits with no dashes or other
              # separators.
              sig { returns(String) }
              attr_accessor :number

              # Information about the United States driver's license used for identification.
              # Required if `method` is equal to `drivers_license`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::DriversLicense
                  )
                )
              end
              attr_reader :drivers_license

              sig do
                params(
                  drivers_license:
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::DriversLicense::OrHash
                ).void
              end
              attr_writer :drivers_license

              # Information about the identification document provided. Required if `method` is
              # equal to `other`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Other
                  )
                )
              end
              attr_reader :other

              sig do
                params(
                  other:
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Other::OrHash
                ).void
              end
              attr_writer :other

              # Information about the passport used for identification. Required if `method` is
              # equal to `passport`.
              sig do
                returns(
                  T.nilable(
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Passport
                  )
                )
              end
              attr_reader :passport

              sig do
                params(
                  passport:
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Passport::OrHash
                ).void
              end
              attr_writer :passport

              # A means of verifying the person's identity.
              sig do
                params(
                  method_:
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol,
                  number: String,
                  drivers_license:
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::DriversLicense::OrHash,
                  other:
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Other::OrHash,
                  passport:
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Passport::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # A method that can be used to verify the individual's identity.
                #
                # Defaults to `social_security_number`.
                method_:,
                # An identification number that can be used to verify the individual's identity,
                # such as a social security number. For Social Security Numbers and Individual
                # Taxpayer Identification Numbers, submit nine digits with no dashes or other
                # separators.
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
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::OrSymbol,
                    number: String,
                    drivers_license:
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::DriversLicense,
                    other:
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Other,
                    passport:
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Passport
                  }
                )
              end
              def to_hash
              end

              # A method that can be used to verify the individual's identity.
              #
              # Defaults to `social_security_number`.
              module Method
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # A social security number.
                SOCIAL_SECURITY_NUMBER =
                  T.let(
                    :social_security_number,
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # An individual taxpayer identification number (ITIN).
                INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
                  T.let(
                    :individual_taxpayer_identification_number,
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # A passport number.
                PASSPORT =
                  T.let(
                    :passport,
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # A driver's license number.
                DRIVERS_LICENSE =
                  T.let(
                    :drivers_license,
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                # Another identifying document.
                OTHER =
                  T.let(
                    :other,
                    Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Method::TaggedSymbol
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
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::DriversLicense,
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
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Other,
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
                      Increase::EntityUpdateParams::Trust::Trustee::Individual::Identification::Passport,
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
        end
      end
    end
  end
end
