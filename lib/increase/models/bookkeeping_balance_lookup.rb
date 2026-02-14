# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingAccounts#balance
    class BookkeepingBalanceLookup < Increase::Internal::Type::BaseModel
      # @!attribute balance
      #   The Bookkeeping Account's current balance, representing the sum of all
      #   Bookkeeping Entries on the Bookkeeping Account.
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
      #   `bookkeeping_balance_lookup`.
      #
      #   @return [Symbol, Increase::Models::BookkeepingBalanceLookup::Type]
      required :type, enum: -> { Increase::BookkeepingBalanceLookup::Type }

      # @!method initialize(balance:, bookkeeping_account_id:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::BookkeepingBalanceLookup} for more details.
      #
      #   Represents a request to lookup the balance of a Bookkeeping Account at a given
      #   point in time.
      #
      #   @param balance [Integer] The Bookkeeping Account's current balance, representing the sum of all Bookkeepi
      #
      #   @param bookkeeping_account_id [String] The identifier for the account for which the balance was queried.
      #
      #   @param type [Symbol, Increase::Models::BookkeepingBalanceLookup::Type] A constant representing the object's type. For this resource it will always be `

      # A constant representing the object's type. For this resource it will always be
      # `bookkeeping_balance_lookup`.
      #
      # @see Increase::Models::BookkeepingBalanceLookup#type
      module Type
        extend Increase::Internal::Type::Enum

        BOOKKEEPING_BALANCE_LOOKUP = :bookkeeping_balance_lookup

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
