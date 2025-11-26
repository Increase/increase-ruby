# frozen_string_literal: true

module Increase
  module Resources
    class DeclinedTransactions
      # Retrieve a Declined Transaction
      #
      # @overload retrieve(declined_transaction_id, request_options: {})
      #
      # @param declined_transaction_id [String] The identifier of the Declined Transaction.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DeclinedTransaction]
      #
      # @see Increase::Models::DeclinedTransactionRetrieveParams
      def retrieve(declined_transaction_id, params = {})
        @client.request(
          method: :get,
          path: ["declined_transactions/%1$s", declined_transaction_id],
          model: Increase::DeclinedTransaction,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::DeclinedTransactionListParams} for more details.
      #
      # List Declined Transactions
      #
      # @overload list(account_id: nil, category: nil, created_at: nil, cursor: nil, limit: nil, route_id: nil, request_options: {})
      #
      # @param account_id [String] Filter Declined Transactions to ones belonging to the specified Account.
      #
      # @param category [Increase::Models::DeclinedTransactionListParams::Category]
      #
      # @param created_at [Increase::Models::DeclinedTransactionListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param route_id [String] Filter Declined Transactions to those belonging to the specified route.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::DeclinedTransaction>]
      #
      # @see Increase::Models::DeclinedTransactionListParams
      def list(params = {})
        parsed, options = Increase::DeclinedTransactionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "declined_transactions",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::DeclinedTransaction,
          options: options
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
