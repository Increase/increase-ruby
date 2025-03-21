# typed: strong

module Increase
  module Resources
    class Transactions
      # Retrieve a Transaction
      sig do
        params(
          transaction_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Util::AnyHash))
        )
          .returns(Increase::Models::Transaction)
      end
      def retrieve(
        # The identifier of the Transaction to retrieve.
        transaction_id,
        request_options: {}
      )
      end

      # List Transactions
      sig do
        params(
          account_id: String,
          category: Increase::Models::TransactionListParams::Category,
          created_at: Increase::Models::TransactionListParams::CreatedAt,
          cursor: String,
          limit: Integer,
          route_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Util::AnyHash))
        )
          .returns(Increase::Page[Increase::Models::Transaction])
      end
      def list(
        # Filter Transactions for those belonging to the specified Account.
        account_id: nil,
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
        # Filter Transactions for those belonging to the specified route. This could be a
        #   Card ID or an Account Number ID.
        route_id: nil,
        request_options: {}
      )
      end

      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
