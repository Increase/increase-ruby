# frozen_string_literal: true

module Increase
  module Resources
    class PendingTransactions
      # Some parameter documentations has been truncated, see
      # {Increase::Models::PendingTransactionCreateParams} for more details.
      #
      # Creates a pending transaction on an account. This can be useful to hold funds
      # for an external payment or known future transaction outside of Increase. The
      # resulting Pending Transaction will have a `category` of `user_initiated_hold`
      # and can be released via the API to unlock the held funds.
      #
      # @overload create(account_id:, amount:, description: nil, request_options: {})
      #
      # @param account_id [String] The Account to place the hold on.
      #
      # @param amount [Integer] The amount to hold in the minor unit of the account's currency. For dollars, for
      #
      # @param description [String] The description you choose to give the hold.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PendingTransaction]
      #
      # @see Increase::Models::PendingTransactionCreateParams
      def create(params)
        parsed, options = Increase::PendingTransactionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "pending_transactions",
          body: parsed,
          model: Increase::PendingTransaction,
          options: options
        )
      end

      # Retrieve a Pending Transaction
      #
      # @overload retrieve(pending_transaction_id, request_options: {})
      #
      # @param pending_transaction_id [String] The identifier of the Pending Transaction.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PendingTransaction]
      #
      # @see Increase::Models::PendingTransactionRetrieveParams
      def retrieve(pending_transaction_id, params = {})
        @client.request(
          method: :get,
          path: ["pending_transactions/%1$s", pending_transaction_id],
          model: Increase::PendingTransaction,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::PendingTransactionListParams} for more details.
      #
      # List Pending Transactions
      #
      # @overload list(account_id: nil, category: nil, created_at: nil, cursor: nil, limit: nil, route_id: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter pending transactions to those belonging to the specified Account.
      #
      # @param category [Increase::Models::PendingTransactionListParams::Category]
      #
      # @param created_at [Increase::Models::PendingTransactionListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param route_id [String] Filter pending transactions to those belonging to the specified Route.
      #
      # @param status [Increase::Models::PendingTransactionListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PendingTransactionListResponse]
      #
      # @see Increase::Models::PendingTransactionListParams
      def list(params = {})
        parsed, options = Increase::PendingTransactionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "pending_transactions",
          query: parsed,
          model: Increase::Models::PendingTransactionListResponse,
          options: options
        )
      end

      # Release a Pending Transaction you had previously created. The Pending
      # Transaction must have a `category` of `user_initiated_hold` and a `status` of
      # `pending`. This will unlock the held funds and mark the Pending Transaction as
      # complete.
      #
      # @overload release(pending_transaction_id, request_options: {})
      #
      # @param pending_transaction_id [String] The identifier of the Pending Transaction to release.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PendingTransaction]
      #
      # @see Increase::Models::PendingTransactionReleaseParams
      def release(pending_transaction_id, params = {})
        @client.request(
          method: :post,
          path: ["pending_transactions/%1$s/release", pending_transaction_id],
          model: Increase::PendingTransaction,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
