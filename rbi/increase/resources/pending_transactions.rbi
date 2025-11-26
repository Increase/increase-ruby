# typed: strong

module Increase
  module Resources
    class PendingTransactions
      # Creates a pending transaction on an account. This can be useful to hold funds
      # for an external payment or known future transaction outside of Increase. The
      # resulting Pending Transaction will have a `category` of `user_initiated_hold`
      # and can be released via the API to unlock the held funds.
      sig do
        params(
          account_id: String,
          amount: Integer,
          description: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PendingTransaction)
      end
      def create(
        # The Account to place the hold on.
        account_id:,
        # The amount to hold in the minor unit of the account's currency. For dollars, for
        # example, this is cents. This should be a negative amount - to hold $1.00 from
        # the account, you would pass -100.
        amount:,
        # The description you choose to give the hold.
        description: nil,
        request_options: {}
      )
      end

      # Retrieve a Pending Transaction
      sig do
        params(
          pending_transaction_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PendingTransaction)
      end
      def retrieve(
        # The identifier of the Pending Transaction.
        pending_transaction_id,
        request_options: {}
      )
      end

      # List Pending Transactions
      sig do
        params(
          account_id: String,
          category: Increase::PendingTransactionListParams::Category::OrHash,
          created_at: Increase::PendingTransactionListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          route_id: String,
          status: Increase::PendingTransactionListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::PendingTransactionListResponse)
      end
      def list(
        # Filter pending transactions to those belonging to the specified Account.
        account_id: nil,
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        # Filter pending transactions to those belonging to the specified Route.
        route_id: nil,
        status: nil,
        request_options: {}
      )
      end

      # Release a Pending Transaction you had previously created. The Pending
      # Transaction must have a `category` of `user_initiated_hold` and a `status` of
      # `pending`. This will unlock the held funds and mark the Pending Transaction as
      # complete.
      sig do
        params(
          pending_transaction_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PendingTransaction)
      end
      def release(
        # The identifier of the Pending Transaction to release.
        pending_transaction_id,
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
