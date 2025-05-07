# frozen_string_literal: true

module Increase
  module Resources
    class BookkeepingEntrySets
      # Some parameter documentations has been truncated, see
      # {Increase::Models::BookkeepingEntrySetCreateParams} for more details.
      #
      # Create a Bookkeeping Entry Set
      #
      # @overload create(entries:, date: nil, transaction_id: nil, request_options: {})
      #
      # @param entries [Array<Increase::BookkeepingEntrySetCreateParams::Entry>] The bookkeeping entries.
      #
      # @param date [Time] The date of the transaction. Optional if `transaction_id` is provided, in which
      #
      # @param transaction_id [String] The identifier of the Transaction related to this entry set, if any.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::BookkeepingEntrySet]
      #
      # @see Increase::Models::BookkeepingEntrySetCreateParams
      def create(params)
        parsed, options = Increase::BookkeepingEntrySetCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "bookkeeping_entry_sets",
          body: parsed,
          model: Increase::BookkeepingEntrySet,
          options: options
        )
      end

      # Retrieve a Bookkeeping Entry Set
      #
      # @overload retrieve(bookkeeping_entry_set_id, request_options: {})
      #
      # @param bookkeeping_entry_set_id [String] The identifier of the Bookkeeping Entry Set.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::BookkeepingEntrySet]
      #
      # @see Increase::Models::BookkeepingEntrySetRetrieveParams
      def retrieve(bookkeeping_entry_set_id, params = {})
        @client.request(
          method: :get,
          path: ["bookkeeping_entry_sets/%1$s", bookkeeping_entry_set_id],
          model: Increase::BookkeepingEntrySet,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::BookkeepingEntrySetListParams} for more details.
      #
      # List Bookkeeping Entry Sets
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, transaction_id: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param transaction_id [String] Filter to the Bookkeeping Entry Set that maps to this Transaction.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::BookkeepingEntrySet>]
      #
      # @see Increase::Models::BookkeepingEntrySetListParams
      def list(params = {})
        parsed, options = Increase::BookkeepingEntrySetListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "bookkeeping_entry_sets",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::BookkeepingEntrySet,
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
