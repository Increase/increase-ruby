# typed: strong

module Increase
  module Resources
    class FednowTransfers
      # Create a FedNow Transfer
      sig do
        params(
          account_id: String,
          amount: Integer,
          creditor_name: String,
          debtor_name: String,
          source_account_number_id: String,
          unstructured_remittance_information: String,
          account_number: String,
          creditor_address:
            Increase::FednowTransferCreateParams::CreditorAddress::OrHash,
          debtor_address:
            Increase::FednowTransferCreateParams::DebtorAddress::OrHash,
          external_account_id: String,
          require_approval: T::Boolean,
          routing_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::FednowTransfer)
      end
      def create(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The amount, in minor units, to send to the creditor.
        amount:,
        # The creditor's name.
        creditor_name:,
        # The debtor's name.
        debtor_name:,
        # The Account Number to include in the transfer as the debtor's account number.
        source_account_number_id:,
        # Unstructured remittance information to include in the transfer.
        unstructured_remittance_information:,
        # The creditor's account number.
        account_number: nil,
        # The creditor's address.
        creditor_address: nil,
        # The debtor's address.
        debtor_address: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number` and `routing_number` must be absent.
        external_account_id: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The creditor's bank account routing number.
        routing_number: nil,
        request_options: {}
      )
      end

      # Retrieve a FedNow Transfer
      sig do
        params(
          fednow_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::FednowTransfer)
      end
      def retrieve(
        # The identifier of the FedNow Transfer.
        fednow_transfer_id,
        request_options: {}
      )
      end

      # List FedNow Transfers
      sig do
        params(
          account_id: String,
          created_at: Increase::FednowTransferListParams::CreatedAt::OrHash,
          cursor: String,
          external_account_id: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::FednowTransferListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::FednowTransferListResponse)
      end
      def list(
        # Filter FedNow Transfers to those that originated from the specified Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter FedNow Transfers to those made to the specified External Account.
        external_account_id: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # Approve a FedNow Transfer
      sig do
        params(
          fednow_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::FednowTransfer)
      end
      def approve(
        # The identifier of the FedNow Transfer to approve.
        fednow_transfer_id,
        request_options: {}
      )
      end

      # Cancel a pending FedNow Transfer
      sig do
        params(
          fednow_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::FednowTransfer)
      end
      def cancel(
        # The identifier of the pending FedNow Transfer to cancel.
        fednow_transfer_id,
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
