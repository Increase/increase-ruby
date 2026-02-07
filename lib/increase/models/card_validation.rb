# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardValidations#create
    class CardValidation < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Card Validation's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute acceptance
      #   If the validation is accepted by the recipient bank, this will contain
      #   supplemental details.
      #
      #   @return [Increase::Models::CardValidation::Acceptance, nil]
      required :acceptance, -> { Increase::CardValidation::Acceptance }, nil?: true

      # @!attribute account_id
      #   The identifier of the Account from which to send the validation.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute card_token_id
      #   The ID of the Card Token that was used to validate the card.
      #
      #   @return [String]
      required :card_token_id, String

      # @!attribute cardholder_first_name
      #   The cardholder's first name.
      #
      #   @return [String, nil]
      required :cardholder_first_name, String, nil?: true

      # @!attribute cardholder_last_name
      #   The cardholder's last name.
      #
      #   @return [String, nil]
      required :cardholder_last_name, String, nil?: true

      # @!attribute cardholder_middle_name
      #   The cardholder's middle name.
      #
      #   @return [String, nil]
      required :cardholder_middle_name, String, nil?: true

      # @!attribute cardholder_postal_code
      #   The postal code of the cardholder's address.
      #
      #   @return [String, nil]
      required :cardholder_postal_code, String, nil?: true

      # @!attribute cardholder_street_address
      #   The cardholder's street address.
      #
      #   @return [String, nil]
      required :cardholder_street_address, String, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the validation was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the validation, either via the API or the dashboard.
      #
      #   @return [Increase::Models::CardValidation::CreatedBy, nil]
      required :created_by, -> { Increase::CardValidation::CreatedBy }, nil?: true

      # @!attribute decline
      #   If the validation is rejected by the card network or the destination financial
      #   institution, this will contain supplemental details.
      #
      #   @return [Increase::Models::CardValidation::Decline, nil]
      required :decline, -> { Increase::CardValidation::Decline }, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute merchant_category_code
      #   A four-digit code (MCC) identifying the type of business or service provided by
      #   the merchant.
      #
      #   @return [String]
      required :merchant_category_code, String

      # @!attribute merchant_city_name
      #   The city where the merchant (typically your business) is located.
      #
      #   @return [String]
      required :merchant_city_name, String

      # @!attribute merchant_name
      #   The merchant name that will appear in the cardholder’s statement descriptor.
      #   Typically your business name.
      #
      #   @return [String]
      required :merchant_name, String

      # @!attribute merchant_postal_code
      #   The postal code for the merchant’s (typically your business’s) location.
      #
      #   @return [String]
      required :merchant_postal_code, String

      # @!attribute merchant_state
      #   The U.S. state where the merchant (typically your business) is located.
      #
      #   @return [String]
      required :merchant_state, String

      # @!attribute status
      #   The lifecycle status of the validation.
      #
      #   @return [Symbol, Increase::Models::CardValidation::Status]
      required :status, enum: -> { Increase::CardValidation::Status }

      # @!attribute submission
      #   After the validation is submitted to the card network, this will contain
      #   supplemental details.
      #
      #   @return [Increase::Models::CardValidation::Submission, nil]
      required :submission, -> { Increase::CardValidation::Submission }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_validation`.
      #
      #   @return [Symbol, Increase::Models::CardValidation::Type]
      required :type, enum: -> { Increase::CardValidation::Type }

      # @!method initialize(id:, acceptance:, account_id:, card_token_id:, cardholder_first_name:, cardholder_last_name:, cardholder_middle_name:, cardholder_postal_code:, cardholder_street_address:, created_at:, created_by:, decline:, idempotency_key:, merchant_category_code:, merchant_city_name:, merchant_name:, merchant_postal_code:, merchant_state:, status:, submission:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardValidation} for more details.
      #
      #   Card Validations are used to validate a card and its cardholder before sending
      #   funds to or pulling funds from a card.
      #
      #   @param id [String] The Card Validation's identifier.
      #
      #   @param acceptance [Increase::Models::CardValidation::Acceptance, nil] If the validation is accepted by the recipient bank, this will contain supplemen
      #
      #   @param account_id [String] The identifier of the Account from which to send the validation.
      #
      #   @param card_token_id [String] The ID of the Card Token that was used to validate the card.
      #
      #   @param cardholder_first_name [String, nil] The cardholder's first name.
      #
      #   @param cardholder_last_name [String, nil] The cardholder's last name.
      #
      #   @param cardholder_middle_name [String, nil] The cardholder's middle name.
      #
      #   @param cardholder_postal_code [String, nil] The postal code of the cardholder's address.
      #
      #   @param cardholder_street_address [String, nil] The cardholder's street address.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::Models::CardValidation::CreatedBy, nil] What object created the validation, either via the API or the dashboard.
      #
      #   @param decline [Increase::Models::CardValidation::Decline, nil] If the validation is rejected by the card network or the destination financial i
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param merchant_category_code [String] A four-digit code (MCC) identifying the type of business or service provided by
      #
      #   @param merchant_city_name [String] The city where the merchant (typically your business) is located.
      #
      #   @param merchant_name [String] The merchant name that will appear in the cardholder’s statement descriptor. Typ
      #
      #   @param merchant_postal_code [String] The postal code for the merchant’s (typically your business’s) location.
      #
      #   @param merchant_state [String] The U.S. state where the merchant (typically your business) is located.
      #
      #   @param status [Symbol, Increase::Models::CardValidation::Status] The lifecycle status of the validation.
      #
      #   @param submission [Increase::Models::CardValidation::Submission, nil] After the validation is submitted to the card network, this will contain supplem
      #
      #   @param type [Symbol, Increase::Models::CardValidation::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::CardValidation#acceptance
      class Acceptance < Increase::Internal::Type::BaseModel
        # @!attribute accepted_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the validation was accepted by the issuing bank.
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
        #   @return [Symbol, Increase::Models::CardValidation::Acceptance::CardVerificationValue2Result, nil]
        required :card_verification_value2_result,
                 enum: -> { Increase::CardValidation::Acceptance::CardVerificationValue2Result },
                 nil?: true

        # @!attribute cardholder_first_name_result
        #   The result of the cardholder first name match.
        #
        #   @return [Symbol, Increase::Models::CardValidation::Acceptance::CardholderFirstNameResult, nil]
        required :cardholder_first_name_result,
                 enum: -> { Increase::CardValidation::Acceptance::CardholderFirstNameResult },
                 nil?: true

        # @!attribute cardholder_full_name_result
        #   The result of the cardholder full name match.
        #
        #   @return [Symbol, Increase::Models::CardValidation::Acceptance::CardholderFullNameResult, nil]
        required :cardholder_full_name_result,
                 enum: -> { Increase::CardValidation::Acceptance::CardholderFullNameResult },
                 nil?: true

        # @!attribute cardholder_last_name_result
        #   The result of the cardholder last name match.
        #
        #   @return [Symbol, Increase::Models::CardValidation::Acceptance::CardholderLastNameResult, nil]
        required :cardholder_last_name_result,
                 enum: -> { Increase::CardValidation::Acceptance::CardholderLastNameResult },
                 nil?: true

        # @!attribute cardholder_middle_name_result
        #   The result of the cardholder middle name match.
        #
        #   @return [Symbol, Increase::Models::CardValidation::Acceptance::CardholderMiddleNameResult, nil]
        required :cardholder_middle_name_result,
                 enum: -> { Increase::CardValidation::Acceptance::CardholderMiddleNameResult },
                 nil?: true

        # @!attribute cardholder_postal_code_result
        #   The result of the cardholder postal code match.
        #
        #   @return [Symbol, Increase::Models::CardValidation::Acceptance::CardholderPostalCodeResult, nil]
        required :cardholder_postal_code_result,
                 enum: -> { Increase::CardValidation::Acceptance::CardholderPostalCodeResult },
                 nil?: true

        # @!attribute cardholder_street_address_result
        #   The result of the cardholder street address match.
        #
        #   @return [Symbol, Increase::Models::CardValidation::Acceptance::CardholderStreetAddressResult, nil]
        required :cardholder_street_address_result,
                 enum: -> { Increase::CardValidation::Acceptance::CardholderStreetAddressResult },
                 nil?: true

        # @!attribute network_transaction_identifier
        #   A unique identifier for the transaction on the card network.
        #
        #   @return [String, nil]
        required :network_transaction_identifier, String, nil?: true

        # @!method initialize(accepted_at:, authorization_identification_response:, card_verification_value2_result:, cardholder_first_name_result:, cardholder_full_name_result:, cardholder_last_name_result:, cardholder_middle_name_result:, cardholder_postal_code_result:, cardholder_street_address_result:, network_transaction_identifier:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardValidation::Acceptance} for more details.
        #
        #   If the validation is accepted by the recipient bank, this will contain
        #   supplemental details.
        #
        #   @param accepted_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param authorization_identification_response [String] The authorization identification response from the issuing bank.
        #
        #   @param card_verification_value2_result [Symbol, Increase::Models::CardValidation::Acceptance::CardVerificationValue2Result, nil] The result of the Card Verification Value 2 match.
        #
        #   @param cardholder_first_name_result [Symbol, Increase::Models::CardValidation::Acceptance::CardholderFirstNameResult, nil] The result of the cardholder first name match.
        #
        #   @param cardholder_full_name_result [Symbol, Increase::Models::CardValidation::Acceptance::CardholderFullNameResult, nil] The result of the cardholder full name match.
        #
        #   @param cardholder_last_name_result [Symbol, Increase::Models::CardValidation::Acceptance::CardholderLastNameResult, nil] The result of the cardholder last name match.
        #
        #   @param cardholder_middle_name_result [Symbol, Increase::Models::CardValidation::Acceptance::CardholderMiddleNameResult, nil] The result of the cardholder middle name match.
        #
        #   @param cardholder_postal_code_result [Symbol, Increase::Models::CardValidation::Acceptance::CardholderPostalCodeResult, nil] The result of the cardholder postal code match.
        #
        #   @param cardholder_street_address_result [Symbol, Increase::Models::CardValidation::Acceptance::CardholderStreetAddressResult, nil] The result of the cardholder street address match.
        #
        #   @param network_transaction_identifier [String, nil] A unique identifier for the transaction on the card network.

        # The result of the Card Verification Value 2 match.
        #
        # @see Increase::Models::CardValidation::Acceptance#card_verification_value2_result
        module CardVerificationValue2Result
          extend Increase::Internal::Type::Enum

          # The Card Verification Value 2 (CVV2) matches the expected value.
          MATCH = :match

          # The Card Verification Value 2 (CVV2) does not match the expected value.
          NO_MATCH = :no_match

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The result of the cardholder first name match.
        #
        # @see Increase::Models::CardValidation::Acceptance#cardholder_first_name_result
        module CardholderFirstNameResult
          extend Increase::Internal::Type::Enum

          # The cardholder name component matches the expected value.
          MATCH = :match

          # The cardholder name component does not match the expected value.
          NO_MATCH = :no_match

          # The cardholder name component partially matches the expected value.
          PARTIAL_MATCH = :partial_match

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The result of the cardholder full name match.
        #
        # @see Increase::Models::CardValidation::Acceptance#cardholder_full_name_result
        module CardholderFullNameResult
          extend Increase::Internal::Type::Enum

          # The cardholder name component matches the expected value.
          MATCH = :match

          # The cardholder name component does not match the expected value.
          NO_MATCH = :no_match

          # The cardholder name component partially matches the expected value.
          PARTIAL_MATCH = :partial_match

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The result of the cardholder last name match.
        #
        # @see Increase::Models::CardValidation::Acceptance#cardholder_last_name_result
        module CardholderLastNameResult
          extend Increase::Internal::Type::Enum

          # The cardholder name component matches the expected value.
          MATCH = :match

          # The cardholder name component does not match the expected value.
          NO_MATCH = :no_match

          # The cardholder name component partially matches the expected value.
          PARTIAL_MATCH = :partial_match

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The result of the cardholder middle name match.
        #
        # @see Increase::Models::CardValidation::Acceptance#cardholder_middle_name_result
        module CardholderMiddleNameResult
          extend Increase::Internal::Type::Enum

          # The cardholder name component matches the expected value.
          MATCH = :match

          # The cardholder name component does not match the expected value.
          NO_MATCH = :no_match

          # The cardholder name component partially matches the expected value.
          PARTIAL_MATCH = :partial_match

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The result of the cardholder postal code match.
        #
        # @see Increase::Models::CardValidation::Acceptance#cardholder_postal_code_result
        module CardholderPostalCodeResult
          extend Increase::Internal::Type::Enum

          # The cardholder address component matches the expected value.
          MATCH = :match

          # The cardholder address component does not match the expected value.
          NO_MATCH = :no_match

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The result of the cardholder street address match.
        #
        # @see Increase::Models::CardValidation::Acceptance#cardholder_street_address_result
        module CardholderStreetAddressResult
          extend Increase::Internal::Type::Enum

          # The cardholder address component matches the expected value.
          MATCH = :match

          # The cardholder address component does not match the expected value.
          NO_MATCH = :no_match

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::CardValidation#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::CardValidation::CreatedBy::Category]
        required :category, enum: -> { Increase::CardValidation::CreatedBy::Category }

        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::CardValidation::CreatedBy::APIKey, nil]
        optional :api_key, -> { Increase::CardValidation::CreatedBy::APIKey }, nil?: true

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::CardValidation::CreatedBy::OAuthApplication, nil]
        optional :oauth_application, -> { Increase::CardValidation::CreatedBy::OAuthApplication }, nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::CardValidation::CreatedBy::User, nil]
        optional :user, -> { Increase::CardValidation::CreatedBy::User }, nil?: true

        # @!method initialize(category:, api_key: nil, oauth_application: nil, user: nil)
        #   What object created the validation, either via the API or the dashboard.
        #
        #   @param category [Symbol, Increase::Models::CardValidation::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param api_key [Increase::Models::CardValidation::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param oauth_application [Increase::Models::CardValidation::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::Models::CardValidation::CreatedBy::User, nil] If present, details about the User that created the transfer.

        # The type of object that created this transfer.
        #
        # @see Increase::Models::CardValidation::CreatedBy#category
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

        # @see Increase::Models::CardValidation::CreatedBy#api_key
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

        # @see Increase::Models::CardValidation::CreatedBy#oauth_application
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

        # @see Increase::Models::CardValidation::CreatedBy#user
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

      # @see Increase::Models::CardValidation#decline
      class Decline < Increase::Internal::Type::BaseModel
        # @!attribute declined_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the validation was declined.
        #
        #   @return [Time]
        required :declined_at, Time

        # @!attribute network_transaction_identifier
        #   A unique identifier for the transaction on the card network.
        #
        #   @return [String, nil]
        required :network_transaction_identifier, String, nil?: true

        # @!attribute reason
        #   The reason why the validation was declined.
        #
        #   @return [Symbol, Increase::Models::CardValidation::Decline::Reason]
        required :reason, enum: -> { Increase::CardValidation::Decline::Reason }

        # @!method initialize(declined_at:, network_transaction_identifier:, reason:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardValidation::Decline} for more details.
        #
        #   If the validation is rejected by the card network or the destination financial
        #   institution, this will contain supplemental details.
        #
        #   @param declined_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param network_transaction_identifier [String, nil] A unique identifier for the transaction on the card network.
        #
        #   @param reason [Symbol, Increase::Models::CardValidation::Decline::Reason] The reason why the validation was declined.

        # The reason why the validation was declined.
        #
        # @see Increase::Models::CardValidation::Decline#reason
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

      # The lifecycle status of the validation.
      #
      # @see Increase::Models::CardValidation#status
      module Status
        extend Increase::Internal::Type::Enum

        # The validation requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # The validation is queued to be submitted to the card network.
        PENDING_SUBMISSION = :pending_submission

        # The validation has been submitted and is pending a response from the card network.
        SUBMITTED = :submitted

        # The validation has been sent successfully and is complete.
        COMPLETE = :complete

        # The validation was declined by the network or the recipient's bank.
        DECLINED = :declined

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::CardValidation#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute retrieval_reference_number
        #   A 12-digit retrieval reference number that identifies the validation. Usually a
        #   combination of a timestamp and the trace number.
        #
        #   @return [String]
        required :retrieval_reference_number, String

        # @!attribute submitted_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the validation was submitted to the card network.
        #
        #   @return [Time]
        required :submitted_at, Time

        # @!attribute trace_number
        #   A 6-digit trace number that identifies the validation within a short time
        #   window.
        #
        #   @return [String]
        required :trace_number, String

        # @!method initialize(retrieval_reference_number:, submitted_at:, trace_number:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardValidation::Submission} for more details.
        #
        #   After the validation is submitted to the card network, this will contain
        #   supplemental details.
        #
        #   @param retrieval_reference_number [String] A 12-digit retrieval reference number that identifies the validation. Usually a
        #
        #   @param submitted_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param trace_number [String] A 6-digit trace number that identifies the validation within a short time window
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_validation`.
      #
      # @see Increase::Models::CardValidation#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_VALIDATION = :card_validation

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
