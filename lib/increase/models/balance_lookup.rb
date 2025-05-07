# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#balance
    class BalanceLookup < Increase::Internal::Type::BaseModel
      # @!attribute account_id
      #   The identifier for the account for which the balance was queried.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute available_balance
      #   The Account's available balance, representing the current balance less any open
      #   Pending Transactions on the Account.
      #
      #   @return [Integer]
      required :available_balance, Integer

      # @!attribute current_balance
      #   The Account's current balance, representing the sum of all posted Transactions
      #   on the Account.
      #
      #   @return [Integer]
      required :current_balance, Integer

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `balance_lookup`.
      #
      #   @return [Symbol, Increase::BalanceLookup::Type]
      required :type, enum: -> { Increase::BalanceLookup::Type }

      # @!method initialize(account_id:, available_balance:, current_balance:, type:)
      #   Some parameter documentations has been truncated, see {Increase::BalanceLookup}
      #   for more details.
      #
      #   Represents a request to lookup the balance of an Account at a given point in
      #   time.
      #
      #   @param account_id [String] The identifier for the account for which the balance was queried.
      #
      #   @param available_balance [Integer] The Account's available balance, representing the current balance less any open
      #
      #   @param current_balance [Integer] The Account's current balance, representing the sum of all posted Transactions o
      #
      #   @param type [Symbol, Increase::BalanceLookup::Type] A constant representing the object's type. For this resource it will always be `

      # A constant representing the object's type. For this resource it will always be
      # `balance_lookup`.
      #
      # @see Increase::BalanceLookup#type
      module Type
        extend Increase::Internal::Type::Enum

        BALANCE_LOOKUP = :balance_lookup

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
