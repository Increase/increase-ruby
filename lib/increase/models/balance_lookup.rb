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

      # @!attribute loan
      #   The loan balances for the Account.
      #
      #   @return [Increase::Models::BalanceLookup::Loan, nil]
      required :loan, -> { Increase::BalanceLookup::Loan }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `balance_lookup`.
      #
      #   @return [Symbol, Increase::Models::BalanceLookup::Type]
      required :type, enum: -> { Increase::BalanceLookup::Type }

      # @!method initialize(account_id:, available_balance:, current_balance:, loan:, type:)
      #   Represents a request to lookup the balance of an Account at a given point in
      #   time.
      #
      #   @param account_id [String] The identifier for the account for which the balance was queried.
      #
      #   @param available_balance [Integer]
      #     The Account's available balance, representing the current balance less any open
      #     Pending Transactions on the Account.
      #
      #   @param current_balance [Integer]
      #     The Account's current balance, representing the sum of all posted Transactions
      #     on the Account.
      #
      #   @param loan [Increase::Models::BalanceLookup::Loan, nil] The loan balances for the Account.
      #
      #   @param type [Symbol, Increase::Models::BalanceLookup::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `balance_lookup`.

      # @see Increase::Models::BalanceLookup#loan
      class Loan < Increase::Internal::Type::BaseModel
        # @!attribute due_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the loan
        #   payment is due.
        #
        #   @return [Time, nil]
        required :due_at, Time, nil?: true

        # @!attribute due_balance
        #   The total amount due on the loan.
        #
        #   @return [Integer]
        required :due_balance, Integer

        # @!attribute past_due_balance
        #   The amount past due on the loan.
        #
        #   @return [Integer]
        required :past_due_balance, Integer

        # @!attribute receivables
        #   The receivables balances for the loan.
        #
        #   @return [Increase::Models::BalanceLookup::Loan::Receivables, nil]
        required :receivables, -> { Increase::BalanceLookup::Loan::Receivables }, nil?: true

        # @!method initialize(due_at:, due_balance:, past_due_balance:, receivables:)
        #   The loan balances for the Account.
        #
        #   @param due_at [Time, nil]
        #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the loan
        #     payment is due.
        #
        #   @param due_balance [Integer] The total amount due on the loan.
        #
        #   @param past_due_balance [Integer] The amount past due on the loan.
        #
        #   @param receivables [Increase::Models::BalanceLookup::Loan::Receivables, nil]
        #     The receivables balances for the loan.

        # @see Increase::Models::BalanceLookup::Loan#receivables
        class Receivables < Increase::Internal::Type::BaseModel
          # @!attribute purchasable_balance
          #   The balance of seasoned receivables available to be purchased.
          #
          #   @return [Integer]
          required :purchasable_balance, Integer

          # @!attribute purchased_balance
          #   The balance of receivables that have been purchased.
          #
          #   @return [Integer]
          required :purchased_balance, Integer

          # @!method initialize(purchasable_balance:, purchased_balance:)
          #   The receivables balances for the loan.
          #
          #   @param purchasable_balance [Integer] The balance of seasoned receivables available to be purchased.
          #
          #   @param purchased_balance [Integer] The balance of receivables that have been purchased.
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `balance_lookup`.
      #
      # @see Increase::Models::BalanceLookup#type
      module Type
        extend Increase::Internal::Type::Enum

        BALANCE_LOOKUP = :balance_lookup

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
