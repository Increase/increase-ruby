# typed: strong

module Increase
  module Models
    class BalanceLookup < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

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
            type: Increase::BalanceLookup::Type::TaggedSymbol
          }
        )
      end
      def to_hash
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
