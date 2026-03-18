# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardTokens#create
      class CardTokenCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute capabilities
        #   The capabilities of the outbound card token.
        #
        #   @return [Array<Increase::Models::Simulations::CardTokenCreateParams::Capability>, nil]
        optional :capabilities,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Simulations::CardTokenCreateParams::Capability] }

        # @!attribute expiration
        #   The expiration date of the card.
        #
        #   @return [Date, nil]
        optional :expiration, Date

        # @!attribute last4
        #   The last 4 digits of the card number.
        #
        #   @return [String, nil]
        optional :last4, String

        # @!attribute outcome
        #   The outcome to simulate for card push transfers using this token.
        #
        #   @return [Increase::Models::Simulations::CardTokenCreateParams::Outcome, nil]
        optional :outcome, -> { Increase::Simulations::CardTokenCreateParams::Outcome }

        # @!attribute prefix
        #   The prefix of the card number, usually the first 8 digits.
        #
        #   @return [String, nil]
        optional :prefix, String

        # @!attribute primary_account_number_length
        #   The total length of the card number, including prefix and last4.
        #
        #   @return [Integer, nil]
        optional :primary_account_number_length, Integer

        # @!method initialize(capabilities: nil, expiration: nil, last4: nil, outcome: nil, prefix: nil, primary_account_number_length: nil, request_options: {})
        #   @param capabilities [Array<Increase::Models::Simulations::CardTokenCreateParams::Capability>] The capabilities of the outbound card token.
        #
        #   @param expiration [Date] The expiration date of the card.
        #
        #   @param last4 [String] The last 4 digits of the card number.
        #
        #   @param outcome [Increase::Models::Simulations::CardTokenCreateParams::Outcome] The outcome to simulate for card push transfers using this token.
        #
        #   @param prefix [String] The prefix of the card number, usually the first 8 digits.
        #
        #   @param primary_account_number_length [Integer] The total length of the card number, including prefix and last4.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        class Capability < Increase::Internal::Type::BaseModel
          # @!attribute cross_border_push_transfers
          #   The cross-border push transfers capability.
          #
          #   @return [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers]
          required :cross_border_push_transfers,
                   enum: -> { Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers }

          # @!attribute domestic_push_transfers
          #   The domestic push transfers capability.
          #
          #   @return [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers]
          required :domestic_push_transfers,
                   enum: -> { Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers }

          # @!attribute route
          #   The route of the capability.
          #
          #   @return [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::Route]
          required :route, enum: -> { Increase::Simulations::CardTokenCreateParams::Capability::Route }

          # @!method initialize(cross_border_push_transfers:, domestic_push_transfers:, route:)
          #   @param cross_border_push_transfers [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers] The cross-border push transfers capability.
          #
          #   @param domestic_push_transfers [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers] The domestic push transfers capability.
          #
          #   @param route [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::Route] The route of the capability.

          # The cross-border push transfers capability.
          #
          # @see Increase::Models::Simulations::CardTokenCreateParams::Capability#cross_border_push_transfers
          module CrossBorderPushTransfers
            extend Increase::Internal::Type::Enum

            # The capability is supported.
            SUPPORTED = :supported

            # The capability is not supported.
            NOT_SUPPORTED = :not_supported

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The domestic push transfers capability.
          #
          # @see Increase::Models::Simulations::CardTokenCreateParams::Capability#domestic_push_transfers
          module DomesticPushTransfers
            extend Increase::Internal::Type::Enum

            # The capability is supported.
            SUPPORTED = :supported

            # The capability is not supported.
            NOT_SUPPORTED = :not_supported

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The route of the capability.
          #
          # @see Increase::Models::Simulations::CardTokenCreateParams::Capability#route
          module Route
            extend Increase::Internal::Type::Enum

            # Visa and Interlink
            VISA = :visa

            # Mastercard and Maestro
            MASTERCARD = :mastercard

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Outcome < Increase::Internal::Type::BaseModel
          # @!attribute result
          #   Whether card push transfers or validations will be approved or declined.
          #
          #   @return [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Outcome::Result]
          required :result, enum: -> { Increase::Simulations::CardTokenCreateParams::Outcome::Result }

          # @!attribute decline
          #   If the result is declined, the details of the decline.
          #
          #   @return [Increase::Models::Simulations::CardTokenCreateParams::Outcome::Decline, nil]
          optional :decline, -> { Increase::Simulations::CardTokenCreateParams::Outcome::Decline }

          # @!method initialize(result:, decline: nil)
          #   The outcome to simulate for card push transfers using this token.
          #
          #   @param result [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Outcome::Result] Whether card push transfers or validations will be approved or declined.
          #
          #   @param decline [Increase::Models::Simulations::CardTokenCreateParams::Outcome::Decline] If the result is declined, the details of the decline.

          # Whether card push transfers or validations will be approved or declined.
          #
          # @see Increase::Models::Simulations::CardTokenCreateParams::Outcome#result
          module Result
            extend Increase::Internal::Type::Enum

            # Any card push transfers or validations will be approved.
            APPROVE = :approve

            # Any card push transfers or validations will be declined.
            DECLINE = :decline

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::Simulations::CardTokenCreateParams::Outcome#decline
          class Decline < Increase::Internal::Type::BaseModel
            # @!attribute reason
            #   The reason for the decline.
            #
            #   @return [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Outcome::Decline::Reason, nil]
            optional :reason, enum: -> { Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason }

            # @!method initialize(reason: nil)
            #   If the result is declined, the details of the decline.
            #
            #   @param reason [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Outcome::Decline::Reason] The reason for the decline.

            # The reason for the decline.
            #
            # @see Increase::Models::Simulations::CardTokenCreateParams::Outcome::Decline#reason
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

              # The transaction is not supported or has been blocked by the issuer.
              TRANSACTION_NOT_SUPPORTED_OR_BLOCKED_BY_ISSUER = :transaction_not_supported_or_blocked_by_issuer

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

              # The transaction was blocked by the cardholder.
              BLOCKED_BY_CARDHOLDER = :blocked_by_cardholder

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

              # The record associated with the transaction could not be located.
              UNABLE_TO_LOCATE_RECORD = :unable_to_locate_record

              # The file needed for the transaction is temporarily unavailable.
              FILE_IS_TEMPORARILY_UNAVAILABLE = :file_is_temporarily_unavailable

              # The PIN entered for the transaction is incorrect.
              INCORRECT_PIN = :incorrect_pin

              # The allowable number of PIN entry tries has been exceeded.
              ALLOWABLE_NUMBER_OF_PIN_ENTRY_TRIES_EXCEEDED = :allowable_number_of_pin_entry_tries_exceeded

              # The previous message associated with the transaction could not be located.
              UNABLE_TO_LOCATE_PREVIOUS_MESSAGE = :unable_to_locate_previous_message

              # An error was found with the PIN associated with the transaction.
              PIN_ERROR_FOUND = :pin_error_found

              # The PIN associated with the transaction could not be verified.
              CANNOT_VERIFY_PIN = :cannot_verify_pin

              # The verification data associated with the transaction has failed.
              VERIFICATION_DATA_FAILED = :verification_data_failed

              # The surcharge amount is not supported by the debit network issuer.
              SURCHARGE_AMOUNT_NOT_SUPPORTED_BY_DEBIT_NETWORK_ISSUER =
                :surcharge_amount_not_supported_by_debit_network_issuer

              # Cash service is not available for this transaction.
              CASH_SERVICE_NOT_AVAILABLE = :cash_service_not_available

              # The cashback request exceeds the issuer limit.
              CASHBACK_REQUEST_EXCEEDS_ISSUER_LIMIT = :cashback_request_exceeds_issuer_limit

              # The transaction amount exceeds the pre-authorized approval amount.
              TRANSACTION_AMOUNT_EXCEEDS_PRE_AUTHORIZED_APPROVAL_AMOUNT =
                :transaction_amount_exceeds_pre_authorized_approval_amount

              # The transaction does not qualify for Visa PIN processing.
              TRANSACTION_DOES_NOT_QUALIFY_FOR_VISA_PIN = :transaction_does_not_qualify_for_visa_pin

              # The transaction was declined offline.
              OFFLINE_DECLINED = :offline_declined

              # The terminal was unable to go online to process the transaction.
              UNABLE_TO_GO_ONLINE = :unable_to_go_online

              # The account is valid but the transaction amount is not supported.
              VALID_ACCOUNT_BUT_AMOUNT_NOT_SUPPORTED = :valid_account_but_amount_not_supported

              # The merchant category code was used incorrectly; correct it and reattempt the transaction.
              INVALID_USE_OF_MERCHANT_CATEGORY_CODE_CORRECT_AND_REATTEMPT =
                :invalid_use_of_merchant_category_code_correct_and_reattempt

              # The card authentication process has failed.
              CARD_AUTHENTICATION_FAILED = :card_authentication_failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
