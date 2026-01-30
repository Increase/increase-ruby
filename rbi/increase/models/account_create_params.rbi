# typed: strong

module Increase
  module Models
    class AccountCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::AccountCreateParams, Increase::Internal::AnyHash)
        end

      # The name you choose for the Account.
      sig { returns(String) }
      attr_accessor :name

      # The identifier for the Entity that will own the Account.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      # Whether the Account is funded by a loan or by deposits.
      sig do
        returns(T.nilable(Increase::AccountCreateParams::Funding::OrSymbol))
      end
      attr_reader :funding

      sig do
        params(funding: Increase::AccountCreateParams::Funding::OrSymbol).void
      end
      attr_writer :funding

      # The identifier of an Entity that, while not owning the Account, is associated
      # with its activity. This is generally the beneficiary of the funds.
      sig { returns(T.nilable(String)) }
      attr_reader :informational_entity_id

      sig { params(informational_entity_id: String).void }
      attr_writer :informational_entity_id

      # The loan details for the account.
      sig { returns(T.nilable(Increase::AccountCreateParams::Loan)) }
      attr_reader :loan

      sig { params(loan: Increase::AccountCreateParams::Loan::OrHash).void }
      attr_writer :loan

      # The identifier for the Program that this Account falls under. Required if you
      # operate more than one Program.
      sig { returns(T.nilable(String)) }
      attr_reader :program_id

      sig { params(program_id: String).void }
      attr_writer :program_id

      sig do
        params(
          name: String,
          entity_id: String,
          funding: Increase::AccountCreateParams::Funding::OrSymbol,
          informational_entity_id: String,
          loan: Increase::AccountCreateParams::Loan::OrHash,
          program_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name you choose for the Account.
        name:,
        # The identifier for the Entity that will own the Account.
        entity_id: nil,
        # Whether the Account is funded by a loan or by deposits.
        funding: nil,
        # The identifier of an Entity that, while not owning the Account, is associated
        # with its activity. This is generally the beneficiary of the funds.
        informational_entity_id: nil,
        # The loan details for the account.
        loan: nil,
        # The identifier for the Program that this Account falls under. Required if you
        # operate more than one Program.
        program_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            entity_id: String,
            funding: Increase::AccountCreateParams::Funding::OrSymbol,
            informational_entity_id: String,
            loan: Increase::AccountCreateParams::Loan,
            program_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether the Account is funded by a loan or by deposits.
      module Funding
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::AccountCreateParams::Funding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # An account funded by a loan. Before opening a loan account, contact support@increase.com to set up a loan program.
        LOAN =
          T.let(:loan, Increase::AccountCreateParams::Funding::TaggedSymbol)

        # An account funded by deposits.
        DEPOSITS =
          T.let(:deposits, Increase::AccountCreateParams::Funding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::AccountCreateParams::Funding::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Loan < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::AccountCreateParams::Loan,
              Increase::Internal::AnyHash
            )
          end

        # The maximum amount of money that can be drawn from the Account.
        sig { returns(Integer) }
        attr_accessor :credit_limit

        # The number of days after the statement date that the Account can be past due
        # before being considered delinquent.
        sig { returns(Integer) }
        attr_accessor :grace_period_days

        # The day of the month on which the loan statement is generated.
        sig { returns(Integer) }
        attr_accessor :statement_day_of_month

        # The type of statement payment for the account.
        sig do
          returns(
            Increase::AccountCreateParams::Loan::StatementPaymentType::OrSymbol
          )
        end
        attr_accessor :statement_payment_type

        # The date on which the loan matures.
        sig { returns(T.nilable(Date)) }
        attr_reader :maturity_date

        sig { params(maturity_date: Date).void }
        attr_writer :maturity_date

        # The loan details for the account.
        sig do
          params(
            credit_limit: Integer,
            grace_period_days: Integer,
            statement_day_of_month: Integer,
            statement_payment_type:
              Increase::AccountCreateParams::Loan::StatementPaymentType::OrSymbol,
            maturity_date: Date
          ).returns(T.attached_class)
        end
        def self.new(
          # The maximum amount of money that can be drawn from the Account.
          credit_limit:,
          # The number of days after the statement date that the Account can be past due
          # before being considered delinquent.
          grace_period_days:,
          # The day of the month on which the loan statement is generated.
          statement_day_of_month:,
          # The type of statement payment for the account.
          statement_payment_type:,
          # The date on which the loan matures.
          maturity_date: nil
        )
        end

        sig do
          override.returns(
            {
              credit_limit: Integer,
              grace_period_days: Integer,
              statement_day_of_month: Integer,
              statement_payment_type:
                Increase::AccountCreateParams::Loan::StatementPaymentType::OrSymbol,
              maturity_date: Date
            }
          )
        end
        def to_hash
        end

        # The type of statement payment for the account.
        module StatementPaymentType
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::AccountCreateParams::Loan::StatementPaymentType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The borrower must pay the full balance of the loan at the end of the statement period.
          BALANCE =
            T.let(
              :balance,
              Increase::AccountCreateParams::Loan::StatementPaymentType::TaggedSymbol
            )

          # The borrower must pay the accrued interest at the end of the statement period.
          INTEREST_UNTIL_MATURITY =
            T.let(
              :interest_until_maturity,
              Increase::AccountCreateParams::Loan::StatementPaymentType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountCreateParams::Loan::StatementPaymentType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
