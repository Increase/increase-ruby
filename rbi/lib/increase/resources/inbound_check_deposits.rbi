# typed: strong

module Increase
  module Resources
    class InboundCheckDeposits
      # Retrieve an Inbound Check Deposit
      sig do
        params(
          inbound_check_deposit_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::InboundCheckDeposit)
      end
      def retrieve(
        # The identifier of the Inbound Check Deposit to get details for.
        inbound_check_deposit_id,
        request_options: {}
      )
      end

      # List Inbound Check Deposits
      sig do
        params(
          account_id: String,
          check_transfer_id: String,
          created_at: T.any(Increase::Models::InboundCheckDepositListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::InboundCheckDeposit])
      end
      def list(
        # Filter Inbound Check Deposits to those belonging to the specified Account.
        account_id: nil,
        # Filter Inbound Check Deposits to those belonging to the specified Check
        #   Transfer.
        check_transfer_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
        request_options: {}
      )
      end

      # Decline an Inbound Check Deposit
      sig do
        params(
          inbound_check_deposit_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::InboundCheckDeposit)
      end
      def decline(
        # The identifier of the Inbound Check Deposit to decline.
        inbound_check_deposit_id,
        request_options: {}
      )
      end

      # Return an Inbound Check Deposit
      sig do
        params(
          inbound_check_deposit_id: String,
          reason: Increase::Models::InboundCheckDepositReturnParams::Reason::OrSymbol,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::InboundCheckDeposit)
      end
      def return_(
        # The identifier of the Inbound Check Deposit to return.
        inbound_check_deposit_id,
        # The reason to return the Inbound Check Deposit.
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
