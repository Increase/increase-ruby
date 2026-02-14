# typed: strong

module Increase
  module Models
    class BookkeepingBalanceLookup < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::BookkeepingBalanceLookup, Increase::Internal::AnyHash)
        end

      # The Bookkeeping Account's current balance, representing the sum of all
      # Bookkeeping Entries on the Bookkeeping Account.
      sig { returns(Integer) }
      attr_accessor :balance

      # The identifier for the account for which the balance was queried.
      sig { returns(String) }
      attr_accessor :bookkeeping_account_id

      # A constant representing the object's type. For this resource it will always be
      # `bookkeeping_balance_lookup`.
      sig { returns(Increase::BookkeepingBalanceLookup::Type::TaggedSymbol) }
      attr_accessor :type

      # Represents a request to lookup the balance of a Bookkeeping Account at a given
      # point in time.
      sig do
        params(
          balance: Integer,
          bookkeeping_account_id: String,
          type: Increase::BookkeepingBalanceLookup::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Bookkeeping Account's current balance, representing the sum of all
        # Bookkeeping Entries on the Bookkeeping Account.
        balance:,
        # The identifier for the account for which the balance was queried.
        bookkeeping_account_id:,
        # A constant representing the object's type. For this resource it will always be
        # `bookkeeping_balance_lookup`.
        type:
      )
      end

      sig do
        override.returns(
          {
            balance: Integer,
            bookkeeping_account_id: String,
            type: Increase::BookkeepingBalanceLookup::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `bookkeeping_balance_lookup`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::BookkeepingBalanceLookup::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BOOKKEEPING_BALANCE_LOOKUP =
          T.let(
            :bookkeeping_balance_lookup,
            Increase::BookkeepingBalanceLookup::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::BookkeepingBalanceLookup::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
