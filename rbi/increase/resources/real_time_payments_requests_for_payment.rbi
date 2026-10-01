# typed: strong

module Increase
  module Resources
    class RealTimePaymentsRequestsForPayment
      # Create a Real-Time Payments Request for Payment
      sig do
        params(
          account_number_id: String,
          amount: Integer,
          debtor:
            Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::OrHash,
          debtor_account_number: String,
          debtor_routing_number: String,
          expires_at: Time,
          requested_execution_at: Time,
          unstructured_remittance_information: String,
          creditor_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::RealTimePaymentsRequestForPayment)
      end
      def create(
        # The identifier of the Account Number where the funds will land.
        account_number_id:,
        # The requested amount in USD cents. Must be positive.
        amount:,
        # Details of the person being requested to pay.
        debtor:,
        # The debtor's account number, which the funds will be requested from.
        debtor_account_number:,
        # The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
        debtor_routing_number:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
        # the request for payment is no longer valid. After this time the debtor's bank
        # should no longer allow the debtor to pay it. Must not be before
        # `requested_execution_at`.
        expires_at:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
        # you are requesting the payment to be made.
        requested_execution_at:,
        # Unstructured information that will show on the recipient's bank statement.
        unstructured_remittance_information:,
        # The name of the creditor requesting the payment. If not provided, defaults to
        # the name of the account's entity.
        creditor_name: nil,
        request_options: {}
      )
      end

      # Retrieve a Real-Time Payments Request for Payment
      sig do
        params(
          real_time_payments_request_for_payment_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::RealTimePaymentsRequestForPayment)
      end
      def retrieve(
        # The identifier of the Real-Time Payments Request for Payment.
        real_time_payments_request_for_payment_id,
        request_options: {}
      )
      end

      # List Real-Time Payments Requests for Payment
      sig do
        params(
          account_id: String,
          created_at:
            Increase::RealTimePaymentsRequestsForPaymentListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(
          Increase::Internal::Page[Increase::RealTimePaymentsRequestForPayment]
        )
      end
      def list(
        # Filter Real-Time Payments Requests for Payment to those destined to the
        # specified Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        #
        # Defaults to `100`.
        limit: nil,
        request_options: {}
      )
      end

      # Cancels a Real-Time Payments Request for Payment that is still awaiting payment.
      sig do
        params(
          real_time_payments_request_for_payment_id: String,
          additional_information: String,
          reason:
            Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::RealTimePaymentsRequestForPayment)
      end
      def cancel(
        # The identifier of the Real-Time Payments Request for Payment to cancel.
        real_time_payments_request_for_payment_id,
        # Additional information about the cancellation to pass on to the recipient bank.
        additional_information: nil,
        # The reason the request for payment is being canceled. Defaults to
        # `requested_by_customer`.
        reason: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
