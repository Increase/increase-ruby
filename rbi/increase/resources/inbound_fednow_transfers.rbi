# typed: strong

module Increase
  module Resources
    class InboundFednowTransfers
      # Retrieve an Inbound FedNow Transfer
      sig do
        params(
          inbound_fednow_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::InboundFednowTransfer)
      end
      def retrieve(
        # The identifier of the Inbound FedNow Transfer to get details for.
        inbound_fednow_transfer_id,
        request_options: {}
      )
      end

      # List Inbound FedNow Transfers
      sig do
        params(
          account_id: String,
          account_number_id: String,
          created_at:
            Increase::InboundFednowTransferListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::InboundFednowTransfer])
      end
      def list(
        # Filter Inbound FedNow Transfers to those belonging to the specified Account.
        account_id: nil,
        # Filter Inbound FedNow Transfers to ones belonging to the specified Account
        # Number.
        account_number_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
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
