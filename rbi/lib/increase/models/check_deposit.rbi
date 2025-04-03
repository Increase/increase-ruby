# typed: strong

module Increase
  module Models
    class CheckDeposit < Increase::Internal::Type::BaseModel
      # The deposit's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account the check was deposited into.
      sig { returns(String) }
      attr_accessor :account_id

      # The deposited amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The ID for the File containing the image of the back of the check.
      sig { returns(T.nilable(String)) }
      attr_accessor :back_image_file_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # If your deposit is successfully parsed and accepted by Increase, this will
      #   contain details of the parsed check.
      sig { returns(T.nilable(Increase::Models::CheckDeposit::DepositAcceptance)) }
      attr_reader :deposit_acceptance

      sig do
        params(
          deposit_acceptance: T.nilable(T.any(Increase::Models::CheckDeposit::DepositAcceptance, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :deposit_acceptance

      # If your deposit is rejected by Increase, this will contain details as to why it
      #   was rejected.
      sig { returns(T.nilable(Increase::Models::CheckDeposit::DepositRejection)) }
      attr_reader :deposit_rejection

      sig do
        params(
          deposit_rejection: T.nilable(T.any(Increase::Models::CheckDeposit::DepositRejection, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :deposit_rejection

      # If your deposit is returned, this will contain details as to why it was
      #   returned.
      sig { returns(T.nilable(Increase::Models::CheckDeposit::DepositReturn)) }
      attr_reader :deposit_return

      sig do
        params(
          deposit_return: T.nilable(T.any(Increase::Models::CheckDeposit::DepositReturn, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :deposit_return

      # After the check is parsed, it is submitted to the Check21 network for
      #   processing. This will contain details of the submission.
      sig { returns(T.nilable(Increase::Models::CheckDeposit::DepositSubmission)) }
      attr_reader :deposit_submission

      sig do
        params(
          deposit_submission: T.nilable(T.any(Increase::Models::CheckDeposit::DepositSubmission, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :deposit_submission

      # The description of the Check Deposit, for display purposes only.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The ID for the File containing the image of the front of the check.
      sig { returns(String) }
      attr_accessor :front_image_file_id

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # Increase will sometimes hold the funds for Check Deposits. If funds are held,
      #   this sub-object will contain details of the hold.
      sig { returns(T.nilable(Increase::Models::CheckDeposit::InboundFundsHold)) }
      attr_reader :inbound_funds_hold

      sig do
        params(
          inbound_funds_hold: T.nilable(T.any(Increase::Models::CheckDeposit::InboundFundsHold, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :inbound_funds_hold

      # If the Check Deposit was the result of an Inbound Mail Item, this will contain
      #   the identifier of the Inbound Mail Item.
      sig { returns(T.nilable(String)) }
      attr_accessor :inbound_mail_item_id

      # If the Check Deposit was the result of an Inbound Mail Item, this will contain
      #   the identifier of the Lockbox that received it.
      sig { returns(T.nilable(String)) }
      attr_accessor :lockbox_id

      # The status of the Check Deposit.
      sig { returns(Increase::Models::CheckDeposit::Status::TaggedSymbol) }
      attr_accessor :status

      # The ID for the Transaction created by the deposit.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      #   `check_deposit`.
      sig { returns(Increase::Models::CheckDeposit::Type::TaggedSymbol) }
      attr_accessor :type

      # Check Deposits allow you to deposit images of paper checks into your account.
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          back_image_file_id: T.nilable(String),
          created_at: Time,
          deposit_acceptance: T.nilable(T.any(Increase::Models::CheckDeposit::DepositAcceptance, Increase::Internal::AnyHash)),
          deposit_rejection: T.nilable(T.any(Increase::Models::CheckDeposit::DepositRejection, Increase::Internal::AnyHash)),
          deposit_return: T.nilable(T.any(Increase::Models::CheckDeposit::DepositReturn, Increase::Internal::AnyHash)),
          deposit_submission: T.nilable(T.any(Increase::Models::CheckDeposit::DepositSubmission, Increase::Internal::AnyHash)),
          description: T.nilable(String),
          front_image_file_id: String,
          idempotency_key: T.nilable(String),
          inbound_funds_hold: T.nilable(T.any(Increase::Models::CheckDeposit::InboundFundsHold, Increase::Internal::AnyHash)),
          inbound_mail_item_id: T.nilable(String),
          lockbox_id: T.nilable(String),
          status: Increase::Models::CheckDeposit::Status::OrSymbol,
          transaction_id: T.nilable(String),
          type: Increase::Models::CheckDeposit::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        account_id:,
        amount:,
        back_image_file_id:,
        created_at:,
        deposit_acceptance:,
        deposit_rejection:,
        deposit_return:,
        deposit_submission:,
        description:,
        front_image_file_id:,
        idempotency_key:,
        inbound_funds_hold:,
        inbound_mail_item_id:,
        lockbox_id:,
        status:,
        transaction_id:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              account_id: String,
              amount: Integer,
              back_image_file_id: T.nilable(String),
              created_at: Time,
              deposit_acceptance: T.nilable(Increase::Models::CheckDeposit::DepositAcceptance),
              deposit_rejection: T.nilable(Increase::Models::CheckDeposit::DepositRejection),
              deposit_return: T.nilable(Increase::Models::CheckDeposit::DepositReturn),
              deposit_submission: T.nilable(Increase::Models::CheckDeposit::DepositSubmission),
              description: T.nilable(String),
              front_image_file_id: String,
              idempotency_key: T.nilable(String),
              inbound_funds_hold: T.nilable(Increase::Models::CheckDeposit::InboundFundsHold),
              inbound_mail_item_id: T.nilable(String),
              lockbox_id: T.nilable(String),
              status: Increase::Models::CheckDeposit::Status::TaggedSymbol,
              transaction_id: T.nilable(String),
              type: Increase::Models::CheckDeposit::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      class DepositAcceptance < Increase::Internal::Type::BaseModel
        # The account number printed on the check.
        sig { returns(String) }
        attr_accessor :account_number

        # The amount to be deposited in the minor unit of the transaction's currency. For
        #   dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # An additional line of metadata printed on the check. This typically includes the
        #   check number for business checks.
        sig { returns(T.nilable(String)) }
        attr_accessor :auxiliary_on_us

        # The ID of the Check Deposit that was accepted.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        #   transaction's currency.
        sig { returns(Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol) }
        attr_accessor :currency

        # The routing number printed on the check.
        sig { returns(String) }
        attr_accessor :routing_number

        # The check serial number, if present, for consumer checks. For business checks,
        #   the serial number is usually in the `auxiliary_on_us` field.
        sig { returns(T.nilable(String)) }
        attr_accessor :serial_number

        # If your deposit is successfully parsed and accepted by Increase, this will
        #   contain details of the parsed check.
        sig do
          params(
            account_number: String,
            amount: Integer,
            auxiliary_on_us: T.nilable(String),
            check_deposit_id: String,
            currency: Increase::Models::CheckDeposit::DepositAcceptance::Currency::OrSymbol,
            routing_number: String,
            serial_number: T.nilable(String)
          )
            .returns(T.attached_class)
        end
        def self.new(
          account_number:,
          amount:,
          auxiliary_on_us:,
          check_deposit_id:,
          currency:,
          routing_number:,
          serial_number:
        )
        end

        sig do
          override
            .returns(
              {
                account_number: String,
                amount: Integer,
                auxiliary_on_us: T.nilable(String),
                check_deposit_id: String,
                currency: Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol,
                routing_number: String,
                serial_number: T.nilable(String)
              }
            )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        #   transaction's currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::DepositAcceptance::Currency) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol) }

          # Canadian Dollar (CAD)
          CAD = T.let(:CAD, Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol)

          # Swiss Franc (CHF)
          CHF = T.let(:CHF, Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol)

          # Euro (EUR)
          EUR = T.let(:EUR, Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol)

          # British Pound (GBP)
          GBP = T.let(:GBP, Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol)

          # Japanese Yen (JPY)
          JPY = T.let(:JPY, Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol)

          # US Dollar (USD)
          USD = T.let(:USD, Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class DepositRejection < Increase::Internal::Type::BaseModel
        # The rejected amount in the minor unit of check's currency. For dollars, for
        #   example, this is cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The identifier of the Check Deposit that was rejected.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
        #   currency.
        sig { returns(Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol) }
        attr_accessor :currency

        # The identifier of the associated declined transaction.
        sig { returns(String) }
        attr_accessor :declined_transaction_id

        # Why the check deposit was rejected.
        sig { returns(Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol) }
        attr_accessor :reason

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the check deposit was rejected.
        sig { returns(Time) }
        attr_accessor :rejected_at

        # If your deposit is rejected by Increase, this will contain details as to why it
        #   was rejected.
        sig do
          params(
            amount: Integer,
            check_deposit_id: String,
            currency: Increase::Models::CheckDeposit::DepositRejection::Currency::OrSymbol,
            declined_transaction_id: String,
            reason: Increase::Models::CheckDeposit::DepositRejection::Reason::OrSymbol,
            rejected_at: Time
          )
            .returns(T.attached_class)
        end
        def self.new(amount:, check_deposit_id:, currency:, declined_transaction_id:, reason:, rejected_at:)
        end

        sig do
          override
            .returns(
              {
                amount: Integer,
                check_deposit_id: String,
                currency: Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol,
                declined_transaction_id: String,
                reason: Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol,
                rejected_at: Time
              }
            )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
        #   currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::DepositRejection::Currency) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol) }

          # Canadian Dollar (CAD)
          CAD = T.let(:CAD, Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol)

          # Swiss Franc (CHF)
          CHF = T.let(:CHF, Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol)

          # Euro (EUR)
          EUR = T.let(:EUR, Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol)

          # British Pound (GBP)
          GBP = T.let(:GBP, Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol)

          # Japanese Yen (JPY)
          JPY = T.let(:JPY, Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol)

          # US Dollar (USD)
          USD = T.let(:USD, Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::CheckDeposit::DepositRejection::Currency::TaggedSymbol]) }
          def self.values
          end
        end

        # Why the check deposit was rejected.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::DepositRejection::Reason) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol) }

          # The check's image is incomplete.
          INCOMPLETE_IMAGE =
            T.let(:incomplete_image, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          # This is a duplicate check submission.
          DUPLICATE = T.let(:duplicate, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          # This check has poor image quality.
          POOR_IMAGE_QUALITY =
            T.let(:poor_image_quality, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          # The check was deposited with the incorrect amount.
          INCORRECT_AMOUNT =
            T.let(:incorrect_amount, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          # The check is made out to someone other than the account holder.
          INCORRECT_RECIPIENT =
            T.let(:incorrect_recipient, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          # This check was not eligible for mobile deposit.
          NOT_ELIGIBLE_FOR_MOBILE_DEPOSIT =
            T.let(
              :not_eligible_for_mobile_deposit,
              Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # This check is missing at least one required field.
          MISSING_REQUIRED_DATA_ELEMENTS =
            T.let(
              :missing_required_data_elements,
              Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # This check is suspected to be fraudulent.
          SUSPECTED_FRAUD =
            T.let(:suspected_fraud, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          # This check's deposit window has expired.
          DEPOSIT_WINDOW_EXPIRED =
            T.let(:deposit_window_expired, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          # The check was rejected at the user's request.
          REQUESTED_BY_USER =
            T.let(:requested_by_user, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          # The check was rejected for an unknown reason.
          UNKNOWN = T.let(:unknown, Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::CheckDeposit::DepositRejection::Reason::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class DepositReturn < Increase::Internal::Type::BaseModel
        # The returned amount in USD cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The identifier of the Check Deposit that was returned.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        #   transaction's currency.
        sig { returns(Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol) }
        attr_accessor :currency

        # Why this check was returned by the bank holding the account it was drawn
        #   against.
        sig { returns(Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol) }
        attr_accessor :return_reason

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the check deposit was returned.
        sig { returns(Time) }
        attr_accessor :returned_at

        # The identifier of the transaction that reversed the original check deposit
        #   transaction.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If your deposit is returned, this will contain details as to why it was
        #   returned.
        sig do
          params(
            amount: Integer,
            check_deposit_id: String,
            currency: Increase::Models::CheckDeposit::DepositReturn::Currency::OrSymbol,
            return_reason: Increase::Models::CheckDeposit::DepositReturn::ReturnReason::OrSymbol,
            returned_at: Time,
            transaction_id: String
          )
            .returns(T.attached_class)
        end
        def self.new(amount:, check_deposit_id:, currency:, return_reason:, returned_at:, transaction_id:)
        end

        sig do
          override
            .returns(
              {
                amount: Integer,
                check_deposit_id: String,
                currency: Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol,
                return_reason: Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol,
                returned_at: Time,
                transaction_id: String
              }
            )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        #   transaction's currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::DepositReturn::Currency) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol) }

          # Canadian Dollar (CAD)
          CAD = T.let(:CAD, Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol)

          # Swiss Franc (CHF)
          CHF = T.let(:CHF, Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol)

          # Euro (EUR)
          EUR = T.let(:EUR, Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol)

          # British Pound (GBP)
          GBP = T.let(:GBP, Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol)

          # Japanese Yen (JPY)
          JPY = T.let(:JPY, Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol)

          # US Dollar (USD)
          USD = T.let(:USD, Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::CheckDeposit::DepositReturn::Currency::TaggedSymbol]) }
          def self.values
          end
        end

        # Why this check was returned by the bank holding the account it was drawn
        #   against.
        module ReturnReason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::DepositReturn::ReturnReason) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol) }

          # The check doesn't allow ACH conversion.
          ACH_CONVERSION_NOT_SUPPORTED =
            T.let(
              :ach_conversion_not_supported,
              Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The account is closed.
          CLOSED_ACCOUNT =
            T.let(:closed_account, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check has already been deposited.
          DUPLICATE_SUBMISSION =
            T.let(:duplicate_submission, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # Insufficient funds
          INSUFFICIENT_FUNDS =
            T.let(:insufficient_funds, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # No account was found matching the check details.
          NO_ACCOUNT =
            T.let(:no_account, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check was not authorized.
          NOT_AUTHORIZED =
            T.let(:not_authorized, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check is too old.
          STALE_DATED =
            T.let(:stale_dated, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The payment has been stopped by the account holder.
          STOP_PAYMENT =
            T.let(:stop_payment, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The reason for the return is unknown.
          UNKNOWN_REASON =
            T.let(:unknown_reason, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The image doesn't match the details submitted.
          UNMATCHED_DETAILS =
            T.let(:unmatched_details, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The image could not be read.
          UNREADABLE_IMAGE =
            T.let(:unreadable_image, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check endorsement was irregular.
          ENDORSEMENT_IRREGULAR =
            T.let(:endorsement_irregular, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check present was either altered or fake.
          ALTERED_OR_FICTITIOUS_ITEM =
            T.let(
              :altered_or_fictitious_item,
              Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The account this check is drawn on is frozen.
          FROZEN_OR_BLOCKED_ACCOUNT =
            T.let(
              :frozen_or_blocked_account,
              Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check is post dated.
          POST_DATED =
            T.let(:post_dated, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The endorsement was missing.
          ENDORSEMENT_MISSING =
            T.let(:endorsement_missing, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check signature was missing.
          SIGNATURE_MISSING =
            T.let(:signature_missing, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The bank suspects a stop payment will be placed.
          STOP_PAYMENT_SUSPECT =
            T.let(:stop_payment_suspect, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The bank cannot read the image.
          UNUSABLE_IMAGE =
            T.let(:unusable_image, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check image fails the bank's security check.
          IMAGE_FAILS_SECURITY_CHECK =
            T.let(
              :image_fails_security_check,
              Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The bank cannot determine the amount.
          CANNOT_DETERMINE_AMOUNT =
            T.let(:cannot_determine_amount, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The signature is inconsistent with prior signatures.
          SIGNATURE_IRREGULAR =
            T.let(:signature_irregular, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check is a non-cash item and cannot be drawn against the account.
          NON_CASH_ITEM =
            T.let(:non_cash_item, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The bank is unable to process this check.
          UNABLE_TO_PROCESS =
            T.let(:unable_to_process, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          # The check exceeds the bank or customer's limit.
          ITEM_EXCEEDS_DOLLAR_LIMIT =
            T.let(
              :item_exceeds_dollar_limit,
              Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The bank sold this account and no longer services this customer.
          BRANCH_OR_ACCOUNT_SOLD =
            T.let(:branch_or_account_sold, Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class DepositSubmission < Increase::Internal::Type::BaseModel
        # The ID for the File containing the check back image that was submitted to the
        #   Check21 network.
        sig { returns(String) }
        attr_accessor :back_file_id

        # The ID for the File containing the check front image that was submitted to the
        #   Check21 network.
        sig { returns(String) }
        attr_accessor :front_file_id

        # When the check deposit was submitted to the Check21 network for processing.
        #   During business days, this happens within a few hours of the check being
        #   accepted by Increase.
        sig { returns(Time) }
        attr_accessor :submitted_at

        # After the check is parsed, it is submitted to the Check21 network for
        #   processing. This will contain details of the submission.
        sig do
          params(back_file_id: String, front_file_id: String, submitted_at: Time).returns(T.attached_class)
        end
        def self.new(back_file_id:, front_file_id:, submitted_at:)
        end

        sig { override.returns({back_file_id: String, front_file_id: String, submitted_at: Time}) }
        def to_hash
        end
      end

      class InboundFundsHold < Increase::Internal::Type::BaseModel
        # The Inbound Funds Hold identifier.
        sig { returns(String) }
        attr_accessor :id

        # The held amount in the minor unit of the account's currency. For dollars, for
        #   example, this is cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # When the hold will be released automatically. Certain conditions may cause it to
        #   be released before this time.
        sig { returns(Time) }
        attr_accessor :automatically_releases_at

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        #   was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   currency.
        sig { returns(Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol) }
        attr_accessor :currency

        # The ID of the Transaction for which funds were held.
        sig { returns(T.nilable(String)) }
        attr_accessor :held_transaction_id

        # The ID of the Pending Transaction representing the held funds.
        sig { returns(T.nilable(String)) }
        attr_accessor :pending_transaction_id

        # When the hold was released (if it has been released).
        sig { returns(T.nilable(Time)) }
        attr_accessor :released_at

        # The status of the hold.
        sig { returns(Increase::Models::CheckDeposit::InboundFundsHold::Status::TaggedSymbol) }
        attr_accessor :status

        # A constant representing the object's type. For this resource it will always be
        #   `inbound_funds_hold`.
        sig { returns(Increase::Models::CheckDeposit::InboundFundsHold::Type::TaggedSymbol) }
        attr_accessor :type

        # Increase will sometimes hold the funds for Check Deposits. If funds are held,
        #   this sub-object will contain details of the hold.
        sig do
          params(
            id: String,
            amount: Integer,
            automatically_releases_at: Time,
            created_at: Time,
            currency: Increase::Models::CheckDeposit::InboundFundsHold::Currency::OrSymbol,
            held_transaction_id: T.nilable(String),
            pending_transaction_id: T.nilable(String),
            released_at: T.nilable(Time),
            status: Increase::Models::CheckDeposit::InboundFundsHold::Status::OrSymbol,
            type: Increase::Models::CheckDeposit::InboundFundsHold::Type::OrSymbol
          )
            .returns(T.attached_class)
        end
        def self.new(
          id:,
          amount:,
          automatically_releases_at:,
          created_at:,
          currency:,
          held_transaction_id:,
          pending_transaction_id:,
          released_at:,
          status:,
          type:
        )
        end

        sig do
          override
            .returns(
              {
                id: String,
                amount: Integer,
                automatically_releases_at: Time,
                created_at: Time,
                currency: Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol,
                held_transaction_id: T.nilable(String),
                pending_transaction_id: T.nilable(String),
                released_at: T.nilable(Time),
                status: Increase::Models::CheckDeposit::InboundFundsHold::Status::TaggedSymbol,
                type: Increase::Models::CheckDeposit::InboundFundsHold::Type::TaggedSymbol
              }
            )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Currency) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol) }

          # Canadian Dollar (CAD)
          CAD = T.let(:CAD, Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol)

          # Swiss Franc (CHF)
          CHF = T.let(:CHF, Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol)

          # Euro (EUR)
          EUR = T.let(:EUR, Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol)

          # British Pound (GBP)
          GBP = T.let(:GBP, Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol)

          # Japanese Yen (JPY)
          JPY = T.let(:JPY, Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol)

          # US Dollar (USD)
          USD = T.let(:USD, Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol]) }
          def self.values
          end
        end

        # The status of the hold.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Status) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::InboundFundsHold::Status::TaggedSymbol) }

          # Funds are still being held.
          HELD = T.let(:held, Increase::Models::CheckDeposit::InboundFundsHold::Status::TaggedSymbol)

          # Funds have been released.
          COMPLETE = T.let(:complete, Increase::Models::CheckDeposit::InboundFundsHold::Status::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::CheckDeposit::InboundFundsHold::Status::TaggedSymbol]) }
          def self.values
          end
        end

        # A constant representing the object's type. For this resource it will always be
        #   `inbound_funds_hold`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Type) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::InboundFundsHold::Type::TaggedSymbol) }

          INBOUND_FUNDS_HOLD =
            T.let(:inbound_funds_hold, Increase::Models::CheckDeposit::InboundFundsHold::Type::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::CheckDeposit::InboundFundsHold::Type::TaggedSymbol]) }
          def self.values
          end
        end
      end

      # The status of the Check Deposit.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::Status::TaggedSymbol) }

        # The Check Deposit is pending review.
        PENDING = T.let(:pending, Increase::Models::CheckDeposit::Status::TaggedSymbol)

        # The Check Deposit has been deposited.
        SUBMITTED = T.let(:submitted, Increase::Models::CheckDeposit::Status::TaggedSymbol)

        # The Check Deposit has been rejected.
        REJECTED = T.let(:rejected, Increase::Models::CheckDeposit::Status::TaggedSymbol)

        # The Check Deposit has been returned.
        RETURNED = T.let(:returned, Increase::Models::CheckDeposit::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::CheckDeposit::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `check_deposit`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckDeposit::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::CheckDeposit::Type::TaggedSymbol) }

        CHECK_DEPOSIT = T.let(:check_deposit, Increase::Models::CheckDeposit::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::CheckDeposit::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
