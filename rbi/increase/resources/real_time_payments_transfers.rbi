# typed: strong

module Increase
  module Resources
    class RealTimePaymentsTransfers
      # Create a Real-Time Payments Transfer
      sig do
        params(
          amount: Integer,
          creditor_name: String,
          remittance_information: String,
          source_account_number_id: String,
          debtor_name: String,
          destination_account_number: String,
          destination_routing_number: String,
          external_account_id: String,
          require_approval: T::Boolean,
          ultimate_creditor_name: String,
          ultimate_debtor_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::RealTimePaymentsTransfer)
      end
      def create(
        # The transfer amount in USD cents. For Real-Time Payments transfers, must be
        # positive.
        amount:,
        # The name of the transfer's recipient.
        creditor_name:,
        # Unstructured information that will show on the recipient's bank statement.
        remittance_information:,
        # The identifier of the Account Number from which to send the transfer.
        source_account_number_id:,
        # The name of the transfer's sender. If not provided, defaults to the name of the
        # account's entity.
        debtor_name: nil,
        # The destination account number.
        destination_account_number: nil,
        # The destination American Bankers' Association (ABA) Routing Transit Number
        # (RTN).
        destination_routing_number: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `destination_account_number` and `destination_routing_number` must be
        # absent.
        external_account_id: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The name of the ultimate recipient of the transfer. Set this if the creditor is
        # an intermediary receiving the payment for someone else.
        ultimate_creditor_name: nil,
        # The name of the ultimate sender of the transfer. Set this if the funds are being
        # sent on behalf of someone who is not the account holder at Increase.
        ultimate_debtor_name: nil,
        request_options: {}
      )
      end

      # Retrieve a Real-Time Payments Transfer
      sig do
        params(
          real_time_payments_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::RealTimePaymentsTransfer)
      end
      def retrieve(
        # The identifier of the Real-Time Payments Transfer.
        real_time_payments_transfer_id,
        request_options: {}
      )
      end

      # List Real-Time Payments Transfers
      sig do
        params(
          account_id: String,
          created_at:
            Increase::RealTimePaymentsTransferListParams::CreatedAt::OrHash,
          cursor: String,
          external_account_id: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::RealTimePaymentsTransferListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::RealTimePaymentsTransfer])
      end
      def list(
        # Filter Real-Time Payments Transfers to those belonging to the specified Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter Real-Time Payments Transfers to those made to the specified External
        # Account.
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

      # Approves an Real-Time Payments Transfer in a pending_approval state.
      sig do
        params(
          real_time_payments_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::RealTimePaymentsTransfer)
      end
      def approve(
        # The identifier of the Real-Time Payments Transfer to approve.
        real_time_payments_transfer_id,
        request_options: {}
      )
      end

      # Cancels an Real-Time Payments Transfer in a pending_approval state.
      sig do
        params(
          real_time_payments_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::RealTimePaymentsTransfer)
      end
      def cancel(
        # The identifier of the pending Real-Time Payments Transfer to cancel.
        real_time_payments_transfer_id,
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
