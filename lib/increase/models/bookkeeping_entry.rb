# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingEntries#retrieve
    class BookkeepingEntry < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The entry identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the Account the Entry belongs to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The Entry amount in the minor unit of its currency. For dollars, for example,
      #     this is cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute created_at
      #   When the entry set was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute entry_set_id
      #   The identifier for the Account the Entry belongs to.
      #
      #   @return [String]
      required :entry_set_id, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `bookkeeping_entry`.
      #
      #   @return [Symbol, Increase::Models::BookkeepingEntry::Type]
      required :type, enum: -> { Increase::Models::BookkeepingEntry::Type }

      # @!parse
      #   # Entries are T-account entries recording debits and credits. Your compliance
      #   #   setup might require annotating money movements using this API. Learn more in our
      #   #   [guide to Bookkeeping](https://increase.com/documentation/bookkeeping#bookkeeping).
      #   #
      #   # @param id [String]
      #   # @param account_id [String]
      #   # @param amount [Integer]
      #   # @param created_at [Time]
      #   # @param entry_set_id [String]
      #   # @param type [Symbol, Increase::Models::BookkeepingEntry::Type]
      #   #
      #   def initialize(id:, account_id:, amount:, created_at:, entry_set_id:, type:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_entry`.
      #
      # @see Increase::Models::BookkeepingEntry#type
      module Type
        extend Increase::Internal::Type::Enum

        BOOKKEEPING_ENTRY = :bookkeeping_entry

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
