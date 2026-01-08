# typed: strong

module Increase
  module Resources
    class SwiftTransfers
      # Create a Swift Transfer
      sig do
        params(
          account_id: String,
          account_number: String,
          bank_identification_code: String,
          creditor_address:
            Increase::SwiftTransferCreateParams::CreditorAddress::OrHash,
          creditor_name: String,
          debtor_address:
            Increase::SwiftTransferCreateParams::DebtorAddress::OrHash,
          debtor_name: String,
          instructed_amount: Integer,
          instructed_currency:
            Increase::SwiftTransferCreateParams::InstructedCurrency::OrSymbol,
          source_account_number_id: String,
          unstructured_remittance_information: String,
          require_approval: T::Boolean,
          routing_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::SwiftTransfer)
      end
      def create(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The creditor's account number.
        account_number:,
        # The bank identification code (BIC) of the creditor. If it ends with the
        # three-character branch code, this must be 11 characters long. Otherwise this
        # must be 8 characters and the branch code will be assumed to be `XXX`.
        bank_identification_code:,
        # The creditor's address.
        creditor_address:,
        # The creditor's name.
        creditor_name:,
        # The debtor's address.
        debtor_address:,
        # The debtor's name.
        debtor_name:,
        # The amount, in minor units of `instructed_currency`, to send to the creditor.
        instructed_amount:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
        # instructed amount.
        instructed_currency:,
        # The Account Number to include in the transfer as the debtor's account number.
        source_account_number_id:,
        # Unstructured remittance information to include in the transfer.
        unstructured_remittance_information:,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The creditor's bank account routing or transit number. Required in certain
        # countries.
        routing_number: nil,
        request_options: {}
      )
      end

      # Retrieve a Swift Transfer
      sig do
        params(
          swift_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::SwiftTransfer)
      end
      def retrieve(
        # The identifier of the Swift Transfer.
        swift_transfer_id,
        request_options: {}
      )
      end

      # List Swift Transfers
      sig do
        params(
          account_id: String,
          created_at: Increase::SwiftTransferListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::SwiftTransferListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::SwiftTransfer])
      end
      def list(
        # Filter Swift Transfers to those that originated from the specified Account.
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
        status: nil,
        request_options: {}
      )
      end

      # Approve a Swift Transfer
      sig do
        params(
          swift_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::SwiftTransfer)
      end
      def approve(
        # The identifier of the Swift Transfer to approve.
        swift_transfer_id,
        request_options: {}
      )
      end

      # Cancel a pending Swift Transfer
      sig do
        params(
          swift_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::SwiftTransfer)
      end
      def cancel(
        # The identifier of the pending Swift Transfer to cancel.
        swift_transfer_id,
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
