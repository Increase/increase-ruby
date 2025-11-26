# frozen_string_literal: true

module Increase
  module Resources
    class BookkeepingEntries
      # Retrieve a Bookkeeping Entry
      #
      # @overload retrieve(bookkeeping_entry_id, request_options: {})
      #
      # @param bookkeeping_entry_id [String] The identifier of the Bookkeeping Entry.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BookkeepingEntry]
      #
      # @see Increase::Models::BookkeepingEntryRetrieveParams
      def retrieve(bookkeeping_entry_id, params = {})
        @client.request(
          method: :get,
          path: ["bookkeeping_entries/%1$s", bookkeeping_entry_id],
          model: Increase::BookkeepingEntry,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::BookkeepingEntryListParams} for more details.
      #
      # List Bookkeeping Entries
      #
      # @overload list(account_id: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param account_id [String] The identifier for the Bookkeeping Account to filter by.
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BookkeepingEntryListResponse]
      #
      # @see Increase::Models::BookkeepingEntryListParams
      def list(params = {})
        parsed, options = Increase::BookkeepingEntryListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "bookkeeping_entries",
          query: parsed,
          model: Increase::Models::BookkeepingEntryListResponse,
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
