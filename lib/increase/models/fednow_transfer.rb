# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::FednowTransfers#create
    class FednowTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The FedNow Transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account from which the transfer was sent.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number
      #   The destination account number.
      #
      #   @return [String]
      required :account_number, String

      # @!attribute acknowledgement
      #   If the transfer is acknowledged by the recipient bank, this will contain
      #   supplemental details.
      #
      #   @return [Increase::Models::FednowTransfer::Acknowledgement, nil]
      required :acknowledgement, -> { Increase::FednowTransfer::Acknowledgement }, nil?: true

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::Models::FednowTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::FednowTransfer::CreatedBy }, nil?: true

      # @!attribute creditor_name
      #   The name of the transfer's recipient. This is set by the sender when creating
      #   the transfer.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   currency. For FedNow transfers this is always equal to `USD`.
      #
      #   @return [Symbol, Increase::Models::FednowTransfer::Currency]
      required :currency, enum: -> { Increase::FednowTransfer::Currency }

      # @!attribute debtor_name
      #   The name of the transfer's sender. If not provided, defaults to the name of the
      #   account's entity.
      #
      #   @return [String]
      required :debtor_name, String

      # @!attribute external_account_id
      #   The identifier of the External Account the transfer was made to, if any.
      #
      #   @return [String, nil]
      required :external_account_id, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute pending_transaction_id
      #   The ID for the pending transaction representing the transfer.
      #
      #   @return [String, nil]
      required :pending_transaction_id, String, nil?: true

      # @!attribute rejection
      #   If the transfer is rejected by FedNow or the destination financial institution,
      #   this will contain supplemental details.
      #
      #   @return [Increase::Models::FednowTransfer::Rejection, nil]
      required :rejection, -> { Increase::FednowTransfer::Rejection }, nil?: true

      # @!attribute routing_number
      #   The destination American Bankers' Association (ABA) Routing Transit Number
      #   (RTN).
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute source_account_number_id
      #   The Account Number the recipient will see as having sent the transfer.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::FednowTransfer::Status]
      required :status, enum: -> { Increase::FednowTransfer::Status }

      # @!attribute submission
      #   After the transfer is submitted to FedNow, this will contain supplemental
      #   details.
      #
      #   @return [Increase::Models::FednowTransfer::Submission, nil]
      required :submission, -> { Increase::FednowTransfer::Submission }, nil?: true

      # @!attribute transaction_id
      #   The Transaction funding the transfer once it is complete.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `fednow_transfer`.
      #
      #   @return [Symbol, Increase::Models::FednowTransfer::Type]
      required :type, enum: -> { Increase::FednowTransfer::Type }

      # @!attribute unique_end_to_end_transaction_reference
      #   The Unique End-to-end Transaction Reference
      #   ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
      #   of the transfer.
      #
      #   @return [String]
      required :unique_end_to_end_transaction_reference, String

      # @!attribute unstructured_remittance_information
      #   Unstructured information that will show on the recipient's bank statement.
      #
      #   @return [String]
      required :unstructured_remittance_information, String

      # @!method initialize(id:, account_id:, account_number:, acknowledgement:, amount:, created_at:, created_by:, creditor_name:, currency:, debtor_name:, external_account_id:, idempotency_key:, pending_transaction_id:, rejection:, routing_number:, source_account_number_id:, status:, submission:, transaction_id:, type:, unique_end_to_end_transaction_reference:, unstructured_remittance_information:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::FednowTransfer} for more details.
      #
      #   FedNow transfers move funds, within seconds, between your Increase account and
      #   any other account supporting FedNow.
      #
      #   @param id [String] The FedNow Transfer's identifier.
      #
      #   @param account_id [String] The Account from which the transfer was sent.
      #
      #   @param account_number [String] The destination account number.
      #
      #   @param acknowledgement [Increase::Models::FednowTransfer::Acknowledgement, nil] If the transfer is acknowledged by the recipient bank, this will contain supplem
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::Models::FednowTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #
      #   @param creditor_name [String] The name of the transfer's recipient. This is set by the sender when creating th
      #
      #   @param currency [Symbol, Increase::Models::FednowTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's c
      #
      #   @param debtor_name [String] The name of the transfer's sender. If not provided, defaults to the name of the
      #
      #   @param external_account_id [String, nil] The identifier of the External Account the transfer was made to, if any.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer.
      #
      #   @param rejection [Increase::Models::FednowTransfer::Rejection, nil] If the transfer is rejected by FedNow or the destination financial institution,
      #
      #   @param routing_number [String] The destination American Bankers' Association (ABA) Routing Transit Number (RTN)
      #
      #   @param source_account_number_id [String] The Account Number the recipient will see as having sent the transfer.
      #
      #   @param status [Symbol, Increase::Models::FednowTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param submission [Increase::Models::FednowTransfer::Submission, nil] After the transfer is submitted to FedNow, this will contain supplemental detail
      #
      #   @param transaction_id [String, nil] The Transaction funding the transfer once it is complete.
      #
      #   @param type [Symbol, Increase::Models::FednowTransfer::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param unique_end_to_end_transaction_reference [String] The Unique End-to-end Transaction Reference ([UETR](https://www.swift.com/paymen
      #
      #   @param unstructured_remittance_information [String] Unstructured information that will show on the recipient's bank statement.

      # @see Increase::Models::FednowTransfer#acknowledgement
      class Acknowledgement < Increase::Internal::Type::BaseModel
        # @!attribute acknowledged_at
        #   When the transfer was acknowledged.
        #
        #   @return [Time]
        required :acknowledged_at, Time

        # @!method initialize(acknowledged_at:)
        #   If the transfer is acknowledged by the recipient bank, this will contain
        #   supplemental details.
        #
        #   @param acknowledged_at [Time] When the transfer was acknowledged.
      end

      # @see Increase::Models::FednowTransfer#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::FednowTransfer::CreatedBy::APIKey, nil]
        required :api_key, -> { Increase::FednowTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::FednowTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::FednowTransfer::CreatedBy::Category }

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::FednowTransfer::CreatedBy::OAuthApplication, nil]
        required :oauth_application, -> { Increase::FednowTransfer::CreatedBy::OAuthApplication }, nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::FednowTransfer::CreatedBy::User, nil]
        required :user, -> { Increase::FednowTransfer::CreatedBy::User }, nil?: true

        # @!method initialize(api_key:, category:, oauth_application:, user:)
        #   What object created the transfer, either via the API or the dashboard.
        #
        #   @param api_key [Increase::Models::FednowTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param category [Symbol, Increase::Models::FednowTransfer::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param oauth_application [Increase::Models::FednowTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::Models::FednowTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.

        # @see Increase::Models::FednowTransfer::CreatedBy#api_key
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
        # @see Increase::Models::FednowTransfer::CreatedBy#category
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

        # @see Increase::Models::FednowTransfer::CreatedBy#oauth_application
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

        # @see Increase::Models::FednowTransfer::CreatedBy#user
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
      # currency. For FedNow transfers this is always equal to `USD`.
      #
      # @see Increase::Models::FednowTransfer#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::FednowTransfer#rejection
      class Rejection < Increase::Internal::Type::BaseModel
        # @!attribute reject_reason_additional_information
        #   Additional information about the rejection provided by the recipient bank.
        #
        #   @return [String, nil]
        required :reject_reason_additional_information, String, nil?: true

        # @!attribute reject_reason_code
        #   The reason the transfer was rejected as provided by the recipient bank or the
        #   FedNow network.
        #
        #   @return [Symbol, Increase::Models::FednowTransfer::Rejection::RejectReasonCode]
        required :reject_reason_code, enum: -> { Increase::FednowTransfer::Rejection::RejectReasonCode }

        # @!attribute rejected_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was rejected.
        #
        #   @return [Time, nil]
        required :rejected_at, Time, nil?: true

        # @!method initialize(reject_reason_additional_information:, reject_reason_code:, rejected_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::FednowTransfer::Rejection} for more details.
        #
        #   If the transfer is rejected by FedNow or the destination financial institution,
        #   this will contain supplemental details.
        #
        #   @param reject_reason_additional_information [String, nil] Additional information about the rejection provided by the recipient bank.
        #
        #   @param reject_reason_code [Symbol, Increase::Models::FednowTransfer::Rejection::RejectReasonCode] The reason the transfer was rejected as provided by the recipient bank or the Fe
        #
        #   @param rejected_at [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th

        # The reason the transfer was rejected as provided by the recipient bank or the
        # FedNow network.
        #
        # @see Increase::Models::FednowTransfer::Rejection#reject_reason_code
        module RejectReasonCode
          extend Increase::Internal::Type::Enum

          # The destination account is closed. Corresponds to the FedNow reason code `AC04`.
          ACCOUNT_CLOSED = :account_closed

          # The destination account is currently blocked from receiving transactions. Corresponds to the FedNow reason code `AC06`.
          ACCOUNT_BLOCKED = :account_blocked

          # The destination account is ineligible to receive FedNow transfers. Corresponds to the FedNow reason code `AC14`.
          INVALID_CREDITOR_ACCOUNT_TYPE = :invalid_creditor_account_type

          # The destination account does not exist. Corresponds to the FedNow reason code `AC03`.
          INVALID_CREDITOR_ACCOUNT_NUMBER = :invalid_creditor_account_number

          # The destination routing number is invalid. Corresponds to the FedNow reason code `RC04`.
          INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER = :invalid_creditor_financial_institution_identifier

          # The destination account holder is deceased. Corresponds to the FedNow reason code `MD07`.
          END_CUSTOMER_DECEASED = :end_customer_deceased

          # The reason is provided as narrative information in the additional information field. Corresponds to the FedNow reason code `NARR`.
          NARRATIVE = :narrative

          # FedNow transfers are not allowed to the destination account. Corresponds to the FedNow reason code `AG01`.
          TRANSACTION_FORBIDDEN = :transaction_forbidden

          # FedNow transfers are not enabled for the destination account. Corresponds to the FedNow reason code `AG03`.
          TRANSACTION_TYPE_NOT_SUPPORTED = :transaction_type_not_supported

          # The amount is higher than the recipient is authorized to send or receive. Corresponds to the FedNow reason code `E990`.
          AMOUNT_EXCEEDS_BANK_LIMITS = :amount_exceeds_bank_limits

          # The creditor's address is required, but missing or invalid. Corresponds to the FedNow reason code `BE04`.
          INVALID_CREDITOR_ADDRESS = :invalid_creditor_address

          # The debtor's address is required, but missing or invalid. Corresponds to the FedNow reason code `BE07`.
          INVALID_DEBTOR_ADDRESS = :invalid_debtor_address

          # There was a timeout processing the transfer. Corresponds to the FedNow reason code `E997`.
          TIMEOUT = :timeout

          # The transfer was rejected due to an internal Increase issue. We have been notified.
          PROCESSING_ERROR = :processing_error

          # Some other error or issue has occurred.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::FednowTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is pending review by Increase.
        PENDING_REVIEWING = :pending_reviewing

        # The transfer has been canceled.
        CANCELED = :canceled

        # The transfer has been rejected by Increase.
        REVIEWING_REJECTED = :reviewing_rejected

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # The transfer is pending approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer is queued to be submitted to FedNow.
        PENDING_SUBMITTING = :pending_submitting

        # The transfer has been submitted and is pending a response from FedNow.
        PENDING_RESPONSE = :pending_response

        # The transfer has been sent successfully and is complete.
        COMPLETE = :complete

        # The transfer was rejected by the network or the recipient's bank.
        REJECTED = :rejected

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::FednowTransfer#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute message_identification
        #   The FedNow network identification of the message submitted.
        #
        #   @return [String]
        required :message_identification, String

        # @!attribute submitted_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was submitted to FedNow.
        #
        #   @return [Time, nil]
        required :submitted_at, Time, nil?: true

        # @!method initialize(message_identification:, submitted_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::FednowTransfer::Submission} for more details.
        #
        #   After the transfer is submitted to FedNow, this will contain supplemental
        #   details.
        #
        #   @param message_identification [String] The FedNow network identification of the message submitted.
        #
        #   @param submitted_at [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      end

      # A constant representing the object's type. For this resource it will always be
      # `fednow_transfer`.
      #
      # @see Increase::Models::FednowTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        FEDNOW_TRANSFER = :fednow_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
