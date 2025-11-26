# typed: strong

module Increase
  module Resources
    class AccountTransfers
      # Create an Account Transfer
      sig do
        params(
          account_id: String,
          amount: Integer,
          description: String,
          destination_account_id: String,
          require_approval: T::Boolean,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::AccountTransfer)
      end
      def create(
        # The identifier for the originating Account that will send the transfer.
        account_id:,
        # The transfer amount in the minor unit of the account currency. For dollars, for
        # example, this is cents.
        amount:,
        # An internal-facing description for the transfer for display in the API and
        # dashboard. This will also show in the description of the created Transactions.
        description:,
        # The identifier for the destination Account that will receive the transfer.
        destination_account_id:,
        # Whether the transfer should require explicit approval via the dashboard or API.
        # For more information, see
        # [Transfer Approvals](/documentation/transfer-approvals).
        require_approval: nil,
        request_options: {}
      )
      end

      # Retrieve an Account Transfer
      sig do
        params(
          account_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::AccountTransfer)
      end
      def retrieve(
        # The identifier of the Account Transfer.
        account_transfer_id,
        request_options: {}
      )
      end

      # List Account Transfers
      sig do
        params(
          account_id: String,
          created_at: Increase::AccountTransferListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::AccountTransferListResponse)
      end
      def list(
        # Filter Account Transfers to those that originated from the specified Account.
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
        limit: nil,
        request_options: {}
      )
      end

      # Approves an Account Transfer in status `pending_approval`.
      sig do
        params(
          account_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::AccountTransfer)
      end
      def approve(
        # The identifier of the Account Transfer to approve.
        account_transfer_id,
        request_options: {}
      )
      end

      # Cancels an Account Transfer in status `pending_approval`.
      sig do
        params(
          account_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::AccountTransfer)
      end
      def cancel(
        # The identifier of the pending Account Transfer to cancel.
        account_transfer_id,
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
