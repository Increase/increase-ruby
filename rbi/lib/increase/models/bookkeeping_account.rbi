# typed: strong

module Increase
  module Models
    class BookkeepingAccount < Increase::Internal::Type::BaseModel
      # The account identifier.
      sig { returns(String) }
      attr_accessor :id

      # The API Account associated with this bookkeeping account.
      sig { returns(T.nilable(String)) }
      attr_accessor :account_id

      # The compliance category of the account.
      sig { returns(T.nilable(Increase::Models::BookkeepingAccount::ComplianceCategory::TaggedSymbol)) }
      attr_accessor :compliance_category

      # The Entity associated with this bookkeeping account.
      sig { returns(T.nilable(String)) }
      attr_accessor :entity_id

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The name you choose for the account.
      sig { returns(String) }
      attr_accessor :name

      # A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_account`.
      sig { returns(Increase::Models::BookkeepingAccount::Type::TaggedSymbol) }
      attr_accessor :type

      # Accounts are T-accounts. They can store accounting entries. Your compliance
      #   setup might require annotating money movements using this API. Learn more in our
      #   [guide to Bookkeeping](https://increase.com/documentation/bookkeeping#bookkeeping).
      sig do
        params(
          id: String,
          account_id: T.nilable(String),
          compliance_category: T.nilable(Increase::Models::BookkeepingAccount::ComplianceCategory::OrSymbol),
          entity_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          name: String,
          type: Increase::Models::BookkeepingAccount::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(id:, account_id:, compliance_category:, entity_id:, idempotency_key:, name:, type:)
      end

      sig do
        override
          .returns(
            {
              id: String,
              account_id: T.nilable(String),
              compliance_category: T.nilable(Increase::Models::BookkeepingAccount::ComplianceCategory::TaggedSymbol),
              entity_id: T.nilable(String),
              idempotency_key: T.nilable(String),
              name: String,
              type: Increase::Models::BookkeepingAccount::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      # The compliance category of the account.
      module ComplianceCategory
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::BookkeepingAccount::ComplianceCategory) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::BookkeepingAccount::ComplianceCategory::TaggedSymbol) }

        # A cash in an commingled Increase Account.
        COMMINGLED_CASH =
          T.let(:commingled_cash, Increase::Models::BookkeepingAccount::ComplianceCategory::TaggedSymbol)

        # A customer balance.
        CUSTOMER_BALANCE =
          T.let(:customer_balance, Increase::Models::BookkeepingAccount::ComplianceCategory::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::BookkeepingAccount::ComplianceCategory::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_account`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::BookkeepingAccount::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::BookkeepingAccount::Type::TaggedSymbol) }

        BOOKKEEPING_ACCOUNT =
          T.let(:bookkeeping_account, Increase::Models::BookkeepingAccount::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::BookkeepingAccount::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
