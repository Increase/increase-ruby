# typed: strong

module Increase
  module Resources
    class WireTransfers
      # Create a Wire Transfer
      sig do
        params(
          account_id: String,
          amount: Integer,
          beneficiary_name: String,
          message_to_recipient: String,
          account_number: String,
          beneficiary_address_line1: String,
          beneficiary_address_line2: String,
          beneficiary_address_line3: String,
          external_account_id: String,
          inbound_wire_drawdown_request_id: String,
          originator_address_line1: String,
          originator_address_line2: String,
          originator_address_line3: String,
          originator_name: String,
          require_approval: T::Boolean,
          routing_number: String,
          source_account_number_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::WireTransfer)
      end
      def create(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The transfer amount in USD cents.
        amount:,
        # The beneficiary's name.
        beneficiary_name:,
        # The message that will show on the recipient's bank statement.
        message_to_recipient:,
        # The account number for the destination account.
        account_number: nil,
        # The beneficiary's address line 1.
        beneficiary_address_line1: nil,
        # The beneficiary's address line 2.
        beneficiary_address_line2: nil,
        # The beneficiary's address line 3.
        beneficiary_address_line3: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number` and `routing_number` must be absent.
        external_account_id: nil,
        # The ID of an Inbound Wire Drawdown Request in response to which this transfer is
        # being sent.
        inbound_wire_drawdown_request_id: nil,
        # The originator's address line 1. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line1: nil,
        # The originator's address line 2. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line2: nil,
        # The originator's address line 3. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line3: nil,
        # The originator's name. This is only necessary if you're transferring from a
        # commingled account. Otherwise, we'll use the associated entity's details.
        originator_name: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
        # destination account.
        routing_number: nil,
        # The ID of an Account Number that will be passed to the wire's recipient
        source_account_number_id: nil,
        request_options: {}
      )
      end

      # Retrieve a Wire Transfer
      sig do
        params(
          wire_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::WireTransfer)
      end
      def retrieve(
        # The identifier of the Wire Transfer.
        wire_transfer_id,
        request_options: {}
      )
      end

      # List Wire Transfers
      sig do
        params(
          account_id: String,
          created_at: Increase::WireTransferListParams::CreatedAt::OrHash,
          cursor: String,
          external_account_id: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::WireTransfer])
      end
      def list(
        # Filter Wire Transfers to those belonging to the specified Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter Wire Transfers to those made to the specified External Account.
        external_account_id: nil,
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

      # Approve a Wire Transfer
      sig do
        params(
          wire_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::WireTransfer)
      end
      def approve(
        # The identifier of the Wire Transfer to approve.
        wire_transfer_id,
        request_options: {}
      )
      end

      # Cancel a pending Wire Transfer
      sig do
        params(
          wire_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::WireTransfer)
      end
      def cancel(
        # The identifier of the pending Wire Transfer to cancel.
        wire_transfer_id,
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
