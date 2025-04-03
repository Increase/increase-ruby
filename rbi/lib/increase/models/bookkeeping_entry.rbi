# typed: strong

module Increase
  module Models
    class BookkeepingEntry < Increase::Internal::Type::BaseModel
      # The entry identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account the Entry belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The Entry amount in the minor unit of its currency. For dollars, for example,
      #   this is cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # When the entry set was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The identifier for the Account the Entry belongs to.
      sig { returns(String) }
      attr_accessor :entry_set_id

      # A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_entry`.
      sig { returns(Increase::Models::BookkeepingEntry::Type::TaggedSymbol) }
      attr_accessor :type

      # Entries are T-account entries recording debits and credits. Your compliance
      #   setup might require annotating money movements using this API. Learn more in our
      #   [guide to Bookkeeping](https://increase.com/documentation/bookkeeping#bookkeeping).
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          created_at: Time,
          entry_set_id: String,
          type: Increase::Models::BookkeepingEntry::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(id:, account_id:, amount:, created_at:, entry_set_id:, type:)
      end

      sig do
        override
          .returns(
            {
              id: String,
              account_id: String,
              amount: Integer,
              created_at: Time,
              entry_set_id: String,
              type: Increase::Models::BookkeepingEntry::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_entry`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::BookkeepingEntry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::BookkeepingEntry::Type::TaggedSymbol) }

        BOOKKEEPING_ENTRY = T.let(:bookkeeping_entry, Increase::Models::BookkeepingEntry::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::BookkeepingEntry::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
