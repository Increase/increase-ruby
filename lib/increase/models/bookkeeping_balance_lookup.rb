# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingAccounts#balance
    class BookkeepingBalanceLookup < Increase::Internal::Type::BaseModel
      # @!attribute balance
      #   The Bookkeeping Account's current balance, representing the sum of all
      #     Bookkeeping Entries on the Bookkeeping Account.
      #
      #   @return [Integer]
      required :balance, Integer

      # @!attribute bookkeeping_account_id
      #   The identifier for the account for which the balance was queried.
      #
      #   @return [String]
      required :bookkeeping_account_id, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `bookkeeping_balance_lookup`.
      #
      #   @return [Symbol, Increase::Models::BookkeepingBalanceLookup::Type]
      required :type, enum: -> { Increase::Models::BookkeepingBalanceLookup::Type }

      # @!parse
      #   # Represents a request to lookup the balance of an Bookkeeping Account at a given
      #   #   point in time.
      #   #
      #   # @param balance [Integer]
      #   # @param bookkeeping_account_id [String]
      #   # @param type [Symbol, Increase::Models::BookkeepingBalanceLookup::Type]
      #   #
      #   def initialize(balance:, bookkeeping_account_id:, type:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_balance_lookup`.
      #
      # @see Increase::Models::BookkeepingBalanceLookup#type
      module Type
        extend Increase::Internal::Type::Enum

        BOOKKEEPING_BALANCE_LOOKUP = :bookkeeping_balance_lookup

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
