# typed: strong

module Increase
  module Models
    class Account < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Account, Increase::Internal::AnyHash) }

      # The Account identifier.
      sig { returns(String) }
      attr_accessor :id

      # The account revenue rate currently being earned on the account, as a string
      # containing a decimal number. For example, a 1% account revenue rate would be
      # represented as "0.01". Account revenue is a type of non-interest income accrued
      # on the account.
      sig { returns(T.nilable(String)) }
      attr_accessor :account_revenue_rate

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

      # Whether the Account is funded by a loan or by deposits.
      sig { returns(T.nilable(Increase::Account::Funding::TaggedSymbol)) }
      attr_accessor :funding

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

      # The interest rate currently being earned on the account, as a string containing
      # a decimal number. For example, a 1% interest rate would be represented as
      # "0.01".
      sig { returns(String) }
      attr_accessor :interest_rate

      # The Account's loan-related information, if the Account is a loan account.
      sig { returns(T.nilable(Increase::Account::Loan)) }
      attr_reader :loan

      sig { params(loan: T.nilable(Increase::Account::Loan::OrHash)).void }
      attr_writer :loan

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
          account_revenue_rate: T.nilable(String),
          bank: Increase::Account::Bank::OrSymbol,
          closed_at: T.nilable(Time),
          created_at: Time,
          currency: Increase::Account::Currency::OrSymbol,
          entity_id: String,
          funding: T.nilable(Increase::Account::Funding::OrSymbol),
          idempotency_key: T.nilable(String),
          informational_entity_id: T.nilable(String),
          interest_accrued: String,
          interest_accrued_at: T.nilable(Date),
          interest_rate: String,
          loan: T.nilable(Increase::Account::Loan::OrHash),
          name: String,
          program_id: String,
          status: Increase::Account::Status::OrSymbol,
          type: Increase::Account::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account identifier.
        id:,
        # The account revenue rate currently being earned on the account, as a string
        # containing a decimal number. For example, a 1% account revenue rate would be
        # represented as "0.01". Account revenue is a type of non-interest income accrued
        # on the account.
        account_revenue_rate:,
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
        # Whether the Account is funded by a loan or by deposits.
        funding:,
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
        # The interest rate currently being earned on the account, as a string containing
        # a decimal number. For example, a 1% interest rate would be represented as
        # "0.01".
        interest_rate:,
        # The Account's loan-related information, if the Account is a loan account.
        loan:,
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
            account_revenue_rate: T.nilable(String),
            bank: Increase::Account::Bank::TaggedSymbol,
            closed_at: T.nilable(Time),
            created_at: Time,
            currency: Increase::Account::Currency::TaggedSymbol,
            entity_id: String,
            funding: T.nilable(Increase::Account::Funding::TaggedSymbol),
            idempotency_key: T.nilable(String),
            informational_entity_id: T.nilable(String),
            interest_accrued: String,
            interest_accrued_at: T.nilable(Date),
            interest_rate: String,
            loan: T.nilable(Increase::Account::Loan),
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

        # US Dollar (USD)
        USD = T.let(:USD, Increase::Account::Currency::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Account::Currency::TaggedSymbol])
        end
        def self.values
        end
      end

      # Whether the Account is funded by a loan or by deposits.
      module Funding
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Account::Funding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # An account funded by a loan. Before opening a loan account, contact support@increase.com to set up a loan program.
        LOAN = T.let(:loan, Increase::Account::Funding::TaggedSymbol)

        # An account funded by deposits.
        DEPOSITS = T.let(:deposits, Increase::Account::Funding::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Account::Funding::TaggedSymbol])
        end
        def self.values
        end
      end

      class Loan < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Account::Loan, Increase::Internal::AnyHash)
          end

        # The maximum amount of money that can be borrowed on the Account.
        sig { returns(Integer) }
        attr_accessor :credit_limit

        # The number of days after the statement date that the Account can be past due
        # before being considered delinquent.
        sig { returns(Integer) }
        attr_accessor :grace_period_days

        # The date on which the loan matures.
        sig { returns(T.nilable(Date)) }
        attr_accessor :maturity_date

        # The day of the month on which the loan statement is generated.
        sig { returns(Integer) }
        attr_accessor :statement_day_of_month

        # The type of payment for the loan.
        sig do
          returns(Increase::Account::Loan::StatementPaymentType::TaggedSymbol)
        end
        attr_accessor :statement_payment_type

        # The Account's loan-related information, if the Account is a loan account.
        sig do
          params(
            credit_limit: Integer,
            grace_period_days: Integer,
            maturity_date: T.nilable(Date),
            statement_day_of_month: Integer,
            statement_payment_type:
              Increase::Account::Loan::StatementPaymentType::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The maximum amount of money that can be borrowed on the Account.
          credit_limit:,
          # The number of days after the statement date that the Account can be past due
          # before being considered delinquent.
          grace_period_days:,
          # The date on which the loan matures.
          maturity_date:,
          # The day of the month on which the loan statement is generated.
          statement_day_of_month:,
          # The type of payment for the loan.
          statement_payment_type:
        )
        end

        sig do
          override.returns(
            {
              credit_limit: Integer,
              grace_period_days: Integer,
              maturity_date: T.nilable(Date),
              statement_day_of_month: Integer,
              statement_payment_type:
                Increase::Account::Loan::StatementPaymentType::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The type of payment for the loan.
        module StatementPaymentType
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::Account::Loan::StatementPaymentType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The borrower must pay the full balance of the loan at the end of the statement period.
          BALANCE =
            T.let(
              :balance,
              Increase::Account::Loan::StatementPaymentType::TaggedSymbol
            )

          # The borrower must pay the accrued interest at the end of the statement period.
          INTEREST_UNTIL_MATURITY =
            T.let(
              :interest_until_maturity,
              Increase::Account::Loan::StatementPaymentType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Account::Loan::StatementPaymentType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
