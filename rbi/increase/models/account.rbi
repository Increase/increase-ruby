# typed: strong

module Increase
  module Models
    class Account < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Account, Increase::Internal::AnyHash) }

      # The Account identifier.
      sig { returns(String) }
      attr_accessor :id

      # The bank the Account is with.
      sig { returns(Increase::Account::Bank::TaggedSymbol) }
      attr_accessor :bank

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      # was closed.
      sig { returns(T.nilable(Time)) }
      attr_accessor :closed_at

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      # was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Account
      # currency.
      sig { returns(Increase::Account::Currency::TaggedSymbol) }
      attr_accessor :currency

      # The identifier for the Entity the Account belongs to.
      sig { returns(String) }
      attr_accessor :entity_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The identifier of an Entity that, while not owning the Account, is associated
      # with its activity.
      sig { returns(T.nilable(String)) }
      attr_accessor :informational_entity_id

      # The interest accrued but not yet paid, expressed as a string containing a
      # floating-point value.
      sig { returns(String) }
      attr_accessor :interest_accrued

      # The latest [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which
      # interest was accrued.
      sig { returns(T.nilable(Date)) }
      attr_accessor :interest_accrued_at

      # The Interest Rate currently being earned on the account, as a string containing
      # a decimal number. For example, a 1% interest rate would be represented as
      # "0.01".
      sig { returns(String) }
      attr_accessor :interest_rate

      # The name you choose for the Account.
      sig { returns(String) }
      attr_accessor :name

      # The identifier of the Program determining the compliance and commercial terms of
      # this Account.
      sig { returns(String) }
      attr_accessor :program_id

      # The status of the Account.
      sig { returns(Increase::Account::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `account`.
      sig { returns(Increase::Account::Type::TaggedSymbol) }
      attr_accessor :type

      # Accounts are your bank accounts with Increase. They store money, receive
      # transfers, and send payments. They earn interest and have depository insurance.
      sig do
        params(
          id: String,
          bank: Increase::Account::Bank::OrSymbol,
          closed_at: T.nilable(Time),
          created_at: Time,
          currency: Increase::Account::Currency::OrSymbol,
          entity_id: String,
          idempotency_key: T.nilable(String),
          informational_entity_id: T.nilable(String),
          interest_accrued: String,
          interest_accrued_at: T.nilable(Date),
          interest_rate: String,
          name: String,
          program_id: String,
          status: Increase::Account::Status::OrSymbol,
          type: Increase::Account::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account identifier.
        id:,
        # The bank the Account is with.
        bank:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
        # was closed.
        closed_at:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
        # was created.
        created_at:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Account
        # currency.
        currency:,
        # The identifier for the Entity the Account belongs to.
        entity_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The identifier of an Entity that, while not owning the Account, is associated
        # with its activity.
        informational_entity_id:,
        # The interest accrued but not yet paid, expressed as a string containing a
        # floating-point value.
        interest_accrued:,
        # The latest [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which
        # interest was accrued.
        interest_accrued_at:,
        # The Interest Rate currently being earned on the account, as a string containing
        # a decimal number. For example, a 1% interest rate would be represented as
        # "0.01".
        interest_rate:,
        # The name you choose for the Account.
        name:,
        # The identifier of the Program determining the compliance and commercial terms of
        # this Account.
        program_id:,
        # The status of the Account.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `account`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            bank: Increase::Account::Bank::TaggedSymbol,
            closed_at: T.nilable(Time),
            created_at: Time,
            currency: Increase::Account::Currency::TaggedSymbol,
            entity_id: String,
            idempotency_key: T.nilable(String),
            informational_entity_id: T.nilable(String),
            interest_accrued: String,
            interest_accrued_at: T.nilable(Date),
            interest_rate: String,
            name: String,
            program_id: String,
            status: Increase::Account::Status::TaggedSymbol,
            type: Increase::Account::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The bank the Account is with.
      module Bank
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Account::Bank) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Core Bank
        CORE_BANK = T.let(:core_bank, Increase::Account::Bank::TaggedSymbol)

        # First Internet Bank of Indiana
        FIRST_INTERNET_BANK =
          T.let(:first_internet_bank, Increase::Account::Bank::TaggedSymbol)

        # Grasshopper Bank
        GRASSHOPPER_BANK =
          T.let(:grasshopper_bank, Increase::Account::Bank::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Account::Bank::TaggedSymbol])
        end
        def self.values
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Account
      # currency.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Account::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::Account::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::Account::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::Account::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::Account::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::Account::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::Account::Currency::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Account::Currency::TaggedSymbol])
        end
        def self.values
        end
      end

      # The status of the Account.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Account::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Closed Accounts on which no new activity can occur.
        CLOSED = T.let(:closed, Increase::Account::Status::TaggedSymbol)

        # Open Accounts that are ready to use.
        OPEN = T.let(:open, Increase::Account::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Account::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `account`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Account::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT = T.let(:account, Increase::Account::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Account::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
