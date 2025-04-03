# typed: strong

module Increase
  module Resources
    class DeclinedTransactions
      # Retrieve a Declined Transaction
      sig do
        params(
          declined_transaction_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::DeclinedTransaction)
      end
      def retrieve(
        # The identifier of the Declined Transaction.
        declined_transaction_id,
        request_options: {}
      )
      end

      # List Declined Transactions
      sig do
        params(
          account_id: String,
          category: T.any(Increase::Models::DeclinedTransactionListParams::Category, Increase::Internal::AnyHash),
          created_at: T.any(Increase::Models::DeclinedTransactionListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          route_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::DeclinedTransaction])
      end
      def list(
        # Filter Declined Transactions to ones belonging to the specified Account.
        account_id: nil,
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
        # Filter Declined Transactions to those belonging to the specified route.
        route_id: nil,
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
