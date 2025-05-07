# typed: strong

module Increase
  module Resources
    class PendingTransactions
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
        ).returns(Increase::Internal::Page[Increase::PendingTransaction])
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

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
