# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardPushTransfers#create
    class CardPushTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Card Push Transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute acceptance
      #   If the transfer is accepted by the recipient bank, this will contain
      #   supplemental details.
      #
      #   @return [Increase::Models::CardPushTransfer::Acceptance, nil]
      required :acceptance, -> { Increase::CardPushTransfer::Acceptance }, nil?: true

      # @!attribute account_id
      #   The Account from which the transfer was sent.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute approval
      #   If your account requires approvals for transfers and the transfer was approved,
      #   this will contain details of the approval.
      #
      #   @return [Increase::Models::CardPushTransfer::Approval, nil]
      required :approval, -> { Increase::CardPushTransfer::Approval }, nil?: true

      # @!attribute business_application_identifier
      #   The Business Application Identifier describes the type of transaction being
      #   performed. Your program must be approved for the specified Business Application
      #   Identifier in order to use it.
      #
      #   @return [Symbol, Increase::Models::CardPushTransfer::BusinessApplicationIdentifier]
      required :business_application_identifier,
               enum: -> { Increase::CardPushTransfer::BusinessApplicationIdentifier }

      # @!attribute cancellation
      #   If your account requires approvals for transfers and the transfer was not
      #   approved, this will contain details of the cancellation.
      #
      #   @return [Increase::Models::CardPushTransfer::Cancellation, nil]
      required :cancellation, -> { Increase::CardPushTransfer::Cancellation }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::Models::CardPushTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::CardPushTransfer::CreatedBy }, nil?: true

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   currency.
      #
      #   @return [Symbol, Increase::Models::CardPushTransfer::Currency]
      required :currency, enum: -> { Increase::CardPushTransfer::Currency }

      # @!attribute decline
      #   If the transfer is rejected by the card network or the destination financial
      #   institution, this will contain supplemental details.
      #
      #   @return [Increase::Models::CardPushTransfer::Decline, nil]
      required :decline, -> { Increase::CardPushTransfer::Decline }, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute merchant_category_code
      #   The merchant category code (MCC) of the merchant (generally your business)
      #   sending the transfer. This is a four-digit code that describes the type of
      #   business or service provided by the merchant. Your program must be approved for
      #   the specified MCC in order to use it.
      #
      #   @return [String]
      required :merchant_category_code, String

      # @!attribute merchant_city_name
      #   The city name of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_city_name, String

      # @!attribute merchant_name
      #   The merchant name shows up as the statement descriptor for the transfer. This is
      #   typically the name of your business or organization.
      #
      #   @return [String]
      required :merchant_name, String

      # @!attribute merchant_name_prefix
      #   For certain Business Application Identifiers, the statement descriptor is
      #   `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
      #   four character prefix that identifies the merchant.
      #
      #   @return [String]
      required :merchant_name_prefix, String

      # @!attribute merchant_postal_code
      #   The postal code of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_postal_code, String

      # @!attribute merchant_state
      #   The state of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_state, String

      # @!attribute recipient_name
      #   The name of the funds recipient.
      #
      #   @return [String]
      required :recipient_name, String

      # @!attribute sender_address_city
      #   The city of the sender.
      #
      #   @return [String]
      required :sender_address_city, String

      # @!attribute sender_address_line1
      #   The address line 1 of the sender.
      #
      #   @return [String]
      required :sender_address_line1, String

      # @!attribute sender_address_postal_code
      #   The postal code of the sender.
      #
      #   @return [String]
      required :sender_address_postal_code, String

      # @!attribute sender_address_state
      #   The state of the sender.
      #
      #   @return [String]
      required :sender_address_state, String

      # @!attribute sender_name
      #   The name of the funds originator.
      #
      #   @return [String]
      required :sender_name, String

      # @!attribute source_account_number_id
      #   The Account Number the recipient will see as having sent the transfer.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::CardPushTransfer::Status]
      required :status, enum: -> { Increase::CardPushTransfer::Status }

      # @!attribute submission
      #   After the transfer is submitted to the card network, this will contain
      #   supplemental details.
      #
      #   @return [Increase::Models::CardPushTransfer::Submission, nil]
      required :submission, -> { Increase::CardPushTransfer::Submission }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_push_transfer`.
      #
      #   @return [Symbol, Increase::Models::CardPushTransfer::Type]
      required :type, enum: -> { Increase::CardPushTransfer::Type }

      # @!method initialize(id:, acceptance:, account_id:, amount:, approval:, business_application_identifier:, cancellation:, created_at:, created_by:, currency:, decline:, idempotency_key:, merchant_category_code:, merchant_city_name:, merchant_name:, merchant_name_prefix:, merchant_postal_code:, merchant_state:, recipient_name:, sender_address_city:, sender_address_line1:, sender_address_postal_code:, sender_address_state:, sender_name:, source_account_number_id:, status:, submission:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardPushTransfer} for more details.
      #
      #   Card Push Transfers send funds to a recipient's payment card in real-time.
      #
      #   @param id [String] The Card Push Transfer's identifier.
      #
      #   @param acceptance [Increase::Models::CardPushTransfer::Acceptance, nil] If the transfer is accepted by the recipient bank, this will contain supplementa
      #
      #   @param account_id [String] The Account from which the transfer was sent.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param approval [Increase::Models::CardPushTransfer::Approval, nil] If your account requires approvals for transfers and the transfer was approved,
      #
      #   @param business_application_identifier [Symbol, Increase::Models::CardPushTransfer::BusinessApplicationIdentifier] The Business Application Identifier describes the type of transaction being perf
      #
      #   @param cancellation [Increase::Models::CardPushTransfer::Cancellation, nil] If your account requires approvals for transfers and the transfer was not approv
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::Models::CardPushTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #
      #   @param currency [Symbol, Increase::Models::CardPushTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's c
      #
      #   @param decline [Increase::Models::CardPushTransfer::Decline, nil] If the transfer is rejected by the card network or the destination financial ins
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param merchant_category_code [String] The merchant category code (MCC) of the merchant (generally your business) sendi
      #
      #   @param merchant_city_name [String] The city name of the merchant (generally your business) sending the transfer.
      #
      #   @param merchant_name [String] The merchant name shows up as the statement descriptor for the transfer. This is
      #
      #   @param merchant_name_prefix [String] For certain Business Application Identifiers, the statement descriptor is `merch
      #
      #   @param merchant_postal_code [String] The postal code of the merchant (generally your business) sending the transfer.
      #
      #   @param merchant_state [String] The state of the merchant (generally your business) sending the transfer.
      #
      #   @param recipient_name [String] The name of the funds recipient.
      #
      #   @param sender_address_city [String] The city of the sender.
      #
      #   @param sender_address_line1 [String] The address line 1 of the sender.
      #
      #   @param sender_address_postal_code [String] The postal code of the sender.
      #
      #   @param sender_address_state [String] The state of the sender.
      #
      #   @param sender_name [String] The name of the funds originator.
      #
      #   @param source_account_number_id [String] The Account Number the recipient will see as having sent the transfer.
      #
      #   @param status [Symbol, Increase::Models::CardPushTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param submission [Increase::Models::CardPushTransfer::Submission, nil] After the transfer is submitted to the card network, this will contain supplemen
      #
      #   @param type [Symbol, Increase::Models::CardPushTransfer::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::CardPushTransfer#acceptance
      class Acceptance < Increase::Internal::Type::BaseModel
        # @!attribute accepted_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was accepted by the issuing bank.
        #
        #   @return [Time]
        required :accepted_at, Time

        # @!attribute authorization_identification_response
        #   The authorization identification response from the issuing bank.
        #
        #   @return [String]
        required :authorization_identification_response, String

        # @!attribute card_verification_value2_result
        #   The result of the Card Verification Value 2 match.
        #
        #   @return [Symbol, Increase::Models::CardPushTransfer::Acceptance::CardVerificationValue2Result, nil]
        required :card_verification_value2_result,
                 enum: -> { Increase::CardPushTransfer::Acceptance::CardVerificationValue2Result },
                 nil?: true

        # @!attribute network_transaction_identifier
        #   A unique identifier for the transaction on the card network.
        #
        #   @return [String, nil]
        required :network_transaction_identifier, String, nil?: true

        # @!method initialize(accepted_at:, authorization_identification_response:, card_verification_value2_result:, network_transaction_identifier:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardPushTransfer::Acceptance} for more details.
        #
        #   If the transfer is accepted by the recipient bank, this will contain
        #   supplemental details.
        #
        #   @param accepted_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param authorization_identification_response [String] The authorization identification response from the issuing bank.
        #
        #   @param card_verification_value2_result [Symbol, Increase::Models::CardPushTransfer::Acceptance::CardVerificationValue2Result, nil] The result of the Card Verification Value 2 match.
        #
        #   @param network_transaction_identifier [String, nil] A unique identifier for the transaction on the card network.

        # The result of the Card Verification Value 2 match.
        #
        # @see Increase::Models::CardPushTransfer::Acceptance#card_verification_value2_result
        module CardVerificationValue2Result
          extend Increase::Internal::Type::Enum

          # The Card Verification Value 2 (CVV2) matches the expected value.
          MATCH = :match

          # The Card Verification Value 2 (CVV2) does not match the expected value.
          NO_MATCH = :no_match

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::CardPushTransfer#approval
      class Approval < Increase::Internal::Type::BaseModel
        # @!attribute approved_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was approved.
        #
        #   @return [Time]
        required :approved_at, Time

        # @!attribute approved_by
        #   If the Transfer was approved by a user in the dashboard, the email address of
        #   that user.
        #
        #   @return [String, nil]
        required :approved_by, String, nil?: true

        # @!method initialize(approved_at:, approved_by:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardPushTransfer::Approval} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was approved,
        #   this will contain details of the approval.
        #
        #   @param approved_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param approved_by [String, nil] If the Transfer was approved by a user in the dashboard, the email address of th
      end

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      #
      # @see Increase::Models::CardPushTransfer#business_application_identifier
      module BusinessApplicationIdentifier
        extend Increase::Internal::Type::Enum

        # Account to Account
        ACCOUNT_TO_ACCOUNT = :account_to_account

        # Business to Business
        BUSINESS_TO_BUSINESS = :business_to_business

        # Money Transfer Bank Initiated
        MONEY_TRANSFER_BANK_INITIATED = :money_transfer_bank_initiated

        # Non-Card Bill Payment
        NON_CARD_BILL_PAYMENT = :non_card_bill_payment

        # Consumer Bill Payment
        CONSUMER_BILL_PAYMENT = :consumer_bill_payment

        # Card Bill Payment
        CARD_BILL_PAYMENT = :card_bill_payment

        # Funds Disbursement
        FUNDS_DISBURSEMENT = :funds_disbursement

        # Funds Transfer
        FUNDS_TRANSFER = :funds_transfer

        # Loyalty and Offers
        LOYALTY_AND_OFFERS = :loyalty_and_offers

        # Merchant Disbursement
        MERCHANT_DISBURSEMENT = :merchant_disbursement

        # Merchant Payment
        MERCHANT_PAYMENT = :merchant_payment

        # Person to Person
        PERSON_TO_PERSON = :person_to_person

        # Top Up
        TOP_UP = :top_up

        # Wallet Transfer
        WALLET_TRANSFER = :wallet_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::CardPushTransfer#cancellation
      class Cancellation < Increase::Internal::Type::BaseModel
        # @!attribute canceled_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Transfer was canceled.
        #
        #   @return [Time]
        required :canceled_at, Time

        # @!attribute canceled_by
        #   If the Transfer was canceled by a user in the dashboard, the email address of
        #   that user.
        #
        #   @return [String, nil]
        required :canceled_by, String, nil?: true

        # @!method initialize(canceled_at:, canceled_by:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardPushTransfer::Cancellation} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was not
        #   approved, this will contain details of the cancellation.
        #
        #   @param canceled_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param canceled_by [String, nil] If the Transfer was canceled by a user in the dashboard, the email address of th
      end

      # @see Increase::Models::CardPushTransfer#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::CardPushTransfer::CreatedBy::APIKey, nil]
        required :api_key, -> { Increase::CardPushTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::CardPushTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::CardPushTransfer::CreatedBy::Category }

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::CardPushTransfer::CreatedBy::OAuthApplication, nil]
        required :oauth_application,
                 -> {
                   Increase::CardPushTransfer::CreatedBy::OAuthApplication
                 },
                 nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::CardPushTransfer::CreatedBy::User, nil]
        required :user, -> { Increase::CardPushTransfer::CreatedBy::User }, nil?: true

        # @!method initialize(api_key:, category:, oauth_application:, user:)
        #   What object created the transfer, either via the API or the dashboard.
        #
        #   @param api_key [Increase::Models::CardPushTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param category [Symbol, Increase::Models::CardPushTransfer::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param oauth_application [Increase::Models::CardPushTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::Models::CardPushTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.

        # @see Increase::Models::CardPushTransfer::CreatedBy#api_key
        class APIKey < Increase::Internal::Type::BaseModel
          # @!attribute description
          #   The description set for the API key when it was created.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!method initialize(description:)
          #   If present, details about the API key that created the transfer.
          #
          #   @param description [String, nil] The description set for the API key when it was created.
        end

        # The type of object that created this transfer.
        #
        # @see Increase::Models::CardPushTransfer::CreatedBy#category
        module Category
          extend Increase::Internal::Type::Enum

          # An API key. Details will be under the `api_key` object.
          API_KEY = :api_key

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION = :oauth_application

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER = :user

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::CardPushTransfer::CreatedBy#oauth_application
        class OAuthApplication < Increase::Internal::Type::BaseModel
          # @!attribute name
          #   The name of the OAuth Application.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(name:)
          #   If present, details about the OAuth Application that created the transfer.
          #
          #   @param name [String] The name of the OAuth Application.
        end

        # @see Increase::Models::CardPushTransfer::CreatedBy#user
        class User < Increase::Internal::Type::BaseModel
          # @!attribute email
          #   The email address of the User.
          #
          #   @return [String]
          required :email, String

          # @!method initialize(email:)
          #   If present, details about the User that created the transfer.
          #
          #   @param email [String] The email address of the User.
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency.
      #
      # @see Increase::Models::CardPushTransfer#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::CardPushTransfer#decline
      class Decline < Increase::Internal::Type::BaseModel
        # @!attribute declined_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer declined.
        #
        #   @return [Time]
        required :declined_at, Time

        # @!attribute network_transaction_identifier
        #   A unique identifier for the transaction on the card network.
        #
        #   @return [String, nil]
        required :network_transaction_identifier, String, nil?: true

        # @!attribute reason
        #   The reason why the transfer was declined.
        #
        #   @return [Symbol, Increase::Models::CardPushTransfer::Decline::Reason]
        required :reason, enum: -> { Increase::CardPushTransfer::Decline::Reason }

        # @!method initialize(declined_at:, network_transaction_identifier:, reason:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardPushTransfer::Decline} for more details.
        #
        #   If the transfer is rejected by the card network or the destination financial
        #   institution, this will contain supplemental details.
        #
        #   @param declined_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param network_transaction_identifier [String, nil] A unique identifier for the transaction on the card network.
        #
        #   @param reason [Symbol, Increase::Models::CardPushTransfer::Decline::Reason] The reason why the transfer was declined.

        # The reason why the transfer was declined.
        #
        # @see Increase::Models::CardPushTransfer::Decline#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The card issuer has declined the transaction without providing a specific reason.
          DO_NOT_HONOR = :do_not_honor

          # The number of transactions for the card has exceeded the limit set by the issuer.
          ACTIVITY_COUNT_LIMIT_EXCEEDED = :activity_count_limit_exceeded

          # The card issuer requires the cardholder to contact them for further information regarding the transaction.
          REFER_TO_CARD_ISSUER = :refer_to_card_issuer

          # The card issuer requires the cardholder to contact them due to a special condition related to the transaction.
          REFER_TO_CARD_ISSUER_SPECIAL_CONDITION = :refer_to_card_issuer_special_condition

          # The merchant is not valid for this transaction.
          INVALID_MERCHANT = :invalid_merchant

          # The card should be retained by the terminal.
          PICK_UP_CARD = :pick_up_card

          # An error occurred during processing of the transaction.
          ERROR = :error

          # The card should be retained by the terminal due to a special condition.
          PICK_UP_CARD_SPECIAL = :pick_up_card_special

          # The transaction is invalid and cannot be processed.
          INVALID_TRANSACTION = :invalid_transaction

          # The amount of the transaction is invalid.
          INVALID_AMOUNT = :invalid_amount

          # The account number provided is invalid.
          INVALID_ACCOUNT_NUMBER = :invalid_account_number

          # The issuer of the card could not be found.
          NO_SUCH_ISSUER = :no_such_issuer

          # The transaction should be re-entered for processing.
          RE_ENTER_TRANSACTION = :re_enter_transaction

          # There is no credit account associated with the card.
          NO_CREDIT_ACCOUNT = :no_credit_account

          # The card should be retained by the terminal because it has been reported lost.
          PICK_UP_CARD_LOST = :pick_up_card_lost

          # The card should be retained by the terminal because it has been reported stolen.
          PICK_UP_CARD_STOLEN = :pick_up_card_stolen

          # The account associated with the card has been closed.
          CLOSED_ACCOUNT = :closed_account

          # There are insufficient funds in the account to complete the transaction.
          INSUFFICIENT_FUNDS = :insufficient_funds

          # There is no checking account associated with the card.
          NO_CHECKING_ACCOUNT = :no_checking_account

          # There is no savings account associated with the card.
          NO_SAVINGS_ACCOUNT = :no_savings_account

          # The card has expired and cannot be used for transactions.
          EXPIRED_CARD = :expired_card

          # The transaction is not permitted for this cardholder.
          TRANSACTION_NOT_PERMITTED_TO_CARDHOLDER = :transaction_not_permitted_to_cardholder

          # The transaction is not allowed at this terminal.
          TRANSACTION_NOT_ALLOWED_AT_TERMINAL = :transaction_not_allowed_at_terminal

          # The transaction has been flagged as suspected fraud and cannot be processed.
          SUSPECTED_FRAUD = :suspected_fraud

          # The amount of activity on the card has exceeded the limit set by the issuer.
          ACTIVITY_AMOUNT_LIMIT_EXCEEDED = :activity_amount_limit_exceeded

          # The card has restrictions that prevent it from being used for this transaction.
          RESTRICTED_CARD = :restricted_card

          # A security violation has occurred, preventing the transaction from being processed.
          SECURITY_VIOLATION = :security_violation

          # The transaction does not meet the anti-money laundering requirements set by the issuer.
          TRANSACTION_DOES_NOT_FULFILL_ANTI_MONEY_LAUNDERING_REQUIREMENT =
            :transaction_does_not_fulfill_anti_money_laundering_requirement

          # The first use of the card has been blocked by the issuer.
          BLOCKED_FIRST_USE = :blocked_first_use

          # The credit issuer is currently unavailable to process the transaction.
          CREDIT_ISSUER_UNAVAILABLE = :credit_issuer_unavailable

          # The card verification value (CVV) results were negative, indicating a potential issue with the card.
          NEGATIVE_CARD_VERIFICATION_VALUE_RESULTS = :negative_card_verification_value_results

          # The issuer of the card is currently unavailable to process the transaction.
          ISSUER_UNAVAILABLE = :issuer_unavailable

          # The financial institution associated with the card could not be found.
          FINANCIAL_INSTITUTION_CANNOT_BE_FOUND = :financial_institution_cannot_be_found

          # The transaction cannot be completed due to an unspecified reason.
          TRANSACTION_CANNOT_BE_COMPLETED = :transaction_cannot_be_completed

          # The transaction is a duplicate of a previous transaction and cannot be processed again.
          DUPLICATE_TRANSACTION = :duplicate_transaction

          # A system malfunction occurred, preventing the transaction from being processed.
          SYSTEM_MALFUNCTION = :system_malfunction

          # Additional customer authentication is required to complete the transaction.
          ADDITIONAL_CUSTOMER_AUTHENTICATION_REQUIRED = :additional_customer_authentication_required

          # The surcharge amount applied to the transaction is not permitted by the issuer.
          SURCHARGE_AMOUNT_NOT_PERMITTED = :surcharge_amount_not_permitted

          # The transaction was declined due to a failure in verifying the CVV2 code.
          DECLINE_FOR_CVV2_FAILURE = :decline_for_cvv2_failure

          # A stop payment order has been placed on this transaction.
          STOP_PAYMENT_ORDER = :stop_payment_order

          # An order has been placed to revoke authorization for this transaction.
          REVOCATION_OF_AUTHORIZATION_ORDER = :revocation_of_authorization_order

          # An order has been placed to revoke all authorizations for this cardholder.
          REVOCATION_OF_ALL_AUTHORIZATIONS_ORDER = :revocation_of_all_authorizations_order

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::CardPushTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is pending approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer has been canceled.
        CANCELED = :canceled

        # The transfer is pending review by Increase.
        PENDING_REVIEWING = :pending_reviewing

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # The transfer is queued to be submitted to the card network.
        PENDING_SUBMISSION = :pending_submission

        # The transfer has been submitted and is pending a response from the card network.
        SUBMITTED = :submitted

        # The transfer has been sent successfully and is complete.
        COMPLETE = :complete

        # The transfer was declined by the network or the recipient's bank.
        DECLINED = :declined

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::CardPushTransfer#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute retrieval_reference_number
        #   A 12-digit retrieval reference number that identifies the transfer. Usually a
        #   combination of a timestamp and the trace number.
        #
        #   @return [String]
        required :retrieval_reference_number, String

        # @!attribute sender_reference
        #   A unique reference for the transfer.
        #
        #   @return [String]
        required :sender_reference, String

        # @!attribute submitted_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was submitted to card network.
        #
        #   @return [Time]
        required :submitted_at, Time

        # @!attribute trace_number
        #   A 6-digit trace number that identifies the transfer within a small window of
        #   time.
        #
        #   @return [String]
        required :trace_number, String

        # @!method initialize(retrieval_reference_number:, sender_reference:, submitted_at:, trace_number:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardPushTransfer::Submission} for more details.
        #
        #   After the transfer is submitted to the card network, this will contain
        #   supplemental details.
        #
        #   @param retrieval_reference_number [String] A 12-digit retrieval reference number that identifies the transfer. Usually a co
        #
        #   @param sender_reference [String] A unique reference for the transfer.
        #
        #   @param submitted_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param trace_number [String] A 6-digit trace number that identifies the transfer within a small window of tim
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_push_transfer`.
      #
      # @see Increase::Models::CardPushTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_PUSH_TRANSFER = :card_push_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
