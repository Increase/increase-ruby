# typed: strong

module Increase
  module Models
    class BookkeepingEntrySet < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::BookkeepingEntrySet, Increase::Internal::AnyHash)
        end

      # The entry set identifier.
      sig { returns(String) }
      attr_accessor :id

      # When the entry set was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The timestamp of the entry set.
      sig { returns(Time) }
      attr_accessor :date

      # The entries.
      sig { returns(T::Array[Increase::BookkeepingEntrySet::Entry]) }
      attr_accessor :entries

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The transaction identifier, if any.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `bookkeeping_entry_set`.
      sig { returns(Increase::BookkeepingEntrySet::Type::TaggedSymbol) }
      attr_accessor :type

      # Entry Sets are accounting entries that are transactionally applied. Your
      # compliance setup might require annotating money movements using this API. Learn
      # more in our
      # [guide to Bookkeeping](https://increase.com/documentation/bookkeeping#bookkeeping).
      sig do
        params(
          id: String,
          created_at: Time,
          date: Time,
          entries: T::Array[Increase::BookkeepingEntrySet::Entry::OrHash],
          idempotency_key: T.nilable(String),
          transaction_id: T.nilable(String),
          type: Increase::BookkeepingEntrySet::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The entry set identifier.
        id:,
        # When the entry set was created.
        created_at:,
        # The timestamp of the entry set.
        date:,
        # The entries.
        entries:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The transaction identifier, if any.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `bookkeeping_entry_set`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            date: Time,
            entries: T::Array[Increase::BookkeepingEntrySet::Entry],
            idempotency_key: T.nilable(String),
            transaction_id: T.nilable(String),
            type: Increase::BookkeepingEntrySet::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Entry < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::BookkeepingEntrySet::Entry,
              Increase::Internal::AnyHash
            )
          end

        # The entry identifier.
        sig { returns(String) }
        attr_accessor :id

        # The bookkeeping account impacted by the entry.
        sig { returns(String) }
        attr_accessor :account_id

        # The amount of the entry in minor units.
        sig { returns(Integer) }
        attr_accessor :amount

        sig do
          params(id: String, account_id: String, amount: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The entry identifier.
          id:,
          # The bookkeeping account impacted by the entry.
          account_id:,
          # The amount of the entry in minor units.
          amount:
        )
        end

        sig do
          override.returns({ id: String, account_id: String, amount: Integer })
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `bookkeeping_entry_set`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::BookkeepingEntrySet::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BOOKKEEPING_ENTRY_SET =
          T.let(
            :bookkeeping_entry_set,
            Increase::BookkeepingEntrySet::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::BookkeepingEntrySet::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
