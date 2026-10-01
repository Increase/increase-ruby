# frozen_string_literal: true

module Increase
  module Resources
    class RealTimePaymentsRequestsForPayment
      # Create a Real-Time Payments Request for Payment
      #
      # @overload create(account_number_id:, amount:, debtor:, debtor_account_number:, debtor_routing_number:, expires_at:, requested_execution_at:, unstructured_remittance_information:, creditor_name: nil, request_options: {})
      #
      # @param account_number_id [String] The identifier of the Account Number where the funds will land.
      #
      # @param amount [Integer] The requested amount in USD cents. Must be positive.
      #
      # @param debtor [Increase::Models::RealTimePaymentsRequestsForPaymentCreateParams::Debtor]
      #   Details of the person being requested to pay.
      #
      # @param debtor_account_number [String] The debtor's account number, which the funds will be requested from.
      #
      # @param debtor_routing_number [String]
      #   The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      # @param expires_at [Time]
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      #   the request for payment is no longer valid. After this time the debtor's bank
      #   should no longer allow the debtor to pay it. Must not be before
      #   `requested_execution_at`.
      #
      # @param requested_execution_at [Time]
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      #   you are requesting the payment to be made.
      #
      # @param unstructured_remittance_information [String]
      #   Unstructured information that will show on the recipient's bank statement.
      #
      # @param creditor_name [String]
      #   The name of the creditor requesting the payment. If not provided, defaults to
      #   the name of the account's entity.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimePaymentsRequestForPayment]
      #
      # @see Increase::Models::RealTimePaymentsRequestsForPaymentCreateParams
      def create(params)
        parsed, options = Increase::RealTimePaymentsRequestsForPaymentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "real_time_payments_requests_for_payment",
          body: parsed,
          model: Increase::RealTimePaymentsRequestForPayment,
          options: options
        )
      end

      # Retrieve a Real-Time Payments Request for Payment
      #
      # @overload retrieve(real_time_payments_request_for_payment_id, request_options: {})
      #
      # @param real_time_payments_request_for_payment_id [String]
      #   The identifier of the Real-Time Payments Request for Payment.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimePaymentsRequestForPayment]
      #
      # @see Increase::Models::RealTimePaymentsRequestsForPaymentRetrieveParams
      def retrieve(real_time_payments_request_for_payment_id, params = {})
        @client.request(
          method: :get,
          path: ["real_time_payments_requests_for_payment/%1$s", real_time_payments_request_for_payment_id],
          model: Increase::RealTimePaymentsRequestForPayment,
          options: params[:request_options]
        )
      end

      # List Real-Time Payments Requests for Payment
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param account_id [String]
      #   Filter Real-Time Payments Requests for Payment to those destined to the
      #   specified Account.
      #
      # @param created_at [Increase::Models::RealTimePaymentsRequestsForPaymentListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String]
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::RealTimePaymentsRequestForPayment>]
      #
      # @see Increase::Models::RealTimePaymentsRequestsForPaymentListParams
      def list(params = {})
        parsed, options = Increase::RealTimePaymentsRequestsForPaymentListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "real_time_payments_requests_for_payment",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::RealTimePaymentsRequestForPayment,
          options: options
        )
      end

      # Cancels a Real-Time Payments Request for Payment that is still awaiting payment.
      #
      # @overload cancel(real_time_payments_request_for_payment_id, additional_information: nil, reason: nil, request_options: {})
      #
      # @param real_time_payments_request_for_payment_id [String]
      #   The identifier of the Real-Time Payments Request for Payment to cancel.
      #
      # @param additional_information [String]
      #   Additional information about the cancellation to pass on to the recipient bank.
      #
      # @param reason [Symbol, Increase::Models::RealTimePaymentsRequestsForPaymentCancelParams::Reason]
      #   The reason the request for payment is being canceled. Defaults to
      #   `requested_by_customer`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimePaymentsRequestForPayment]
      #
      # @see Increase::Models::RealTimePaymentsRequestsForPaymentCancelParams
      def cancel(real_time_payments_request_for_payment_id, params = {})
        parsed, options = Increase::RealTimePaymentsRequestsForPaymentCancelParams.dump_request(params)
        @client.request(
          method: :post,
          path: [
            "real_time_payments_requests_for_payment/%1$s/cancel",
            real_time_payments_request_for_payment_id
          ],
          body: parsed,
          model: Increase::RealTimePaymentsRequestForPayment,
          options: options
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
