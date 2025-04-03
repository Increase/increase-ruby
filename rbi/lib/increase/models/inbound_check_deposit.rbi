# typed: strong

module Increase
  module Models
    class InboundCheckDeposit < Increase::Internal::Type::BaseModel
      # The deposit's identifier.
      sig { returns(String) }
      attr_accessor :id

      # If the Inbound Check Deposit was accepted, the
      #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which this
      #   took place.
      sig { returns(T.nilable(Time)) }
      attr_accessor :accepted_at

      # The Account the check is being deposited against.
      sig { returns(String) }
      attr_accessor :account_id

      # The Account Number the check is being deposited against.
      sig { returns(T.nilable(String)) }
      attr_accessor :account_number_id

      # If the deposit or the return was adjusted by the sending institution, this will
      #   contain details of the adjustments.
      sig { returns(T::Array[Increase::Models::InboundCheckDeposit::Adjustment]) }
      attr_accessor :adjustments

      # The deposited amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The ID for the File containing the image of the back of the check.
      sig { returns(T.nilable(String)) }
      attr_accessor :back_image_file_id

      # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #   bank depositing this check. In some rare cases, this is not transmitted via
      #   Check21 and the value will be null.
      sig { returns(T.nilable(String)) }
      attr_accessor :bank_of_first_deposit_routing_number

      # The check number printed on the check being deposited.
      sig { returns(T.nilable(String)) }
      attr_accessor :check_number

      # If this deposit is for an existing Check Transfer, the identifier of that Check
      #   Transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :check_transfer_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the deposit was attempted.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the deposit.
      sig { returns(Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol) }
      attr_accessor :currency

      # If the Inbound Check Deposit was declined, the
      #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which this
      #   took place.
      sig { returns(T.nilable(Time)) }
      attr_accessor :declined_at

      # If the deposit attempt has been rejected, the identifier of the Declined
      #   Transaction object created as a result of the failed deposit.
      sig { returns(T.nilable(String)) }
      attr_accessor :declined_transaction_id

      # If you requested a return of this deposit, this will contain details of the
      #   return.
      sig { returns(T.nilable(Increase::Models::InboundCheckDeposit::DepositReturn)) }
      attr_reader :deposit_return

      sig do
        params(
          deposit_return: T.nilable(T.any(Increase::Models::InboundCheckDeposit::DepositReturn, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :deposit_return

      # The ID for the File containing the image of the front of the check.
      sig { returns(T.nilable(String)) }
      attr_accessor :front_image_file_id

      # Whether the details on the check match the recipient name of the check transfer.
      #   This is an optional feature, contact sales to enable.
      sig { returns(Increase::Models::InboundCheckDeposit::PayeeNameAnalysis::TaggedSymbol) }
      attr_accessor :payee_name_analysis

      # The status of the Inbound Check Deposit.
      sig { returns(Increase::Models::InboundCheckDeposit::Status::TaggedSymbol) }
      attr_accessor :status

      # If the deposit attempt has been accepted, the identifier of the Transaction
      #   object created as a result of the successful deposit.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      #   `inbound_check_deposit`.
      sig { returns(Increase::Models::InboundCheckDeposit::Type::TaggedSymbol) }
      attr_accessor :type

      # Inbound Check Deposits are records of third-parties attempting to deposit checks
      #   against your account.
      sig do
        params(
          id: String,
          accepted_at: T.nilable(Time),
          account_id: String,
          account_number_id: T.nilable(String),
          adjustments: T::Array[T.any(Increase::Models::InboundCheckDeposit::Adjustment, Increase::Internal::AnyHash)],
          amount: Integer,
          back_image_file_id: T.nilable(String),
          bank_of_first_deposit_routing_number: T.nilable(String),
          check_number: T.nilable(String),
          check_transfer_id: T.nilable(String),
          created_at: Time,
          currency: Increase::Models::InboundCheckDeposit::Currency::OrSymbol,
          declined_at: T.nilable(Time),
          declined_transaction_id: T.nilable(String),
          deposit_return: T.nilable(T.any(Increase::Models::InboundCheckDeposit::DepositReturn, Increase::Internal::AnyHash)),
          front_image_file_id: T.nilable(String),
          payee_name_analysis: Increase::Models::InboundCheckDeposit::PayeeNameAnalysis::OrSymbol,
          status: Increase::Models::InboundCheckDeposit::Status::OrSymbol,
          transaction_id: T.nilable(String),
          type: Increase::Models::InboundCheckDeposit::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        accepted_at:,
        account_id:,
        account_number_id:,
        adjustments:,
        amount:,
        back_image_file_id:,
        bank_of_first_deposit_routing_number:,
        check_number:,
        check_transfer_id:,
        created_at:,
        currency:,
        declined_at:,
        declined_transaction_id:,
        deposit_return:,
        front_image_file_id:,
        payee_name_analysis:,
        status:,
        transaction_id:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              accepted_at: T.nilable(Time),
              account_id: String,
              account_number_id: T.nilable(String),
              adjustments: T::Array[Increase::Models::InboundCheckDeposit::Adjustment],
              amount: Integer,
              back_image_file_id: T.nilable(String),
              bank_of_first_deposit_routing_number: T.nilable(String),
              check_number: T.nilable(String),
              check_transfer_id: T.nilable(String),
              created_at: Time,
              currency: Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol,
              declined_at: T.nilable(Time),
              declined_transaction_id: T.nilable(String),
              deposit_return: T.nilable(Increase::Models::InboundCheckDeposit::DepositReturn),
              front_image_file_id: T.nilable(String),
              payee_name_analysis: Increase::Models::InboundCheckDeposit::PayeeNameAnalysis::TaggedSymbol,
              status: Increase::Models::InboundCheckDeposit::Status::TaggedSymbol,
              transaction_id: T.nilable(String),
              type: Increase::Models::InboundCheckDeposit::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      class Adjustment < Increase::Internal::Type::BaseModel
        # The time at which the return adjustment was received.
        sig { returns(Time) }
        attr_accessor :adjusted_at

        # The amount of the adjustment.
        sig { returns(Integer) }
        attr_accessor :amount

        # The reason for the adjustment.
        sig { returns(Increase::Models::InboundCheckDeposit::Adjustment::Reason::TaggedSymbol) }
        attr_accessor :reason

        # The id of the transaction for the adjustment.
        sig { returns(String) }
        attr_accessor :transaction_id

        sig do
          params(
            adjusted_at: Time,
            amount: Integer,
            reason: Increase::Models::InboundCheckDeposit::Adjustment::Reason::OrSymbol,
            transaction_id: String
          )
            .returns(T.attached_class)
        end
        def self.new(adjusted_at:, amount:, reason:, transaction_id:)
        end

        sig do
          override
            .returns(
              {
                adjusted_at: Time,
                amount: Integer,
                reason: Increase::Models::InboundCheckDeposit::Adjustment::Reason::TaggedSymbol,
                transaction_id: String
              }
            )
        end
        def to_hash
        end

        # The reason for the adjustment.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundCheckDeposit::Adjustment::Reason) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::InboundCheckDeposit::Adjustment::Reason::TaggedSymbol) }

          # The return was initiated too late and the receiving institution has responded with a Late Return Claim.
          LATE_RETURN =
            T.let(:late_return, Increase::Models::InboundCheckDeposit::Adjustment::Reason::TaggedSymbol)

          # The check was deposited to the wrong payee and the depositing institution has reimbursed the funds with a Wrong Payee Credit.
          WRONG_PAYEE_CREDIT =
            T.let(:wrong_payee_credit, Increase::Models::InboundCheckDeposit::Adjustment::Reason::TaggedSymbol)

          # The check was deposited with a different amount than what was written on the check.
          ADJUSTED_AMOUNT =
            T.let(:adjusted_amount, Increase::Models::InboundCheckDeposit::Adjustment::Reason::TaggedSymbol)

          # The recipient was not able to process the check. This usually happens for e.g., low quality images.
          NON_CONFORMING_ITEM =
            T.let(:non_conforming_item, Increase::Models::InboundCheckDeposit::Adjustment::Reason::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::InboundCheckDeposit::Adjustment::Reason::TaggedSymbol]) }
          def self.values
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the deposit.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundCheckDeposit::Currency) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::InboundCheckDeposit::Currency::TaggedSymbol]) }
        def self.values
        end
      end

      class DepositReturn < Increase::Internal::Type::BaseModel
        # The reason the deposit was returned.
        sig { returns(Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol) }
        attr_accessor :reason

        # The time at which the deposit was returned.
        sig { returns(Time) }
        attr_accessor :returned_at

        # The id of the transaction for the returned deposit.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If you requested a return of this deposit, this will contain details of the
        #   return.
        sig do
          params(
            reason: Increase::Models::InboundCheckDeposit::DepositReturn::Reason::OrSymbol,
            returned_at: Time,
            transaction_id: String
          )
            .returns(T.attached_class)
        end
        def self.new(reason:, returned_at:, transaction_id:)
        end

        sig do
          override
            .returns(
              {
                reason: Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol,
                returned_at: Time,
                transaction_id: String
              }
            )
        end
        def to_hash
        end

        # The reason the deposit was returned.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::InboundCheckDeposit::DepositReturn::Reason) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol) }

          # The check was altered or fictitious.
          ALTERED_OR_FICTITIOUS =
            T.let(:altered_or_fictitious, Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol)

          # The check was not authorized.
          NOT_AUTHORIZED =
            T.let(:not_authorized, Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol)

          # The check was a duplicate presentment.
          DUPLICATE_PRESENTMENT =
            T.let(:duplicate_presentment, Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol)

          # The check was not endorsed.
          ENDORSEMENT_MISSING =
            T.let(:endorsement_missing, Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol)

          # The check was not endorsed by the payee.
          ENDORSEMENT_IRREGULAR =
            T.let(:endorsement_irregular, Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::InboundCheckDeposit::DepositReturn::Reason::TaggedSymbol]) }
          def self.values
          end
        end
      end

      # Whether the details on the check match the recipient name of the check transfer.
      #   This is an optional feature, contact sales to enable.
      module PayeeNameAnalysis
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundCheckDeposit::PayeeNameAnalysis) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::InboundCheckDeposit::PayeeNameAnalysis::TaggedSymbol) }

        # The details on the check match the recipient name of the check transfer.
        NAME_MATCHES =
          T.let(:name_matches, Increase::Models::InboundCheckDeposit::PayeeNameAnalysis::TaggedSymbol)

        # The details on the check do not match the recipient name of the check transfer.
        DOES_NOT_MATCH =
          T.let(:does_not_match, Increase::Models::InboundCheckDeposit::PayeeNameAnalysis::TaggedSymbol)

        # The payee name analysis was not evaluated.
        NOT_EVALUATED =
          T.let(:not_evaluated, Increase::Models::InboundCheckDeposit::PayeeNameAnalysis::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::InboundCheckDeposit::PayeeNameAnalysis::TaggedSymbol]) }
        def self.values
        end
      end

      # The status of the Inbound Check Deposit.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundCheckDeposit::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::InboundCheckDeposit::Status::TaggedSymbol) }

        # The Inbound Check Deposit is pending.
        PENDING = T.let(:pending, Increase::Models::InboundCheckDeposit::Status::TaggedSymbol)

        # The Inbound Check Deposit was accepted.
        ACCEPTED = T.let(:accepted, Increase::Models::InboundCheckDeposit::Status::TaggedSymbol)

        # The Inbound Check Deposit was rejected.
        DECLINED = T.let(:declined, Increase::Models::InboundCheckDeposit::Status::TaggedSymbol)

        # The Inbound Check Deposit was returned.
        RETURNED = T.let(:returned, Increase::Models::InboundCheckDeposit::Status::TaggedSymbol)

        # The Inbound Check Deposit requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(:requires_attention, Increase::Models::InboundCheckDeposit::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::InboundCheckDeposit::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `inbound_check_deposit`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundCheckDeposit::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::InboundCheckDeposit::Type::TaggedSymbol) }

        INBOUND_CHECK_DEPOSIT =
          T.let(:inbound_check_deposit, Increase::Models::InboundCheckDeposit::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::InboundCheckDeposit::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
