# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#create
    class AccountCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute name
      #   The name you choose for the Account.
      #
      #   @return [String]
      required :name, String

      # @!attribute entity_id
      #   The identifier for the Entity that will own the Account.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!attribute funding
      #   Whether the Account is funded by a loan or by deposits.
      #
      #   @return [Symbol, Increase::Models::AccountCreateParams::Funding, nil]
      optional :funding, enum: -> { Increase::AccountCreateParams::Funding }

      # @!attribute informational_entity_id
      #   The identifier of an Entity that, while not owning the Account, is associated
      #   with its activity. This is generally the beneficiary of the funds.
      #
      #   @return [String, nil]
      optional :informational_entity_id, String

      # @!attribute loan
      #   The loan details for the account.
      #
      #   @return [Increase::Models::AccountCreateParams::Loan, nil]
      optional :loan, -> { Increase::AccountCreateParams::Loan }

      # @!attribute program_id
      #   The identifier for the Program that this Account falls under. Required if you
      #   operate more than one Program.
      #
      #   @return [String, nil]
      optional :program_id, String

      # @!method initialize(name:, entity_id: nil, funding: nil, informational_entity_id: nil, loan: nil, program_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::AccountCreateParams} for more details.
      #
      #   @param name [String] The name you choose for the Account.
      #
      #   @param entity_id [String] The identifier for the Entity that will own the Account.
      #
      #   @param funding [Symbol, Increase::Models::AccountCreateParams::Funding] Whether the Account is funded by a loan or by deposits.
      #
      #   @param informational_entity_id [String] The identifier of an Entity that, while not owning the Account, is associated wi
      #
      #   @param loan [Increase::Models::AccountCreateParams::Loan] The loan details for the account.
      #
      #   @param program_id [String] The identifier for the Program that this Account falls under. Required if you op
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # Whether the Account is funded by a loan or by deposits.
      module Funding
        extend Increase::Internal::Type::Enum

        # An account funded by a loan. Before opening a loan account, contact support@increase.com to set up a loan program.
        LOAN = :loan

        # An account funded by deposits.
        DEPOSITS = :deposits

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Loan < Increase::Internal::Type::BaseModel
        # @!attribute credit_limit
        #   The maximum amount of money that can be drawn from the Account.
        #
        #   @return [Integer]
        required :credit_limit, Integer

        # @!attribute grace_period_days
        #   The number of days after the statement date that the Account can be past due
        #   before being considered delinquent.
        #
        #   @return [Integer]
        required :grace_period_days, Integer

        # @!attribute statement_day_of_month
        #   The day of the month on which the loan statement is generated.
        #
        #   @return [Integer]
        required :statement_day_of_month, Integer

        # @!attribute statement_payment_type
        #   The type of statement payment for the account.
        #
        #   @return [Symbol, Increase::Models::AccountCreateParams::Loan::StatementPaymentType]
        required :statement_payment_type, enum: -> { Increase::AccountCreateParams::Loan::StatementPaymentType }

        # @!attribute maturity_date
        #   The date on which the loan matures.
        #
        #   @return [Date, nil]
        optional :maturity_date, Date

        # @!method initialize(credit_limit:, grace_period_days:, statement_day_of_month:, statement_payment_type:, maturity_date: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::AccountCreateParams::Loan} for more details.
        #
        #   The loan details for the account.
        #
        #   @param credit_limit [Integer] The maximum amount of money that can be drawn from the Account.
        #
        #   @param grace_period_days [Integer] The number of days after the statement date that the Account can be past due bef
        #
        #   @param statement_day_of_month [Integer] The day of the month on which the loan statement is generated.
        #
        #   @param statement_payment_type [Symbol, Increase::Models::AccountCreateParams::Loan::StatementPaymentType] The type of statement payment for the account.
        #
        #   @param maturity_date [Date] The date on which the loan matures.

        # The type of statement payment for the account.
        #
        # @see Increase::Models::AccountCreateParams::Loan#statement_payment_type
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
    end
  end
end
