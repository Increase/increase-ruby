# typed: strong

module Increase
  module Models
    class BookkeepingEntry < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::BookkeepingEntry, Increase::Internal::AnyHash)
        end

      # The entry identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account the Entry belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The Entry amount in the minor unit of its currency. For dollars, for example,
      # this is cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # When the entry set was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The identifier for the Entry Set the Entry belongs to.
      sig { returns(String) }
      attr_accessor :entry_set_id

      # A constant representing the object's type. For this resource it will always be
      # `bookkeeping_entry`.
      sig { returns(Increase::BookkeepingEntry::Type::TaggedSymbol) }
      attr_accessor :type

      # Entries are T-account entries recording debits and credits. Your compliance
      # setup might require annotating money movements using this API. Learn more in our
      # [guide to Bookkeeping](https://increase.com/documentation/bookkeeping#bookkeeping).
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          created_at: Time,
          entry_set_id: String,
          type: Increase::BookkeepingEntry::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The entry identifier.
        id:,
        # The identifier for the Account the Entry belongs to.
        account_id:,
        # The Entry amount in the minor unit of its currency. For dollars, for example,
        # this is cents.
        amount:,
        # When the entry set was created.
        created_at:,
        # The identifier for the Entry Set the Entry belongs to.
        entry_set_id:,
        # A constant representing the object's type. For this resource it will always be
        # `bookkeeping_entry`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            amount: Integer,
            created_at: Time,
            entry_set_id: String,
            type: Increase::BookkeepingEntry::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `bookkeeping_entry`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::BookkeepingEntry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BOOKKEEPING_ENTRY =
          T.let(
            :bookkeeping_entry,
            Increase::BookkeepingEntry::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::BookkeepingEntry::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
