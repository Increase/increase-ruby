# typed: strong

module Increase
  module Resources
    class InboundRealTimePaymentsTransfers
      # Retrieve an Inbound Real-Time Payments Transfer
      sig do
        params(
          inbound_real_time_payments_transfer_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::InboundRealTimePaymentsTransfer)
      end
      def retrieve(
        # The identifier of the Inbound Real-Time Payments Transfer to get details for.
        inbound_real_time_payments_transfer_id,
        request_options: {}
      )
      end

      # List Inbound Real-Time Payments Transfers
      sig do
        params(
          account_id: String,
          account_number_id: String,
          created_at: T.any(Increase::Models::InboundRealTimePaymentsTransferListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::InboundRealTimePaymentsTransfer])
      end
      def list(
        # Filter Inbound Real-Time Payments Transfers to those belonging to the specified
        #   Account.
        account_id: nil,
        # Filter Inbound Real-Time Payments Transfers to ones belonging to the specified
        #   Account Number.
        account_number_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
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
