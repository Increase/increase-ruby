# typed: strong

module Increase
  module Resources
    class BookkeepingEntries
      # Retrieve a Bookkeeping Entry
      sig do
        params(
          bookkeeping_entry_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::BookkeepingEntry)
      end
      def retrieve(
        # The identifier of the Bookkeeping Entry.
        bookkeeping_entry_id,
        request_options: {}
      )
      end

      # List Bookkeeping Entries
      sig do
        params(
          account_id: String,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::BookkeepingEntryListResponse)
      end
      def list(
        # The identifier for the Bookkeeping Account to filter by.
        account_id: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
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
