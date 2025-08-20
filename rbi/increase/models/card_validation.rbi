# typed: strong

module Increase
  module Models
    class CardValidation < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardValidation, Increase::Internal::AnyHash)
        end

      # The Card Validation's identifier.
      sig { returns(String) }
      attr_accessor :id

      # If the validation is accepted by the recipient bank, this will contain
      # supplemental details.
      sig { returns(T.nilable(Increase::CardValidation::Acceptance)) }
      attr_reader :acceptance

      sig do
        params(
          acceptance: T.nilable(Increase::CardValidation::Acceptance::OrHash)
        ).void
      end
      attr_writer :acceptance

      # The identifier of the Account from which to send the validation.
      sig { returns(String) }
      attr_accessor :account_id

      # The ID of the Card Token that was used to validate the card.
      sig { returns(String) }
      attr_accessor :card_token_id

      # The cardholder's first name.
      sig { returns(T.nilable(String)) }
      attr_accessor :cardholder_first_name

      # The cardholder's last name.
      sig { returns(T.nilable(String)) }
      attr_accessor :cardholder_last_name

      # The cardholder's middle name.
      sig { returns(T.nilable(String)) }
      attr_accessor :cardholder_middle_name

      # The postal code of the cardholder's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :cardholder_postal_code

      # The cardholder's street address.
      sig { returns(T.nilable(String)) }
      attr_accessor :cardholder_street_address

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the validation was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the validation, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::CardValidation::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(Increase::CardValidation::CreatedBy::OrHash)
        ).void
      end
      attr_writer :created_by

      # If the validation is rejected by the card network or the destination financial
      # institution, this will contain supplemental details.
      sig { returns(T.nilable(Increase::CardValidation::Decline)) }
      attr_reader :decline

      sig do
        params(
          decline: T.nilable(Increase::CardValidation::Decline::OrHash)
        ).void
      end
      attr_writer :decline

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # A four-digit code (MCC) identifying the type of business or service provided by
      # the merchant.
      sig { returns(String) }
      attr_accessor :merchant_category_code

      # The city where the merchant (typically your business) is located.
      sig { returns(String) }
      attr_accessor :merchant_city_name

      # The merchant name that will appear in the cardholder’s statement descriptor.
      # Typically your business name.
      sig { returns(String) }
      attr_accessor :merchant_name

      # The postal code for the merchant’s (typically your business’s) location.
      sig { returns(String) }
      attr_accessor :merchant_postal_code

      # The U.S. state where the merchant (typically your business) is located.
      sig { returns(String) }
      attr_accessor :merchant_state

      # The lifecycle status of the validation.
      sig { returns(Increase::CardValidation::Status::TaggedSymbol) }
      attr_accessor :status

      # After the validation is submitted to the card network, this will contain
      # supplemental details.
      sig { returns(T.nilable(Increase::CardValidation::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission: T.nilable(Increase::CardValidation::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # A constant representing the object's type. For this resource it will always be
      # `card_validation`.
      sig { returns(Increase::CardValidation::Type::TaggedSymbol) }
      attr_accessor :type

      # Card Validations are used to validate a card and its cardholder before sending
      # funds to or pulling funds from a card.
      sig do
        params(
          id: String,
          acceptance: T.nilable(Increase::CardValidation::Acceptance::OrHash),
          account_id: String,
          card_token_id: String,
          cardholder_first_name: T.nilable(String),
          cardholder_last_name: T.nilable(String),
          cardholder_middle_name: T.nilable(String),
          cardholder_postal_code: T.nilable(String),
          cardholder_street_address: T.nilable(String),
          created_at: Time,
          created_by: T.nilable(Increase::CardValidation::CreatedBy::OrHash),
          decline: T.nilable(Increase::CardValidation::Decline::OrHash),
          idempotency_key: T.nilable(String),
          merchant_category_code: String,
          merchant_city_name: String,
          merchant_name: String,
          merchant_postal_code: String,
          merchant_state: String,
          status: Increase::CardValidation::Status::OrSymbol,
          submission: T.nilable(Increase::CardValidation::Submission::OrHash),
          type: Increase::CardValidation::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Card Validation's identifier.
        id:,
        # If the validation is accepted by the recipient bank, this will contain
        # supplemental details.
        acceptance:,
        # The identifier of the Account from which to send the validation.
        account_id:,
        # The ID of the Card Token that was used to validate the card.
        card_token_id:,
        # The cardholder's first name.
        cardholder_first_name:,
        # The cardholder's last name.
        cardholder_last_name:,
        # The cardholder's middle name.
        cardholder_middle_name:,
        # The postal code of the cardholder's address.
        cardholder_postal_code:,
        # The cardholder's street address.
        cardholder_street_address:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the validation was created.
        created_at:,
        # What object created the validation, either via the API or the dashboard.
        created_by:,
        # If the validation is rejected by the card network or the destination financial
        # institution, this will contain supplemental details.
        decline:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # A four-digit code (MCC) identifying the type of business or service provided by
        # the merchant.
        merchant_category_code:,
        # The city where the merchant (typically your business) is located.
        merchant_city_name:,
        # The merchant name that will appear in the cardholder’s statement descriptor.
        # Typically your business name.
        merchant_name:,
        # The postal code for the merchant’s (typically your business’s) location.
        merchant_postal_code:,
        # The U.S. state where the merchant (typically your business) is located.
        merchant_state:,
        # The lifecycle status of the validation.
        status:,
        # After the validation is submitted to the card network, this will contain
        # supplemental details.
        submission:,
        # A constant representing the object's type. For this resource it will always be
        # `card_validation`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            acceptance: T.nilable(Increase::CardValidation::Acceptance),
            account_id: String,
            card_token_id: String,
            cardholder_first_name: T.nilable(String),
            cardholder_last_name: T.nilable(String),
            cardholder_middle_name: T.nilable(String),
            cardholder_postal_code: T.nilable(String),
            cardholder_street_address: T.nilable(String),
            created_at: Time,
            created_by: T.nilable(Increase::CardValidation::CreatedBy),
            decline: T.nilable(Increase::CardValidation::Decline),
            idempotency_key: T.nilable(String),
            merchant_category_code: String,
            merchant_city_name: String,
            merchant_name: String,
            merchant_postal_code: String,
            merchant_state: String,
            status: Increase::CardValidation::Status::TaggedSymbol,
            submission: T.nilable(Increase::CardValidation::Submission),
            type: Increase::CardValidation::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Acceptance < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardValidation::Acceptance,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the validation was accepted by the issuing bank.
        sig { returns(Time) }
        attr_accessor :accepted_at

        # The authorization identification response from the issuing bank.
        sig { returns(String) }
        attr_accessor :authorization_identification_response

        # The result of the Card Verification Value 2 match.
        sig do
          returns(
            T.nilable(
              Increase::CardValidation::Acceptance::CardVerificationValue2Result::TaggedSymbol
            )
          )
        end
        attr_accessor :card_verification_value2_result

        # The result of the cardholder first name match.
        sig do
          returns(
            T.nilable(
              Increase::CardValidation::Acceptance::CardholderFirstNameResult::TaggedSymbol
            )
          )
        end
        attr_accessor :cardholder_first_name_result

        # The result of the cardholder full name match.
        sig do
          returns(
            T.nilable(
              Increase::CardValidation::Acceptance::CardholderFullNameResult::TaggedSymbol
            )
          )
        end
        attr_accessor :cardholder_full_name_result

        # The result of the cardholder last name match.
        sig do
          returns(
            T.nilable(
              Increase::CardValidation::Acceptance::CardholderLastNameResult::TaggedSymbol
            )
          )
        end
        attr_accessor :cardholder_last_name_result

        # The result of the cardholder middle name match.
        sig do
          returns(
            T.nilable(
              Increase::CardValidation::Acceptance::CardholderMiddleNameResult::TaggedSymbol
            )
          )
        end
        attr_accessor :cardholder_middle_name_result

        # The result of the cardholder postal code match.
        sig do
          returns(
            T.nilable(
              Increase::CardValidation::Acceptance::CardholderPostalCodeResult::TaggedSymbol
            )
          )
        end
        attr_accessor :cardholder_postal_code_result

        # The result of the cardholder street address match.
        sig do
          returns(
            T.nilable(
              Increase::CardValidation::Acceptance::CardholderStreetAddressResult::TaggedSymbol
            )
          )
        end
        attr_accessor :cardholder_street_address_result

        # A unique identifier for the transaction on the card network.
        sig { returns(T.nilable(String)) }
        attr_accessor :network_transaction_identifier

        # If the validation is accepted by the recipient bank, this will contain
        # supplemental details.
        sig do
          params(
            accepted_at: Time,
            authorization_identification_response: String,
            card_verification_value2_result:
              T.nilable(
                Increase::CardValidation::Acceptance::CardVerificationValue2Result::OrSymbol
              ),
            cardholder_first_name_result:
              T.nilable(
                Increase::CardValidation::Acceptance::CardholderFirstNameResult::OrSymbol
              ),
            cardholder_full_name_result:
              T.nilable(
                Increase::CardValidation::Acceptance::CardholderFullNameResult::OrSymbol
              ),
            cardholder_last_name_result:
              T.nilable(
                Increase::CardValidation::Acceptance::CardholderLastNameResult::OrSymbol
              ),
            cardholder_middle_name_result:
              T.nilable(
                Increase::CardValidation::Acceptance::CardholderMiddleNameResult::OrSymbol
              ),
            cardholder_postal_code_result:
              T.nilable(
                Increase::CardValidation::Acceptance::CardholderPostalCodeResult::OrSymbol
              ),
            cardholder_street_address_result:
              T.nilable(
                Increase::CardValidation::Acceptance::CardholderStreetAddressResult::OrSymbol
              ),
            network_transaction_identifier: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the validation was accepted by the issuing bank.
          accepted_at:,
          # The authorization identification response from the issuing bank.
          authorization_identification_response:,
          # The result of the Card Verification Value 2 match.
          card_verification_value2_result:,
          # The result of the cardholder first name match.
          cardholder_first_name_result:,
          # The result of the cardholder full name match.
          cardholder_full_name_result:,
          # The result of the cardholder last name match.
          cardholder_last_name_result:,
          # The result of the cardholder middle name match.
          cardholder_middle_name_result:,
          # The result of the cardholder postal code match.
          cardholder_postal_code_result:,
          # The result of the cardholder street address match.
          cardholder_street_address_result:,
          # A unique identifier for the transaction on the card network.
          network_transaction_identifier:
        )
        end

        sig do
          override.returns(
            {
              accepted_at: Time,
              authorization_identification_response: String,
              card_verification_value2_result:
                T.nilable(
                  Increase::CardValidation::Acceptance::CardVerificationValue2Result::TaggedSymbol
                ),
              cardholder_first_name_result:
                T.nilable(
                  Increase::CardValidation::Acceptance::CardholderFirstNameResult::TaggedSymbol
                ),
              cardholder_full_name_result:
                T.nilable(
                  Increase::CardValidation::Acceptance::CardholderFullNameResult::TaggedSymbol
                ),
              cardholder_last_name_result:
                T.nilable(
                  Increase::CardValidation::Acceptance::CardholderLastNameResult::TaggedSymbol
                ),
              cardholder_middle_name_result:
                T.nilable(
                  Increase::CardValidation::Acceptance::CardholderMiddleNameResult::TaggedSymbol
                ),
              cardholder_postal_code_result:
                T.nilable(
                  Increase::CardValidation::Acceptance::CardholderPostalCodeResult::TaggedSymbol
                ),
              cardholder_street_address_result:
                T.nilable(
                  Increase::CardValidation::Acceptance::CardholderStreetAddressResult::TaggedSymbol
                ),
              network_transaction_identifier: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # The result of the Card Verification Value 2 match.
        module CardVerificationValue2Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardValidation::Acceptance::CardVerificationValue2Result
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The Card Verification Value 2 (CVV2) matches the expected value.
          MATCH =
            T.let(
              :match,
              Increase::CardValidation::Acceptance::CardVerificationValue2Result::TaggedSymbol
            )

          # The Card Verification Value 2 (CVV2) does not match the expected value.
          NO_MATCH =
            T.let(
              :no_match,
              Increase::CardValidation::Acceptance::CardVerificationValue2Result::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidation::Acceptance::CardVerificationValue2Result::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The result of the cardholder first name match.
        module CardholderFirstNameResult
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardValidation::Acceptance::CardholderFirstNameResult
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The cardholder name component matches the expected value.
          MATCH =
            T.let(
              :match,
              Increase::CardValidation::Acceptance::CardholderFirstNameResult::TaggedSymbol
            )

          # The cardholder name component does not match the expected value.
          NO_MATCH =
            T.let(
              :no_match,
              Increase::CardValidation::Acceptance::CardholderFirstNameResult::TaggedSymbol
            )

          # The cardholder name component partially matches the expected value.
          PARTIAL_MATCH =
            T.let(
              :partial_match,
              Increase::CardValidation::Acceptance::CardholderFirstNameResult::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidation::Acceptance::CardholderFirstNameResult::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The result of the cardholder full name match.
        module CardholderFullNameResult
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardValidation::Acceptance::CardholderFullNameResult
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The cardholder name component matches the expected value.
          MATCH =
            T.let(
              :match,
              Increase::CardValidation::Acceptance::CardholderFullNameResult::TaggedSymbol
            )

          # The cardholder name component does not match the expected value.
          NO_MATCH =
            T.let(
              :no_match,
              Increase::CardValidation::Acceptance::CardholderFullNameResult::TaggedSymbol
            )

          # The cardholder name component partially matches the expected value.
          PARTIAL_MATCH =
            T.let(
              :partial_match,
              Increase::CardValidation::Acceptance::CardholderFullNameResult::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidation::Acceptance::CardholderFullNameResult::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The result of the cardholder last name match.
        module CardholderLastNameResult
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardValidation::Acceptance::CardholderLastNameResult
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The cardholder name component matches the expected value.
          MATCH =
            T.let(
              :match,
              Increase::CardValidation::Acceptance::CardholderLastNameResult::TaggedSymbol
            )

          # The cardholder name component does not match the expected value.
          NO_MATCH =
            T.let(
              :no_match,
              Increase::CardValidation::Acceptance::CardholderLastNameResult::TaggedSymbol
            )

          # The cardholder name component partially matches the expected value.
          PARTIAL_MATCH =
            T.let(
              :partial_match,
              Increase::CardValidation::Acceptance::CardholderLastNameResult::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidation::Acceptance::CardholderLastNameResult::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The result of the cardholder middle name match.
        module CardholderMiddleNameResult
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardValidation::Acceptance::CardholderMiddleNameResult
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The cardholder name component matches the expected value.
          MATCH =
            T.let(
              :match,
              Increase::CardValidation::Acceptance::CardholderMiddleNameResult::TaggedSymbol
            )

          # The cardholder name component does not match the expected value.
          NO_MATCH =
            T.let(
              :no_match,
              Increase::CardValidation::Acceptance::CardholderMiddleNameResult::TaggedSymbol
            )

          # The cardholder name component partially matches the expected value.
          PARTIAL_MATCH =
            T.let(
              :partial_match,
              Increase::CardValidation::Acceptance::CardholderMiddleNameResult::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidation::Acceptance::CardholderMiddleNameResult::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The result of the cardholder postal code match.
        module CardholderPostalCodeResult
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardValidation::Acceptance::CardholderPostalCodeResult
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The cardholder address component matches the expected value.
          MATCH =
            T.let(
              :match,
              Increase::CardValidation::Acceptance::CardholderPostalCodeResult::TaggedSymbol
            )

          # The cardholder address component does not match the expected value.
          NO_MATCH =
            T.let(
              :no_match,
              Increase::CardValidation::Acceptance::CardholderPostalCodeResult::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidation::Acceptance::CardholderPostalCodeResult::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The result of the cardholder street address match.
        module CardholderStreetAddressResult
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardValidation::Acceptance::CardholderStreetAddressResult
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The cardholder address component matches the expected value.
          MATCH =
            T.let(
              :match,
              Increase::CardValidation::Acceptance::CardholderStreetAddressResult::TaggedSymbol
            )

          # The cardholder address component does not match the expected value.
          NO_MATCH =
            T.let(
              :no_match,
              Increase::CardValidation::Acceptance::CardholderStreetAddressResult::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidation::Acceptance::CardholderStreetAddressResult::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class CreatedBy < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardValidation::CreatedBy,
              Increase::Internal::AnyHash
            )
          end

        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::CardValidation::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(Increase::CardValidation::CreatedBy::APIKey::OrHash)
          ).void
        end
        attr_writer :api_key

        # The type of object that created this transfer.
        sig do
          returns(Increase::CardValidation::CreatedBy::Category::TaggedSymbol)
        end
        attr_accessor :category

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(
            T.nilable(Increase::CardValidation::CreatedBy::OAuthApplication)
          )
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::CardValidation::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::CardValidation::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Increase::CardValidation::CreatedBy::User::OrHash)
          ).void
        end
        attr_writer :user

        # What object created the validation, either via the API or the dashboard.
        sig do
          params(
            api_key:
              T.nilable(Increase::CardValidation::CreatedBy::APIKey::OrHash),
            category: Increase::CardValidation::CreatedBy::Category::OrSymbol,
            oauth_application:
              T.nilable(
                Increase::CardValidation::CreatedBy::OAuthApplication::OrHash
              ),
            user: T.nilable(Increase::CardValidation::CreatedBy::User::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # If present, details about the API key that created the transfer.
          api_key:,
          # The type of object that created this transfer.
          category:,
          # If present, details about the OAuth Application that created the transfer.
          oauth_application:,
          # If present, details about the User that created the transfer.
          user:
        )
        end

        sig do
          override.returns(
            {
              api_key: T.nilable(Increase::CardValidation::CreatedBy::APIKey),
              category:
                Increase::CardValidation::CreatedBy::Category::TaggedSymbol,
              oauth_application:
                T.nilable(
                  Increase::CardValidation::CreatedBy::OAuthApplication
                ),
              user: T.nilable(Increase::CardValidation::CreatedBy::User)
            }
          )
        end
        def to_hash
        end

        class APIKey < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardValidation::CreatedBy::APIKey,
                Increase::Internal::AnyHash
              )
            end

          # The description set for the API key when it was created.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # If present, details about the API key that created the transfer.
          sig do
            params(description: T.nilable(String)).returns(T.attached_class)
          end
          def self.new(
            # The description set for the API key when it was created.
            description:
          )
          end

          sig { override.returns({ description: T.nilable(String) }) }
          def to_hash
          end
        end

        # The type of object that created this transfer.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CardValidation::CreatedBy::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::CardValidation::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::CardValidation::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::CardValidation::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidation::CreatedBy::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class OAuthApplication < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardValidation::CreatedBy::OAuthApplication,
                Increase::Internal::AnyHash
              )
            end

          # The name of the OAuth Application.
          sig { returns(String) }
          attr_accessor :name

          # If present, details about the OAuth Application that created the transfer.
          sig { params(name: String).returns(T.attached_class) }
          def self.new(
            # The name of the OAuth Application.
            name:
          )
          end

          sig { override.returns({ name: String }) }
          def to_hash
          end
        end

        class User < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardValidation::CreatedBy::User,
                Increase::Internal::AnyHash
              )
            end

          # The email address of the User.
          sig { returns(String) }
          attr_accessor :email

          # If present, details about the User that created the transfer.
          sig { params(email: String).returns(T.attached_class) }
          def self.new(
            # The email address of the User.
            email:
          )
          end

          sig { override.returns({ email: String }) }
          def to_hash
          end
        end
      end

      class Decline < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardValidation::Decline,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the validation was declined.
        sig { returns(Time) }
        attr_accessor :declined_at

        # A unique identifier for the transaction on the card network.
        sig { returns(T.nilable(String)) }
        attr_accessor :network_transaction_identifier

        # The reason why the validation was declined.
        sig { returns(Increase::CardValidation::Decline::Reason::TaggedSymbol) }
        attr_accessor :reason

        # If the validation is rejected by the card network or the destination financial
        # institution, this will contain supplemental details.
        sig do
          params(
            declined_at: Time,
            network_transaction_identifier: T.nilable(String),
            reason: Increase::CardValidation::Decline::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the validation was declined.
          declined_at:,
          # A unique identifier for the transaction on the card network.
          network_transaction_identifier:,
          # The reason why the validation was declined.
          reason:
        )
        end

        sig do
          override.returns(
            {
              declined_at: Time,
              network_transaction_identifier: T.nilable(String),
              reason: Increase::CardValidation::Decline::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The reason why the validation was declined.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CardValidation::Decline::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The card issuer has declined the transaction without providing a specific reason.
          DO_NOT_HONOR =
            T.let(
              :do_not_honor,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The number of transactions for the card has exceeded the limit set by the issuer.
          ACTIVITY_COUNT_LIMIT_EXCEEDED =
            T.let(
              :activity_count_limit_exceeded,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card issuer requires the cardholder to contact them for further information regarding the transaction.
          REFER_TO_CARD_ISSUER =
            T.let(
              :refer_to_card_issuer,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card issuer requires the cardholder to contact them due to a special condition related to the transaction.
          REFER_TO_CARD_ISSUER_SPECIAL_CONDITION =
            T.let(
              :refer_to_card_issuer_special_condition,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The merchant is not valid for this transaction.
          INVALID_MERCHANT =
            T.let(
              :invalid_merchant,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card should be retained by the terminal.
          PICK_UP_CARD =
            T.let(
              :pick_up_card,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # An error occurred during processing of the transaction.
          ERROR =
            T.let(
              :error,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card should be retained by the terminal due to a special condition.
          PICK_UP_CARD_SPECIAL =
            T.let(
              :pick_up_card_special,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction is invalid and cannot be processed.
          INVALID_TRANSACTION =
            T.let(
              :invalid_transaction,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The amount of the transaction is invalid.
          INVALID_AMOUNT =
            T.let(
              :invalid_amount,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The account number provided is invalid.
          INVALID_ACCOUNT_NUMBER =
            T.let(
              :invalid_account_number,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The issuer of the card could not be found.
          NO_SUCH_ISSUER =
            T.let(
              :no_such_issuer,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction should be re-entered for processing.
          RE_ENTER_TRANSACTION =
            T.let(
              :re_enter_transaction,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # There is no credit account associated with the card.
          NO_CREDIT_ACCOUNT =
            T.let(
              :no_credit_account,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card should be retained by the terminal because it has been reported lost.
          PICK_UP_CARD_LOST =
            T.let(
              :pick_up_card_lost,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card should be retained by the terminal because it has been reported stolen.
          PICK_UP_CARD_STOLEN =
            T.let(
              :pick_up_card_stolen,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The account associated with the card has been closed.
          CLOSED_ACCOUNT =
            T.let(
              :closed_account,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # There are insufficient funds in the account to complete the transaction.
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # There is no checking account associated with the card.
          NO_CHECKING_ACCOUNT =
            T.let(
              :no_checking_account,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # There is no savings account associated with the card.
          NO_SAVINGS_ACCOUNT =
            T.let(
              :no_savings_account,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card has expired and cannot be used for transactions.
          EXPIRED_CARD =
            T.let(
              :expired_card,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction is not permitted for this cardholder.
          TRANSACTION_NOT_PERMITTED_TO_CARDHOLDER =
            T.let(
              :transaction_not_permitted_to_cardholder,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction is not allowed at this terminal.
          TRANSACTION_NOT_ALLOWED_AT_TERMINAL =
            T.let(
              :transaction_not_allowed_at_terminal,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction has been flagged as suspected fraud and cannot be processed.
          SUSPECTED_FRAUD =
            T.let(
              :suspected_fraud,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The amount of activity on the card has exceeded the limit set by the issuer.
          ACTIVITY_AMOUNT_LIMIT_EXCEEDED =
            T.let(
              :activity_amount_limit_exceeded,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card has restrictions that prevent it from being used for this transaction.
          RESTRICTED_CARD =
            T.let(
              :restricted_card,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # A security violation has occurred, preventing the transaction from being processed.
          SECURITY_VIOLATION =
            T.let(
              :security_violation,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction does not meet the anti-money laundering requirements set by the issuer.
          TRANSACTION_DOES_NOT_FULFILL_ANTI_MONEY_LAUNDERING_REQUIREMENT =
            T.let(
              :transaction_does_not_fulfill_anti_money_laundering_requirement,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The first use of the card has been blocked by the issuer.
          BLOCKED_FIRST_USE =
            T.let(
              :blocked_first_use,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The credit issuer is currently unavailable to process the transaction.
          CREDIT_ISSUER_UNAVAILABLE =
            T.let(
              :credit_issuer_unavailable,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The card verification value (CVV) results were negative, indicating a potential issue with the card.
          NEGATIVE_CARD_VERIFICATION_VALUE_RESULTS =
            T.let(
              :negative_card_verification_value_results,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The issuer of the card is currently unavailable to process the transaction.
          ISSUER_UNAVAILABLE =
            T.let(
              :issuer_unavailable,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The financial institution associated with the card could not be found.
          FINANCIAL_INSTITUTION_CANNOT_BE_FOUND =
            T.let(
              :financial_institution_cannot_be_found,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction cannot be completed due to an unspecified reason.
          TRANSACTION_CANNOT_BE_COMPLETED =
            T.let(
              :transaction_cannot_be_completed,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction is a duplicate of a previous transaction and cannot be processed again.
          DUPLICATE_TRANSACTION =
            T.let(
              :duplicate_transaction,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # A system malfunction occurred, preventing the transaction from being processed.
          SYSTEM_MALFUNCTION =
            T.let(
              :system_malfunction,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # Additional customer authentication is required to complete the transaction.
          ADDITIONAL_CUSTOMER_AUTHENTICATION_REQUIRED =
            T.let(
              :additional_customer_authentication_required,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The surcharge amount applied to the transaction is not permitted by the issuer.
          SURCHARGE_AMOUNT_NOT_PERMITTED =
            T.let(
              :surcharge_amount_not_permitted,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # The transaction was declined due to a failure in verifying the CVV2 code.
          DECLINE_FOR_CVV2_FAILURE =
            T.let(
              :decline_for_cvv2_failure,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # A stop payment order has been placed on this transaction.
          STOP_PAYMENT_ORDER =
            T.let(
              :stop_payment_order,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # An order has been placed to revoke authorization for this transaction.
          REVOCATION_OF_AUTHORIZATION_ORDER =
            T.let(
              :revocation_of_authorization_order,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          # An order has been placed to revoke all authorizations for this cardholder.
          REVOCATION_OF_ALL_AUTHORIZATIONS_ORDER =
            T.let(
              :revocation_of_all_authorizations_order,
              Increase::CardValidation::Decline::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::CardValidation::Decline::Reason::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      # The lifecycle status of the validation.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardValidation::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The validation requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::CardValidation::Status::TaggedSymbol
          )

        # The validation is queued to be submitted to the card network.
        PENDING_SUBMISSION =
          T.let(
            :pending_submission,
            Increase::CardValidation::Status::TaggedSymbol
          )

        # The validation has been submitted and is pending a response from the card network.
        SUBMITTED =
          T.let(:submitted, Increase::CardValidation::Status::TaggedSymbol)

        # The validation has been sent successfully and is complete.
        COMPLETE =
          T.let(:complete, Increase::CardValidation::Status::TaggedSymbol)

        # The validation was declined by the network or the recipient's bank.
        DECLINED =
          T.let(:declined, Increase::CardValidation::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardValidation::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardValidation::Submission,
              Increase::Internal::AnyHash
            )
          end

        # A 12-digit retrieval reference number that identifies the validation. Usually a
        # combination of a timestamp and the trace number.
        sig { returns(String) }
        attr_accessor :retrieval_reference_number

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the validation was submitted to the card network.
        sig { returns(Time) }
        attr_accessor :submitted_at

        # A 6-digit trace number that identifies the validation within a short time
        # window.
        sig { returns(String) }
        attr_accessor :trace_number

        # After the validation is submitted to the card network, this will contain
        # supplemental details.
        sig do
          params(
            retrieval_reference_number: String,
            submitted_at: Time,
            trace_number: String
          ).returns(T.attached_class)
        end
        def self.new(
          # A 12-digit retrieval reference number that identifies the validation. Usually a
          # combination of a timestamp and the trace number.
          retrieval_reference_number:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the validation was submitted to the card network.
          submitted_at:,
          # A 6-digit trace number that identifies the validation within a short time
          # window.
          trace_number:
        )
        end

        sig do
          override.returns(
            {
              retrieval_reference_number: String,
              submitted_at: Time,
              trace_number: String
            }
          )
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_validation`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardValidation::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_VALIDATION =
          T.let(:card_validation, Increase::CardValidation::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardValidation::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
