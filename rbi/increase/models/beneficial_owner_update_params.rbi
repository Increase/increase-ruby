# typed: strong

module Increase
  module Models
    class BeneficialOwnerUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::BeneficialOwnerUpdateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Beneficial Owner to update.
      sig { returns(String) }
      attr_accessor :entity_beneficial_owner_id

      # The individual's physical address. Mail receiving locations like PO Boxes and
      # PMB's are disallowed.
      sig { returns(T.nilable(Increase::BeneficialOwnerUpdateParams::Address)) }
      attr_reader :address

      sig do
        params(
          address: Increase::BeneficialOwnerUpdateParams::Address::OrHash
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
          T.nilable(Increase::BeneficialOwnerUpdateParams::Identification)
        )
      end
      attr_reader :identification

      sig do
        params(
          identification:
            Increase::BeneficialOwnerUpdateParams::Identification::OrHash
        ).void
      end
      attr_writer :identification

      sig do
        params(
          entity_beneficial_owner_id: String,
          address: Increase::BeneficialOwnerUpdateParams::Address::OrHash,
          confirmed_no_us_tax_id: T::Boolean,
          identification:
            Increase::BeneficialOwnerUpdateParams::Identification::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Beneficial Owner to update.
        entity_beneficial_owner_id:,
        # The individual's physical address. Mail receiving locations like PO Boxes and
        # PMB's are disallowed.
        address: nil,
        # The identification method for an individual can only be a passport, driver's
        # license, or other document if you've confirmed the individual does not have a US
        # tax id (either a Social Security Number or Individual Taxpayer Identification
        # Number).
        confirmed_no_us_tax_id: nil,
        # A means of verifying the person's identity.
        identification: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            entity_beneficial_owner_id: String,
            address: Increase::BeneficialOwnerUpdateParams::Address,
            confirmed_no_us_tax_id: T::Boolean,
            identification:
              Increase::BeneficialOwnerUpdateParams::Identification,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Address < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::BeneficialOwnerUpdateParams::Address,
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
              Increase::BeneficialOwnerUpdateParams::Identification,
              Increase::Internal::AnyHash
            )
          end

        # A method that can be used to verify the individual's identity.
        sig do
          returns(
            Increase::BeneficialOwnerUpdateParams::Identification::Method::OrSymbol
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
              Increase::BeneficialOwnerUpdateParams::Identification::DriversLicense
            )
          )
        end
        attr_reader :drivers_license

        sig do
          params(
            drivers_license:
              Increase::BeneficialOwnerUpdateParams::Identification::DriversLicense::OrHash
          ).void
        end
        attr_writer :drivers_license

        # Information about the identification document provided. Required if `method` is
        # equal to `other`.
        sig do
          returns(
            T.nilable(
              Increase::BeneficialOwnerUpdateParams::Identification::Other
            )
          )
        end
        attr_reader :other

        sig do
          params(
            other:
              Increase::BeneficialOwnerUpdateParams::Identification::Other::OrHash
          ).void
        end
        attr_writer :other

        # Information about the passport used for identification. Required if `method` is
        # equal to `passport`.
        sig do
          returns(
            T.nilable(
              Increase::BeneficialOwnerUpdateParams::Identification::Passport
            )
          )
        end
        attr_reader :passport

        sig do
          params(
            passport:
              Increase::BeneficialOwnerUpdateParams::Identification::Passport::OrHash
          ).void
        end
        attr_writer :passport

        # A means of verifying the person's identity.
        sig do
          params(
            method_:
              Increase::BeneficialOwnerUpdateParams::Identification::Method::OrSymbol,
            number: String,
            drivers_license:
              Increase::BeneficialOwnerUpdateParams::Identification::DriversLicense::OrHash,
            other:
              Increase::BeneficialOwnerUpdateParams::Identification::Other::OrHash,
            passport:
              Increase::BeneficialOwnerUpdateParams::Identification::Passport::OrHash
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
                Increase::BeneficialOwnerUpdateParams::Identification::Method::OrSymbol,
              number: String,
              drivers_license:
                Increase::BeneficialOwnerUpdateParams::Identification::DriversLicense,
              other:
                Increase::BeneficialOwnerUpdateParams::Identification::Other,
              passport:
                Increase::BeneficialOwnerUpdateParams::Identification::Passport
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
                Increase::BeneficialOwnerUpdateParams::Identification::Method
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A social security number.
          SOCIAL_SECURITY_NUMBER =
            T.let(
              :social_security_number,
              Increase::BeneficialOwnerUpdateParams::Identification::Method::TaggedSymbol
            )

          # An individual taxpayer identification number (ITIN).
          INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER =
            T.let(
              :individual_taxpayer_identification_number,
              Increase::BeneficialOwnerUpdateParams::Identification::Method::TaggedSymbol
            )

          # A passport number.
          PASSPORT =
            T.let(
              :passport,
              Increase::BeneficialOwnerUpdateParams::Identification::Method::TaggedSymbol
            )

          # A driver's license number.
          DRIVERS_LICENSE =
            T.let(
              :drivers_license,
              Increase::BeneficialOwnerUpdateParams::Identification::Method::TaggedSymbol
            )

          # Another identifying document.
          OTHER =
            T.let(
              :other,
              Increase::BeneficialOwnerUpdateParams::Identification::Method::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::BeneficialOwnerUpdateParams::Identification::Method::TaggedSymbol
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
                Increase::BeneficialOwnerUpdateParams::Identification::DriversLicense,
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
                Increase::BeneficialOwnerUpdateParams::Identification::Other,
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
                Increase::BeneficialOwnerUpdateParams::Identification::Passport,
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
