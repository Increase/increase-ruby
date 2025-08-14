# typed: strong

module Increase
  module Models
    class CardPushTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardPushTransfer, Increase::Internal::AnyHash)
        end

      # The Card Push Transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # If the transfer is accepted by the recipient bank, this will contain
      # supplemental details.
      sig { returns(T.nilable(Increase::CardPushTransfer::Acceptance)) }
      attr_reader :acceptance

      sig do
        params(
          acceptance: T.nilable(Increase::CardPushTransfer::Acceptance::OrHash)
        ).void
      end
      attr_writer :acceptance

      # The Account from which the transfer was sent.
      sig { returns(String) }
      attr_accessor :account_id

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # If your account requires approvals for transfers and the transfer was approved,
      # this will contain details of the approval.
      sig { returns(T.nilable(Increase::CardPushTransfer::Approval)) }
      attr_reader :approval

      sig do
        params(
          approval: T.nilable(Increase::CardPushTransfer::Approval::OrHash)
        ).void
      end
      attr_writer :approval

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      sig do
        returns(
          Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
        )
      end
      attr_accessor :business_application_identifier

      # If your account requires approvals for transfers and the transfer was not
      # approved, this will contain details of the cancellation.
      sig { returns(T.nilable(Increase::CardPushTransfer::Cancellation)) }
      attr_reader :cancellation

      sig do
        params(
          cancellation:
            T.nilable(Increase::CardPushTransfer::Cancellation::OrHash)
        ).void
      end
      attr_writer :cancellation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::CardPushTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(Increase::CardPushTransfer::CreatedBy::OrHash)
        ).void
      end
      attr_writer :created_by

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency.
      sig { returns(Increase::CardPushTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # If the transfer is rejected by the card network or the destination financial
      # institution, this will contain supplemental details.
      sig { returns(T.nilable(Increase::CardPushTransfer::Decline)) }
      attr_reader :decline

      sig do
        params(
          decline: T.nilable(Increase::CardPushTransfer::Decline::OrHash)
        ).void
      end
      attr_writer :decline

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The merchant category code (MCC) of the merchant (generally your business)
      # sending the transfer. This is a four-digit code that describes the type of
      # business or service provided by the merchant. Your program must be approved for
      # the specified MCC in order to use it.
      sig { returns(String) }
      attr_accessor :merchant_category_code

      # The city name of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_city_name

      # The merchant name shows up as the statement descriptor for the transfer. This is
      # typically the name of your business or organization.
      sig { returns(String) }
      attr_accessor :merchant_name

      # For certain Business Application Identifiers, the statement descriptor is
      # `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
      # four character prefix that identifies the merchant.
      sig { returns(String) }
      attr_accessor :merchant_name_prefix

      # The postal code of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_postal_code

      # The state of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_state

      # The name of the funds recipient.
      sig { returns(String) }
      attr_accessor :recipient_name

      # The city of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_city

      # The address line 1 of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_line1

      # The postal code of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_postal_code

      # The state of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_state

      # The name of the funds originator.
      sig { returns(String) }
      attr_accessor :sender_name

      # The Account Number the recipient will see as having sent the transfer.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::CardPushTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # After the transfer is submitted to the card network, this will contain
      # supplemental details.
      sig { returns(T.nilable(Increase::CardPushTransfer::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission: T.nilable(Increase::CardPushTransfer::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # A constant representing the object's type. For this resource it will always be
      # `card_push_transfer`.
      sig { returns(Increase::CardPushTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # Card Push Transfers send funds to a recipient's payment card in real-time.
      sig do
        params(
          id: String,
          acceptance: T.nilable(Increase::CardPushTransfer::Acceptance::OrHash),
          account_id: String,
          amount: Integer,
          approval: T.nilable(Increase::CardPushTransfer::Approval::OrHash),
          business_application_identifier:
            Increase::CardPushTransfer::BusinessApplicationIdentifier::OrSymbol,
          cancellation:
            T.nilable(Increase::CardPushTransfer::Cancellation::OrHash),
          created_at: Time,
          created_by: T.nilable(Increase::CardPushTransfer::CreatedBy::OrHash),
          currency: Increase::CardPushTransfer::Currency::OrSymbol,
          decline: T.nilable(Increase::CardPushTransfer::Decline::OrHash),
          idempotency_key: T.nilable(String),
          merchant_category_code: String,
          merchant_city_name: String,
          merchant_name: String,
          merchant_name_prefix: String,
          merchant_postal_code: String,
          merchant_state: String,
          recipient_name: String,
          sender_address_city: String,
          sender_address_line1: String,
          sender_address_postal_code: String,
          sender_address_state: String,
          sender_name: String,
          source_account_number_id: String,
          status: Increase::CardPushTransfer::Status::OrSymbol,
          submission: T.nilable(Increase::CardPushTransfer::Submission::OrHash),
          type: Increase::CardPushTransfer::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Card Push Transfer's identifier.
        id:,
        # If the transfer is accepted by the recipient bank, this will contain
        # supplemental details.
        acceptance:,
        # The Account from which the transfer was sent.
        account_id:,
        # The transfer amount in USD cents.
        amount:,
        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        approval:,
        # The Business Application Identifier describes the type of transaction being
        # performed. Your program must be approved for the specified Business Application
        # Identifier in order to use it.
        business_application_identifier:,
        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        cancellation:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # What object created the transfer, either via the API or the dashboard.
        created_by:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
        # currency.
        currency:,
        # If the transfer is rejected by the card network or the destination financial
        # institution, this will contain supplemental details.
        decline:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The merchant category code (MCC) of the merchant (generally your business)
        # sending the transfer. This is a four-digit code that describes the type of
        # business or service provided by the merchant. Your program must be approved for
        # the specified MCC in order to use it.
        merchant_category_code:,
        # The city name of the merchant (generally your business) sending the transfer.
        merchant_city_name:,
        # The merchant name shows up as the statement descriptor for the transfer. This is
        # typically the name of your business or organization.
        merchant_name:,
        # For certain Business Application Identifiers, the statement descriptor is
        # `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
        # four character prefix that identifies the merchant.
        merchant_name_prefix:,
        # The postal code of the merchant (generally your business) sending the transfer.
        merchant_postal_code:,
        # The state of the merchant (generally your business) sending the transfer.
        merchant_state:,
        # The name of the funds recipient.
        recipient_name:,
        # The city of the sender.
        sender_address_city:,
        # The address line 1 of the sender.
        sender_address_line1:,
        # The postal code of the sender.
        sender_address_postal_code:,
        # The state of the sender.
        sender_address_state:,
        # The name of the funds originator.
        sender_name:,
        # The Account Number the recipient will see as having sent the transfer.
        source_account_number_id:,
        # The lifecycle status of the transfer.
        status:,
        # After the transfer is submitted to the card network, this will contain
        # supplemental details.
        submission:,
        # A constant representing the object's type. For this resource it will always be
        # `card_push_transfer`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            acceptance: T.nilable(Increase::CardPushTransfer::Acceptance),
            account_id: String,
            amount: Integer,
            approval: T.nilable(Increase::CardPushTransfer::Approval),
            business_application_identifier:
              Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol,
            cancellation: T.nilable(Increase::CardPushTransfer::Cancellation),
            created_at: Time,
            created_by: T.nilable(Increase::CardPushTransfer::CreatedBy),
            currency: Increase::CardPushTransfer::Currency::TaggedSymbol,
            decline: T.nilable(Increase::CardPushTransfer::Decline),
            idempotency_key: T.nilable(String),
            merchant_category_code: String,
            merchant_city_name: String,
            merchant_name: String,
            merchant_name_prefix: String,
            merchant_postal_code: String,
            merchant_state: String,
            recipient_name: String,
            sender_address_city: String,
            sender_address_line1: String,
            sender_address_postal_code: String,
            sender_address_state: String,
            sender_name: String,
            source_account_number_id: String,
            status: Increase::CardPushTransfer::Status::TaggedSymbol,
            submission: T.nilable(Increase::CardPushTransfer::Submission),
            type: Increase::CardPushTransfer::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Acceptance < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPushTransfer::Acceptance,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was accepted by the issuing bank.
        sig { returns(Time) }
        attr_accessor :accepted_at

        # The authorization identification response from the issuing bank.
        sig { returns(String) }
        attr_accessor :authorization_identification_response

        # The result of the Card Verification Value 2 match.
        sig do
          returns(
            T.nilable(
              Increase::CardPushTransfer::Acceptance::CardVerificationValue2Result::TaggedSymbol
            )
          )
        end
        attr_accessor :card_verification_value2_result

        # A unique identifier for the transaction on the card network.
        sig { returns(T.nilable(String)) }
        attr_accessor :network_transaction_identifier

        # If the transfer is accepted by the recipient bank, this will contain
        # supplemental details.
        sig do
          params(
            accepted_at: Time,
            authorization_identification_response: String,
            card_verification_value2_result:
              T.nilable(
                Increase::CardPushTransfer::Acceptance::CardVerificationValue2Result::OrSymbol
              ),
            network_transaction_identifier: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was accepted by the issuing bank.
          accepted_at:,
          # The authorization identification response from the issuing bank.
          authorization_identification_response:,
          # The result of the Card Verification Value 2 match.
          card_verification_value2_result:,
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
                  Increase::CardPushTransfer::Acceptance::CardVerificationValue2Result::TaggedSymbol
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
                Increase::CardPushTransfer::Acceptance::CardVerificationValue2Result
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The Card Verification Value 2 (CVV2) matches the expected value.
          MATCH =
            T.let(
              :match,
              Increase::CardPushTransfer::Acceptance::CardVerificationValue2Result::TaggedSymbol
            )

          # The Card Verification Value 2 (CVV2) does not match the expected value.
          NO_MATCH =
            T.let(
              :no_match,
              Increase::CardPushTransfer::Acceptance::CardVerificationValue2Result::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardPushTransfer::Acceptance::CardVerificationValue2Result::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Approval < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPushTransfer::Approval,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was approved.
        sig { returns(Time) }
        attr_accessor :approved_at

        # If the Transfer was approved by a user in the dashboard, the email address of
        # that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :approved_by

        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        sig do
          params(approved_at: Time, approved_by: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was approved.
          approved_at:,
          # If the Transfer was approved by a user in the dashboard, the email address of
          # that user.
          approved_by:
        )
        end

        sig do
          override.returns(
            { approved_at: Time, approved_by: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      module BusinessApplicationIdentifier
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::CardPushTransfer::BusinessApplicationIdentifier
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Account to Account
        ACCOUNT_TO_ACCOUNT =
          T.let(
            :account_to_account,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Business to Business
        BUSINESS_TO_BUSINESS =
          T.let(
            :business_to_business,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Money Transfer Bank Initiated
        MONEY_TRANSFER_BANK_INITIATED =
          T.let(
            :money_transfer_bank_initiated,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Non-Card Bill Payment
        NON_CARD_BILL_PAYMENT =
          T.let(
            :non_card_bill_payment,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Consumer Bill Payment
        CONSUMER_BILL_PAYMENT =
          T.let(
            :consumer_bill_payment,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Card Bill Payment
        CARD_BILL_PAYMENT =
          T.let(
            :card_bill_payment,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Funds Disbursement
        FUNDS_DISBURSEMENT =
          T.let(
            :funds_disbursement,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Funds Transfer
        FUNDS_TRANSFER =
          T.let(
            :funds_transfer,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Loyalty and Offers
        LOYALTY_AND_OFFERS =
          T.let(
            :loyalty_and_offers,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Merchant Disbursement
        MERCHANT_DISBURSEMENT =
          T.let(
            :merchant_disbursement,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Merchant Payment
        MERCHANT_PAYMENT =
          T.let(
            :merchant_payment,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Person to Person
        PERSON_TO_PERSON =
          T.let(
            :person_to_person,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Top Up
        TOP_UP =
          T.let(
            :top_up,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Wallet Transfer
        WALLET_TRANSFER =
          T.let(
            :wallet_transfer,
            Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::CardPushTransfer::BusinessApplicationIdentifier::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Cancellation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPushTransfer::Cancellation,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Transfer was canceled.
        sig { returns(Time) }
        attr_accessor :canceled_at

        # If the Transfer was canceled by a user in the dashboard, the email address of
        # that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :canceled_by

        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        sig do
          params(canceled_at: Time, canceled_by: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Transfer was canceled.
          canceled_at:,
          # If the Transfer was canceled by a user in the dashboard, the email address of
          # that user.
          canceled_by:
        )
        end

        sig do
          override.returns(
            { canceled_at: Time, canceled_by: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class CreatedBy < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPushTransfer::CreatedBy,
              Increase::Internal::AnyHash
            )
          end

        # If present, details about the API key that created the transfer.
        sig do
          returns(T.nilable(Increase::CardPushTransfer::CreatedBy::APIKey))
        end
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(Increase::CardPushTransfer::CreatedBy::APIKey::OrHash)
          ).void
        end
        attr_writer :api_key

        # The type of object that created this transfer.
        sig do
          returns(Increase::CardPushTransfer::CreatedBy::Category::TaggedSymbol)
        end
        attr_accessor :category

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(
            T.nilable(Increase::CardPushTransfer::CreatedBy::OAuthApplication)
          )
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::CardPushTransfer::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::CardPushTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Increase::CardPushTransfer::CreatedBy::User::OrHash)
          ).void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            api_key:
              T.nilable(Increase::CardPushTransfer::CreatedBy::APIKey::OrHash),
            category: Increase::CardPushTransfer::CreatedBy::Category::OrSymbol,
            oauth_application:
              T.nilable(
                Increase::CardPushTransfer::CreatedBy::OAuthApplication::OrHash
              ),
            user: T.nilable(Increase::CardPushTransfer::CreatedBy::User::OrHash)
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
              api_key: T.nilable(Increase::CardPushTransfer::CreatedBy::APIKey),
              category:
                Increase::CardPushTransfer::CreatedBy::Category::TaggedSymbol,
              oauth_application:
                T.nilable(
                  Increase::CardPushTransfer::CreatedBy::OAuthApplication
                ),
              user: T.nilable(Increase::CardPushTransfer::CreatedBy::User)
            }
          )
        end
        def to_hash
        end

        class APIKey < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPushTransfer::CreatedBy::APIKey,
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
              T.all(Symbol, Increase::CardPushTransfer::CreatedBy::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::CardPushTransfer::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::CardPushTransfer::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::CardPushTransfer::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardPushTransfer::CreatedBy::Category::TaggedSymbol
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
                Increase::CardPushTransfer::CreatedBy::OAuthApplication,
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
                Increase::CardPushTransfer::CreatedBy::User,
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

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardPushTransfer::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::CardPushTransfer::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::CardPushTransfer::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::CardPushTransfer::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::CardPushTransfer::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::CardPushTransfer::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::CardPushTransfer::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardPushTransfer::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Decline < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPushTransfer::Decline,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer declined.
        sig { returns(Time) }
        attr_accessor :declined_at

        # A unique identifier for the transaction on the card network.
        sig { returns(T.nilable(String)) }
        attr_accessor :network_transaction_identifier

        # The reason why the transfer was declined.
        sig do
          returns(Increase::CardPushTransfer::Decline::Reason::TaggedSymbol)
        end
        attr_accessor :reason

        # If the transfer is rejected by the card network or the destination financial
        # institution, this will contain supplemental details.
        sig do
          params(
            declined_at: Time,
            network_transaction_identifier: T.nilable(String),
            reason: Increase::CardPushTransfer::Decline::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer declined.
          declined_at:,
          # A unique identifier for the transaction on the card network.
          network_transaction_identifier:,
          # The reason why the transfer was declined.
          reason:
        )
        end

        sig do
          override.returns(
            {
              declined_at: Time,
              network_transaction_identifier: T.nilable(String),
              reason: Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The reason why the transfer was declined.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CardPushTransfer::Decline::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The card issuer has declined the transaction without providing a specific reason.
          DO_NOT_HONOR =
            T.let(
              :do_not_honor,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The number of transactions for the card has exceeded the limit set by the issuer.
          ACTIVITY_COUNT_LIMIT_EXCEEDED =
            T.let(
              :activity_count_limit_exceeded,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card issuer requires the cardholder to contact them for further information regarding the transaction.
          REFER_TO_CARD_ISSUER =
            T.let(
              :refer_to_card_issuer,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card issuer requires the cardholder to contact them due to a special condition related to the transaction.
          REFER_TO_CARD_ISSUER_SPECIAL_CONDITION =
            T.let(
              :refer_to_card_issuer_special_condition,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The merchant is not valid for this transaction.
          INVALID_MERCHANT =
            T.let(
              :invalid_merchant,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card should be retained by the terminal.
          PICK_UP_CARD =
            T.let(
              :pick_up_card,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # An error occurred during processing of the transaction.
          ERROR =
            T.let(
              :error,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card should be retained by the terminal due to a special condition.
          PICK_UP_CARD_SPECIAL =
            T.let(
              :pick_up_card_special,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction is invalid and cannot be processed.
          INVALID_TRANSACTION =
            T.let(
              :invalid_transaction,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The amount of the transaction is invalid.
          INVALID_AMOUNT =
            T.let(
              :invalid_amount,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The account number provided is invalid.
          INVALID_ACCOUNT_NUMBER =
            T.let(
              :invalid_account_number,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The issuer of the card could not be found.
          NO_SUCH_ISSUER =
            T.let(
              :no_such_issuer,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction should be re-entered for processing.
          RE_ENTER_TRANSACTION =
            T.let(
              :re_enter_transaction,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # There is no credit account associated with the card.
          NO_CREDIT_ACCOUNT =
            T.let(
              :no_credit_account,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card should be retained by the terminal because it has been reported lost.
          PICK_UP_CARD_LOST =
            T.let(
              :pick_up_card_lost,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card should be retained by the terminal because it has been reported stolen.
          PICK_UP_CARD_STOLEN =
            T.let(
              :pick_up_card_stolen,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The account associated with the card has been closed.
          CLOSED_ACCOUNT =
            T.let(
              :closed_account,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # There are insufficient funds in the account to complete the transaction.
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # There is no checking account associated with the card.
          NO_CHECKING_ACCOUNT =
            T.let(
              :no_checking_account,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # There is no savings account associated with the card.
          NO_SAVINGS_ACCOUNT =
            T.let(
              :no_savings_account,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card has expired and cannot be used for transactions.
          EXPIRED_CARD =
            T.let(
              :expired_card,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction is not permitted for this cardholder.
          TRANSACTION_NOT_PERMITTED_TO_CARDHOLDER =
            T.let(
              :transaction_not_permitted_to_cardholder,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction is not allowed at this terminal.
          TRANSACTION_NOT_ALLOWED_AT_TERMINAL =
            T.let(
              :transaction_not_allowed_at_terminal,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction has been flagged as suspected fraud and cannot be processed.
          SUSPECTED_FRAUD =
            T.let(
              :suspected_fraud,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The amount of activity on the card has exceeded the limit set by the issuer.
          ACTIVITY_AMOUNT_LIMIT_EXCEEDED =
            T.let(
              :activity_amount_limit_exceeded,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card has restrictions that prevent it from being used for this transaction.
          RESTRICTED_CARD =
            T.let(
              :restricted_card,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # A security violation has occurred, preventing the transaction from being processed.
          SECURITY_VIOLATION =
            T.let(
              :security_violation,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction does not meet the anti-money laundering requirements set by the issuer.
          TRANSACTION_DOES_NOT_FULFILL_ANTI_MONEY_LAUNDERING_REQUIREMENT =
            T.let(
              :transaction_does_not_fulfill_anti_money_laundering_requirement,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The first use of the card has been blocked by the issuer.
          BLOCKED_FIRST_USE =
            T.let(
              :blocked_first_use,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The credit issuer is currently unavailable to process the transaction.
          CREDIT_ISSUER_UNAVAILABLE =
            T.let(
              :credit_issuer_unavailable,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The card verification value (CVV) results were negative, indicating a potential issue with the card.
          NEGATIVE_CARD_VERIFICATION_VALUE_RESULTS =
            T.let(
              :negative_card_verification_value_results,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The issuer of the card is currently unavailable to process the transaction.
          ISSUER_UNAVAILABLE =
            T.let(
              :issuer_unavailable,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The financial institution associated with the card could not be found.
          FINANCIAL_INSTITUTION_CANNOT_BE_FOUND =
            T.let(
              :financial_institution_cannot_be_found,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction cannot be completed due to an unspecified reason.
          TRANSACTION_CANNOT_BE_COMPLETED =
            T.let(
              :transaction_cannot_be_completed,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction is a duplicate of a previous transaction and cannot be processed again.
          DUPLICATE_TRANSACTION =
            T.let(
              :duplicate_transaction,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # A system malfunction occurred, preventing the transaction from being processed.
          SYSTEM_MALFUNCTION =
            T.let(
              :system_malfunction,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # Additional customer authentication is required to complete the transaction.
          ADDITIONAL_CUSTOMER_AUTHENTICATION_REQUIRED =
            T.let(
              :additional_customer_authentication_required,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The surcharge amount applied to the transaction is not permitted by the issuer.
          SURCHARGE_AMOUNT_NOT_PERMITTED =
            T.let(
              :surcharge_amount_not_permitted,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction was declined due to a failure in verifying the CVV2 code.
          DECLINE_FOR_CVV2_FAILURE =
            T.let(
              :decline_for_cvv2_failure,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # A stop payment order has been placed on this transaction.
          STOP_PAYMENT_ORDER =
            T.let(
              :stop_payment_order,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # An order has been placed to revoke authorization for this transaction.
          REVOCATION_OF_AUTHORIZATION_ORDER =
            T.let(
              :revocation_of_authorization_order,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          # An order has been placed to revoke all authorizations for this cardholder.
          REVOCATION_OF_ALL_AUTHORIZATIONS_ORDER =
            T.let(
              :revocation_of_all_authorizations_order,
              Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardPushTransfer::Decline::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardPushTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending approval.
        PENDING_APPROVAL =
          T.let(
            :pending_approval,
            Increase::CardPushTransfer::Status::TaggedSymbol
          )

        # The transfer has been canceled.
        CANCELED =
          T.let(:canceled, Increase::CardPushTransfer::Status::TaggedSymbol)

        # The transfer is pending review by Increase.
        PENDING_REVIEWING =
          T.let(
            :pending_reviewing,
            Increase::CardPushTransfer::Status::TaggedSymbol
          )

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::CardPushTransfer::Status::TaggedSymbol
          )

        # The transfer is queued to be submitted to the card network.
        PENDING_SUBMISSION =
          T.let(
            :pending_submission,
            Increase::CardPushTransfer::Status::TaggedSymbol
          )

        # The transfer has been submitted and is pending a response from the card network.
        SUBMITTED =
          T.let(:submitted, Increase::CardPushTransfer::Status::TaggedSymbol)

        # The transfer has been sent successfully and is complete.
        COMPLETE =
          T.let(:complete, Increase::CardPushTransfer::Status::TaggedSymbol)

        # The transfer was declined by the network or the recipient's bank.
        DECLINED =
          T.let(:declined, Increase::CardPushTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardPushTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPushTransfer::Submission,
              Increase::Internal::AnyHash
            )
          end

        # A 12-digit retrieval reference number that identifies the transfer. Usually a
        # combination of a timestamp and the trace number.
        sig { returns(String) }
        attr_accessor :retrieval_reference_number

        # A unique reference for the transfer.
        sig { returns(String) }
        attr_accessor :sender_reference

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was submitted to card network.
        sig { returns(Time) }
        attr_accessor :submitted_at

        # A 6-digit trace number that identifies the transfer within a small window of
        # time.
        sig { returns(String) }
        attr_accessor :trace_number

        # After the transfer is submitted to the card network, this will contain
        # supplemental details.
        sig do
          params(
            retrieval_reference_number: String,
            sender_reference: String,
            submitted_at: Time,
            trace_number: String
          ).returns(T.attached_class)
        end
        def self.new(
          # A 12-digit retrieval reference number that identifies the transfer. Usually a
          # combination of a timestamp and the trace number.
          retrieval_reference_number:,
          # A unique reference for the transfer.
          sender_reference:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was submitted to card network.
          submitted_at:,
          # A 6-digit trace number that identifies the transfer within a small window of
          # time.
          trace_number:
        )
        end

        sig do
          override.returns(
            {
              retrieval_reference_number: String,
              sender_reference: String,
              submitted_at: Time,
              trace_number: String
            }
          )
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_push_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardPushTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_PUSH_TRANSFER =
          T.let(
            :card_push_transfer,
            Increase::CardPushTransfer::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::CardPushTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
