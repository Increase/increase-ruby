# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimePaymentsRequestsForPayment#create
    class RealTimePaymentsRequestForPayment < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Real-Time Payments Request for Payment's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account in which a successful transfer will arrive.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number_id
      #   The Account Number in which a successful transfer will arrive.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute cancellation
      #   If a cancellation has been requested, this will contain supplemental details.
      #   The request for payment moves to `canceled` once the recipient bank acknowledges
      #   the cancellation.
      #
      #   @return [Increase::Models::RealTimePaymentsRequestForPayment::Cancellation, nil]
      required :cancellation, -> { Increase::RealTimePaymentsRequestForPayment::Cancellation }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the request for payment was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute creditor_name
      #   The name of the creditor requesting the payment.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   currency. For real-time payments transfers this is always equal to `USD`.
      #
      #   @return [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Currency]
      required :currency, enum: -> { Increase::RealTimePaymentsRequestForPayment::Currency }

      # @!attribute debtor
      #   Details of the person being requested to pay.
      #
      #   @return [Increase::Models::RealTimePaymentsRequestForPayment::Debtor]
      required :debtor, -> { Increase::RealTimePaymentsRequestForPayment::Debtor }

      # @!attribute debtor_account_number
      #   The debtor's account number, which the request is sent to.
      #
      #   @return [String]
      required :debtor_account_number, String

      # @!attribute debtor_routing_number
      #   The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @return [String]
      required :debtor_routing_number, String

      # @!attribute expires_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      #   the request for payment is no longer valid. After this time the debtor's bank
      #   should no longer allow the debtor to pay it.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute fulfillment_inbound_real_time_payments_transfer_id
      #   The identifier of the Inbound Real-Time Payments Transfer that fulfilled this
      #   request.
      #
      #   @return [String, nil]
      required :fulfillment_inbound_real_time_payments_transfer_id, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute refusal
      #   If the request for payment is refused by the destination financial institution
      #   or the receiving customer, this will contain supplemental details.
      #
      #   @return [Increase::Models::RealTimePaymentsRequestForPayment::Refusal, nil]
      required :refusal, -> { Increase::RealTimePaymentsRequestForPayment::Refusal }, nil?: true

      # @!attribute rejection
      #   If the request for payment is rejected by Real-Time Payments or the destination
      #   financial institution, this will contain supplemental details.
      #
      #   @return [Increase::Models::RealTimePaymentsRequestForPayment::Rejection, nil]
      required :rejection, -> { Increase::RealTimePaymentsRequestForPayment::Rejection }, nil?: true

      # @!attribute requested_execution_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      #   the payment was requested to be made.
      #
      #   @return [Time, nil]
      required :requested_execution_at, Time, nil?: true

      # @!attribute status
      #   The lifecycle status of the request for payment.
      #
      #   @return [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Status]
      required :status, enum: -> { Increase::RealTimePaymentsRequestForPayment::Status }

      # @!attribute submission
      #   After the request for payment is submitted to Real-Time Payments, this will
      #   contain supplemental details.
      #
      #   @return [Increase::Models::RealTimePaymentsRequestForPayment::Submission, nil]
      required :submission, -> { Increase::RealTimePaymentsRequestForPayment::Submission }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `real_time_payments_request_for_payment`.
      #
      #   @return [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Type]
      required :type, enum: -> { Increase::RealTimePaymentsRequestForPayment::Type }

      # @!attribute unstructured_remittance_information
      #   Unstructured information that will show on the recipient's bank statement.
      #
      #   @return [String]
      required :unstructured_remittance_information, String

      # @!method initialize(id:, account_id:, account_number_id:, amount:, cancellation:, created_at:, creditor_name:, currency:, debtor:, debtor_account_number:, debtor_routing_number:, expires_at:, fulfillment_inbound_real_time_payments_transfer_id:, idempotency_key:, refusal:, rejection:, requested_execution_at:, status:, submission:, type:, unstructured_remittance_information:)
      #   Real-Time Payments transfers move funds, within seconds, between your Increase
      #   account and any other account on the Real-Time Payments network. A request for
      #   payment is a request to the receiver to send funds to your account. The
      #   permitted uses of Requests For Payment are limited by the Real-Time Payments
      #   network to business-to-business payments and transfers between two accounts at
      #   different banks owned by the same individual. Please contact
      #   [support@increase.com](mailto:support@increase.com) to enable this API for your
      #   team.
      #
      #   @param id [String] The Real-Time Payments Request for Payment's identifier.
      #
      #   @param account_id [String] The Account in which a successful transfer will arrive.
      #
      #   @param account_number_id [String] The Account Number in which a successful transfer will arrive.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param cancellation [Increase::Models::RealTimePaymentsRequestForPayment::Cancellation, nil]
      #     If a cancellation has been requested, this will contain supplemental details.
      #     The request for payment moves to `canceled` once the recipient bank acknowledges
      #     the cancellation.
      #
      #   @param created_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the request for payment was created.
      #
      #   @param creditor_name [String] The name of the creditor requesting the payment.
      #
      #   @param currency [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Currency]
      #     The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #     currency. For real-time payments transfers this is always equal to `USD`.
      #
      #   @param debtor [Increase::Models::RealTimePaymentsRequestForPayment::Debtor]
      #     Details of the person being requested to pay.
      #
      #   @param debtor_account_number [String] The debtor's account number, which the request is sent to.
      #
      #   @param debtor_routing_number [String]
      #     The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @param expires_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      #     the request for payment is no longer valid. After this time the debtor's bank
      #     should no longer allow the debtor to pay it.
      #
      #   @param fulfillment_inbound_real_time_payments_transfer_id [String, nil]
      #     The identifier of the Inbound Real-Time Payments Transfer that fulfilled this
      #     request.
      #
      #   @param idempotency_key [String, nil]
      #     The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @param refusal [Increase::Models::RealTimePaymentsRequestForPayment::Refusal, nil]
      #     If the request for payment is refused by the destination financial institution
      #     or the receiving customer, this will contain supplemental details.
      #
      #   @param rejection [Increase::Models::RealTimePaymentsRequestForPayment::Rejection, nil]
      #     If the request for payment is rejected by Real-Time Payments or the destination
      #     financial institution, this will contain supplemental details.
      #
      #   @param requested_execution_at [Time, nil]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      #     the payment was requested to be made.
      #
      #   @param status [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Status]
      #     The lifecycle status of the request for payment.
      #
      #   @param submission [Increase::Models::RealTimePaymentsRequestForPayment::Submission, nil]
      #     After the request for payment is submitted to Real-Time Payments, this will
      #     contain supplemental details.
      #
      #   @param type [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `real_time_payments_request_for_payment`.
      #
      #   @param unstructured_remittance_information [String]
      #     Unstructured information that will show on the recipient's bank statement.

      # @see Increase::Models::RealTimePaymentsRequestForPayment#cancellation
      class Cancellation < Increase::Internal::Type::BaseModel
        # @!attribute additional_information
        #   Additional information about the cancellation, sent on to the recipient bank.
        #
        #   @return [String, nil]
        required :additional_information, String, nil?: true

        # @!attribute canceled_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the cancellation was requested.
        #
        #   @return [Time]
        required :canceled_at, Time

        # @!attribute reason
        #   The reason the request for payment was canceled.
        #
        #   @return [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Cancellation::Reason]
        required :reason, enum: -> { Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason }

        # @!method initialize(additional_information:, canceled_at:, reason:)
        #   If a cancellation has been requested, this will contain supplemental details.
        #   The request for payment moves to `canceled` once the recipient bank acknowledges
        #   the cancellation.
        #
        #   @param additional_information [String, nil]
        #     Additional information about the cancellation, sent on to the recipient bank.
        #
        #   @param canceled_at [Time]
        #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the cancellation was requested.
        #
        #   @param reason [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Cancellation::Reason]
        #     The reason the request for payment was canceled.

        # The reason the request for payment was canceled.
        #
        # @see Increase::Models::RealTimePaymentsRequestForPayment::Cancellation#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The creditor no longer wants to be paid. Corresponds to the Real-Time Payments reason code `CUST`.
          REQUESTED_BY_CUSTOMER = :requested_by_customer

          # The requested payment has already been made through another channel. Corresponds to the Real-Time Payments reason code `UPAY`.
          PAID_BY_OTHER_MEANS = :paid_by_other_means

          # The request for payment duplicated another request for payment. Corresponds to the Real-Time Payments reason code `DUPL`.
          DUPLICATE = :duplicate

          # The request for payment was sent for the wrong amount. Corresponds to the Real-Time Payments reason code `AM09`.
          WRONG_AMOUNT = :wrong_amount

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For real-time payments transfers this is always equal to `USD`.
      #
      # @see Increase::Models::RealTimePaymentsRequestForPayment#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::RealTimePaymentsRequestForPayment#debtor
      class Debtor < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   Address of the debtor.
        #
        #   @return [Increase::Models::RealTimePaymentsRequestForPayment::Debtor::Address]
        required :address, -> { Increase::RealTimePaymentsRequestForPayment::Debtor::Address }

        # @!attribute name
        #   The name of the debtor.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(address:, name:)
        #   Details of the person being requested to pay.
        #
        #   @param address [Increase::Models::RealTimePaymentsRequestForPayment::Debtor::Address]
        #     Address of the debtor.
        #
        #   @param name [String] The name of the debtor.

        # @see Increase::Models::RealTimePaymentsRequestForPayment::Debtor#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute address_line2
          #   A second address line, such as an apartment or suite number. The first address
          #   line is separated into `building_number` and `street_name`.
          #
          #   @return [String, nil]
          required :address_line2, String, nil?: true

          # @!attribute building_number
          #   The number identifying the position of the building on the street.
          #
          #   @return [String, nil]
          required :building_number, String, nil?: true

          # @!attribute city
          #   The town or city.
          #
          #   @return [String, nil]
          required :city, String, nil?: true

          # @!attribute country
          #   The ISO 3166, Alpha-2 country code.
          #
          #   @return [String, nil]
          required :country, String, nil?: true

          # @!attribute postal_code
          #   The postal code or zip.
          #
          #   @return [String, nil]
          required :postal_code, String, nil?: true

          # @!attribute state
          #   The US state component of the address.
          #
          #   @return [String, nil]
          required :state, String, nil?: true

          # @!attribute street_name
          #   The street name without the street number.
          #
          #   @return [String, nil]
          required :street_name, String, nil?: true

          # @!method initialize(address_line2:, building_number:, city:, country:, postal_code:, state:, street_name:)
          #   Address of the debtor.
          #
          #   @param address_line2 [String, nil]
          #     A second address line, such as an apartment or suite number. The first address
          #     line is separated into `building_number` and `street_name`.
          #
          #   @param building_number [String, nil] The number identifying the position of the building on the street.
          #
          #   @param city [String, nil] The town or city.
          #
          #   @param country [String, nil] The ISO 3166, Alpha-2 country code.
          #
          #   @param postal_code [String, nil] The postal code or zip.
          #
          #   @param state [String, nil] The US state component of the address.
          #
          #   @param street_name [String, nil] The street name without the street number.
        end
      end

      # @see Increase::Models::RealTimePaymentsRequestForPayment#refusal
      class Refusal < Increase::Internal::Type::BaseModel
        # @!attribute refusal_reason_additional_information
        #   Additional information about the refusal provided by the recipient bank or the
        #   customer. This is typically present when the `refusal_reason_code` is `other`.
        #
        #   @return [String, nil]
        required :refusal_reason_additional_information, String, nil?: true

        # @!attribute refusal_reason_code
        #   The reason the request for payment was refused as provided by the recipient bank
        #   or the customer.
        #
        #   @return [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode]
        required :refusal_reason_code,
                 enum: -> { Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode }

        # @!attribute refused_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the request for payment was refused.
        #
        #   @return [Time, nil]
        required :refused_at, Time, nil?: true

        # @!method initialize(refusal_reason_additional_information:, refusal_reason_code:, refused_at:)
        #   If the request for payment is refused by the destination financial institution
        #   or the receiving customer, this will contain supplemental details.
        #
        #   @param refusal_reason_additional_information [String, nil]
        #     Additional information about the refusal provided by the recipient bank or the
        #     customer. This is typically present when the `refusal_reason_code` is `other`.
        #
        #   @param refusal_reason_code [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode]
        #     The reason the request for payment was refused as provided by the recipient bank
        #     or the customer.
        #
        #   @param refused_at [Time, nil]
        #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the request for payment was refused.

        # The reason the request for payment was refused as provided by the recipient bank
        # or the customer.
        #
        # @see Increase::Models::RealTimePaymentsRequestForPayment::Refusal#refusal_reason_code
        module RefusalReasonCode
          extend Increase::Internal::Type::Enum

          # The destination account is currently blocked from receiving transactions. Corresponds to the Real-Time Payments reason code `AC06`.
          ACCOUNT_BLOCKED = :account_blocked

          # Real-Time Payments transfers are not allowed to the destination account. Corresponds to the Real-Time Payments reason code `AG01`.
          TRANSACTION_FORBIDDEN = :transaction_forbidden

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code `AG03`.
          TRANSACTION_TYPE_NOT_SUPPORTED = :transaction_type_not_supported

          # The amount of the transfer is different than expected by the recipient. Corresponds to the Real-Time Payments reason code `AM09`.
          UNEXPECTED_AMOUNT = :unexpected_amount

          # The amount is higher than the recipient is authorized to send or receive. Corresponds to the Real-Time Payments reason code `AM14`.
          AMOUNT_EXCEEDS_BANK_LIMITS = :amount_exceeds_bank_limits

          # The debtor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE07`.
          INVALID_DEBTOR_ADDRESS = :invalid_debtor_address

          # The creditor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE04`.
          INVALID_CREDITOR_ADDRESS = :invalid_creditor_address

          # Creditor identifier incorrect. Corresponds to the Real-Time Payments reason code `CH11`.
          CREDITOR_IDENTIFIER_INCORRECT = :creditor_identifier_incorrect

          # The customer refused the request. Corresponds to the Real-Time Payments reason code `CUST`.
          REQUESTED_BY_CUSTOMER = :requested_by_customer

          # The order was rejected. Corresponds to the Real-Time Payments reason code `DS04`.
          ORDER_REJECTED = :order_rejected

          # The destination account holder is deceased. Corresponds to the Real-Time Payments reason code `MD07`.
          END_CUSTOMER_DECEASED = :end_customer_deceased

          # The customer has opted out of receiving requests for payments from this creditor. Corresponds to the Real-Time Payments reason code `SL12`.
          CUSTOMER_HAS_OPTED_OUT = :customer_has_opted_out

          # Some other error or issue has occurred.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::RealTimePaymentsRequestForPayment#rejection
      class Rejection < Increase::Internal::Type::BaseModel
        # @!attribute reject_reason_additional_information
        #   Additional information about the rejection provided by the recipient bank or the
        #   Real-Time Payments network. This is typically present when the
        #   `reject_reason_code` is `narrative`.
        #
        #   @return [String, nil]
        required :reject_reason_additional_information, String, nil?: true

        # @!attribute reject_reason_code
        #   The reason the request for payment was rejected as provided by the recipient
        #   bank or the Real-Time Payments network.
        #
        #   @return [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode]
        required :reject_reason_code,
                 enum: -> { Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode }

        # @!attribute rejected_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the request for payment was rejected.
        #
        #   @return [Time, nil]
        required :rejected_at, Time, nil?: true

        # @!method initialize(reject_reason_additional_information:, reject_reason_code:, rejected_at:)
        #   If the request for payment is rejected by Real-Time Payments or the destination
        #   financial institution, this will contain supplemental details.
        #
        #   @param reject_reason_additional_information [String, nil]
        #     Additional information about the rejection provided by the recipient bank or the
        #     Real-Time Payments network. This is typically present when the
        #     `reject_reason_code` is `narrative`.
        #
        #   @param reject_reason_code [Symbol, Increase::Models::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode]
        #     The reason the request for payment was rejected as provided by the recipient
        #     bank or the Real-Time Payments network.
        #
        #   @param rejected_at [Time, nil]
        #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the request for payment was rejected.

        # The reason the request for payment was rejected as provided by the recipient
        # bank or the Real-Time Payments network.
        #
        # @see Increase::Models::RealTimePaymentsRequestForPayment::Rejection#reject_reason_code
        module RejectReasonCode
          extend Increase::Internal::Type::Enum

          # The destination account is closed. Corresponds to the Real-Time Payments reason code "AC04".
          ACCOUNT_CLOSED = :account_closed

          # The destination account is currently blocked from receiving transactions. Corresponds to the Real-Time Payments reason code "AC06".
          ACCOUNT_BLOCKED = :account_blocked

          # The destination account is ineligible to receive Real-Time Payments transfers. Corresponds to the Real-Time Payments reason code "AC14".
          INVALID_CREDITOR_ACCOUNT_TYPE = :invalid_creditor_account_type

          # The destination account does not exist. Corresponds to the Real-Time Payments reason code "AC03".
          INVALID_CREDITOR_ACCOUNT_NUMBER = :invalid_creditor_account_number

          # The destination routing number is invalid. Corresponds to the Real-Time Payments reason code "RC04".
          INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER = :invalid_creditor_financial_institution_identifier

          # The destination account holder is deceased. Corresponds to the Real-Time Payments reason code "MD07".
          END_CUSTOMER_DECEASED = :end_customer_deceased

          # The reason is provided as narrative information in the additional information field.
          NARRATIVE = :narrative

          # Real-Time Payments transfers are not allowed to the destination account. Corresponds to the Real-Time Payments reason code "AG01".
          TRANSACTION_FORBIDDEN = :transaction_forbidden

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code "AG03".
          TRANSACTION_TYPE_NOT_SUPPORTED = :transaction_type_not_supported

          # The amount of the transfer is different than expected by the recipient. Corresponds to the Real-Time Payments reason code "AM09".
          UNEXPECTED_AMOUNT = :unexpected_amount

          # The amount is higher than the recipient is authorized to send or receive. Corresponds to the Real-Time Payments reason code "AM14".
          AMOUNT_EXCEEDS_BANK_LIMITS = :amount_exceeds_bank_limits

          # The creditor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code "BE04".
          INVALID_CREDITOR_ADDRESS = :invalid_creditor_address

          # The specified creditor is unknown. Corresponds to the Real-Time Payments reason code "BE06".
          UNKNOWN_END_CUSTOMER = :unknown_end_customer

          # The debtor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code "BE07".
          INVALID_DEBTOR_ADDRESS = :invalid_debtor_address

          # There was a timeout processing the transfer. Corresponds to the Real-Time Payments reason code "DS24".
          TIMEOUT = :timeout

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code "NOAT".
          UNSUPPORTED_MESSAGE_FOR_RECIPIENT = :unsupported_message_for_recipient

          # The destination financial institution is currently not connected to Real-Time Payments. Corresponds to the Real-Time Payments reason code "9912".
          RECIPIENT_CONNECTION_NOT_AVAILABLE = :recipient_connection_not_available

          # Real-Time Payments is currently unavailable. Corresponds to the Real-Time Payments reason code "9948".
          REAL_TIME_PAYMENTS_SUSPENDED = :real_time_payments_suspended

          # The destination financial institution is currently signed off of Real-Time Payments. Corresponds to the Real-Time Payments reason code "9910".
          INSTRUCTED_AGENT_SIGNED_OFF = :instructed_agent_signed_off

          # The transfer was rejected due to an internal Increase issue. We have been notified.
          PROCESSING_ERROR = :processing_error

          # Some other error or issue has occurred.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The lifecycle status of the request for payment.
      #
      # @see Increase::Models::RealTimePaymentsRequestForPayment#status
      module Status
        extend Increase::Internal::Type::Enum

        # The request for payment is queued to be submitted to Real-Time Payments.
        PENDING_SUBMISSION = :pending_submission

        # The request for payment has been submitted and is pending a response from Real-Time Payments.
        PENDING_RESPONSE = :pending_response

        # The request for payment was rejected by the network or the recipient.
        REJECTED = :rejected

        # The request for payment was accepted by the recipient but has not yet been paid.
        ACCEPTED = :accepted

        # The request for payment was refused by the recipient.
        REFUSED = :refused

        # The request for payment was fulfilled by the receiver.
        FULFILLED = :fulfilled

        # The request for payment was canceled and can no longer be paid.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::RealTimePaymentsRequestForPayment#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute payment_information_identification
        #   The Real-Time Payments payment information identification of the request.
        #
        #   @return [String]
        required :payment_information_identification, String

        # @!method initialize(payment_information_identification:)
        #   After the request for payment is submitted to Real-Time Payments, this will
        #   contain supplemental details.
        #
        #   @param payment_information_identification [String]
        #     The Real-Time Payments payment information identification of the request.
      end

      # A constant representing the object's type. For this resource it will always be
      # `real_time_payments_request_for_payment`.
      #
      # @see Increase::Models::RealTimePaymentsRequestForPayment#type
      module Type
        extend Increase::Internal::Type::Enum

        REAL_TIME_PAYMENTS_REQUEST_FOR_PAYMENT = :real_time_payments_request_for_payment

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
