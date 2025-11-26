# typed: strong

module Increase
  module Resources
    class BookkeepingEntrySets
      # Create a Bookkeeping Entry Set
      sig do
        params(
          entries:
            T::Array[Increase::BookkeepingEntrySetCreateParams::Entry::OrHash],
          date: Time,
          transaction_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::BookkeepingEntrySet)
      end
      def create(
        # The bookkeeping entries.
        entries:,
        # The date of the transaction. Optional if `transaction_id` is provided, in which
        # case we use the `date` of that transaction. Required otherwise.
        date: nil,
        # The identifier of the Transaction related to this entry set, if any.
        transaction_id: nil,
        request_options: {}
      )
      end

      # Retrieve a Bookkeeping Entry Set
      sig do
        params(
          bookkeeping_entry_set_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::BookkeepingEntrySet)
      end
      def retrieve(
        # The identifier of the Bookkeeping Entry Set.
        bookkeeping_entry_set_id,
        request_options: {}
      )
      end

      # List Bookkeeping Entry Sets
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          transaction_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::BookkeepingEntrySetListResponse)
      end
      def list(
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        # Filter to the Bookkeeping Entry Set that maps to this Transaction.
        transaction_id: nil,
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
