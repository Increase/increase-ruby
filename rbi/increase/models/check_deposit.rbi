# typed: strong

module Increase
  module Models
    class CheckDeposit < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CheckDeposit, Increase::Internal::AnyHash)
        end

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
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # If your deposit is successfully parsed and accepted by Increase, this will
      # contain details of the parsed check.
      sig { returns(T.nilable(Increase::CheckDeposit::DepositAcceptance)) }
      attr_reader :deposit_acceptance

      sig do
        params(
          deposit_acceptance:
            T.nilable(Increase::CheckDeposit::DepositAcceptance::OrHash)
        ).void
      end
      attr_writer :deposit_acceptance

      # If your deposit is rejected by Increase, this will contain details as to why it
      # was rejected.
      sig { returns(T.nilable(Increase::CheckDeposit::DepositRejection)) }
      attr_reader :deposit_rejection

      sig do
        params(
          deposit_rejection:
            T.nilable(Increase::CheckDeposit::DepositRejection::OrHash)
        ).void
      end
      attr_writer :deposit_rejection

      # If your deposit is returned, this will contain details as to why it was
      # returned.
      sig { returns(T.nilable(Increase::CheckDeposit::DepositReturn)) }
      attr_reader :deposit_return

      sig do
        params(
          deposit_return:
            T.nilable(Increase::CheckDeposit::DepositReturn::OrHash)
        ).void
      end
      attr_writer :deposit_return

      # After the check is parsed, it is submitted to the Check21 network for
      # processing. This will contain details of the submission.
      sig { returns(T.nilable(Increase::CheckDeposit::DepositSubmission)) }
      attr_reader :deposit_submission

      sig do
        params(
          deposit_submission:
            T.nilable(Increase::CheckDeposit::DepositSubmission::OrHash)
        ).void
      end
      attr_writer :deposit_submission

      # The description of the Check Deposit, for display purposes only.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The ID for the File containing the image of the front of the check.
      sig { returns(String) }
      attr_accessor :front_image_file_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # Increase will sometimes hold the funds for Check Deposits. If funds are held,
      # this sub-object will contain details of the hold.
      sig { returns(T.nilable(Increase::CheckDeposit::InboundFundsHold)) }
      attr_reader :inbound_funds_hold

      sig do
        params(
          inbound_funds_hold:
            T.nilable(Increase::CheckDeposit::InboundFundsHold::OrHash)
        ).void
      end
      attr_writer :inbound_funds_hold

      # If the Check Deposit was the result of an Inbound Mail Item, this will contain
      # the identifier of the Inbound Mail Item.
      sig { returns(T.nilable(String)) }
      attr_accessor :inbound_mail_item_id

      # If the Check Deposit was the result of an Inbound Mail Item, this will contain
      # the identifier of the Lockbox that received it.
      sig { returns(T.nilable(String)) }
      attr_accessor :lockbox_id

      # The status of the Check Deposit.
      sig { returns(Increase::CheckDeposit::Status::TaggedSymbol) }
      attr_accessor :status

      # The ID for the Transaction created by the deposit.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `check_deposit`.
      sig { returns(Increase::CheckDeposit::Type::TaggedSymbol) }
      attr_accessor :type

      # Check Deposits allow you to deposit images of paper checks into your account.
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          back_image_file_id: T.nilable(String),
          created_at: Time,
          deposit_acceptance:
            T.nilable(Increase::CheckDeposit::DepositAcceptance::OrHash),
          deposit_rejection:
            T.nilable(Increase::CheckDeposit::DepositRejection::OrHash),
          deposit_return:
            T.nilable(Increase::CheckDeposit::DepositReturn::OrHash),
          deposit_submission:
            T.nilable(Increase::CheckDeposit::DepositSubmission::OrHash),
          description: T.nilable(String),
          front_image_file_id: String,
          idempotency_key: T.nilable(String),
          inbound_funds_hold:
            T.nilable(Increase::CheckDeposit::InboundFundsHold::OrHash),
          inbound_mail_item_id: T.nilable(String),
          lockbox_id: T.nilable(String),
          status: Increase::CheckDeposit::Status::OrSymbol,
          transaction_id: T.nilable(String),
          type: Increase::CheckDeposit::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The deposit's identifier.
        id:,
        # The Account the check was deposited into.
        account_id:,
        # The deposited amount in USD cents.
        amount:,
        # The ID for the File containing the image of the back of the check.
        back_image_file_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # If your deposit is successfully parsed and accepted by Increase, this will
        # contain details of the parsed check.
        deposit_acceptance:,
        # If your deposit is rejected by Increase, this will contain details as to why it
        # was rejected.
        deposit_rejection:,
        # If your deposit is returned, this will contain details as to why it was
        # returned.
        deposit_return:,
        # After the check is parsed, it is submitted to the Check21 network for
        # processing. This will contain details of the submission.
        deposit_submission:,
        # The description of the Check Deposit, for display purposes only.
        description:,
        # The ID for the File containing the image of the front of the check.
        front_image_file_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # Increase will sometimes hold the funds for Check Deposits. If funds are held,
        # this sub-object will contain details of the hold.
        inbound_funds_hold:,
        # If the Check Deposit was the result of an Inbound Mail Item, this will contain
        # the identifier of the Inbound Mail Item.
        inbound_mail_item_id:,
        # If the Check Deposit was the result of an Inbound Mail Item, this will contain
        # the identifier of the Lockbox that received it.
        lockbox_id:,
        # The status of the Check Deposit.
        status:,
        # The ID for the Transaction created by the deposit.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `check_deposit`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            amount: Integer,
            back_image_file_id: T.nilable(String),
            created_at: Time,
            deposit_acceptance:
              T.nilable(Increase::CheckDeposit::DepositAcceptance),
            deposit_rejection:
              T.nilable(Increase::CheckDeposit::DepositRejection),
            deposit_return: T.nilable(Increase::CheckDeposit::DepositReturn),
            deposit_submission:
              T.nilable(Increase::CheckDeposit::DepositSubmission),
            description: T.nilable(String),
            front_image_file_id: String,
            idempotency_key: T.nilable(String),
            inbound_funds_hold:
              T.nilable(Increase::CheckDeposit::InboundFundsHold),
            inbound_mail_item_id: T.nilable(String),
            lockbox_id: T.nilable(String),
            status: Increase::CheckDeposit::Status::TaggedSymbol,
            transaction_id: T.nilable(String),
            type: Increase::CheckDeposit::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class DepositAcceptance < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckDeposit::DepositAcceptance,
              Increase::Internal::AnyHash
            )
          end

        # The account number printed on the check.
        sig { returns(String) }
        attr_accessor :account_number

        # The amount to be deposited in the minor unit of the transaction's currency. For
        # dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # An additional line of metadata printed on the check. This typically includes the
        # check number for business checks.
        sig { returns(T.nilable(String)) }
        attr_accessor :auxiliary_on_us

        # The ID of the Check Deposit that was accepted.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        # transaction's currency.
        sig do
          returns(
            Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol
          )
        end
        attr_accessor :currency

        # The routing number printed on the check.
        sig { returns(String) }
        attr_accessor :routing_number

        # The check serial number, if present, for consumer checks. For business checks,
        # the serial number is usually in the `auxiliary_on_us` field.
        sig { returns(T.nilable(String)) }
        attr_accessor :serial_number

        # If your deposit is successfully parsed and accepted by Increase, this will
        # contain details of the parsed check.
        sig do
          params(
            account_number: String,
            amount: Integer,
            auxiliary_on_us: T.nilable(String),
            check_deposit_id: String,
            currency:
              Increase::CheckDeposit::DepositAcceptance::Currency::OrSymbol,
            routing_number: String,
            serial_number: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The account number printed on the check.
          account_number:,
          # The amount to be deposited in the minor unit of the transaction's currency. For
          # dollars, for example, this is cents.
          amount:,
          # An additional line of metadata printed on the check. This typically includes the
          # check number for business checks.
          auxiliary_on_us:,
          # The ID of the Check Deposit that was accepted.
          check_deposit_id:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          currency:,
          # The routing number printed on the check.
          routing_number:,
          # The check serial number, if present, for consumer checks. For business checks,
          # the serial number is usually in the `auxiliary_on_us` field.
          serial_number:
        )
        end

        sig do
          override.returns(
            {
              account_number: String,
              amount: Integer,
              auxiliary_on_us: T.nilable(String),
              check_deposit_id: String,
              currency:
                Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol,
              routing_number: String,
              serial_number: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        # transaction's currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckDeposit::DepositAcceptance::Currency)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Canadian Dollar (CAD)
          CAD =
            T.let(
              :CAD,
              Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol
            )

          # Swiss Franc (CHF)
          CHF =
            T.let(
              :CHF,
              Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol
            )

          # Euro (EUR)
          EUR =
            T.let(
              :EUR,
              Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol
            )

          # British Pound (GBP)
          GBP =
            T.let(
              :GBP,
              Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol
            )

          # Japanese Yen (JPY)
          JPY =
            T.let(
              :JPY,
              Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol
            )

          # US Dollar (USD)
          USD =
            T.let(
              :USD,
              Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckDeposit::DepositAcceptance::Currency::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class DepositRejection < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckDeposit::DepositRejection,
              Increase::Internal::AnyHash
            )
          end

        # The rejected amount in the minor unit of check's currency. For dollars, for
        # example, this is cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The identifier of the Check Deposit that was rejected.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
        # currency.
        sig do
          returns(
            Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol
          )
        end
        attr_accessor :currency

        # The identifier of the associated declined transaction.
        sig { returns(String) }
        attr_accessor :declined_transaction_id

        # Why the check deposit was rejected.
        sig do
          returns(
            Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the check deposit was rejected.
        sig { returns(Time) }
        attr_accessor :rejected_at

        # If your deposit is rejected by Increase, this will contain details as to why it
        # was rejected.
        sig do
          params(
            amount: Integer,
            check_deposit_id: String,
            currency:
              Increase::CheckDeposit::DepositRejection::Currency::OrSymbol,
            declined_transaction_id: String,
            reason: Increase::CheckDeposit::DepositRejection::Reason::OrSymbol,
            rejected_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The rejected amount in the minor unit of check's currency. For dollars, for
          # example, this is cents.
          amount:,
          # The identifier of the Check Deposit that was rejected.
          check_deposit_id:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          # currency.
          currency:,
          # The identifier of the associated declined transaction.
          declined_transaction_id:,
          # Why the check deposit was rejected.
          reason:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the check deposit was rejected.
          rejected_at:
        )
        end

        sig do
          override.returns(
            {
              amount: Integer,
              check_deposit_id: String,
              currency:
                Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol,
              declined_transaction_id: String,
              reason:
                Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol,
              rejected_at: Time
            }
          )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
        # currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckDeposit::DepositRejection::Currency)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Canadian Dollar (CAD)
          CAD =
            T.let(
              :CAD,
              Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol
            )

          # Swiss Franc (CHF)
          CHF =
            T.let(
              :CHF,
              Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol
            )

          # Euro (EUR)
          EUR =
            T.let(
              :EUR,
              Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol
            )

          # British Pound (GBP)
          GBP =
            T.let(
              :GBP,
              Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol
            )

          # Japanese Yen (JPY)
          JPY =
            T.let(
              :JPY,
              Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol
            )

          # US Dollar (USD)
          USD =
            T.let(
              :USD,
              Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckDeposit::DepositRejection::Currency::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Why the check deposit was rejected.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckDeposit::DepositRejection::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The check's image is incomplete.
          INCOMPLETE_IMAGE =
            T.let(
              :incomplete_image,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # This is a duplicate check submission.
          DUPLICATE =
            T.let(
              :duplicate,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # This check has poor image quality.
          POOR_IMAGE_QUALITY =
            T.let(
              :poor_image_quality,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # The check was deposited with the incorrect amount.
          INCORRECT_AMOUNT =
            T.let(
              :incorrect_amount,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # The check is made out to someone other than the account holder.
          INCORRECT_RECIPIENT =
            T.let(
              :incorrect_recipient,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # This check was not eligible for mobile deposit.
          NOT_ELIGIBLE_FOR_MOBILE_DEPOSIT =
            T.let(
              :not_eligible_for_mobile_deposit,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # This check is missing at least one required field.
          MISSING_REQUIRED_DATA_ELEMENTS =
            T.let(
              :missing_required_data_elements,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # This check is suspected to be fraudulent.
          SUSPECTED_FRAUD =
            T.let(
              :suspected_fraud,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # This check's deposit window has expired.
          DEPOSIT_WINDOW_EXPIRED =
            T.let(
              :deposit_window_expired,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # The check was rejected at the user's request.
          REQUESTED_BY_USER =
            T.let(
              :requested_by_user,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          # The check was rejected for an unknown reason.
          UNKNOWN =
            T.let(
              :unknown,
              Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckDeposit::DepositRejection::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class DepositReturn < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckDeposit::DepositReturn,
              Increase::Internal::AnyHash
            )
          end

        # The returned amount in USD cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The identifier of the Check Deposit that was returned.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        # transaction's currency.
        sig do
          returns(Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol)
        end
        attr_accessor :currency

        # Why this check was returned by the bank holding the account it was drawn
        # against.
        sig do
          returns(
            Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
          )
        end
        attr_accessor :return_reason

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the check deposit was returned.
        sig { returns(Time) }
        attr_accessor :returned_at

        # The identifier of the transaction that reversed the original check deposit
        # transaction.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If your deposit is returned, this will contain details as to why it was
        # returned.
        sig do
          params(
            amount: Integer,
            check_deposit_id: String,
            currency: Increase::CheckDeposit::DepositReturn::Currency::OrSymbol,
            return_reason:
              Increase::CheckDeposit::DepositReturn::ReturnReason::OrSymbol,
            returned_at: Time,
            transaction_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The returned amount in USD cents.
          amount:,
          # The identifier of the Check Deposit that was returned.
          check_deposit_id:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          currency:,
          # Why this check was returned by the bank holding the account it was drawn
          # against.
          return_reason:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the check deposit was returned.
          returned_at:,
          # The identifier of the transaction that reversed the original check deposit
          # transaction.
          transaction_id:
        )
        end

        sig do
          override.returns(
            {
              amount: Integer,
              check_deposit_id: String,
              currency:
                Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol,
              return_reason:
                Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol,
              returned_at: Time,
              transaction_id: String
            }
          )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        # transaction's currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckDeposit::DepositReturn::Currency)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Canadian Dollar (CAD)
          CAD =
            T.let(
              :CAD,
              Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol
            )

          # Swiss Franc (CHF)
          CHF =
            T.let(
              :CHF,
              Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol
            )

          # Euro (EUR)
          EUR =
            T.let(
              :EUR,
              Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol
            )

          # British Pound (GBP)
          GBP =
            T.let(
              :GBP,
              Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol
            )

          # Japanese Yen (JPY)
          JPY =
            T.let(
              :JPY,
              Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol
            )

          # US Dollar (USD)
          USD =
            T.let(
              :USD,
              Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckDeposit::DepositReturn::Currency::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Why this check was returned by the bank holding the account it was drawn
        # against.
        module ReturnReason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckDeposit::DepositReturn::ReturnReason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The check doesn't allow ACH conversion.
          ACH_CONVERSION_NOT_SUPPORTED =
            T.let(
              :ach_conversion_not_supported,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The account is closed. (Check21 return code `D`)
          CLOSED_ACCOUNT =
            T.let(
              :closed_account,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check has already been deposited. (Check21 return code `Y`)
          DUPLICATE_SUBMISSION =
            T.let(
              :duplicate_submission,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # Insufficient funds (Check21 return code `A`)
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # No account was found matching the check details. (Check21 return code `E`)
          NO_ACCOUNT =
            T.let(
              :no_account,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check was not authorized. (Check21 return code `Q`)
          NOT_AUTHORIZED =
            T.let(
              :not_authorized,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check is too old. (Check21 return code `G`)
          STALE_DATED =
            T.let(
              :stale_dated,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The payment has been stopped by the account holder. (Check21 return code `C`)
          STOP_PAYMENT =
            T.let(
              :stop_payment,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The reason for the return is unknown.
          UNKNOWN_REASON =
            T.let(
              :unknown_reason,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The image doesn't match the details submitted.
          UNMATCHED_DETAILS =
            T.let(
              :unmatched_details,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The image could not be read. (Check21 return code `U`)
          UNREADABLE_IMAGE =
            T.let(
              :unreadable_image,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check endorsement was irregular. (Check21 return code `J`)
          ENDORSEMENT_IRREGULAR =
            T.let(
              :endorsement_irregular,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check present was either altered or fake. (Check21 return code `N`)
          ALTERED_OR_FICTITIOUS_ITEM =
            T.let(
              :altered_or_fictitious_item,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The account this check is drawn on is frozen. (Check21 return code `F`)
          FROZEN_OR_BLOCKED_ACCOUNT =
            T.let(
              :frozen_or_blocked_account,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check is post dated. (Check21 return code `H`)
          POST_DATED =
            T.let(
              :post_dated,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The endorsement was missing. (Check21 return code `I`)
          ENDORSEMENT_MISSING =
            T.let(
              :endorsement_missing,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check signature was missing. (Check21 return code `K`)
          SIGNATURE_MISSING =
            T.let(
              :signature_missing,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The bank suspects a stop payment will be placed. (Check21 return code `T`)
          STOP_PAYMENT_SUSPECT =
            T.let(
              :stop_payment_suspect,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The bank cannot read the image. (Check21 return code `U`)
          UNUSABLE_IMAGE =
            T.let(
              :unusable_image,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check image fails the bank's security check. (Check21 return code `V`)
          IMAGE_FAILS_SECURITY_CHECK =
            T.let(
              :image_fails_security_check,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The bank cannot determine the amount. (Check21 return code `W`)
          CANNOT_DETERMINE_AMOUNT =
            T.let(
              :cannot_determine_amount,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The signature is inconsistent with prior signatures. (Check21 return code `L`)
          SIGNATURE_IRREGULAR =
            T.let(
              :signature_irregular,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check is a non-cash item and cannot be drawn against the account. (Check21 return code `M`)
          NON_CASH_ITEM =
            T.let(
              :non_cash_item,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The bank is unable to process this check. (Check21 return code `O`)
          UNABLE_TO_PROCESS =
            T.let(
              :unable_to_process,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The check exceeds the bank or customer's limit. (Check21 return code `P`)
          ITEM_EXCEEDS_DOLLAR_LIMIT =
            T.let(
              :item_exceeds_dollar_limit,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          # The bank sold this account and no longer services this customer. (Check21 return code `R`)
          BRANCH_OR_ACCOUNT_SOLD =
            T.let(
              :branch_or_account_sold,
              Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckDeposit::DepositReturn::ReturnReason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class DepositSubmission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckDeposit::DepositSubmission,
              Increase::Internal::AnyHash
            )
          end

        # The ID for the File containing the check back image that was submitted to the
        # Check21 network.
        sig { returns(String) }
        attr_accessor :back_file_id

        # The ID for the File containing the check front image that was submitted to the
        # Check21 network.
        sig { returns(String) }
        attr_accessor :front_file_id

        # When the check deposit was submitted to the Check21 network for processing.
        # During business days, this happens within a few hours of the check being
        # accepted by Increase.
        sig { returns(Time) }
        attr_accessor :submitted_at

        # After the check is parsed, it is submitted to the Check21 network for
        # processing. This will contain details of the submission.
        sig do
          params(
            back_file_id: String,
            front_file_id: String,
            submitted_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID for the File containing the check back image that was submitted to the
          # Check21 network.
          back_file_id:,
          # The ID for the File containing the check front image that was submitted to the
          # Check21 network.
          front_file_id:,
          # When the check deposit was submitted to the Check21 network for processing.
          # During business days, this happens within a few hours of the check being
          # accepted by Increase.
          submitted_at:
        )
        end

        sig do
          override.returns(
            { back_file_id: String, front_file_id: String, submitted_at: Time }
          )
        end
        def to_hash
        end
      end

      class InboundFundsHold < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckDeposit::InboundFundsHold,
              Increase::Internal::AnyHash
            )
          end

        # The Inbound Funds Hold identifier.
        sig { returns(String) }
        attr_accessor :id

        # The held amount in the minor unit of the account's currency. For dollars, for
        # example, this is cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # When the hold will be released automatically. Certain conditions may cause it to
        # be released before this time.
        sig { returns(Time) }
        attr_accessor :automatically_releases_at

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        # was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        # currency.
        sig do
          returns(
            Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol
          )
        end
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
        sig do
          returns(
            Increase::CheckDeposit::InboundFundsHold::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # A constant representing the object's type. For this resource it will always be
        # `inbound_funds_hold`.
        sig do
          returns(Increase::CheckDeposit::InboundFundsHold::Type::TaggedSymbol)
        end
        attr_accessor :type

        # Increase will sometimes hold the funds for Check Deposits. If funds are held,
        # this sub-object will contain details of the hold.
        sig do
          params(
            id: String,
            amount: Integer,
            automatically_releases_at: Time,
            created_at: Time,
            currency:
              Increase::CheckDeposit::InboundFundsHold::Currency::OrSymbol,
            held_transaction_id: T.nilable(String),
            pending_transaction_id: T.nilable(String),
            released_at: T.nilable(Time),
            status: Increase::CheckDeposit::InboundFundsHold::Status::OrSymbol,
            type: Increase::CheckDeposit::InboundFundsHold::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The Inbound Funds Hold identifier.
          id:,
          # The held amount in the minor unit of the account's currency. For dollars, for
          # example, this is cents.
          amount:,
          # When the hold will be released automatically. Certain conditions may cause it to
          # be released before this time.
          automatically_releases_at:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
          # was created.
          created_at:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
          # currency.
          currency:,
          # The ID of the Transaction for which funds were held.
          held_transaction_id:,
          # The ID of the Pending Transaction representing the held funds.
          pending_transaction_id:,
          # When the hold was released (if it has been released).
          released_at:,
          # The status of the hold.
          status:,
          # A constant representing the object's type. For this resource it will always be
          # `inbound_funds_hold`.
          type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              amount: Integer,
              automatically_releases_at: Time,
              created_at: Time,
              currency:
                Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol,
              held_transaction_id: T.nilable(String),
              pending_transaction_id: T.nilable(String),
              released_at: T.nilable(Time),
              status:
                Increase::CheckDeposit::InboundFundsHold::Status::TaggedSymbol,
              type: Increase::CheckDeposit::InboundFundsHold::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        # currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckDeposit::InboundFundsHold::Currency)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Canadian Dollar (CAD)
          CAD =
            T.let(
              :CAD,
              Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol
            )

          # Swiss Franc (CHF)
          CHF =
            T.let(
              :CHF,
              Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol
            )

          # Euro (EUR)
          EUR =
            T.let(
              :EUR,
              Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol
            )

          # British Pound (GBP)
          GBP =
            T.let(
              :GBP,
              Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol
            )

          # Japanese Yen (JPY)
          JPY =
            T.let(
              :JPY,
              Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol
            )

          # US Dollar (USD)
          USD =
            T.let(
              :USD,
              Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckDeposit::InboundFundsHold::Currency::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The status of the hold.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckDeposit::InboundFundsHold::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Funds are still being held.
          HELD =
            T.let(
              :held,
              Increase::CheckDeposit::InboundFundsHold::Status::TaggedSymbol
            )

          # Funds have been released.
          COMPLETE =
            T.let(
              :complete,
              Increase::CheckDeposit::InboundFundsHold::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckDeposit::InboundFundsHold::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # A constant representing the object's type. For this resource it will always be
        # `inbound_funds_hold`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckDeposit::InboundFundsHold::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INBOUND_FUNDS_HOLD =
            T.let(
              :inbound_funds_hold,
              Increase::CheckDeposit::InboundFundsHold::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckDeposit::InboundFundsHold::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The status of the Check Deposit.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CheckDeposit::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Check Deposit is pending review.
        PENDING = T.let(:pending, Increase::CheckDeposit::Status::TaggedSymbol)

        # The Check Deposit has been deposited.
        SUBMITTED =
          T.let(:submitted, Increase::CheckDeposit::Status::TaggedSymbol)

        # The Check Deposit has been rejected.
        REJECTED =
          T.let(:rejected, Increase::CheckDeposit::Status::TaggedSymbol)

        # The Check Deposit has been returned.
        RETURNED =
          T.let(:returned, Increase::CheckDeposit::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CheckDeposit::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `check_deposit`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CheckDeposit::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CHECK_DEPOSIT =
          T.let(:check_deposit, Increase::CheckDeposit::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::CheckDeposit::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
