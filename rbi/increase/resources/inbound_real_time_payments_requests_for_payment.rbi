# typed: strong

module Increase
  module Resources
    class InboundRealTimePaymentsRequestsForPayment
      # Retrieve an Inbound Real-Time Payments Request for Payment
      sig do
        params(
          inbound_real_time_payments_request_for_payment_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::InboundRealTimePaymentsRequestForPayment)
      end
      def retrieve(
        # The identifier of the Inbound Real-Time Payments Request for Payment to get
        # details for.
        inbound_real_time_payments_request_for_payment_id,
        request_options: {}
      )
      end

      # List Inbound Real-Time Payments Requests for Payment
      sig do
        params(
          account_id: String,
          account_number_id: String,
          created_at:
            Increase::InboundRealTimePaymentsRequestsForPaymentListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(
          Increase::Internal::Page[
            Increase::InboundRealTimePaymentsRequestForPayment
          ]
        )
      end
      def list(
        # Filter Inbound Real-Time Payments Requests for Payment to those belonging to the
        # specified Account.
        account_id: nil,
        # Filter Inbound Real-Time Payments Requests for Payment to ones belonging to the
        # specified Account Number.
        account_number_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        #
        # Defaults to `100`.
        limit: nil,
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
