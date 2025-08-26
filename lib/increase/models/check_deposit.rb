# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckDeposits#create
    class CheckDeposit < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The deposit's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account the check was deposited into.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The deposited amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute back_image_file_id
      #   The ID for the File containing the image of the back of the check.
      #
      #   @return [String, nil]
      required :back_image_file_id, String, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute deposit_acceptance
      #   If your deposit is successfully parsed and accepted by Increase, this will
      #   contain details of the parsed check.
      #
      #   @return [Increase::Models::CheckDeposit::DepositAcceptance, nil]
      required :deposit_acceptance, -> { Increase::CheckDeposit::DepositAcceptance }, nil?: true

      # @!attribute deposit_rejection
      #   If your deposit is rejected by Increase, this will contain details as to why it
      #   was rejected.
      #
      #   @return [Increase::Models::CheckDeposit::DepositRejection, nil]
      required :deposit_rejection, -> { Increase::CheckDeposit::DepositRejection }, nil?: true

      # @!attribute deposit_return
      #   If your deposit is returned, this will contain details as to why it was
      #   returned.
      #
      #   @return [Increase::Models::CheckDeposit::DepositReturn, nil]
      required :deposit_return, -> { Increase::CheckDeposit::DepositReturn }, nil?: true

      # @!attribute deposit_submission
      #   After the check is parsed, it is submitted to the Check21 network for
      #   processing. This will contain details of the submission.
      #
      #   @return [Increase::Models::CheckDeposit::DepositSubmission, nil]
      required :deposit_submission, -> { Increase::CheckDeposit::DepositSubmission }, nil?: true

      # @!attribute description
      #   The description of the Check Deposit, for display purposes only.
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute front_image_file_id
      #   The ID for the File containing the image of the front of the check.
      #
      #   @return [String]
      required :front_image_file_id, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute inbound_funds_hold
      #   Increase will sometimes hold the funds for Check Deposits. If funds are held,
      #   this sub-object will contain details of the hold.
      #
      #   @return [Increase::Models::CheckDeposit::InboundFundsHold, nil]
      required :inbound_funds_hold, -> { Increase::CheckDeposit::InboundFundsHold }, nil?: true

      # @!attribute inbound_mail_item_id
      #   If the Check Deposit was the result of an Inbound Mail Item, this will contain
      #   the identifier of the Inbound Mail Item.
      #
      #   @return [String, nil]
      required :inbound_mail_item_id, String, nil?: true

      # @!attribute lockbox_id
      #   If the Check Deposit was the result of an Inbound Mail Item, this will contain
      #   the identifier of the Lockbox that received it.
      #
      #   @return [String, nil]
      required :lockbox_id, String, nil?: true

      # @!attribute status
      #   The status of the Check Deposit.
      #
      #   @return [Symbol, Increase::Models::CheckDeposit::Status]
      required :status, enum: -> { Increase::CheckDeposit::Status }

      # @!attribute transaction_id
      #   The ID for the Transaction created by the deposit.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `check_deposit`.
      #
      #   @return [Symbol, Increase::Models::CheckDeposit::Type]
      required :type, enum: -> { Increase::CheckDeposit::Type }

      # @!method initialize(id:, account_id:, amount:, back_image_file_id:, created_at:, deposit_acceptance:, deposit_rejection:, deposit_return:, deposit_submission:, description:, front_image_file_id:, idempotency_key:, inbound_funds_hold:, inbound_mail_item_id:, lockbox_id:, status:, transaction_id:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CheckDeposit} for more details.
      #
      #   Check Deposits allow you to deposit images of paper checks into your account.
      #
      #   @param id [String] The deposit's identifier.
      #
      #   @param account_id [String] The Account the check was deposited into.
      #
      #   @param amount [Integer] The deposited amount in USD cents.
      #
      #   @param back_image_file_id [String, nil] The ID for the File containing the image of the back of the check.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param deposit_acceptance [Increase::Models::CheckDeposit::DepositAcceptance, nil] If your deposit is successfully parsed and accepted by Increase, this will conta
      #
      #   @param deposit_rejection [Increase::Models::CheckDeposit::DepositRejection, nil] If your deposit is rejected by Increase, this will contain details as to why it
      #
      #   @param deposit_return [Increase::Models::CheckDeposit::DepositReturn, nil] If your deposit is returned, this will contain details as to why it was returned
      #
      #   @param deposit_submission [Increase::Models::CheckDeposit::DepositSubmission, nil] After the check is parsed, it is submitted to the Check21 network for processing
      #
      #   @param description [String, nil] The description of the Check Deposit, for display purposes only.
      #
      #   @param front_image_file_id [String] The ID for the File containing the image of the front of the check.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param inbound_funds_hold [Increase::Models::CheckDeposit::InboundFundsHold, nil] Increase will sometimes hold the funds for Check Deposits. If funds are held, th
      #
      #   @param inbound_mail_item_id [String, nil] If the Check Deposit was the result of an Inbound Mail Item, this will contain t
      #
      #   @param lockbox_id [String, nil] If the Check Deposit was the result of an Inbound Mail Item, this will contain t
      #
      #   @param status [Symbol, Increase::Models::CheckDeposit::Status] The status of the Check Deposit.
      #
      #   @param transaction_id [String, nil] The ID for the Transaction created by the deposit.
      #
      #   @param type [Symbol, Increase::Models::CheckDeposit::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::CheckDeposit#deposit_acceptance
      class DepositAcceptance < Increase::Internal::Type::BaseModel
        # @!attribute account_number
        #   The account number printed on the check.
        #
        #   @return [String]
        required :account_number, String

        # @!attribute amount
        #   The amount to be deposited in the minor unit of the transaction's currency. For
        #   dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute auxiliary_on_us
        #   An additional line of metadata printed on the check. This typically includes the
        #   check number for business checks.
        #
        #   @return [String, nil]
        required :auxiliary_on_us, String, nil?: true

        # @!attribute check_deposit_id
        #   The ID of the Check Deposit that was accepted.
        #
        #   @return [String]
        required :check_deposit_id, String

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        #   transaction's currency.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositAcceptance::Currency]
        required :currency, enum: -> { Increase::CheckDeposit::DepositAcceptance::Currency }

        # @!attribute routing_number
        #   The routing number printed on the check.
        #
        #   @return [String]
        required :routing_number, String

        # @!attribute serial_number
        #   The check serial number, if present, for consumer checks. For business checks,
        #   the serial number is usually in the `auxiliary_on_us` field.
        #
        #   @return [String, nil]
        required :serial_number, String, nil?: true

        # @!method initialize(account_number:, amount:, auxiliary_on_us:, check_deposit_id:, currency:, routing_number:, serial_number:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CheckDeposit::DepositAcceptance} for more details.
        #
        #   If your deposit is successfully parsed and accepted by Increase, this will
        #   contain details of the parsed check.
        #
        #   @param account_number [String] The account number printed on the check.
        #
        #   @param amount [Integer] The amount to be deposited in the minor unit of the transaction's currency. For
        #
        #   @param auxiliary_on_us [String, nil] An additional line of metadata printed on the check. This typically includes the
        #
        #   @param check_deposit_id [String] The ID of the Check Deposit that was accepted.
        #
        #   @param currency [Symbol, Increase::Models::CheckDeposit::DepositAcceptance::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
        #
        #   @param routing_number [String] The routing number printed on the check.
        #
        #   @param serial_number [String, nil] The check serial number, if present, for consumer checks. For business checks, t

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        # transaction's currency.
        #
        # @see Increase::Models::CheckDeposit::DepositAcceptance#currency
        module Currency
          extend Increase::Internal::Type::Enum

          # Canadian Dollar (CAD)
          CAD = :CAD

          # Swiss Franc (CHF)
          CHF = :CHF

          # Euro (EUR)
          EUR = :EUR

          # British Pound (GBP)
          GBP = :GBP

          # Japanese Yen (JPY)
          JPY = :JPY

          # US Dollar (USD)
          USD = :USD

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::CheckDeposit#deposit_rejection
      class DepositRejection < Increase::Internal::Type::BaseModel
        # @!attribute amount
        #   The rejected amount in the minor unit of check's currency. For dollars, for
        #   example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute check_deposit_id
        #   The identifier of the Check Deposit that was rejected.
        #
        #   @return [String]
        required :check_deposit_id, String

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
        #   currency.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositRejection::Currency]
        required :currency, enum: -> { Increase::CheckDeposit::DepositRejection::Currency }

        # @!attribute declined_transaction_id
        #   The identifier of the associated declined transaction.
        #
        #   @return [String]
        required :declined_transaction_id, String

        # @!attribute reason
        #   Why the check deposit was rejected.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositRejection::Reason]
        required :reason, enum: -> { Increase::CheckDeposit::DepositRejection::Reason }

        # @!attribute rejected_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the check deposit was rejected.
        #
        #   @return [Time]
        required :rejected_at, Time

        # @!method initialize(amount:, check_deposit_id:, currency:, declined_transaction_id:, reason:, rejected_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CheckDeposit::DepositRejection} for more details.
        #
        #   If your deposit is rejected by Increase, this will contain details as to why it
        #   was rejected.
        #
        #   @param amount [Integer] The rejected amount in the minor unit of check's currency. For dollars, for exam
        #
        #   @param check_deposit_id [String] The identifier of the Check Deposit that was rejected.
        #
        #   @param currency [Symbol, Increase::Models::CheckDeposit::DepositRejection::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's curr
        #
        #   @param declined_transaction_id [String] The identifier of the associated declined transaction.
        #
        #   @param reason [Symbol, Increase::Models::CheckDeposit::DepositRejection::Reason] Why the check deposit was rejected.
        #
        #   @param rejected_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
        # currency.
        #
        # @see Increase::Models::CheckDeposit::DepositRejection#currency
        module Currency
          extend Increase::Internal::Type::Enum

          # Canadian Dollar (CAD)
          CAD = :CAD

          # Swiss Franc (CHF)
          CHF = :CHF

          # Euro (EUR)
          EUR = :EUR

          # British Pound (GBP)
          GBP = :GBP

          # Japanese Yen (JPY)
          JPY = :JPY

          # US Dollar (USD)
          USD = :USD

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Why the check deposit was rejected.
        #
        # @see Increase::Models::CheckDeposit::DepositRejection#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The check's image is incomplete.
          INCOMPLETE_IMAGE = :incomplete_image

          # This is a duplicate check submission.
          DUPLICATE = :duplicate

          # This check has poor image quality.
          POOR_IMAGE_QUALITY = :poor_image_quality

          # The check was deposited with the incorrect amount.
          INCORRECT_AMOUNT = :incorrect_amount

          # The check is made out to someone other than the account holder.
          INCORRECT_RECIPIENT = :incorrect_recipient

          # This check was not eligible for mobile deposit.
          NOT_ELIGIBLE_FOR_MOBILE_DEPOSIT = :not_eligible_for_mobile_deposit

          # This check is missing at least one required field.
          MISSING_REQUIRED_DATA_ELEMENTS = :missing_required_data_elements

          # This check is suspected to be fraudulent.
          SUSPECTED_FRAUD = :suspected_fraud

          # This check's deposit window has expired.
          DEPOSIT_WINDOW_EXPIRED = :deposit_window_expired

          # The check was rejected at the user's request.
          REQUESTED_BY_USER = :requested_by_user

          # The check was rejected for an unknown reason.
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::CheckDeposit#deposit_return
      class DepositReturn < Increase::Internal::Type::BaseModel
        # @!attribute amount
        #   The returned amount in USD cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute check_deposit_id
        #   The identifier of the Check Deposit that was returned.
        #
        #   @return [String]
        required :check_deposit_id, String

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        #   transaction's currency.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositReturn::Currency]
        required :currency, enum: -> { Increase::CheckDeposit::DepositReturn::Currency }

        # @!attribute return_reason
        #   Why this check was returned by the bank holding the account it was drawn
        #   against.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositReturn::ReturnReason]
        required :return_reason, enum: -> { Increase::CheckDeposit::DepositReturn::ReturnReason }

        # @!attribute returned_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the check deposit was returned.
        #
        #   @return [Time]
        required :returned_at, Time

        # @!attribute transaction_id
        #   The identifier of the transaction that reversed the original check deposit
        #   transaction.
        #
        #   @return [String]
        required :transaction_id, String

        # @!method initialize(amount:, check_deposit_id:, currency:, return_reason:, returned_at:, transaction_id:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CheckDeposit::DepositReturn} for more details.
        #
        #   If your deposit is returned, this will contain details as to why it was
        #   returned.
        #
        #   @param amount [Integer] The returned amount in USD cents.
        #
        #   @param check_deposit_id [String] The identifier of the Check Deposit that was returned.
        #
        #   @param currency [Symbol, Increase::Models::CheckDeposit::DepositReturn::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
        #
        #   @param return_reason [Symbol, Increase::Models::CheckDeposit::DepositReturn::ReturnReason] Why this check was returned by the bank holding the account it was drawn against
        #
        #   @param returned_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param transaction_id [String] The identifier of the transaction that reversed the original check deposit trans

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        # transaction's currency.
        #
        # @see Increase::Models::CheckDeposit::DepositReturn#currency
        module Currency
          extend Increase::Internal::Type::Enum

          # Canadian Dollar (CAD)
          CAD = :CAD

          # Swiss Franc (CHF)
          CHF = :CHF

          # Euro (EUR)
          EUR = :EUR

          # British Pound (GBP)
          GBP = :GBP

          # Japanese Yen (JPY)
          JPY = :JPY

          # US Dollar (USD)
          USD = :USD

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Why this check was returned by the bank holding the account it was drawn
        # against.
        #
        # @see Increase::Models::CheckDeposit::DepositReturn#return_reason
        module ReturnReason
          extend Increase::Internal::Type::Enum

          # The check doesn't allow ACH conversion.
          ACH_CONVERSION_NOT_SUPPORTED = :ach_conversion_not_supported

          # The account is closed. (Check21 return code `D`)
          CLOSED_ACCOUNT = :closed_account

          # The check has already been deposited. (Check21 return code `Y`)
          DUPLICATE_SUBMISSION = :duplicate_submission

          # Insufficient funds (Check21 return code `A`)
          INSUFFICIENT_FUNDS = :insufficient_funds

          # No account was found matching the check details. (Check21 return code `E`)
          NO_ACCOUNT = :no_account

          # The check was not authorized. (Check21 return code `Q`)
          NOT_AUTHORIZED = :not_authorized

          # The check is too old. (Check21 return code `G`)
          STALE_DATED = :stale_dated

          # The payment has been stopped by the account holder. (Check21 return code `C`)
          STOP_PAYMENT = :stop_payment

          # The reason for the return is unknown.
          UNKNOWN_REASON = :unknown_reason

          # The image doesn't match the details submitted.
          UNMATCHED_DETAILS = :unmatched_details

          # The image could not be read. (Check21 return code `U`)
          UNREADABLE_IMAGE = :unreadable_image

          # The check endorsement was irregular. (Check21 return code `J`)
          ENDORSEMENT_IRREGULAR = :endorsement_irregular

          # The check present was either altered or fake. (Check21 return code `N`)
          ALTERED_OR_FICTITIOUS_ITEM = :altered_or_fictitious_item

          # The account this check is drawn on is frozen. (Check21 return code `F`)
          FROZEN_OR_BLOCKED_ACCOUNT = :frozen_or_blocked_account

          # The check is post dated. (Check21 return code `H`)
          POST_DATED = :post_dated

          # The endorsement was missing. (Check21 return code `I`)
          ENDORSEMENT_MISSING = :endorsement_missing

          # The check signature was missing. (Check21 return code `K`)
          SIGNATURE_MISSING = :signature_missing

          # The bank suspects a stop payment will be placed. (Check21 return code `T`)
          STOP_PAYMENT_SUSPECT = :stop_payment_suspect

          # The bank cannot read the image. (Check21 return code `U`)
          UNUSABLE_IMAGE = :unusable_image

          # The check image fails the bank's security check. (Check21 return code `V`)
          IMAGE_FAILS_SECURITY_CHECK = :image_fails_security_check

          # The bank cannot determine the amount. (Check21 return code `W`)
          CANNOT_DETERMINE_AMOUNT = :cannot_determine_amount

          # The signature is inconsistent with prior signatures. (Check21 return code `L`)
          SIGNATURE_IRREGULAR = :signature_irregular

          # The check is a non-cash item and cannot be drawn against the account. (Check21 return code `M`)
          NON_CASH_ITEM = :non_cash_item

          # The bank is unable to process this check. (Check21 return code `O`)
          UNABLE_TO_PROCESS = :unable_to_process

          # The check exceeds the bank or customer's limit. (Check21 return code `P`)
          ITEM_EXCEEDS_DOLLAR_LIMIT = :item_exceeds_dollar_limit

          # The bank sold this account and no longer services this customer. (Check21 return code `R`)
          BRANCH_OR_ACCOUNT_SOLD = :branch_or_account_sold

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::CheckDeposit#deposit_submission
      class DepositSubmission < Increase::Internal::Type::BaseModel
        # @!attribute back_file_id
        #   The ID for the File containing the check back image that was submitted to the
        #   Check21 network.
        #
        #   @return [String]
        required :back_file_id, String

        # @!attribute front_file_id
        #   The ID for the File containing the check front image that was submitted to the
        #   Check21 network.
        #
        #   @return [String]
        required :front_file_id, String

        # @!attribute submitted_at
        #   When the check deposit was submitted to the Check21 network for processing.
        #   During business days, this happens within a few hours of the check being
        #   accepted by Increase.
        #
        #   @return [Time]
        required :submitted_at, Time

        # @!method initialize(back_file_id:, front_file_id:, submitted_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CheckDeposit::DepositSubmission} for more details.
        #
        #   After the check is parsed, it is submitted to the Check21 network for
        #   processing. This will contain details of the submission.
        #
        #   @param back_file_id [String] The ID for the File containing the check back image that was submitted to the Ch
        #
        #   @param front_file_id [String] The ID for the File containing the check front image that was submitted to the C
        #
        #   @param submitted_at [Time] When the check deposit was submitted to the Check21 network for processing. Duri
      end

      # @see Increase::Models::CheckDeposit#inbound_funds_hold
      class InboundFundsHold < Increase::Internal::Type::BaseModel
        # @!attribute amount
        #   The held amount in the minor unit of the account's currency. For dollars, for
        #   example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute automatically_releases_at
        #   When the hold will be released automatically. Certain conditions may cause it to
        #   be released before this time.
        #
        #   @return [Time]
        required :automatically_releases_at, Time

        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        #   was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   currency.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Currency]
        required :currency, enum: -> { Increase::CheckDeposit::InboundFundsHold::Currency }

        # @!attribute held_transaction_id
        #   The ID of the Transaction for which funds were held.
        #
        #   @return [String, nil]
        required :held_transaction_id, String, nil?: true

        # @!attribute pending_transaction_id
        #   The ID of the Pending Transaction representing the held funds.
        #
        #   @return [String, nil]
        required :pending_transaction_id, String, nil?: true

        # @!attribute released_at
        #   When the hold was released (if it has been released).
        #
        #   @return [Time, nil]
        required :released_at, Time, nil?: true

        # @!attribute status
        #   The status of the hold.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Status]
        required :status, enum: -> { Increase::CheckDeposit::InboundFundsHold::Status }

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be
        #   `inbound_funds_hold`.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Type]
        required :type, enum: -> { Increase::CheckDeposit::InboundFundsHold::Type }

        # @!method initialize(amount:, automatically_releases_at:, created_at:, currency:, held_transaction_id:, pending_transaction_id:, released_at:, status:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CheckDeposit::InboundFundsHold} for more details.
        #
        #   Increase will sometimes hold the funds for Check Deposits. If funds are held,
        #   this sub-object will contain details of the hold.
        #
        #   @param amount [Integer] The held amount in the minor unit of the account's currency. For dollars, for ex
        #
        #   @param automatically_releases_at [Time] When the hold will be released automatically. Certain conditions may cause it to
        #
        #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold wa
        #
        #   @param currency [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's curre
        #
        #   @param held_transaction_id [String, nil] The ID of the Transaction for which funds were held.
        #
        #   @param pending_transaction_id [String, nil] The ID of the Pending Transaction representing the held funds.
        #
        #   @param released_at [Time, nil] When the hold was released (if it has been released).
        #
        #   @param status [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Status] The status of the hold.
        #
        #   @param type [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Type] A constant representing the object's type. For this resource it will always be `

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        # currency.
        #
        # @see Increase::Models::CheckDeposit::InboundFundsHold#currency
        module Currency
          extend Increase::Internal::Type::Enum

          # Canadian Dollar (CAD)
          CAD = :CAD

          # Swiss Franc (CHF)
          CHF = :CHF

          # Euro (EUR)
          EUR = :EUR

          # British Pound (GBP)
          GBP = :GBP

          # Japanese Yen (JPY)
          JPY = :JPY

          # US Dollar (USD)
          USD = :USD

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The status of the hold.
        #
        # @see Increase::Models::CheckDeposit::InboundFundsHold#status
        module Status
          extend Increase::Internal::Type::Enum

          # Funds are still being held.
          HELD = :held

          # Funds have been released.
          COMPLETE = :complete

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # A constant representing the object's type. For this resource it will always be
        # `inbound_funds_hold`.
        #
        # @see Increase::Models::CheckDeposit::InboundFundsHold#type
        module Type
          extend Increase::Internal::Type::Enum

          INBOUND_FUNDS_HOLD = :inbound_funds_hold

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The status of the Check Deposit.
      #
      # @see Increase::Models::CheckDeposit#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Check Deposit is pending review.
        PENDING = :pending

        # The Check Deposit has been deposited.
        SUBMITTED = :submitted

        # The Check Deposit has been rejected.
        REJECTED = :rejected

        # The Check Deposit has been returned.
        RETURNED = :returned

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `check_deposit`.
      #
      # @see Increase::Models::CheckDeposit#type
      module Type
        extend Increase::Internal::Type::Enum

        CHECK_DEPOSIT = :check_deposit

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
