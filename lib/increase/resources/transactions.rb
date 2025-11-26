# frozen_string_literal: true

module Increase
  module Resources
    class Transactions
      # Retrieve a Transaction
      #
      # @overload retrieve(transaction_id, request_options: {})
      #
      # @param transaction_id [String] The identifier of the Transaction to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Transaction]
      #
      # @see Increase::Models::TransactionRetrieveParams
      def retrieve(transaction_id, params = {})
        @client.request(
          method: :get,
          path: ["transactions/%1$s", transaction_id],
          model: Increase::Transaction,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::TransactionListParams} for more details.
      #
      # List Transactions
      #
      # @overload list(account_id: nil, category: nil, created_at: nil, cursor: nil, limit: nil, route_id: nil, request_options: {})
      #
      # @param account_id [String] Filter Transactions for those belonging to the specified Account.
      #
      # @param category [Increase::Models::TransactionListParams::Category]
      #
      # @param created_at [Increase::Models::TransactionListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param route_id [String] Filter Transactions for those belonging to the specified route. This could be a
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::Transaction>]
      #
      # @see Increase::Models::TransactionListParams
      def list(params = {})
        parsed, options = Increase::TransactionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "transactions",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Transaction,
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
