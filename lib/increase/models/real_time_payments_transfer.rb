# frozen_string_literal: true

module Increase
  module Models
    # @example
    # ```ruby
    # real_time_payments_transfer => {
    #   id: String,
    #   account_id: String,
    #   acknowledgement: Increase::Models::RealTimePaymentsTransfer::Acknowledgement,
    #   amount: Integer,
    #   approval: Increase::Models::RealTimePaymentsTransfer::Approval,
    #   **_
    # }
    # ```
    class RealTimePaymentsTransfer < Increase::BaseModel
      # @!attribute id
      #   The Real-Time Payments Transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account from which the transfer was sent.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute acknowledgement
      #   If the transfer is acknowledged by the recipient bank, this will contain supplemental details.
      #
      #   @return [Increase::Models::RealTimePaymentsTransfer::Acknowledgement, nil]
      required :acknowledgement, -> { Increase::Models::RealTimePaymentsTransfer::Acknowledgement }

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute approval
      #   If your account requires approvals for transfers and the transfer was approved, this will contain details of the approval.
      #
      #   @return [Increase::Models::RealTimePaymentsTransfer::Approval, nil]
      required :approval, -> { Increase::Models::RealTimePaymentsTransfer::Approval }

      # @!attribute cancellation
      #   If your account requires approvals for transfers and the transfer was not approved, this will contain details of the cancellation.
      #
      #   @return [Increase::Models::RealTimePaymentsTransfer::Cancellation, nil]
      required :cancellation, -> { Increase::Models::RealTimePaymentsTransfer::Cancellation }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::Models::RealTimePaymentsTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::Models::RealTimePaymentsTransfer::CreatedBy }

      # @!attribute creditor_name
      #   The name of the transfer's recipient. This is set by the sender when creating the transfer.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's currency. For real-time payments transfers this is always equal to `USD`.
      #
      #   @return [Symbol, Increase::Models::RealTimePaymentsTransfer::Currency]
      required :currency, enum: -> { Increase::Models::RealTimePaymentsTransfer::Currency }

      # @!attribute debtor_name
      #   The name of the transfer's sender. If not provided, defaults to the name of the account's entity.
      #
      #   @return [String, nil]
      required :debtor_name, String

      # @!attribute destination_account_number
      #   The destination account number.
      #
      #   @return [String]
      required :destination_account_number, String

      # @!attribute destination_routing_number
      #   The destination American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @return [String]
      required :destination_routing_number, String

      # @!attribute external_account_id
      #   The identifier of the External Account the transfer was made to, if any.
      #
      #   @return [String, nil]
      required :external_account_id, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across Increase and is used to ensure that a request is only processed once. Learn more about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String

      # @!attribute pending_transaction_id
      #   The ID for the pending transaction representing the transfer. A pending transaction is created when the transfer [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals) by someone else in your organization.
      #
      #   @return [String, nil]
      required :pending_transaction_id, String

      # @!attribute rejection
      #   If the transfer is rejected by Real-Time Payments or the destination financial institution, this will contain supplemental details.
      #
      #   @return [Increase::Models::RealTimePaymentsTransfer::Rejection, nil]
      required :rejection, -> { Increase::Models::RealTimePaymentsTransfer::Rejection }

      # @!attribute remittance_information
      #   Unstructured information that will show on the recipient's bank statement.
      #
      #   @return [String]
      required :remittance_information, String

      # @!attribute source_account_number_id
      #   The Account Number the recipient will see as having sent the transfer.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::RealTimePaymentsTransfer::Status]
      required :status, enum: -> { Increase::Models::RealTimePaymentsTransfer::Status }

      # @!attribute submission
      #   After the transfer is submitted to Real-Time Payments, this will contain supplemental details.
      #
      #   @return [Increase::Models::RealTimePaymentsTransfer::Submission, nil]
      required :submission, -> { Increase::Models::RealTimePaymentsTransfer::Submission }

      # @!attribute transaction_id
      #   The Transaction funding the transfer once it is complete.
      #
      #   @return [String, nil]
      required :transaction_id, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be `real_time_payments_transfer`.
      #
      #   @return [Symbol, Increase::Models::RealTimePaymentsTransfer::Type]
      required :type, enum: -> { Increase::Models::RealTimePaymentsTransfer::Type }

      # @!attribute ultimate_creditor_name
      #   The name of the ultimate recipient of the transfer. Set this if the creditor is an intermediary receiving the payment for someone else.
      #
      #   @return [String, nil]
      required :ultimate_creditor_name, String

      # @!attribute ultimate_debtor_name
      #   The name of the ultimate sender of the transfer. Set this if the funds are being sent on behalf of someone who is not the account holder at Increase.
      #
      #   @return [String, nil]
      required :ultimate_debtor_name, String

      # @!parse
      #   # Real-Time Payments transfers move funds, within seconds, between your Increase
      #   #   account and any other account on the Real-Time Payments network.
      #   #
      #   # @param id [String] The Real-Time Payments Transfer's identifier.
      #   #
      #   # @param account_id [String] The Account from which the transfer was sent.
      #   #
      #   # @param acknowledgement [Increase::Models::RealTimePaymentsTransfer::Acknowledgement, nil] If the transfer is acknowledged by the recipient bank, this will contain
      #   #   supplemental details.
      #   #
      #   # @param amount [Integer] The transfer amount in USD cents.
      #   #
      #   # @param approval [Increase::Models::RealTimePaymentsTransfer::Approval, nil] If your account requires approvals for transfers and the transfer was approved,
      #   #   this will contain details of the approval.
      #   #
      #   # @param cancellation [Increase::Models::RealTimePaymentsTransfer::Cancellation, nil] If your account requires approvals for transfers and the transfer was not
      #   #   approved, this will contain details of the cancellation.
      #   #
      #   # @param created_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   #   the transfer was created.
      #   #
      #   # @param created_by [Increase::Models::RealTimePaymentsTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #   #
      #   # @param creditor_name [String] The name of the transfer's recipient. This is set by the sender when creating
      #   #   the transfer.
      #   #
      #   # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   #   currency. For real-time payments transfers this is always equal to `USD`.
      #   #
      #   # @param debtor_name [String, nil] The name of the transfer's sender. If not provided, defaults to the name of the
      #   #   account's entity.
      #   #
      #   # @param destination_account_number [String] The destination account number.
      #   #
      #   # @param destination_routing_number [String] The destination American Bankers' Association (ABA) Routing Transit Number
      #   #   (RTN).
      #   #
      #   # @param external_account_id [String, nil] The identifier of the External Account the transfer was made to, if any.
      #   #
      #   # @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across
      #   #   Increase and is used to ensure that a request is only processed once. Learn more
      #   #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #   #
      #   # @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer. A pending
      #   #   transaction is created when the transfer
      #   #   [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      #   #   by someone else in your organization.
      #   #
      #   # @param rejection [Increase::Models::RealTimePaymentsTransfer::Rejection, nil] If the transfer is rejected by Real-Time Payments or the destination financial
      #   #   institution, this will contain supplemental details.
      #   #
      #   # @param remittance_information [String] Unstructured information that will show on the recipient's bank statement.
      #   #
      #   # @param source_account_number_id [String] The Account Number the recipient will see as having sent the transfer.
      #   #
      #   # @param status [String] The lifecycle status of the transfer.
      #   #
      #   # @param submission [Increase::Models::RealTimePaymentsTransfer::Submission, nil] After the transfer is submitted to Real-Time Payments, this will contain
      #   #   supplemental details.
      #   #
      #   # @param transaction_id [String, nil] The Transaction funding the transfer once it is complete.
      #   #
      #   # @param type [String] A constant representing the object's type. For this resource it will always be
      #   #   `real_time_payments_transfer`.
      #   #
      #   # @param ultimate_creditor_name [String, nil] The name of the ultimate recipient of the transfer. Set this if the creditor is
      #   #   an intermediary receiving the payment for someone else.
      #   #
      #   # @param ultimate_debtor_name [String, nil] The name of the ultimate sender of the transfer. Set this if the funds are being
      #   #   sent on behalf of someone who is not the account holder at Increase.
      #   #
      #   def initialize(
      #     id:,
      #     account_id:,
      #     acknowledgement:,
      #     amount:,
      #     approval:,
      #     cancellation:,
      #     created_at:,
      #     created_by:,
      #     creditor_name:,
      #     currency:,
      #     debtor_name:,
      #     destination_account_number:,
      #     destination_routing_number:,
      #     external_account_id:,
      #     idempotency_key:,
      #     pending_transaction_id:,
      #     rejection:,
      #     remittance_information:,
      #     source_account_number_id:,
      #     status:,
      #     submission:,
      #     transaction_id:,
      #     type:,
      #     ultimate_creditor_name:,
      #     ultimate_debtor_name:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::BaseModel) -> void

      # @example
      # ```ruby
      # acknowledgement => {
      #   acknowledged_at: Time
      # }
      # ```
      class Acknowledgement < Increase::BaseModel
        # @!attribute acknowledged_at
        #   When the transfer was acknowledged.
        #
        #   @return [Time]
        required :acknowledged_at, Time

        # @!parse
        #   # If the transfer is acknowledged by the recipient bank, this will contain
        #   #   supplemental details.
        #   #
        #   # @param acknowledged_at [String] When the transfer was acknowledged.
        #   #
        #   def initialize(acknowledged_at:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # @example
      # ```ruby
      # approval => {
      #   approved_at: Time,
      #   approved_by: String
      # }
      # ```
      class Approval < Increase::BaseModel
        # @!attribute approved_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the transfer was approved.
        #
        #   @return [Time]
        required :approved_at, Time

        # @!attribute approved_by
        #   If the Transfer was approved by a user in the dashboard, the email address of that user.
        #
        #   @return [String, nil]
        required :approved_by, String

        # @!parse
        #   # If your account requires approvals for transfers and the transfer was approved,
        #   #   this will contain details of the approval.
        #   #
        #   # @param approved_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   #   the transfer was approved.
        #   #
        #   # @param approved_by [String, nil] If the Transfer was approved by a user in the dashboard, the email address of
        #   #   that user.
        #   #
        #   def initialize(approved_at:, approved_by:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # @example
      # ```ruby
      # cancellation => {
      #   canceled_at: Time,
      #   canceled_by: String
      # }
      # ```
      class Cancellation < Increase::BaseModel
        # @!attribute canceled_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the Transfer was canceled.
        #
        #   @return [Time]
        required :canceled_at, Time

        # @!attribute canceled_by
        #   If the Transfer was canceled by a user in the dashboard, the email address of that user.
        #
        #   @return [String, nil]
        required :canceled_by, String

        # @!parse
        #   # If your account requires approvals for transfers and the transfer was not
        #   #   approved, this will contain details of the cancellation.
        #   #
        #   # @param canceled_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   #   the Transfer was canceled.
        #   #
        #   # @param canceled_by [String, nil] If the Transfer was canceled by a user in the dashboard, the email address of
        #   #   that user.
        #   #
        #   def initialize(canceled_at:, canceled_by:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # @example
      # ```ruby
      # created_by => {
      #   api_key: Increase::Models::RealTimePaymentsTransfer::CreatedBy::APIKey,
      #   category: enum: Increase::Models::RealTimePaymentsTransfer::CreatedBy::Category,
      #   oauth_application: Increase::Models::RealTimePaymentsTransfer::CreatedBy::OAuthApplication,
      #   user: Increase::Models::RealTimePaymentsTransfer::CreatedBy::User
      # }
      # ```
      class CreatedBy < Increase::BaseModel
        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::RealTimePaymentsTransfer::CreatedBy::APIKey, nil]
        required :api_key, -> { Increase::Models::RealTimePaymentsTransfer::CreatedBy::APIKey }

        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::RealTimePaymentsTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::Models::RealTimePaymentsTransfer::CreatedBy::Category }

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::RealTimePaymentsTransfer::CreatedBy::OAuthApplication, nil]
        required :oauth_application,
                 -> { Increase::Models::RealTimePaymentsTransfer::CreatedBy::OAuthApplication }

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::RealTimePaymentsTransfer::CreatedBy::User, nil]
        required :user, -> { Increase::Models::RealTimePaymentsTransfer::CreatedBy::User }

        # @!parse
        #   # What object created the transfer, either via the API or the dashboard.
        #   #
        #   # @param api_key [Increase::Models::RealTimePaymentsTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #   #
        #   # @param category [String] The type of object that created this transfer.
        #   #
        #   # @param oauth_application [Increase::Models::RealTimePaymentsTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #   #
        #   # @param user [Increase::Models::RealTimePaymentsTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.
        #   #
        #   def initialize(api_key:, category:, oauth_application:, user:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void

        # @example
        # ```ruby
        # api_key => {
        #   description: String
        # }
        # ```
        class APIKey < Increase::BaseModel
          # @!attribute description
          #   The description set for the API key when it was created.
          #
          #   @return [String, nil]
          required :description, String

          # @!parse
          #   # If present, details about the API key that created the transfer.
          #   #
          #   # @param description [String, nil] The description set for the API key when it was created.
          #   #
          #   def initialize(description:, **) = super

          # def initialize: (Hash | Increase::BaseModel) -> void
        end

        # The type of object that created this transfer.
        #
        # @example
        # ```ruby
        # case category
        # in :api_key
        #   # ...
        # in :oauth_application
        #   # ...
        # in :user
        #   # ...
        # end
        # ```
        class Category < Increase::Enum
          # An API key. Details will be under the `api_key` object.
          API_KEY = :api_key

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION = :oauth_application

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER = :user

          finalize!
        end

        # @example
        # ```ruby
        # oauth_application => {
        #   name: String
        # }
        # ```
        class OAuthApplication < Increase::BaseModel
          # @!attribute name
          #   The name of the OAuth Application.
          #
          #   @return [String]
          required :name, String

          # @!parse
          #   # If present, details about the OAuth Application that created the transfer.
          #   #
          #   # @param name [String] The name of the OAuth Application.
          #   #
          #   def initialize(name:, **) = super

          # def initialize: (Hash | Increase::BaseModel) -> void
        end

        # @example
        # ```ruby
        # user => {
        #   email: String
        # }
        # ```
        class User < Increase::BaseModel
          # @!attribute email
          #   The email address of the User.
          #
          #   @return [String]
          required :email, String

          # @!parse
          #   # If present, details about the User that created the transfer.
          #   #
          #   # @param email [String] The email address of the User.
          #   #
          #   def initialize(email:, **) = super

          # def initialize: (Hash | Increase::BaseModel) -> void
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's currency. For real-time payments transfers this is always equal to `USD`.
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

      # @example
      # ```ruby
      # rejection => {
      #   reject_reason_additional_information: String,
      #   reject_reason_code: enum: Increase::Models::RealTimePaymentsTransfer::Rejection::RejectReasonCode,
      #   rejected_at: Time
      # }
      # ```
      class Rejection < Increase::BaseModel
        # @!attribute reject_reason_additional_information
        #   Additional information about the rejection provided by the recipient bank when the `reject_reason_code` is `NARRATIVE`.
        #
        #   @return [String, nil]
        required :reject_reason_additional_information, String

        # @!attribute reject_reason_code
        #   The reason the transfer was rejected as provided by the recipient bank or the Real-Time Payments network.
        #
        #   @return [Symbol, Increase::Models::RealTimePaymentsTransfer::Rejection::RejectReasonCode]
        required :reject_reason_code,
                 enum: -> { Increase::Models::RealTimePaymentsTransfer::Rejection::RejectReasonCode }

        # @!attribute rejected_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the transfer was rejected.
        #
        #   @return [Time, nil]
        required :rejected_at, Time

        # @!parse
        #   # If the transfer is rejected by Real-Time Payments or the destination financial
        #   #   institution, this will contain supplemental details.
        #   #
        #   # @param reject_reason_additional_information [String, nil] Additional information about the rejection provided by the recipient bank when
        #   #   the `reject_reason_code` is `NARRATIVE`.
        #   #
        #   # @param reject_reason_code [String] The reason the transfer was rejected as provided by the recipient bank or the
        #   #   Real-Time Payments network.
        #   #
        #   # @param rejected_at [String, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   #   the transfer was rejected.
        #   #
        #   def initialize(reject_reason_additional_information:, reject_reason_code:, rejected_at:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void

        # The reason the transfer was rejected as provided by the recipient bank or the Real-Time Payments network.
        #
        # @example
        # ```ruby
        # case reject_reason_code
        # in :account_closed
        #   # ...
        # in :account_blocked
        #   # ...
        # in :invalid_creditor_account_type
        #   # ...
        # in :invalid_creditor_account_number
        #   # ...
        # in :invalid_creditor_financial_institution_identifier
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class RejectReasonCode < Increase::Enum
          # The destination account is closed. Corresponds to the Real-Time Payments reason code `AC04`.
          ACCOUNT_CLOSED = :account_closed

          # The destination account is currently blocked from receiving transactions. Corresponds to the Real-Time Payments reason code `AC06`.
          ACCOUNT_BLOCKED = :account_blocked

          # The destination account is ineligible to receive Real-Time Payments transfers. Corresponds to the Real-Time Payments reason code `AC14`.
          INVALID_CREDITOR_ACCOUNT_TYPE = :invalid_creditor_account_type

          # The destination account does not exist. Corresponds to the Real-Time Payments reason code `AC03`.
          INVALID_CREDITOR_ACCOUNT_NUMBER = :invalid_creditor_account_number

          # The destination routing number is invalid. Corresponds to the Real-Time Payments reason code `RC04`.
          INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER = :invalid_creditor_financial_institution_identifier

          # The destination account holder is deceased. Corresponds to the Real-Time Payments reason code `MD07`.
          END_CUSTOMER_DECEASED = :end_customer_deceased

          # The reason is provided as narrative information in the additional information field.
          NARRATIVE = :narrative

          # Real-Time Payments transfers are not allowed to the destination account. Corresponds to the Real-Time Payments reason code `AG01`.
          TRANSACTION_FORBIDDEN = :transaction_forbidden

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code `AG03`.
          TRANSACTION_TYPE_NOT_SUPPORTED = :transaction_type_not_supported

          # The amount of the transfer is different than expected by the recipient. Corresponds to the Real-Time Payments reason code `AM09`.
          UNEXPECTED_AMOUNT = :unexpected_amount

          # The amount is higher than the recipient is authorized to send or receive. Corresponds to the Real-Time Payments reason code `AM14`.
          AMOUNT_EXCEEDS_BANK_LIMITS = :amount_exceeds_bank_limits

          # The creditor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE04`.
          INVALID_CREDITOR_ADDRESS = :invalid_creditor_address

          # The specified creditor is unknown. Corresponds to the Real-Time Payments reason code `BE06`.
          UNKNOWN_END_CUSTOMER = :unknown_end_customer

          # The debtor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE07`.
          INVALID_DEBTOR_ADDRESS = :invalid_debtor_address

          # There was a timeout processing the transfer. Corresponds to the Real-Time Payments reason code `DS24`.
          TIMEOUT = :timeout

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code `NOAT`.
          UNSUPPORTED_MESSAGE_FOR_RECIPIENT = :unsupported_message_for_recipient

          # The destination financial institution is currently not connected to Real-Time Payments. Corresponds to the Real-Time Payments reason code `9912`.
          RECIPIENT_CONNECTION_NOT_AVAILABLE = :recipient_connection_not_available

          # Real-Time Payments is currently unavailable. Corresponds to the Real-Time Payments reason code `9948`.
          REAL_TIME_PAYMENTS_SUSPENDED = :real_time_payments_suspended

          # The destination financial institution is currently signed off of Real-Time Payments. Corresponds to the Real-Time Payments reason code `9910`.
          INSTRUCTED_AGENT_SIGNED_OFF = :instructed_agent_signed_off

          # The transfer was rejected due to an internal Increase issue. We have been notified.
          PROCESSING_ERROR = :processing_error

          # Some other error or issue has occurred.
          OTHER = :other

          finalize!
        end
      end

      # The lifecycle status of the transfer.
      #
      # @example
      # ```ruby
      # case status
      # in :pending_approval
      #   # ...
      # in :canceled
      #   # ...
      # in :pending_reviewing
      #   # ...
      # in :requires_attention
      #   # ...
      # in :rejected
      #   # ...
      # in ...
      #   #...
      # end
      # ```
      class Status < Increase::Enum
        # The transfer is pending approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer has been canceled.
        CANCELED = :canceled

        # The transfer is pending review by Increase.
        PENDING_REVIEWING = :pending_reviewing

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # The transfer was rejected by the network or the recipient's bank.
        REJECTED = :rejected

        # The transfer is queued to be submitted to Real-Time Payments.
        PENDING_SUBMISSION = :pending_submission

        # The transfer has been submitted and is pending a response from Real-Time Payments.
        SUBMITTED = :submitted

        # The transfer has been sent successfully and is complete.
        COMPLETE = :complete

        finalize!
      end

      # @example
      # ```ruby
      # submission => {
      #   submitted_at: Time,
      #   transaction_identification: String
      # }
      # ```
      class Submission < Increase::BaseModel
        # @!attribute submitted_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the transfer was submitted to The Clearing House.
        #
        #   @return [Time, nil]
        required :submitted_at, Time

        # @!attribute transaction_identification
        #   The Real-Time Payments network identification of the transfer.
        #
        #   @return [String]
        required :transaction_identification, String

        # @!parse
        #   # After the transfer is submitted to Real-Time Payments, this will contain
        #   #   supplemental details.
        #   #
        #   # @param submitted_at [String, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   #   the transfer was submitted to The Clearing House.
        #   #
        #   # @param transaction_identification [String] The Real-Time Payments network identification of the transfer.
        #   #
        #   def initialize(submitted_at:, transaction_identification:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # A constant representing the object's type. For this resource it will always be `real_time_payments_transfer`.
      #
      # @example
      # ```ruby
      # case type
      # in :real_time_payments_transfer
      #   # ...
      # end
      # ```
      class Type < Increase::Enum
        REAL_TIME_PAYMENTS_TRANSFER = :real_time_payments_transfer

        finalize!
      end
    end
  end
end
