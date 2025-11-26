# typed: strong

module Increase
  module Resources
    class InboundACHTransfers
      # Retrieve an Inbound ACH Transfer
      sig do
        params(
          inbound_ach_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::InboundACHTransfer)
      end
      def retrieve(
        # The identifier of the Inbound ACH Transfer to get details for.
        inbound_ach_transfer_id,
        request_options: {}
      )
      end

      # List Inbound ACH Transfers
      sig do
        params(
          account_id: String,
          account_number_id: String,
          created_at: Increase::InboundACHTransferListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          status: Increase::InboundACHTransferListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::InboundACHTransferListResponse)
      end
      def list(
        # Filter Inbound ACH Transfers to ones belonging to the specified Account.
        account_id: nil,
        # Filter Inbound ACH Transfers to ones belonging to the specified Account Number.
        account_number_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # Create a notification of change for an Inbound ACH Transfer
      sig do
        params(
          inbound_ach_transfer_id: String,
          updated_account_number: String,
          updated_routing_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::InboundACHTransfer)
      end
      def create_notification_of_change(
        # The identifier of the Inbound ACH Transfer for which to create a notification of
        # change.
        inbound_ach_transfer_id,
        # The updated account number to send in the notification of change.
        updated_account_number: nil,
        # The updated routing number to send in the notification of change.
        updated_routing_number: nil,
        request_options: {}
      )
      end

      # Decline an Inbound ACH Transfer
      sig do
        params(
          inbound_ach_transfer_id: String,
          reason: Increase::InboundACHTransferDeclineParams::Reason::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::InboundACHTransfer)
      end
      def decline(
        # The identifier of the Inbound ACH Transfer to decline.
        inbound_ach_transfer_id,
        # The reason why this transfer will be returned. If this parameter is unset, the
        # return codes will be `payment_stopped` for debits and
        # `credit_entry_refused_by_receiver` for credits.
        reason: nil,
        request_options: {}
      )
      end

      # Return an Inbound ACH Transfer
      sig do
        params(
          inbound_ach_transfer_id: String,
          reason:
            Increase::InboundACHTransferTransferReturnParams::Reason::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::InboundACHTransfer)
      end
      def transfer_return(
        # The identifier of the Inbound ACH Transfer to return to the originating
        # financial institution.
        inbound_ach_transfer_id,
        # The reason why this transfer will be returned. The most usual return codes are
        # `payment_stopped` for debits and `credit_entry_refused_by_receiver` for credits.
        reason:,
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
