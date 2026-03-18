# typed: strong

module Increase
  module Models
    module Simulations
      class CardTokenCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardTokenCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The capabilities of the outbound card token.
        sig do
          returns(
            T.nilable(
              T::Array[Increase::Simulations::CardTokenCreateParams::Capability]
            )
          )
        end
        attr_reader :capabilities

        sig do
          params(
            capabilities:
              T::Array[
                Increase::Simulations::CardTokenCreateParams::Capability::OrHash
              ]
          ).void
        end
        attr_writer :capabilities

        # The expiration date of the card.
        sig { returns(T.nilable(Date)) }
        attr_reader :expiration

        sig { params(expiration: Date).void }
        attr_writer :expiration

        # The last 4 digits of the card number.
        sig { returns(T.nilable(String)) }
        attr_reader :last4

        sig { params(last4: String).void }
        attr_writer :last4

        # The outcome to simulate for card push transfers using this token.
        sig do
          returns(
            T.nilable(Increase::Simulations::CardTokenCreateParams::Outcome)
          )
        end
        attr_reader :outcome

        sig do
          params(
            outcome:
              Increase::Simulations::CardTokenCreateParams::Outcome::OrHash
          ).void
        end
        attr_writer :outcome

        # The prefix of the card number, usually the first 8 digits.
        sig { returns(T.nilable(String)) }
        attr_reader :prefix

        sig { params(prefix: String).void }
        attr_writer :prefix

        # The total length of the card number, including prefix and last4.
        sig { returns(T.nilable(Integer)) }
        attr_reader :primary_account_number_length

        sig { params(primary_account_number_length: Integer).void }
        attr_writer :primary_account_number_length

        sig do
          params(
            capabilities:
              T::Array[
                Increase::Simulations::CardTokenCreateParams::Capability::OrHash
              ],
            expiration: Date,
            last4: String,
            outcome:
              Increase::Simulations::CardTokenCreateParams::Outcome::OrHash,
            prefix: String,
            primary_account_number_length: Integer,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The capabilities of the outbound card token.
          capabilities: nil,
          # The expiration date of the card.
          expiration: nil,
          # The last 4 digits of the card number.
          last4: nil,
          # The outcome to simulate for card push transfers using this token.
          outcome: nil,
          # The prefix of the card number, usually the first 8 digits.
          prefix: nil,
          # The total length of the card number, including prefix and last4.
          primary_account_number_length: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              capabilities:
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Capability
                ],
              expiration: Date,
              last4: String,
              outcome: Increase::Simulations::CardTokenCreateParams::Outcome,
              prefix: String,
              primary_account_number_length: Integer,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Capability < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::CardTokenCreateParams::Capability,
                Increase::Internal::AnyHash
              )
            end

          # The cross-border push transfers capability.
          sig do
            returns(
              Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::OrSymbol
            )
          end
          attr_accessor :cross_border_push_transfers

          # The domestic push transfers capability.
          sig do
            returns(
              Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::OrSymbol
            )
          end
          attr_accessor :domestic_push_transfers

          # The route of the capability.
          sig do
            returns(
              Increase::Simulations::CardTokenCreateParams::Capability::Route::OrSymbol
            )
          end
          attr_accessor :route

          sig do
            params(
              cross_border_push_transfers:
                Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::OrSymbol,
              domestic_push_transfers:
                Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::OrSymbol,
              route:
                Increase::Simulations::CardTokenCreateParams::Capability::Route::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The cross-border push transfers capability.
            cross_border_push_transfers:,
            # The domestic push transfers capability.
            domestic_push_transfers:,
            # The route of the capability.
            route:
          )
          end

          sig do
            override.returns(
              {
                cross_border_push_transfers:
                  Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::OrSymbol,
                domestic_push_transfers:
                  Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::OrSymbol,
                route:
                  Increase::Simulations::CardTokenCreateParams::Capability::Route::OrSymbol
              }
            )
          end
          def to_hash
          end

          # The cross-border push transfers capability.
          module CrossBorderPushTransfers
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The capability is supported.
            SUPPORTED =
              T.let(
                :supported,
                Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::TaggedSymbol
              )

            # The capability is not supported.
            NOT_SUPPORTED =
              T.let(
                :not_supported,
                Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The domestic push transfers capability.
          module DomesticPushTransfers
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The capability is supported.
            SUPPORTED =
              T.let(
                :supported,
                Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::TaggedSymbol
              )

            # The capability is not supported.
            NOT_SUPPORTED =
              T.let(
                :not_supported,
                Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The route of the capability.
          module Route
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::CardTokenCreateParams::Capability::Route
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa and Interlink
            VISA =
              T.let(
                :visa,
                Increase::Simulations::CardTokenCreateParams::Capability::Route::TaggedSymbol
              )

            # Mastercard and Maestro
            MASTERCARD =
              T.let(
                :mastercard,
                Increase::Simulations::CardTokenCreateParams::Capability::Route::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Capability::Route::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Outcome < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::CardTokenCreateParams::Outcome,
                Increase::Internal::AnyHash
              )
            end

          # Whether card push transfers or validations will be approved or declined.
          sig do
            returns(
              Increase::Simulations::CardTokenCreateParams::Outcome::Result::OrSymbol
            )
          end
          attr_accessor :result

          # If the result is declined, the details of the decline.
          sig do
            returns(
              T.nilable(
                Increase::Simulations::CardTokenCreateParams::Outcome::Decline
              )
            )
          end
          attr_reader :decline

          sig do
            params(
              decline:
                Increase::Simulations::CardTokenCreateParams::Outcome::Decline::OrHash
            ).void
          end
          attr_writer :decline

          # The outcome to simulate for card push transfers using this token.
          sig do
            params(
              result:
                Increase::Simulations::CardTokenCreateParams::Outcome::Result::OrSymbol,
              decline:
                Increase::Simulations::CardTokenCreateParams::Outcome::Decline::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether card push transfers or validations will be approved or declined.
            result:,
            # If the result is declined, the details of the decline.
            decline: nil
          )
          end

          sig do
            override.returns(
              {
                result:
                  Increase::Simulations::CardTokenCreateParams::Outcome::Result::OrSymbol,
                decline:
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline
              }
            )
          end
          def to_hash
          end

          # Whether card push transfers or validations will be approved or declined.
          module Result
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Result
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Any card push transfers or validations will be approved.
            APPROVE =
              T.let(
                :approve,
                Increase::Simulations::CardTokenCreateParams::Outcome::Result::TaggedSymbol
              )

            # Any card push transfers or validations will be declined.
            DECLINE =
              T.let(
                :decline,
                Increase::Simulations::CardTokenCreateParams::Outcome::Result::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Outcome::Result::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Decline < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline,
                  Increase::Internal::AnyHash
                )
              end

            # The reason for the decline.
            sig do
              returns(
                T.nilable(
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::OrSymbol
                )
              )
            end
            attr_reader :reason

            sig do
              params(
                reason:
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::OrSymbol
              ).void
            end
            attr_writer :reason

            # If the result is declined, the details of the decline.
            sig do
              params(
                reason:
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The reason for the decline.
              reason: nil
            )
            end

            sig do
              override.returns(
                {
                  reason:
                    Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::OrSymbol
                }
              )
            end
            def to_hash
            end

            # The reason for the decline.
            module Reason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # The card issuer has declined the transaction without providing a specific reason.
              DO_NOT_HONOR =
                T.let(
                  :do_not_honor,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The number of transactions for the card has exceeded the limit set by the issuer.
              ACTIVITY_COUNT_LIMIT_EXCEEDED =
                T.let(
                  :activity_count_limit_exceeded,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card issuer requires the cardholder to contact them for further information regarding the transaction.
              REFER_TO_CARD_ISSUER =
                T.let(
                  :refer_to_card_issuer,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card issuer requires the cardholder to contact them due to a special condition related to the transaction.
              REFER_TO_CARD_ISSUER_SPECIAL_CONDITION =
                T.let(
                  :refer_to_card_issuer_special_condition,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The merchant is not valid for this transaction.
              INVALID_MERCHANT =
                T.let(
                  :invalid_merchant,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card should be retained by the terminal.
              PICK_UP_CARD =
                T.let(
                  :pick_up_card,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # An error occurred during processing of the transaction.
              ERROR =
                T.let(
                  :error,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card should be retained by the terminal due to a special condition.
              PICK_UP_CARD_SPECIAL =
                T.let(
                  :pick_up_card_special,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction is invalid and cannot be processed.
              INVALID_TRANSACTION =
                T.let(
                  :invalid_transaction,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The amount of the transaction is invalid.
              INVALID_AMOUNT =
                T.let(
                  :invalid_amount,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The account number provided is invalid.
              INVALID_ACCOUNT_NUMBER =
                T.let(
                  :invalid_account_number,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The issuer of the card could not be found.
              NO_SUCH_ISSUER =
                T.let(
                  :no_such_issuer,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction should be re-entered for processing.
              RE_ENTER_TRANSACTION =
                T.let(
                  :re_enter_transaction,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # There is no credit account associated with the card.
              NO_CREDIT_ACCOUNT =
                T.let(
                  :no_credit_account,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card should be retained by the terminal because it has been reported lost.
              PICK_UP_CARD_LOST =
                T.let(
                  :pick_up_card_lost,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card should be retained by the terminal because it has been reported stolen.
              PICK_UP_CARD_STOLEN =
                T.let(
                  :pick_up_card_stolen,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The account associated with the card has been closed.
              CLOSED_ACCOUNT =
                T.let(
                  :closed_account,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # There are insufficient funds in the account to complete the transaction.
              INSUFFICIENT_FUNDS =
                T.let(
                  :insufficient_funds,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # There is no checking account associated with the card.
              NO_CHECKING_ACCOUNT =
                T.let(
                  :no_checking_account,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # There is no savings account associated with the card.
              NO_SAVINGS_ACCOUNT =
                T.let(
                  :no_savings_account,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card has expired and cannot be used for transactions.
              EXPIRED_CARD =
                T.let(
                  :expired_card,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction is not permitted for this cardholder.
              TRANSACTION_NOT_PERMITTED_TO_CARDHOLDER =
                T.let(
                  :transaction_not_permitted_to_cardholder,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction is not allowed at this terminal.
              TRANSACTION_NOT_ALLOWED_AT_TERMINAL =
                T.let(
                  :transaction_not_allowed_at_terminal,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction is not supported or has been blocked by the issuer.
              TRANSACTION_NOT_SUPPORTED_OR_BLOCKED_BY_ISSUER =
                T.let(
                  :transaction_not_supported_or_blocked_by_issuer,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction has been flagged as suspected fraud and cannot be processed.
              SUSPECTED_FRAUD =
                T.let(
                  :suspected_fraud,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The amount of activity on the card has exceeded the limit set by the issuer.
              ACTIVITY_AMOUNT_LIMIT_EXCEEDED =
                T.let(
                  :activity_amount_limit_exceeded,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card has restrictions that prevent it from being used for this transaction.
              RESTRICTED_CARD =
                T.let(
                  :restricted_card,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # A security violation has occurred, preventing the transaction from being processed.
              SECURITY_VIOLATION =
                T.let(
                  :security_violation,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction does not meet the anti-money laundering requirements set by the issuer.
              TRANSACTION_DOES_NOT_FULFILL_ANTI_MONEY_LAUNDERING_REQUIREMENT =
                T.let(
                  :transaction_does_not_fulfill_anti_money_laundering_requirement,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction was blocked by the cardholder.
              BLOCKED_BY_CARDHOLDER =
                T.let(
                  :blocked_by_cardholder,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The first use of the card has been blocked by the issuer.
              BLOCKED_FIRST_USE =
                T.let(
                  :blocked_first_use,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The credit issuer is currently unavailable to process the transaction.
              CREDIT_ISSUER_UNAVAILABLE =
                T.let(
                  :credit_issuer_unavailable,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card verification value (CVV) results were negative, indicating a potential issue with the card.
              NEGATIVE_CARD_VERIFICATION_VALUE_RESULTS =
                T.let(
                  :negative_card_verification_value_results,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The issuer of the card is currently unavailable to process the transaction.
              ISSUER_UNAVAILABLE =
                T.let(
                  :issuer_unavailable,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The financial institution associated with the card could not be found.
              FINANCIAL_INSTITUTION_CANNOT_BE_FOUND =
                T.let(
                  :financial_institution_cannot_be_found,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction cannot be completed due to an unspecified reason.
              TRANSACTION_CANNOT_BE_COMPLETED =
                T.let(
                  :transaction_cannot_be_completed,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction is a duplicate of a previous transaction and cannot be processed again.
              DUPLICATE_TRANSACTION =
                T.let(
                  :duplicate_transaction,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # A system malfunction occurred, preventing the transaction from being processed.
              SYSTEM_MALFUNCTION =
                T.let(
                  :system_malfunction,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # Additional customer authentication is required to complete the transaction.
              ADDITIONAL_CUSTOMER_AUTHENTICATION_REQUIRED =
                T.let(
                  :additional_customer_authentication_required,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The surcharge amount applied to the transaction is not permitted by the issuer.
              SURCHARGE_AMOUNT_NOT_PERMITTED =
                T.let(
                  :surcharge_amount_not_permitted,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction was declined due to a failure in verifying the CVV2 code.
              DECLINE_FOR_CVV2_FAILURE =
                T.let(
                  :decline_for_cvv2_failure,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # A stop payment order has been placed on this transaction.
              STOP_PAYMENT_ORDER =
                T.let(
                  :stop_payment_order,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # An order has been placed to revoke authorization for this transaction.
              REVOCATION_OF_AUTHORIZATION_ORDER =
                T.let(
                  :revocation_of_authorization_order,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # An order has been placed to revoke all authorizations for this cardholder.
              REVOCATION_OF_ALL_AUTHORIZATIONS_ORDER =
                T.let(
                  :revocation_of_all_authorizations_order,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The record associated with the transaction could not be located.
              UNABLE_TO_LOCATE_RECORD =
                T.let(
                  :unable_to_locate_record,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The file needed for the transaction is temporarily unavailable.
              FILE_IS_TEMPORARILY_UNAVAILABLE =
                T.let(
                  :file_is_temporarily_unavailable,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The PIN entered for the transaction is incorrect.
              INCORRECT_PIN =
                T.let(
                  :incorrect_pin,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The allowable number of PIN entry tries has been exceeded.
              ALLOWABLE_NUMBER_OF_PIN_ENTRY_TRIES_EXCEEDED =
                T.let(
                  :allowable_number_of_pin_entry_tries_exceeded,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The previous message associated with the transaction could not be located.
              UNABLE_TO_LOCATE_PREVIOUS_MESSAGE =
                T.let(
                  :unable_to_locate_previous_message,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The data in the transaction is inconsistent with the original message.
              DATA_INCONSISTENT_WITH_ORIGINAL_MESSAGE =
                T.let(
                  :data_inconsistent_with_original_message,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # An error was found with the PIN associated with the transaction.
              PIN_ERROR_FOUND =
                T.let(
                  :pin_error_found,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The PIN associated with the transaction could not be verified.
              CANNOT_VERIFY_PIN =
                T.let(
                  :cannot_verify_pin,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The verification data associated with the transaction has failed.
              VERIFICATION_DATA_FAILED =
                T.let(
                  :verification_data_failed,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The surcharge amount is not supported by the debit network issuer.
              SURCHARGE_AMOUNT_NOT_SUPPORTED_BY_DEBIT_NETWORK_ISSUER =
                T.let(
                  :surcharge_amount_not_supported_by_debit_network_issuer,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # Cash service is not available for this transaction.
              CASH_SERVICE_NOT_AVAILABLE =
                T.let(
                  :cash_service_not_available,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The cashback request exceeds the issuer limit.
              CASHBACK_REQUEST_EXCEEDS_ISSUER_LIMIT =
                T.let(
                  :cashback_request_exceeds_issuer_limit,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction amount exceeds the pre-authorized approval amount.
              TRANSACTION_AMOUNT_EXCEEDS_PRE_AUTHORIZED_APPROVAL_AMOUNT =
                T.let(
                  :transaction_amount_exceeds_pre_authorized_approval_amount,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The biller information provided is invalid.
              INVALID_BILLER_INFORMATION =
                T.let(
                  :invalid_biller_information,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The PIN change request has been declined.
              PIN_CHANGE_REQUEST_DECLINED =
                T.let(
                  :pin_change_request_declined,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The PIN provided is considered unsafe.
              UNSAFE_PIN =
                T.let(
                  :unsafe_pin,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction does not qualify for Visa PIN processing.
              TRANSACTION_DOES_NOT_QUALIFY_FOR_VISA_PIN =
                T.let(
                  :transaction_does_not_qualify_for_visa_pin,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction was declined offline.
              OFFLINE_DECLINED =
                T.let(
                  :offline_declined,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The terminal was unable to go online to process the transaction.
              UNABLE_TO_GO_ONLINE =
                T.let(
                  :unable_to_go_online,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The account is valid but the transaction amount is not supported.
              VALID_ACCOUNT_BUT_AMOUNT_NOT_SUPPORTED =
                T.let(
                  :valid_account_but_amount_not_supported,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The merchant category code was used incorrectly; correct it and reattempt the transaction.
              INVALID_USE_OF_MERCHANT_CATEGORY_CODE_CORRECT_AND_REATTEMPT =
                T.let(
                  :invalid_use_of_merchant_category_code_correct_and_reattempt,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The transaction should be forwarded to the issuer for processing.
              FORWARD_TO_ISSUER =
                T.let(
                  :forward_to_issuer,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              # The card authentication process has failed.
              CARD_AUTHENTICATION_FAILED =
                T.let(
                  :card_authentication_failed,
                  Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Simulations::CardTokenCreateParams::Outcome::Decline::Reason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
