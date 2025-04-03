# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingEntrySets#create
    class BookkeepingEntrySet < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The entry set identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   When the entry set was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute date
      #   The timestamp of the entry set.
      #
      #   @return [Time]
      required :date, Time

      # @!attribute entries
      #   The entries.
      #
      #   @return [Array<Increase::Models::BookkeepingEntrySet::Entry>]
      required :entries, -> { Increase::Internal::Type::ArrayOf[Increase::Models::BookkeepingEntrySet::Entry] }

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute transaction_id
      #   The transaction identifier, if any.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `bookkeeping_entry_set`.
      #
      #   @return [Symbol, Increase::Models::BookkeepingEntrySet::Type]
      required :type, enum: -> { Increase::Models::BookkeepingEntrySet::Type }

      # @!parse
      #   # Entry Sets are accounting entries that are transactionally applied. Your
      #   #   compliance setup might require annotating money movements using this API. Learn
      #   #   more in our
      #   #   [guide to Bookkeeping](https://increase.com/documentation/bookkeeping#bookkeeping).
      #   #
      #   # @param id [String]
      #   # @param created_at [Time]
      #   # @param date [Time]
      #   # @param entries [Array<Increase::Models::BookkeepingEntrySet::Entry>]
      #   # @param idempotency_key [String, nil]
      #   # @param transaction_id [String, nil]
      #   # @param type [Symbol, Increase::Models::BookkeepingEntrySet::Type]
      #   #
      #   def initialize(id:, created_at:, date:, entries:, idempotency_key:, transaction_id:, type:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class Entry < Increase::Internal::Type::BaseModel
        # @!attribute id
        #   The entry identifier.
        #
        #   @return [String]
        required :id, String

        # @!attribute account_id
        #   The bookkeeping account impacted by the entry.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute amount
        #   The amount of the entry in minor units.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!parse
        #   # @param id [String]
        #   # @param account_id [String]
        #   # @param amount [Integer]
        #   #
        #   def initialize(id:, account_id:, amount:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_entry_set`.
      #
      # @see Increase::Models::BookkeepingEntrySet#type
      module Type
        extend Increase::Internal::Type::Enum

        BOOKKEEPING_ENTRY_SET = :bookkeeping_entry_set

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
