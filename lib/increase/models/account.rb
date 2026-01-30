# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#create
    class Account < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Account identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_revenue_rate
      #   The account revenue rate currently being earned on the account, as a string
      #   containing a decimal number. For example, a 1% account revenue rate would be
      #   represented as "0.01". Account revenue is a type of non-interest income accrued
      #   on the account.
      #
      #   @return [String, nil]
      required :account_revenue_rate, String, nil?: true

      # @!attribute bank
      #   The bank the Account is with.
      #
      #   @return [Symbol, Increase::Models::Account::Bank]
      required :bank, enum: -> { Increase::Account::Bank }

      # @!attribute closed_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #   was closed.
      #
      #   @return [Time, nil]
      required :closed_at, Time, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #   was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Account
      #   currency.
      #
      #   @return [Symbol, Increase::Models::Account::Currency]
      required :currency, enum: -> { Increase::Account::Currency }

      # @!attribute entity_id
      #   The identifier for the Entity the Account belongs to.
      #
      #   @return [String]
      required :entity_id, String

      # @!attribute funding
      #   Whether the Account is funded by a loan or by deposits.
      #
      #   @return [Symbol, Increase::Models::Account::Funding, nil]
      required :funding, enum: -> { Increase::Account::Funding }, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute informational_entity_id
      #   The identifier of an Entity that, while not owning the Account, is associated
      #   with its activity.
      #
      #   @return [String, nil]
      required :informational_entity_id, String, nil?: true

      # @!attribute interest_accrued
      #   The interest accrued but not yet paid, expressed as a string containing a
      #   floating-point value.
      #
      #   @return [String]
      required :interest_accrued, String

      # @!attribute interest_accrued_at
      #   The latest [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which
      #   interest was accrued.
      #
      #   @return [Date, nil]
      required :interest_accrued_at, Date, nil?: true

      # @!attribute interest_rate
      #   The interest rate currently being earned on the account, as a string containing
      #   a decimal number. For example, a 1% interest rate would be represented as
      #   "0.01".
      #
      #   @return [String]
      required :interest_rate, String

      # @!attribute loan
      #   The Account's loan-related information, if the Account is a loan account.
      #
      #   @return [Increase::Models::Account::Loan, nil]
      required :loan, -> { Increase::Account::Loan }, nil?: true

      # @!attribute name
      #   The name you choose for the Account.
      #
      #   @return [String]
      required :name, String

      # @!attribute program_id
      #   The identifier of the Program determining the compliance and commercial terms of
      #   this Account.
      #
      #   @return [String]
      required :program_id, String

      # @!attribute status
      #   The status of the Account.
      #
      #   @return [Symbol, Increase::Models::Account::Status]
      required :status, enum: -> { Increase::Account::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `account`.
      #
      #   @return [Symbol, Increase::Models::Account::Type]
      required :type, enum: -> { Increase::Account::Type }

      # @!method initialize(id:, account_revenue_rate:, bank:, closed_at:, created_at:, currency:, entity_id:, funding:, idempotency_key:, informational_entity_id:, interest_accrued:, interest_accrued_at:, interest_rate:, loan:, name:, program_id:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::Account} for more details.
      #
      #   Accounts are your bank accounts with Increase. They store money, receive
      #   transfers, and send payments. They earn interest and have depository insurance.
      #
      #   @param id [String] The Account identifier.
      #
      #   @param account_revenue_rate [String, nil] The account revenue rate currently being earned on the account, as a string cont
      #
      #   @param bank [Symbol, Increase::Models::Account::Bank] The bank the Account is with.
      #
      #   @param closed_at [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #
      #   @param currency [Symbol, Increase::Models::Account::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Account curr
      #
      #   @param entity_id [String] The identifier for the Entity the Account belongs to.
      #
      #   @param funding [Symbol, Increase::Models::Account::Funding, nil] Whether the Account is funded by a loan or by deposits.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param informational_entity_id [String, nil] The identifier of an Entity that, while not owning the Account, is associated wi
      #
      #   @param interest_accrued [String] The interest accrued but not yet paid, expressed as a string containing a floati
      #
      #   @param interest_accrued_at [Date, nil] The latest [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which inte
      #
      #   @param interest_rate [String] The interest rate currently being earned on the account, as a string containing
      #
      #   @param loan [Increase::Models::Account::Loan, nil] The Account's loan-related information, if the Account is a loan account.
      #
      #   @param name [String] The name you choose for the Account.
      #
      #   @param program_id [String] The identifier of the Program determining the compliance and commercial terms of
      #
      #   @param status [Symbol, Increase::Models::Account::Status] The status of the Account.
      #
      #   @param type [Symbol, Increase::Models::Account::Type] A constant representing the object's type. For this resource it will always be `

      # The bank the Account is with.
      #
      # @see Increase::Models::Account#bank
      module Bank
        extend Increase::Internal::Type::Enum

        # Core Bank
        CORE_BANK = :core_bank

        # First Internet Bank of Indiana
        FIRST_INTERNET_BANK = :first_internet_bank

        # Grasshopper Bank
        GRASSHOPPER_BANK = :grasshopper_bank

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Account
      # currency.
      #
      # @see Increase::Models::Account#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Whether the Account is funded by a loan or by deposits.
      #
      # @see Increase::Models::Account#funding
      module Funding
        extend Increase::Internal::Type::Enum

        # An account funded by a loan. Before opening a loan account, contact support@increase.com to set up a loan program.
        LOAN = :loan

        # An account funded by deposits.
        DEPOSITS = :deposits

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::Account#loan
      class Loan < Increase::Internal::Type::BaseModel
        # @!attribute credit_limit
        #   The maximum amount of money that can be borrowed on the Account.
        #
        #   @return [Integer]
        required :credit_limit, Integer

        # @!attribute grace_period_days
        #   The number of days after the statement date that the Account can be past due
        #   before being considered delinquent.
        #
        #   @return [Integer]
        required :grace_period_days, Integer

        # @!attribute maturity_date
        #   The date on which the loan matures.
        #
        #   @return [Date, nil]
        required :maturity_date, Date, nil?: true

        # @!attribute statement_day_of_month
        #   The day of the month on which the loan statement is generated.
        #
        #   @return [Integer]
        required :statement_day_of_month, Integer

        # @!attribute statement_payment_type
        #   The type of payment for the loan.
        #
        #   @return [Symbol, Increase::Models::Account::Loan::StatementPaymentType]
        required :statement_payment_type, enum: -> { Increase::Account::Loan::StatementPaymentType }

        # @!method initialize(credit_limit:, grace_period_days:, maturity_date:, statement_day_of_month:, statement_payment_type:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Account::Loan} for more details.
        #
        #   The Account's loan-related information, if the Account is a loan account.
        #
        #   @param credit_limit [Integer] The maximum amount of money that can be borrowed on the Account.
        #
        #   @param grace_period_days [Integer] The number of days after the statement date that the Account can be past due bef
        #
        #   @param maturity_date [Date, nil] The date on which the loan matures.
        #
        #   @param statement_day_of_month [Integer] The day of the month on which the loan statement is generated.
        #
        #   @param statement_payment_type [Symbol, Increase::Models::Account::Loan::StatementPaymentType] The type of payment for the loan.

        # The type of payment for the loan.
        #
        # @see Increase::Models::Account::Loan#statement_payment_type
        module StatementPaymentType
          extend Increase::Internal::Type::Enum

          # The borrower must pay the full balance of the loan at the end of the statement period.
          BALANCE = :balance

          # The borrower must pay the accrued interest at the end of the statement period.
          INTEREST_UNTIL_MATURITY = :interest_until_maturity

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The status of the Account.
      #
      # @see Increase::Models::Account#status
      module Status
        extend Increase::Internal::Type::Enum

        # Closed Accounts on which no new activity can occur.
        CLOSED = :closed

        # Open Accounts that are ready to use.
        OPEN = :open

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `account`.
      #
      # @see Increase::Models::Account#type
      module Type
        extend Increase::Internal::Type::Enum

        ACCOUNT = :account

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
