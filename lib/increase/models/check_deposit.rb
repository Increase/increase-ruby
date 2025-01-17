# frozen_string_literal: true

module Increase
  module Models
    # @example
    # ```ruby
    # check_deposit => {
    #   id: String,
    #   account_id: String,
    #   amount: Integer,
    #   back_image_file_id: String,
    #   created_at: Time,
    #   **_
    # }
    # ```
    class CheckDeposit < Increase::BaseModel
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
      required :back_image_file_id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute deposit_acceptance
      #   If your deposit is successfully parsed and accepted by Increase, this will contain details of the parsed check.
      #
      #   @return [Increase::Models::CheckDeposit::DepositAcceptance, nil]
      required :deposit_acceptance, -> { Increase::Models::CheckDeposit::DepositAcceptance }

      # @!attribute deposit_rejection
      #   If your deposit is rejected by Increase, this will contain details as to why it was rejected.
      #
      #   @return [Increase::Models::CheckDeposit::DepositRejection, nil]
      required :deposit_rejection, -> { Increase::Models::CheckDeposit::DepositRejection }

      # @!attribute deposit_return
      #   If your deposit is returned, this will contain details as to why it was returned.
      #
      #   @return [Increase::Models::CheckDeposit::DepositReturn, nil]
      required :deposit_return, -> { Increase::Models::CheckDeposit::DepositReturn }

      # @!attribute deposit_submission
      #   After the check is parsed, it is submitted to the Check21 network for processing. This will contain details of the submission.
      #
      #   @return [Increase::Models::CheckDeposit::DepositSubmission, nil]
      required :deposit_submission, -> { Increase::Models::CheckDeposit::DepositSubmission }

      # @!attribute description
      #   The description of the Check Deposit, for display purposes only.
      #
      #   @return [String, nil]
      required :description, String

      # @!attribute front_image_file_id
      #   The ID for the File containing the image of the front of the check.
      #
      #   @return [String]
      required :front_image_file_id, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across Increase and is used to ensure that a request is only processed once. Learn more about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String

      # @!attribute inbound_funds_hold
      #   Increase will sometimes hold the funds for Check Deposits. If funds are held, this sub-object will contain details of the hold.
      #
      #   @return [Increase::Models::CheckDeposit::InboundFundsHold, nil]
      required :inbound_funds_hold, -> { Increase::Models::CheckDeposit::InboundFundsHold }

      # @!attribute inbound_mail_item_id
      #   If the Check Deposit was the result of an Inbound Mail Item, this will contain the identifier of the Inbound Mail Item.
      #
      #   @return [String, nil]
      required :inbound_mail_item_id, String

      # @!attribute lockbox_id
      #   If the Check Deposit was the result of an Inbound Mail Item, this will contain the identifier of the Lockbox that received it.
      #
      #   @return [String, nil]
      required :lockbox_id, String

      # @!attribute status
      #   The status of the Check Deposit.
      #
      #   @return [Symbol, Increase::Models::CheckDeposit::Status]
      required :status, enum: -> { Increase::Models::CheckDeposit::Status }

      # @!attribute transaction_id
      #   The ID for the Transaction created by the deposit.
      #
      #   @return [String, nil]
      required :transaction_id, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be `check_deposit`.
      #
      #   @return [Symbol, Increase::Models::CheckDeposit::Type]
      required :type, enum: -> { Increase::Models::CheckDeposit::Type }

      # @!parse
      #   # Check Deposits allow you to deposit images of paper checks into your account.
      #   #
      #   # @param id [String] The deposit's identifier.
      #   #
      #   # @param account_id [String] The Account the check was deposited into.
      #   #
      #   # @param amount [Integer] The deposited amount in USD cents.
      #   #
      #   # @param back_image_file_id [String, nil] The ID for the File containing the image of the back of the check.
      #   #
      #   # @param created_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   #   the transfer was created.
      #   #
      #   # @param deposit_acceptance [Increase::Models::CheckDeposit::DepositAcceptance, nil] If your deposit is successfully parsed and accepted by Increase, this will
      #   #   contain details of the parsed check.
      #   #
      #   # @param deposit_rejection [Increase::Models::CheckDeposit::DepositRejection, nil] If your deposit is rejected by Increase, this will contain details as to why it
      #   #   was rejected.
      #   #
      #   # @param deposit_return [Increase::Models::CheckDeposit::DepositReturn, nil] If your deposit is returned, this will contain details as to why it was
      #   #   returned.
      #   #
      #   # @param deposit_submission [Increase::Models::CheckDeposit::DepositSubmission, nil] After the check is parsed, it is submitted to the Check21 network for
      #   #   processing. This will contain details of the submission.
      #   #
      #   # @param description [String, nil] The description of the Check Deposit, for display purposes only.
      #   #
      #   # @param front_image_file_id [String] The ID for the File containing the image of the front of the check.
      #   #
      #   # @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across
      #   #   Increase and is used to ensure that a request is only processed once. Learn more
      #   #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #   #
      #   # @param inbound_funds_hold [Increase::Models::CheckDeposit::InboundFundsHold, nil] Increase will sometimes hold the funds for Check Deposits. If funds are held,
      #   #   this sub-object will contain details of the hold.
      #   #
      #   # @param inbound_mail_item_id [String, nil] If the Check Deposit was the result of an Inbound Mail Item, this will contain
      #   #   the identifier of the Inbound Mail Item.
      #   #
      #   # @param lockbox_id [String, nil] If the Check Deposit was the result of an Inbound Mail Item, this will contain
      #   #   the identifier of the Lockbox that received it.
      #   #
      #   # @param status [String] The status of the Check Deposit.
      #   #
      #   # @param transaction_id [String, nil] The ID for the Transaction created by the deposit.
      #   #
      #   # @param type [String] A constant representing the object's type. For this resource it will always be
      #   #   `check_deposit`.
      #   #
      #   def initialize(
      #     id:,
      #     account_id:,
      #     amount:,
      #     back_image_file_id:,
      #     created_at:,
      #     deposit_acceptance:,
      #     deposit_rejection:,
      #     deposit_return:,
      #     deposit_submission:,
      #     description:,
      #     front_image_file_id:,
      #     idempotency_key:,
      #     inbound_funds_hold:,
      #     inbound_mail_item_id:,
      #     lockbox_id:,
      #     status:,
      #     transaction_id:,
      #     type:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::BaseModel) -> void

      # @example
      # ```ruby
      # deposit_acceptance => {
      #   account_number: String,
      #   amount: Integer,
      #   auxiliary_on_us: String,
      #   check_deposit_id: String,
      #   currency: enum: Increase::Models::CheckDeposit::DepositAcceptance::Currency,
      #   **_
      # }
      # ```
      class DepositAcceptance < Increase::BaseModel
        # @!attribute account_number
        #   The account number printed on the check.
        #
        #   @return [String]
        required :account_number, String

        # @!attribute amount
        #   The amount to be deposited in the minor unit of the transaction's currency. For dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute auxiliary_on_us
        #   An additional line of metadata printed on the check. This typically includes the check number for business checks.
        #
        #   @return [String, nil]
        required :auxiliary_on_us, String

        # @!attribute check_deposit_id
        #   The ID of the Check Deposit that was accepted.
        #
        #   @return [String]
        required :check_deposit_id, String

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction's currency.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositAcceptance::Currency]
        required :currency, enum: -> { Increase::Models::CheckDeposit::DepositAcceptance::Currency }

        # @!attribute routing_number
        #   The routing number printed on the check.
        #
        #   @return [String]
        required :routing_number, String

        # @!attribute serial_number
        #   The check serial number, if present, for consumer checks. For business checks, the serial number is usually in the `auxiliary_on_us` field.
        #
        #   @return [String, nil]
        required :serial_number, String

        # @!parse
        #   # If your deposit is successfully parsed and accepted by Increase, this will
        #   #   contain details of the parsed check.
        #   #
        #   # @param account_number [String] The account number printed on the check.
        #   #
        #   # @param amount [Integer] The amount to be deposited in the minor unit of the transaction's currency. For
        #   #   dollars, for example, this is cents.
        #   #
        #   # @param auxiliary_on_us [String, nil] An additional line of metadata printed on the check. This typically includes the
        #   #   check number for business checks.
        #   #
        #   # @param check_deposit_id [String] The ID of the Check Deposit that was accepted.
        #   #
        #   # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        #   #   transaction's currency.
        #   #
        #   # @param routing_number [String] The routing number printed on the check.
        #   #
        #   # @param serial_number [String, nil] The check serial number, if present, for consumer checks. For business checks,
        #   #   the serial number is usually in the `auxiliary_on_us` field.
        #   #
        #   def initialize(
        #     account_number:,
        #     amount:,
        #     auxiliary_on_us:,
        #     check_deposit_id:,
        #     currency:,
        #     routing_number:,
        #     serial_number:,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::BaseModel) -> void

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction's currency.
        #
        # @example
        # ```ruby
        # case currency
        # in :CAD
        #   # ...
        # in :CHF
        #   # ...
        # in :EUR
        #   # ...
        # in :GBP
        #   # ...
        # in :JPY
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class Currency < Increase::Enum
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

          finalize!
        end
      end

      # @example
      # ```ruby
      # deposit_rejection => {
      #   amount: Integer,
      #   check_deposit_id: String,
      #   currency: enum: Increase::Models::CheckDeposit::DepositRejection::Currency,
      #   declined_transaction_id: String,
      #   reason: enum: Increase::Models::CheckDeposit::DepositRejection::Reason
      # }
      # ```
      class DepositRejection < Increase::BaseModel
        # @!attribute amount
        #   The rejected amount in the minor unit of check's currency. For dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute check_deposit_id
        #   The identifier of the Check Deposit that was rejected.
        #
        #   @return [String]
        required :check_deposit_id, String

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's currency.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositRejection::Currency]
        required :currency, enum: -> { Increase::Models::CheckDeposit::DepositRejection::Currency }

        # @!attribute declined_transaction_id
        #   The identifier of the associated declined transaction.
        #
        #   @return [String]
        required :declined_transaction_id, String

        # @!attribute reason
        #   Why the check deposit was rejected.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositRejection::Reason]
        required :reason, enum: -> { Increase::Models::CheckDeposit::DepositRejection::Reason }

        # @!attribute rejected_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the check deposit was rejected.
        #
        #   @return [Time]
        required :rejected_at, Time

        # @!parse
        #   # If your deposit is rejected by Increase, this will contain details as to why it
        #   #   was rejected.
        #   #
        #   # @param amount [Integer] The rejected amount in the minor unit of check's currency. For dollars, for
        #   #   example, this is cents.
        #   #
        #   # @param check_deposit_id [String] The identifier of the Check Deposit that was rejected.
        #   #
        #   # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
        #   #   currency.
        #   #
        #   # @param declined_transaction_id [String] The identifier of the associated declined transaction.
        #   #
        #   # @param reason [String] Why the check deposit was rejected.
        #   #
        #   # @param rejected_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   #   the check deposit was rejected.
        #   #
        #   def initialize(amount:, check_deposit_id:, currency:, declined_transaction_id:, reason:, rejected_at:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's currency.
        #
        # @example
        # ```ruby
        # case currency
        # in :CAD
        #   # ...
        # in :CHF
        #   # ...
        # in :EUR
        #   # ...
        # in :GBP
        #   # ...
        # in :JPY
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class Currency < Increase::Enum
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

          finalize!
        end

        # Why the check deposit was rejected.
        #
        # @example
        # ```ruby
        # case reason
        # in :incomplete_image
        #   # ...
        # in :duplicate
        #   # ...
        # in :poor_image_quality
        #   # ...
        # in :incorrect_amount
        #   # ...
        # in :incorrect_recipient
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class Reason < Increase::Enum
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

          finalize!
        end
      end

      # @example
      # ```ruby
      # deposit_return => {
      #   amount: Integer,
      #   check_deposit_id: String,
      #   currency: enum: Increase::Models::CheckDeposit::DepositReturn::Currency,
      #   return_reason: enum: Increase::Models::CheckDeposit::DepositReturn::ReturnReason,
      #   returned_at: Time
      # }
      # ```
      class DepositReturn < Increase::BaseModel
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
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction's currency.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositReturn::Currency]
        required :currency, enum: -> { Increase::Models::CheckDeposit::DepositReturn::Currency }

        # @!attribute return_reason
        #   Why this check was returned by the bank holding the account it was drawn against.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::DepositReturn::ReturnReason]
        required :return_reason, enum: -> { Increase::Models::CheckDeposit::DepositReturn::ReturnReason }

        # @!attribute returned_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the check deposit was returned.
        #
        #   @return [Time]
        required :returned_at, Time

        # @!attribute transaction_id
        #   The identifier of the transaction that reversed the original check deposit transaction.
        #
        #   @return [String]
        required :transaction_id, String

        # @!parse
        #   # If your deposit is returned, this will contain details as to why it was
        #   #   returned.
        #   #
        #   # @param amount [Integer] The returned amount in USD cents.
        #   #
        #   # @param check_deposit_id [String] The identifier of the Check Deposit that was returned.
        #   #
        #   # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        #   #   transaction's currency.
        #   #
        #   # @param return_reason [String] Why this check was returned by the bank holding the account it was drawn
        #   #   against.
        #   #
        #   # @param returned_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   #   the check deposit was returned.
        #   #
        #   # @param transaction_id [String] The identifier of the transaction that reversed the original check deposit
        #   #   transaction.
        #   #
        #   def initialize(amount:, check_deposit_id:, currency:, return_reason:, returned_at:, transaction_id:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction's currency.
        #
        # @example
        # ```ruby
        # case currency
        # in :CAD
        #   # ...
        # in :CHF
        #   # ...
        # in :EUR
        #   # ...
        # in :GBP
        #   # ...
        # in :JPY
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class Currency < Increase::Enum
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

          finalize!
        end

        # Why this check was returned by the bank holding the account it was drawn against.
        #
        # @example
        # ```ruby
        # case return_reason
        # in :ach_conversion_not_supported
        #   # ...
        # in :closed_account
        #   # ...
        # in :duplicate_submission
        #   # ...
        # in :insufficient_funds
        #   # ...
        # in :no_account
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class ReturnReason < Increase::Enum
          # The check doesn't allow ACH conversion.
          ACH_CONVERSION_NOT_SUPPORTED = :ach_conversion_not_supported

          # The account is closed.
          CLOSED_ACCOUNT = :closed_account

          # The check has already been deposited.
          DUPLICATE_SUBMISSION = :duplicate_submission

          # Insufficient funds
          INSUFFICIENT_FUNDS = :insufficient_funds

          # No account was found matching the check details.
          NO_ACCOUNT = :no_account

          # The check was not authorized.
          NOT_AUTHORIZED = :not_authorized

          # The check is too old.
          STALE_DATED = :stale_dated

          # The payment has been stopped by the account holder.
          STOP_PAYMENT = :stop_payment

          # The reason for the return is unknown.
          UNKNOWN_REASON = :unknown_reason

          # The image doesn't match the details submitted.
          UNMATCHED_DETAILS = :unmatched_details

          # The image could not be read.
          UNREADABLE_IMAGE = :unreadable_image

          # The check endorsement was irregular.
          ENDORSEMENT_IRREGULAR = :endorsement_irregular

          # The check present was either altered or fake.
          ALTERED_OR_FICTITIOUS_ITEM = :altered_or_fictitious_item

          # The account this check is drawn on is frozen.
          FROZEN_OR_BLOCKED_ACCOUNT = :frozen_or_blocked_account

          # The check is post dated.
          POST_DATED = :post_dated

          # The endorsement was missing.
          ENDORSEMENT_MISSING = :endorsement_missing

          # The check signature was missing.
          SIGNATURE_MISSING = :signature_missing

          # The bank suspects a stop payment will be placed.
          STOP_PAYMENT_SUSPECT = :stop_payment_suspect

          # The bank cannot read the image.
          UNUSABLE_IMAGE = :unusable_image

          # The check image fails the bank's security check.
          IMAGE_FAILS_SECURITY_CHECK = :image_fails_security_check

          # The bank cannot determine the amount.
          CANNOT_DETERMINE_AMOUNT = :cannot_determine_amount

          # The signature is inconsistent with prior signatures.
          SIGNATURE_IRREGULAR = :signature_irregular

          # The check is a non-cash item and cannot be drawn against the account.
          NON_CASH_ITEM = :non_cash_item

          # The bank is unable to process this check.
          UNABLE_TO_PROCESS = :unable_to_process

          # The check exceeds the bank or customer's limit.
          ITEM_EXCEEDS_DOLLAR_LIMIT = :item_exceeds_dollar_limit

          # The bank sold this account and no longer services this customer.
          BRANCH_OR_ACCOUNT_SOLD = :branch_or_account_sold

          finalize!
        end
      end

      # @example
      # ```ruby
      # deposit_submission => {
      #   back_file_id: String,
      #   front_file_id: String,
      #   submitted_at: Time
      # }
      # ```
      class DepositSubmission < Increase::BaseModel
        # @!attribute back_file_id
        #   The ID for the File containing the check back image that was submitted to the Check21 network.
        #
        #   @return [String]
        required :back_file_id, String

        # @!attribute front_file_id
        #   The ID for the File containing the check front image that was submitted to the Check21 network.
        #
        #   @return [String]
        required :front_file_id, String

        # @!attribute submitted_at
        #   When the check deposit was submitted to the Check21 network for processing. During business days, this happens within a few hours of the check being accepted by Increase.
        #
        #   @return [Time]
        required :submitted_at, Time

        # @!parse
        #   # After the check is parsed, it is submitted to the Check21 network for
        #   #   processing. This will contain details of the submission.
        #   #
        #   # @param back_file_id [String] The ID for the File containing the check back image that was submitted to the
        #   #   Check21 network.
        #   #
        #   # @param front_file_id [String] The ID for the File containing the check front image that was submitted to the
        #   #   Check21 network.
        #   #
        #   # @param submitted_at [String] When the check deposit was submitted to the Check21 network for processing.
        #   #   During business days, this happens within a few hours of the check being
        #   #   accepted by Increase.
        #   #
        #   def initialize(back_file_id:, front_file_id:, submitted_at:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # @example
      # ```ruby
      # inbound_funds_hold => {
      #   id: String,
      #   amount: Integer,
      #   automatically_releases_at: Time,
      #   created_at: Time,
      #   currency: enum: Increase::Models::CheckDeposit::InboundFundsHold::Currency,
      #   **_
      # }
      # ```
      class InboundFundsHold < Increase::BaseModel
        # @!attribute id
        #   The Inbound Funds Hold identifier.
        #
        #   @return [String]
        required :id, String

        # @!attribute amount
        #   The held amount in the minor unit of the account's currency. For dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute automatically_releases_at
        #   When the hold will be released automatically. Certain conditions may cause it to be released before this time.
        #
        #   @return [Time]
        required :automatically_releases_at, Time

        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's currency.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Currency]
        required :currency, enum: -> { Increase::Models::CheckDeposit::InboundFundsHold::Currency }

        # @!attribute held_transaction_id
        #   The ID of the Transaction for which funds were held.
        #
        #   @return [String, nil]
        required :held_transaction_id, String

        # @!attribute pending_transaction_id
        #   The ID of the Pending Transaction representing the held funds.
        #
        #   @return [String, nil]
        required :pending_transaction_id, String

        # @!attribute released_at
        #   When the hold was released (if it has been released).
        #
        #   @return [Time, nil]
        required :released_at, Time

        # @!attribute status
        #   The status of the hold.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Status]
        required :status, enum: -> { Increase::Models::CheckDeposit::InboundFundsHold::Status }

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be `inbound_funds_hold`.
        #
        #   @return [Symbol, Increase::Models::CheckDeposit::InboundFundsHold::Type]
        required :type, enum: -> { Increase::Models::CheckDeposit::InboundFundsHold::Type }

        # @!parse
        #   # Increase will sometimes hold the funds for Check Deposits. If funds are held,
        #   #   this sub-object will contain details of the hold.
        #   #
        #   # @param id [String] The Inbound Funds Hold identifier.
        #   #
        #   # @param amount [Integer] The held amount in the minor unit of the account's currency. For dollars, for
        #   #   example, this is cents.
        #   #
        #   # @param automatically_releases_at [String] When the hold will be released automatically. Certain conditions may cause it to
        #   #   be released before this time.
        #   #
        #   # @param created_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        #   #   was created.
        #   #
        #   # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   #   currency.
        #   #
        #   # @param held_transaction_id [String, nil] The ID of the Transaction for which funds were held.
        #   #
        #   # @param pending_transaction_id [String, nil] The ID of the Pending Transaction representing the held funds.
        #   #
        #   # @param released_at [String, nil] When the hold was released (if it has been released).
        #   #
        #   # @param status [String] The status of the hold.
        #   #
        #   # @param type [String] A constant representing the object's type. For this resource it will always be
        #   #   `inbound_funds_hold`.
        #   #
        #   def initialize(
        #     id:,
        #     amount:,
        #     automatically_releases_at:,
        #     created_at:,
        #     currency:,
        #     held_transaction_id:,
        #     pending_transaction_id:,
        #     released_at:,
        #     status:,
        #     type:,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::BaseModel) -> void

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's currency.
        #
        # @example
        # ```ruby
        # case currency
        # in :CAD
        #   # ...
        # in :CHF
        #   # ...
        # in :EUR
        #   # ...
        # in :GBP
        #   # ...
        # in :JPY
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class Currency < Increase::Enum
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

          finalize!
        end

        # The status of the hold.
        #
        # @example
        # ```ruby
        # case status
        # in :held
        #   # ...
        # in :complete
        #   # ...
        # end
        # ```
        class Status < Increase::Enum
          # Funds are still being held.
          HELD = :held

          # Funds have been released.
          COMPLETE = :complete

          finalize!
        end

        # A constant representing the object's type. For this resource it will always be `inbound_funds_hold`.
        #
        # @example
        # ```ruby
        # case type
        # in :inbound_funds_hold
        #   # ...
        # end
        # ```
        class Type < Increase::Enum
          INBOUND_FUNDS_HOLD = :inbound_funds_hold

          finalize!
        end
      end

      # The status of the Check Deposit.
      #
      # @example
      # ```ruby
      # case status
      # in :pending
      #   # ...
      # in :submitted
      #   # ...
      # in :rejected
      #   # ...
      # in :returned
      #   # ...
      # end
      # ```
      class Status < Increase::Enum
        # The Check Deposit is pending review.
        PENDING = :pending

        # The Check Deposit has been deposited.
        SUBMITTED = :submitted

        # The Check Deposit has been rejected.
        REJECTED = :rejected

        # The Check Deposit has been returned.
        RETURNED = :returned

        finalize!
      end

      # A constant representing the object's type. For this resource it will always be `check_deposit`.
      #
      # @example
      # ```ruby
      # case type
      # in :check_deposit
      #   # ...
      # end
      # ```
      class Type < Increase::Enum
        CHECK_DEPOSIT = :check_deposit

        finalize!
      end
    end
  end
end
