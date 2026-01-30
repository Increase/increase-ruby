# typed: strong

module Increase
  module Models
    class BalanceLookup < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::BalanceLookup, Increase::Internal::AnyHash)
        end

      # The identifier for the account for which the balance was queried.
      sig { returns(String) }
      attr_accessor :account_id

      # The Account's available balance, representing the current balance less any open
      # Pending Transactions on the Account.
      sig { returns(Integer) }
      attr_accessor :available_balance

      # The Account's current balance, representing the sum of all posted Transactions
      # on the Account.
      sig { returns(Integer) }
      attr_accessor :current_balance

      # The loan balances for the Account.
      sig { returns(T.nilable(Increase::BalanceLookup::Loan)) }
      attr_reader :loan

      sig do
        params(loan: T.nilable(Increase::BalanceLookup::Loan::OrHash)).void
      end
      attr_writer :loan

      # A constant representing the object's type. For this resource it will always be
      # `balance_lookup`.
      sig { returns(Increase::BalanceLookup::Type::TaggedSymbol) }
      attr_accessor :type

      # Represents a request to lookup the balance of an Account at a given point in
      # time.
      sig do
        params(
          account_id: String,
          available_balance: Integer,
          current_balance: Integer,
          loan: T.nilable(Increase::BalanceLookup::Loan::OrHash),
          type: Increase::BalanceLookup::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the account for which the balance was queried.
        account_id:,
        # The Account's available balance, representing the current balance less any open
        # Pending Transactions on the Account.
        available_balance:,
        # The Account's current balance, representing the sum of all posted Transactions
        # on the Account.
        current_balance:,
        # The loan balances for the Account.
        loan:,
        # A constant representing the object's type. For this resource it will always be
        # `balance_lookup`.
        type:
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            available_balance: Integer,
            current_balance: Integer,
            loan: T.nilable(Increase::BalanceLookup::Loan),
            type: Increase::BalanceLookup::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Loan < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::BalanceLookup::Loan, Increase::Internal::AnyHash)
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the loan
        # payment is due.
        sig { returns(T.nilable(Time)) }
        attr_accessor :due_at

        # The total amount due on the loan.
        sig { returns(Integer) }
        attr_accessor :due_balance

        # The amount past due on the loan.
        sig { returns(Integer) }
        attr_accessor :past_due_balance

        # The loan balances for the Account.
        sig do
          params(
            due_at: T.nilable(Time),
            due_balance: Integer,
            past_due_balance: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the loan
          # payment is due.
          due_at:,
          # The total amount due on the loan.
          due_balance:,
          # The amount past due on the loan.
          past_due_balance:
        )
        end

        sig do
          override.returns(
            {
              due_at: T.nilable(Time),
              due_balance: Integer,
              past_due_balance: Integer
            }
          )
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `balance_lookup`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::BalanceLookup::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BALANCE_LOOKUP =
          T.let(:balance_lookup, Increase::BalanceLookup::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::BalanceLookup::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
