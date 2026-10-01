# frozen_string_literal: true

module Increase
  module Resources
    class InboundRealTimePaymentsRequestsForPayment
      # Retrieve an Inbound Real-Time Payments Request for Payment
      #
      # @overload retrieve(inbound_real_time_payments_request_for_payment_id, request_options: {})
      #
      # @param inbound_real_time_payments_request_for_payment_id [String]
      #   The identifier of the Inbound Real-Time Payments Request for Payment to get
      #   details for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundRealTimePaymentsRequestForPayment]
      #
      # @see Increase::Models::InboundRealTimePaymentsRequestsForPaymentRetrieveParams
      def retrieve(inbound_real_time_payments_request_for_payment_id, params = {})
        @client.request(
          method: :get,
          path: [
            "inbound_real_time_payments_requests_for_payment/%1$s",
            inbound_real_time_payments_request_for_payment_id
          ],
          model: Increase::InboundRealTimePaymentsRequestForPayment,
          options: params[:request_options]
        )
      end

      # List Inbound Real-Time Payments Requests for Payment
      #
      # @overload list(account_id: nil, account_number_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param account_id [String]
      #   Filter Inbound Real-Time Payments Requests for Payment to those belonging to the
      #   specified Account.
      #
      # @param account_number_id [String]
      #   Filter Inbound Real-Time Payments Requests for Payment to ones belonging to the
      #   specified Account Number.
      #
      # @param created_at [Increase::Models::InboundRealTimePaymentsRequestsForPaymentListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::InboundRealTimePaymentsRequestForPayment>]
      #
      # @see Increase::Models::InboundRealTimePaymentsRequestsForPaymentListParams
      def list(params = {})
        parsed, options = Increase::InboundRealTimePaymentsRequestsForPaymentListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "inbound_real_time_payments_requests_for_payment",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::InboundRealTimePaymentsRequestForPayment,
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
