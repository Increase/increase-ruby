# typed: strong

module Increase
  module Models
    class Transaction < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::Transaction, Increase::Internal::AnyHash)
        end

      # The Transaction identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account the Transaction belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The Transaction amount in the minor unit of its currency. For dollars, for
      # example, this is cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the
      # Transaction occurred.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
      # Transaction's currency. This will match the currency on the Transaction's
      # Account.
      sig { returns(Increase::Transaction::Currency::TaggedSymbol) }
      attr_accessor :currency

      # An informational message describing this transaction. Use the fields in `source`
      # to get more detailed information. This field appears as the line-item on the
      # statement.
      sig { returns(String) }
      attr_accessor :description

      # The identifier for the route this Transaction came through. Routes are things
      # like cards and ACH details.
      sig { returns(T.nilable(String)) }
      attr_accessor :route_id

      # The type of the route this Transaction came through.
      sig { returns(T.nilable(Increase::Transaction::RouteType::TaggedSymbol)) }
      attr_accessor :route_type

      # This is an object giving more details on the network-level event that caused the
      # Transaction. Note that for backwards compatibility reasons, additional
      # undocumented keys may appear in this object. These should be treated as
      # deprecated and will be removed in the future.
      sig { returns(Increase::Transaction::Source) }
      attr_reader :source

      sig { params(source: Increase::Transaction::Source::OrHash).void }
      attr_writer :source

      # A constant representing the object's type. For this resource it will always be
      # `transaction`.
      sig { returns(Increase::Transaction::Type::TaggedSymbol) }
      attr_accessor :type

      # Transactions are the immutable additions and removals of money from your bank
      # account. They're the equivalent of line items on your bank statement. To learn
      # more, see [Transactions and Transfers](/documentation/transactions-transfers).
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          created_at: Time,
          currency: Increase::Transaction::Currency::OrSymbol,
          description: String,
          route_id: T.nilable(String),
          route_type: T.nilable(Increase::Transaction::RouteType::OrSymbol),
          source: Increase::Transaction::Source::OrHash,
          type: Increase::Transaction::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Transaction identifier.
        id:,
        # The identifier for the Account the Transaction belongs to.
        account_id:,
        # The Transaction amount in the minor unit of its currency. For dollars, for
        # example, this is cents.
        amount:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the
        # Transaction occurred.
        created_at:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
        # Transaction's currency. This will match the currency on the Transaction's
        # Account.
        currency:,
        # An informational message describing this transaction. Use the fields in `source`
        # to get more detailed information. This field appears as the line-item on the
        # statement.
        description:,
        # The identifier for the route this Transaction came through. Routes are things
        # like cards and ACH details.
        route_id:,
        # The type of the route this Transaction came through.
        route_type:,
        # This is an object giving more details on the network-level event that caused the
        # Transaction. Note that for backwards compatibility reasons, additional
        # undocumented keys may appear in this object. These should be treated as
        # deprecated and will be removed in the future.
        source:,
        # A constant representing the object's type. For this resource it will always be
        # `transaction`.
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
            currency: Increase::Transaction::Currency::TaggedSymbol,
            description: String,
            route_id: T.nilable(String),
            route_type:
              T.nilable(Increase::Transaction::RouteType::TaggedSymbol),
            source: Increase::Transaction::Source,
            type: Increase::Transaction::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
      # Transaction's currency. This will match the currency on the Transaction's
      # Account.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Transaction::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD = T.let(:USD, Increase::Transaction::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::Transaction::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of the route this Transaction came through.
      module RouteType
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Transaction::RouteType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # An Account Number.
        ACCOUNT_NUMBER =
          T.let(:account_number, Increase::Transaction::RouteType::TaggedSymbol)

        # A Card.
        CARD = T.let(:card, Increase::Transaction::RouteType::TaggedSymbol)

        # A Lockbox.
        LOCKBOX =
          T.let(:lockbox, Increase::Transaction::RouteType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::Transaction::RouteType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Source < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Transaction::Source, Increase::Internal::AnyHash)
          end

        # An Account Revenue Payment object. This field will be present in the JSON
        # response if and only if `category` is equal to `account_revenue_payment`. An
        # Account Revenue Payment represents a payment made to an account from the bank.
        # Account revenue is a type of non-interest income.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::AccountRevenuePayment)
          )
        end
        attr_reader :account_revenue_payment

        sig do
          params(
            account_revenue_payment:
              T.nilable(
                Increase::Transaction::Source::AccountRevenuePayment::OrHash
              )
          ).void
        end
        attr_writer :account_revenue_payment

        # An Account Transfer Intention object. This field will be present in the JSON
        # response if and only if `category` is equal to `account_transfer_intention`. Two
        # Account Transfer Intentions are created from each Account Transfer. One
        # decrements the source account, and the other increments the destination account.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::AccountTransferIntention)
          )
        end
        attr_reader :account_transfer_intention

        sig do
          params(
            account_transfer_intention:
              T.nilable(
                Increase::Transaction::Source::AccountTransferIntention::OrHash
              )
          ).void
        end
        attr_writer :account_transfer_intention

        # An ACH Transfer Intention object. This field will be present in the JSON
        # response if and only if `category` is equal to `ach_transfer_intention`. An ACH
        # Transfer Intention is created from an ACH Transfer. It reflects the intention to
        # move money into or out of an Increase account via the ACH network.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::ACHTransferIntention)
          )
        end
        attr_reader :ach_transfer_intention

        sig do
          params(
            ach_transfer_intention:
              T.nilable(
                Increase::Transaction::Source::ACHTransferIntention::OrHash
              )
          ).void
        end
        attr_writer :ach_transfer_intention

        # An ACH Transfer Rejection object. This field will be present in the JSON
        # response if and only if `category` is equal to `ach_transfer_rejection`. An ACH
        # Transfer Rejection is created when an ACH Transfer is rejected by Increase. It
        # offsets the ACH Transfer Intention. These rejections are rare.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::ACHTransferRejection)
          )
        end
        attr_reader :ach_transfer_rejection

        sig do
          params(
            ach_transfer_rejection:
              T.nilable(
                Increase::Transaction::Source::ACHTransferRejection::OrHash
              )
          ).void
        end
        attr_writer :ach_transfer_rejection

        # An ACH Transfer Return object. This field will be present in the JSON response
        # if and only if `category` is equal to `ach_transfer_return`. An ACH Transfer
        # Return is created when an ACH Transfer is returned by the receiving bank. It
        # offsets the ACH Transfer Intention. ACH Transfer Returns usually occur within
        # the first two business days after the transfer is initiated, but can occur much
        # later.
        sig do
          returns(T.nilable(Increase::Transaction::Source::ACHTransferReturn))
        end
        attr_reader :ach_transfer_return

        sig do
          params(
            ach_transfer_return:
              T.nilable(
                Increase::Transaction::Source::ACHTransferReturn::OrHash
              )
          ).void
        end
        attr_writer :ach_transfer_return

        # A Legacy Card Dispute Acceptance object. This field will be present in the JSON
        # response if and only if `category` is equal to `card_dispute_acceptance`.
        # Contains the details of a successful Card Dispute.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::CardDisputeAcceptance)
          )
        end
        attr_reader :card_dispute_acceptance

        sig do
          params(
            card_dispute_acceptance:
              T.nilable(
                Increase::Transaction::Source::CardDisputeAcceptance::OrHash
              )
          ).void
        end
        attr_writer :card_dispute_acceptance

        # A Card Dispute Financial object. This field will be present in the JSON response
        # if and only if `category` is equal to `card_dispute_financial`. Financial event
        # related to a Card Dispute.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::CardDisputeFinancial)
          )
        end
        attr_reader :card_dispute_financial

        sig do
          params(
            card_dispute_financial:
              T.nilable(
                Increase::Transaction::Source::CardDisputeFinancial::OrHash
              )
          ).void
        end
        attr_writer :card_dispute_financial

        # A Legacy Card Dispute Loss object. This field will be present in the JSON
        # response if and only if `category` is equal to `card_dispute_loss`. Contains the
        # details of a lost Card Dispute.
        sig do
          returns(T.nilable(Increase::Transaction::Source::CardDisputeLoss))
        end
        attr_reader :card_dispute_loss

        sig do
          params(
            card_dispute_loss:
              T.nilable(Increase::Transaction::Source::CardDisputeLoss::OrHash)
          ).void
        end
        attr_writer :card_dispute_loss

        # A Card Financial object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_financial`. Card Financials are temporary
        # holds placed on a customers funds with the intent to later clear a transaction.
        sig { returns(T.nilable(Increase::Transaction::Source::CardFinancial)) }
        attr_reader :card_financial

        sig do
          params(
            card_financial:
              T.nilable(Increase::Transaction::Source::CardFinancial::OrHash)
          ).void
        end
        attr_writer :card_financial

        # A Card Push Transfer Acceptance object. This field will be present in the JSON
        # response if and only if `category` is equal to `card_push_transfer_acceptance`.
        # A Card Push Transfer Acceptance is created when an Outbound Card Push Transfer
        # sent from Increase is accepted by the receiving bank.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::CardPushTransferAcceptance)
          )
        end
        attr_reader :card_push_transfer_acceptance

        sig do
          params(
            card_push_transfer_acceptance:
              T.nilable(
                Increase::Transaction::Source::CardPushTransferAcceptance::OrHash
              )
          ).void
        end
        attr_writer :card_push_transfer_acceptance

        # A Card Refund object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_refund`. Card Refunds move money back to
        # the cardholder. While they are usually connected to a Card Settlement an
        # acquirer can also refund money directly to a card without relation to a
        # transaction.
        sig { returns(T.nilable(Increase::Transaction::Source::CardRefund)) }
        attr_reader :card_refund

        sig do
          params(
            card_refund:
              T.nilable(Increase::Transaction::Source::CardRefund::OrHash)
          ).void
        end
        attr_writer :card_refund

        # A Card Revenue Payment object. This field will be present in the JSON response
        # if and only if `category` is equal to `card_revenue_payment`. Card Revenue
        # Payments reflect earnings from fees on card transactions.
        sig do
          returns(T.nilable(Increase::Transaction::Source::CardRevenuePayment))
        end
        attr_reader :card_revenue_payment

        sig do
          params(
            card_revenue_payment:
              T.nilable(
                Increase::Transaction::Source::CardRevenuePayment::OrHash
              )
          ).void
        end
        attr_writer :card_revenue_payment

        # A Card Settlement object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_settlement`. Card Settlements are card
        # transactions that have cleared and settled. While a settlement is usually
        # preceded by an authorization, an acquirer can also directly clear a transaction
        # without first authorizing it.
        sig do
          returns(T.nilable(Increase::Transaction::Source::CardSettlement))
        end
        attr_reader :card_settlement

        sig do
          params(
            card_settlement:
              T.nilable(Increase::Transaction::Source::CardSettlement::OrHash)
          ).void
        end
        attr_writer :card_settlement

        # A Cashback Payment object. This field will be present in the JSON response if
        # and only if `category` is equal to `cashback_payment`. A Cashback Payment
        # represents the cashback paid to a cardholder for a given period. Cashback is
        # usually paid monthly for the prior month's transactions.
        sig do
          returns(T.nilable(Increase::Transaction::Source::CashbackPayment))
        end
        attr_reader :cashback_payment

        sig do
          params(
            cashback_payment:
              T.nilable(Increase::Transaction::Source::CashbackPayment::OrHash)
          ).void
        end
        attr_writer :cashback_payment

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        sig { returns(Increase::Transaction::Source::Category::TaggedSymbol) }
        attr_accessor :category

        # A Check Deposit Acceptance object. This field will be present in the JSON
        # response if and only if `category` is equal to `check_deposit_acceptance`. A
        # Check Deposit Acceptance is created when a Check Deposit is processed and its
        # details confirmed. Check Deposits may be returned by the receiving bank, which
        # will appear as a Check Deposit Return.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::CheckDepositAcceptance)
          )
        end
        attr_reader :check_deposit_acceptance

        sig do
          params(
            check_deposit_acceptance:
              T.nilable(
                Increase::Transaction::Source::CheckDepositAcceptance::OrHash
              )
          ).void
        end
        attr_writer :check_deposit_acceptance

        # A Check Deposit Return object. This field will be present in the JSON response
        # if and only if `category` is equal to `check_deposit_return`. A Check Deposit
        # Return is created when a Check Deposit is returned by the bank holding the
        # account it was drawn against. Check Deposits may be returned for a variety of
        # reasons, including insufficient funds or a mismatched account number. Usually,
        # checks are returned within the first 7 days after the deposit is made.
        sig do
          returns(T.nilable(Increase::Transaction::Source::CheckDepositReturn))
        end
        attr_reader :check_deposit_return

        sig do
          params(
            check_deposit_return:
              T.nilable(
                Increase::Transaction::Source::CheckDepositReturn::OrHash
              )
          ).void
        end
        attr_writer :check_deposit_return

        # A Check Transfer Deposit object. This field will be present in the JSON response
        # if and only if `category` is equal to `check_transfer_deposit`. An Inbound Check
        # is a check drawn on an Increase account that has been deposited by an external
        # bank account. These types of checks are not pre-registered.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::CheckTransferDeposit)
          )
        end
        attr_reader :check_transfer_deposit

        sig do
          params(
            check_transfer_deposit:
              T.nilable(
                Increase::Transaction::Source::CheckTransferDeposit::OrHash
              )
          ).void
        end
        attr_writer :check_transfer_deposit

        # A FedNow Transfer Acknowledgement object. This field will be present in the JSON
        # response if and only if `category` is equal to
        # `fednow_transfer_acknowledgement`. A FedNow Transfer Acknowledgement is created
        # when a FedNow Transfer sent from Increase is acknowledged by the receiving bank.
        sig do
          returns(
            T.nilable(
              Increase::Transaction::Source::FednowTransferAcknowledgement
            )
          )
        end
        attr_reader :fednow_transfer_acknowledgement

        sig do
          params(
            fednow_transfer_acknowledgement:
              T.nilable(
                Increase::Transaction::Source::FednowTransferAcknowledgement::OrHash
              )
          ).void
        end
        attr_writer :fednow_transfer_acknowledgement

        # A Fee Payment object. This field will be present in the JSON response if and
        # only if `category` is equal to `fee_payment`. A Fee Payment represents a payment
        # made to Increase.
        sig { returns(T.nilable(Increase::Transaction::Source::FeePayment)) }
        attr_reader :fee_payment

        sig do
          params(
            fee_payment:
              T.nilable(Increase::Transaction::Source::FeePayment::OrHash)
          ).void
        end
        attr_writer :fee_payment

        # An Inbound ACH Transfer Intention object. This field will be present in the JSON
        # response if and only if `category` is equal to `inbound_ach_transfer`. An
        # Inbound ACH Transfer Intention is created when an ACH transfer is initiated at
        # another bank and received by Increase.
        sig do
          returns(T.nilable(Increase::Transaction::Source::InboundACHTransfer))
        end
        attr_reader :inbound_ach_transfer

        sig do
          params(
            inbound_ach_transfer:
              T.nilable(
                Increase::Transaction::Source::InboundACHTransfer::OrHash
              )
          ).void
        end
        attr_writer :inbound_ach_transfer

        # An Inbound ACH Transfer Return Intention object. This field will be present in
        # the JSON response if and only if `category` is equal to
        # `inbound_ach_transfer_return_intention`. An Inbound ACH Transfer Return
        # Intention is created when an ACH transfer is initiated at another bank and
        # returned by Increase.
        sig do
          returns(
            T.nilable(
              Increase::Transaction::Source::InboundACHTransferReturnIntention
            )
          )
        end
        attr_reader :inbound_ach_transfer_return_intention

        sig do
          params(
            inbound_ach_transfer_return_intention:
              T.nilable(
                Increase::Transaction::Source::InboundACHTransferReturnIntention::OrHash
              )
          ).void
        end
        attr_writer :inbound_ach_transfer_return_intention

        # An Inbound Check Adjustment object. This field will be present in the JSON
        # response if and only if `category` is equal to `inbound_check_adjustment`. An
        # Inbound Check Adjustment is created when Increase receives an adjustment for a
        # check or return deposited through Check21.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::InboundCheckAdjustment)
          )
        end
        attr_reader :inbound_check_adjustment

        sig do
          params(
            inbound_check_adjustment:
              T.nilable(
                Increase::Transaction::Source::InboundCheckAdjustment::OrHash
              )
          ).void
        end
        attr_writer :inbound_check_adjustment

        # An Inbound Check Deposit Return Intention object. This field will be present in
        # the JSON response if and only if `category` is equal to
        # `inbound_check_deposit_return_intention`. An Inbound Check Deposit Return
        # Intention is created when Increase receives an Inbound Check and the User
        # requests that it be returned.
        sig do
          returns(
            T.nilable(
              Increase::Transaction::Source::InboundCheckDepositReturnIntention
            )
          )
        end
        attr_reader :inbound_check_deposit_return_intention

        sig do
          params(
            inbound_check_deposit_return_intention:
              T.nilable(
                Increase::Transaction::Source::InboundCheckDepositReturnIntention::OrHash
              )
          ).void
        end
        attr_writer :inbound_check_deposit_return_intention

        # An Inbound FedNow Transfer Confirmation object. This field will be present in
        # the JSON response if and only if `category` is equal to
        # `inbound_fednow_transfer_confirmation`. An Inbound FedNow Transfer Confirmation
        # is created when a FedNow transfer is initiated at another bank and received by
        # Increase.
        sig do
          returns(
            T.nilable(
              Increase::Transaction::Source::InboundFednowTransferConfirmation
            )
          )
        end
        attr_reader :inbound_fednow_transfer_confirmation

        sig do
          params(
            inbound_fednow_transfer_confirmation:
              T.nilable(
                Increase::Transaction::Source::InboundFednowTransferConfirmation::OrHash
              )
          ).void
        end
        attr_writer :inbound_fednow_transfer_confirmation

        # An Inbound Real-Time Payments Transfer Confirmation object. This field will be
        # present in the JSON response if and only if `category` is equal to
        # `inbound_real_time_payments_transfer_confirmation`. An Inbound Real-Time
        # Payments Transfer Confirmation is created when a Real-Time Payments transfer is
        # initiated at another bank and received by Increase.
        sig do
          returns(
            T.nilable(
              Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation
            )
          )
        end
        attr_reader :inbound_real_time_payments_transfer_confirmation

        sig do
          params(
            inbound_real_time_payments_transfer_confirmation:
              T.nilable(
                Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::OrHash
              )
          ).void
        end
        attr_writer :inbound_real_time_payments_transfer_confirmation

        # An Inbound Wire Reversal object. This field will be present in the JSON response
        # if and only if `category` is equal to `inbound_wire_reversal`. An Inbound Wire
        # Reversal represents a reversal of a wire transfer that was initiated via
        # Increase. The other bank is sending the money back. This most often happens when
        # the original destination account details were incorrect.
        sig do
          returns(T.nilable(Increase::Transaction::Source::InboundWireReversal))
        end
        attr_reader :inbound_wire_reversal

        sig do
          params(
            inbound_wire_reversal:
              T.nilable(
                Increase::Transaction::Source::InboundWireReversal::OrHash
              )
          ).void
        end
        attr_writer :inbound_wire_reversal

        # An Inbound Wire Transfer Intention object. This field will be present in the
        # JSON response if and only if `category` is equal to `inbound_wire_transfer`. An
        # Inbound Wire Transfer Intention is created when a wire transfer is initiated at
        # another bank and received by Increase.
        sig do
          returns(T.nilable(Increase::Transaction::Source::InboundWireTransfer))
        end
        attr_reader :inbound_wire_transfer

        sig do
          params(
            inbound_wire_transfer:
              T.nilable(
                Increase::Transaction::Source::InboundWireTransfer::OrHash
              )
          ).void
        end
        attr_writer :inbound_wire_transfer

        # An Inbound Wire Transfer Reversal Intention object. This field will be present
        # in the JSON response if and only if `category` is equal to
        # `inbound_wire_transfer_reversal`. An Inbound Wire Transfer Reversal Intention is
        # created when Increase has received a wire and the User requests that it be
        # reversed.
        sig do
          returns(
            T.nilable(
              Increase::Transaction::Source::InboundWireTransferReversal
            )
          )
        end
        attr_reader :inbound_wire_transfer_reversal

        sig do
          params(
            inbound_wire_transfer_reversal:
              T.nilable(
                Increase::Transaction::Source::InboundWireTransferReversal::OrHash
              )
          ).void
        end
        attr_writer :inbound_wire_transfer_reversal

        # An Interest Payment object. This field will be present in the JSON response if
        # and only if `category` is equal to `interest_payment`. An Interest Payment
        # represents a payment of interest on an account. Interest is usually paid
        # monthly.
        sig do
          returns(T.nilable(Increase::Transaction::Source::InterestPayment))
        end
        attr_reader :interest_payment

        sig do
          params(
            interest_payment:
              T.nilable(Increase::Transaction::Source::InterestPayment::OrHash)
          ).void
        end
        attr_writer :interest_payment

        # An Internal Source object. This field will be present in the JSON response if
        # and only if `category` is equal to `internal_source`. A transaction between the
        # user and Increase. See the `reason` attribute for more information.
        sig do
          returns(T.nilable(Increase::Transaction::Source::InternalSource))
        end
        attr_reader :internal_source

        sig do
          params(
            internal_source:
              T.nilable(Increase::Transaction::Source::InternalSource::OrHash)
          ).void
        end
        attr_writer :internal_source

        # If the category of this Transaction source is equal to `other`, this field will
        # contain an empty object, otherwise it will contain null.
        sig { returns(T.nilable(Increase::Transaction::Source::Other)) }
        attr_reader :other

        sig do
          params(
            other: T.nilable(Increase::Transaction::Source::Other::OrHash)
          ).void
        end
        attr_writer :other

        # A Real-Time Payments Transfer Acknowledgement object. This field will be present
        # in the JSON response if and only if `category` is equal to
        # `real_time_payments_transfer_acknowledgement`. A Real-Time Payments Transfer
        # Acknowledgement is created when a Real-Time Payments Transfer sent from Increase
        # is acknowledged by the receiving bank.
        sig do
          returns(
            T.nilable(
              Increase::Transaction::Source::RealTimePaymentsTransferAcknowledgement
            )
          )
        end
        attr_reader :real_time_payments_transfer_acknowledgement

        sig do
          params(
            real_time_payments_transfer_acknowledgement:
              T.nilable(
                Increase::Transaction::Source::RealTimePaymentsTransferAcknowledgement::OrHash
              )
          ).void
        end
        attr_writer :real_time_payments_transfer_acknowledgement

        # A Sample Funds object. This field will be present in the JSON response if and
        # only if `category` is equal to `sample_funds`. Sample funds for testing
        # purposes.
        sig { returns(T.nilable(Increase::Transaction::Source::SampleFunds)) }
        attr_reader :sample_funds

        sig do
          params(
            sample_funds:
              T.nilable(Increase::Transaction::Source::SampleFunds::OrHash)
          ).void
        end
        attr_writer :sample_funds

        # A Swift Transfer Intention object. This field will be present in the JSON
        # response if and only if `category` is equal to `swift_transfer_intention`. A
        # Swift Transfer initiated via Increase.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::SwiftTransferIntention)
          )
        end
        attr_reader :swift_transfer_intention

        sig do
          params(
            swift_transfer_intention:
              T.nilable(
                Increase::Transaction::Source::SwiftTransferIntention::OrHash
              )
          ).void
        end
        attr_writer :swift_transfer_intention

        # A Swift Transfer Return object. This field will be present in the JSON response
        # if and only if `category` is equal to `swift_transfer_return`. A Swift Transfer
        # Return is created when a Swift Transfer is returned by the receiving bank.
        sig do
          returns(T.nilable(Increase::Transaction::Source::SwiftTransferReturn))
        end
        attr_reader :swift_transfer_return

        sig do
          params(
            swift_transfer_return:
              T.nilable(
                Increase::Transaction::Source::SwiftTransferReturn::OrHash
              )
          ).void
        end
        attr_writer :swift_transfer_return

        # A Wire Transfer Intention object. This field will be present in the JSON
        # response if and only if `category` is equal to `wire_transfer_intention`. A Wire
        # Transfer initiated via Increase and sent to a different bank.
        sig do
          returns(
            T.nilable(Increase::Transaction::Source::WireTransferIntention)
          )
        end
        attr_reader :wire_transfer_intention

        sig do
          params(
            wire_transfer_intention:
              T.nilable(
                Increase::Transaction::Source::WireTransferIntention::OrHash
              )
          ).void
        end
        attr_writer :wire_transfer_intention

        # This is an object giving more details on the network-level event that caused the
        # Transaction. Note that for backwards compatibility reasons, additional
        # undocumented keys may appear in this object. These should be treated as
        # deprecated and will be removed in the future.
        sig do
          params(
            account_revenue_payment:
              T.nilable(
                Increase::Transaction::Source::AccountRevenuePayment::OrHash
              ),
            account_transfer_intention:
              T.nilable(
                Increase::Transaction::Source::AccountTransferIntention::OrHash
              ),
            ach_transfer_intention:
              T.nilable(
                Increase::Transaction::Source::ACHTransferIntention::OrHash
              ),
            ach_transfer_rejection:
              T.nilable(
                Increase::Transaction::Source::ACHTransferRejection::OrHash
              ),
            ach_transfer_return:
              T.nilable(
                Increase::Transaction::Source::ACHTransferReturn::OrHash
              ),
            card_dispute_acceptance:
              T.nilable(
                Increase::Transaction::Source::CardDisputeAcceptance::OrHash
              ),
            card_dispute_financial:
              T.nilable(
                Increase::Transaction::Source::CardDisputeFinancial::OrHash
              ),
            card_dispute_loss:
              T.nilable(Increase::Transaction::Source::CardDisputeLoss::OrHash),
            card_financial:
              T.nilable(Increase::Transaction::Source::CardFinancial::OrHash),
            card_push_transfer_acceptance:
              T.nilable(
                Increase::Transaction::Source::CardPushTransferAcceptance::OrHash
              ),
            card_refund:
              T.nilable(Increase::Transaction::Source::CardRefund::OrHash),
            card_revenue_payment:
              T.nilable(
                Increase::Transaction::Source::CardRevenuePayment::OrHash
              ),
            card_settlement:
              T.nilable(Increase::Transaction::Source::CardSettlement::OrHash),
            cashback_payment:
              T.nilable(Increase::Transaction::Source::CashbackPayment::OrHash),
            category: Increase::Transaction::Source::Category::OrSymbol,
            check_deposit_acceptance:
              T.nilable(
                Increase::Transaction::Source::CheckDepositAcceptance::OrHash
              ),
            check_deposit_return:
              T.nilable(
                Increase::Transaction::Source::CheckDepositReturn::OrHash
              ),
            check_transfer_deposit:
              T.nilable(
                Increase::Transaction::Source::CheckTransferDeposit::OrHash
              ),
            fednow_transfer_acknowledgement:
              T.nilable(
                Increase::Transaction::Source::FednowTransferAcknowledgement::OrHash
              ),
            fee_payment:
              T.nilable(Increase::Transaction::Source::FeePayment::OrHash),
            inbound_ach_transfer:
              T.nilable(
                Increase::Transaction::Source::InboundACHTransfer::OrHash
              ),
            inbound_ach_transfer_return_intention:
              T.nilable(
                Increase::Transaction::Source::InboundACHTransferReturnIntention::OrHash
              ),
            inbound_check_adjustment:
              T.nilable(
                Increase::Transaction::Source::InboundCheckAdjustment::OrHash
              ),
            inbound_check_deposit_return_intention:
              T.nilable(
                Increase::Transaction::Source::InboundCheckDepositReturnIntention::OrHash
              ),
            inbound_fednow_transfer_confirmation:
              T.nilable(
                Increase::Transaction::Source::InboundFednowTransferConfirmation::OrHash
              ),
            inbound_real_time_payments_transfer_confirmation:
              T.nilable(
                Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::OrHash
              ),
            inbound_wire_reversal:
              T.nilable(
                Increase::Transaction::Source::InboundWireReversal::OrHash
              ),
            inbound_wire_transfer:
              T.nilable(
                Increase::Transaction::Source::InboundWireTransfer::OrHash
              ),
            inbound_wire_transfer_reversal:
              T.nilable(
                Increase::Transaction::Source::InboundWireTransferReversal::OrHash
              ),
            interest_payment:
              T.nilable(Increase::Transaction::Source::InterestPayment::OrHash),
            internal_source:
              T.nilable(Increase::Transaction::Source::InternalSource::OrHash),
            other: T.nilable(Increase::Transaction::Source::Other::OrHash),
            real_time_payments_transfer_acknowledgement:
              T.nilable(
                Increase::Transaction::Source::RealTimePaymentsTransferAcknowledgement::OrHash
              ),
            sample_funds:
              T.nilable(Increase::Transaction::Source::SampleFunds::OrHash),
            swift_transfer_intention:
              T.nilable(
                Increase::Transaction::Source::SwiftTransferIntention::OrHash
              ),
            swift_transfer_return:
              T.nilable(
                Increase::Transaction::Source::SwiftTransferReturn::OrHash
              ),
            wire_transfer_intention:
              T.nilable(
                Increase::Transaction::Source::WireTransferIntention::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # An Account Revenue Payment object. This field will be present in the JSON
          # response if and only if `category` is equal to `account_revenue_payment`. An
          # Account Revenue Payment represents a payment made to an account from the bank.
          # Account revenue is a type of non-interest income.
          account_revenue_payment:,
          # An Account Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `account_transfer_intention`. Two
          # Account Transfer Intentions are created from each Account Transfer. One
          # decrements the source account, and the other increments the destination account.
          account_transfer_intention:,
          # An ACH Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `ach_transfer_intention`. An ACH
          # Transfer Intention is created from an ACH Transfer. It reflects the intention to
          # move money into or out of an Increase account via the ACH network.
          ach_transfer_intention:,
          # An ACH Transfer Rejection object. This field will be present in the JSON
          # response if and only if `category` is equal to `ach_transfer_rejection`. An ACH
          # Transfer Rejection is created when an ACH Transfer is rejected by Increase. It
          # offsets the ACH Transfer Intention. These rejections are rare.
          ach_transfer_rejection:,
          # An ACH Transfer Return object. This field will be present in the JSON response
          # if and only if `category` is equal to `ach_transfer_return`. An ACH Transfer
          # Return is created when an ACH Transfer is returned by the receiving bank. It
          # offsets the ACH Transfer Intention. ACH Transfer Returns usually occur within
          # the first two business days after the transfer is initiated, but can occur much
          # later.
          ach_transfer_return:,
          # A Legacy Card Dispute Acceptance object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_dispute_acceptance`.
          # Contains the details of a successful Card Dispute.
          card_dispute_acceptance:,
          # A Card Dispute Financial object. This field will be present in the JSON response
          # if and only if `category` is equal to `card_dispute_financial`. Financial event
          # related to a Card Dispute.
          card_dispute_financial:,
          # A Legacy Card Dispute Loss object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_dispute_loss`. Contains the
          # details of a lost Card Dispute.
          card_dispute_loss:,
          # A Card Financial object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_financial`. Card Financials are temporary
          # holds placed on a customers funds with the intent to later clear a transaction.
          card_financial:,
          # A Card Push Transfer Acceptance object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_push_transfer_acceptance`.
          # A Card Push Transfer Acceptance is created when an Outbound Card Push Transfer
          # sent from Increase is accepted by the receiving bank.
          card_push_transfer_acceptance:,
          # A Card Refund object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_refund`. Card Refunds move money back to
          # the cardholder. While they are usually connected to a Card Settlement an
          # acquirer can also refund money directly to a card without relation to a
          # transaction.
          card_refund:,
          # A Card Revenue Payment object. This field will be present in the JSON response
          # if and only if `category` is equal to `card_revenue_payment`. Card Revenue
          # Payments reflect earnings from fees on card transactions.
          card_revenue_payment:,
          # A Card Settlement object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_settlement`. Card Settlements are card
          # transactions that have cleared and settled. While a settlement is usually
          # preceded by an authorization, an acquirer can also directly clear a transaction
          # without first authorizing it.
          card_settlement:,
          # A Cashback Payment object. This field will be present in the JSON response if
          # and only if `category` is equal to `cashback_payment`. A Cashback Payment
          # represents the cashback paid to a cardholder for a given period. Cashback is
          # usually paid monthly for the prior month's transactions.
          cashback_payment:,
          # The type of the resource. We may add additional possible values for this enum
          # over time; your application should be able to handle such additions gracefully.
          category:,
          # A Check Deposit Acceptance object. This field will be present in the JSON
          # response if and only if `category` is equal to `check_deposit_acceptance`. A
          # Check Deposit Acceptance is created when a Check Deposit is processed and its
          # details confirmed. Check Deposits may be returned by the receiving bank, which
          # will appear as a Check Deposit Return.
          check_deposit_acceptance:,
          # A Check Deposit Return object. This field will be present in the JSON response
          # if and only if `category` is equal to `check_deposit_return`. A Check Deposit
          # Return is created when a Check Deposit is returned by the bank holding the
          # account it was drawn against. Check Deposits may be returned for a variety of
          # reasons, including insufficient funds or a mismatched account number. Usually,
          # checks are returned within the first 7 days after the deposit is made.
          check_deposit_return:,
          # A Check Transfer Deposit object. This field will be present in the JSON response
          # if and only if `category` is equal to `check_transfer_deposit`. An Inbound Check
          # is a check drawn on an Increase account that has been deposited by an external
          # bank account. These types of checks are not pre-registered.
          check_transfer_deposit:,
          # A FedNow Transfer Acknowledgement object. This field will be present in the JSON
          # response if and only if `category` is equal to
          # `fednow_transfer_acknowledgement`. A FedNow Transfer Acknowledgement is created
          # when a FedNow Transfer sent from Increase is acknowledged by the receiving bank.
          fednow_transfer_acknowledgement:,
          # A Fee Payment object. This field will be present in the JSON response if and
          # only if `category` is equal to `fee_payment`. A Fee Payment represents a payment
          # made to Increase.
          fee_payment:,
          # An Inbound ACH Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `inbound_ach_transfer`. An
          # Inbound ACH Transfer Intention is created when an ACH transfer is initiated at
          # another bank and received by Increase.
          inbound_ach_transfer:,
          # An Inbound ACH Transfer Return Intention object. This field will be present in
          # the JSON response if and only if `category` is equal to
          # `inbound_ach_transfer_return_intention`. An Inbound ACH Transfer Return
          # Intention is created when an ACH transfer is initiated at another bank and
          # returned by Increase.
          inbound_ach_transfer_return_intention:,
          # An Inbound Check Adjustment object. This field will be present in the JSON
          # response if and only if `category` is equal to `inbound_check_adjustment`. An
          # Inbound Check Adjustment is created when Increase receives an adjustment for a
          # check or return deposited through Check21.
          inbound_check_adjustment:,
          # An Inbound Check Deposit Return Intention object. This field will be present in
          # the JSON response if and only if `category` is equal to
          # `inbound_check_deposit_return_intention`. An Inbound Check Deposit Return
          # Intention is created when Increase receives an Inbound Check and the User
          # requests that it be returned.
          inbound_check_deposit_return_intention:,
          # An Inbound FedNow Transfer Confirmation object. This field will be present in
          # the JSON response if and only if `category` is equal to
          # `inbound_fednow_transfer_confirmation`. An Inbound FedNow Transfer Confirmation
          # is created when a FedNow transfer is initiated at another bank and received by
          # Increase.
          inbound_fednow_transfer_confirmation:,
          # An Inbound Real-Time Payments Transfer Confirmation object. This field will be
          # present in the JSON response if and only if `category` is equal to
          # `inbound_real_time_payments_transfer_confirmation`. An Inbound Real-Time
          # Payments Transfer Confirmation is created when a Real-Time Payments transfer is
          # initiated at another bank and received by Increase.
          inbound_real_time_payments_transfer_confirmation:,
          # An Inbound Wire Reversal object. This field will be present in the JSON response
          # if and only if `category` is equal to `inbound_wire_reversal`. An Inbound Wire
          # Reversal represents a reversal of a wire transfer that was initiated via
          # Increase. The other bank is sending the money back. This most often happens when
          # the original destination account details were incorrect.
          inbound_wire_reversal:,
          # An Inbound Wire Transfer Intention object. This field will be present in the
          # JSON response if and only if `category` is equal to `inbound_wire_transfer`. An
          # Inbound Wire Transfer Intention is created when a wire transfer is initiated at
          # another bank and received by Increase.
          inbound_wire_transfer:,
          # An Inbound Wire Transfer Reversal Intention object. This field will be present
          # in the JSON response if and only if `category` is equal to
          # `inbound_wire_transfer_reversal`. An Inbound Wire Transfer Reversal Intention is
          # created when Increase has received a wire and the User requests that it be
          # reversed.
          inbound_wire_transfer_reversal:,
          # An Interest Payment object. This field will be present in the JSON response if
          # and only if `category` is equal to `interest_payment`. An Interest Payment
          # represents a payment of interest on an account. Interest is usually paid
          # monthly.
          interest_payment:,
          # An Internal Source object. This field will be present in the JSON response if
          # and only if `category` is equal to `internal_source`. A transaction between the
          # user and Increase. See the `reason` attribute for more information.
          internal_source:,
          # If the category of this Transaction source is equal to `other`, this field will
          # contain an empty object, otherwise it will contain null.
          other:,
          # A Real-Time Payments Transfer Acknowledgement object. This field will be present
          # in the JSON response if and only if `category` is equal to
          # `real_time_payments_transfer_acknowledgement`. A Real-Time Payments Transfer
          # Acknowledgement is created when a Real-Time Payments Transfer sent from Increase
          # is acknowledged by the receiving bank.
          real_time_payments_transfer_acknowledgement:,
          # A Sample Funds object. This field will be present in the JSON response if and
          # only if `category` is equal to `sample_funds`. Sample funds for testing
          # purposes.
          sample_funds:,
          # A Swift Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `swift_transfer_intention`. A
          # Swift Transfer initiated via Increase.
          swift_transfer_intention:,
          # A Swift Transfer Return object. This field will be present in the JSON response
          # if and only if `category` is equal to `swift_transfer_return`. A Swift Transfer
          # Return is created when a Swift Transfer is returned by the receiving bank.
          swift_transfer_return:,
          # A Wire Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `wire_transfer_intention`. A Wire
          # Transfer initiated via Increase and sent to a different bank.
          wire_transfer_intention:
        )
        end

        sig do
          override.returns(
            {
              account_revenue_payment:
                T.nilable(Increase::Transaction::Source::AccountRevenuePayment),
              account_transfer_intention:
                T.nilable(
                  Increase::Transaction::Source::AccountTransferIntention
                ),
              ach_transfer_intention:
                T.nilable(Increase::Transaction::Source::ACHTransferIntention),
              ach_transfer_rejection:
                T.nilable(Increase::Transaction::Source::ACHTransferRejection),
              ach_transfer_return:
                T.nilable(Increase::Transaction::Source::ACHTransferReturn),
              card_dispute_acceptance:
                T.nilable(Increase::Transaction::Source::CardDisputeAcceptance),
              card_dispute_financial:
                T.nilable(Increase::Transaction::Source::CardDisputeFinancial),
              card_dispute_loss:
                T.nilable(Increase::Transaction::Source::CardDisputeLoss),
              card_financial:
                T.nilable(Increase::Transaction::Source::CardFinancial),
              card_push_transfer_acceptance:
                T.nilable(
                  Increase::Transaction::Source::CardPushTransferAcceptance
                ),
              card_refund: T.nilable(Increase::Transaction::Source::CardRefund),
              card_revenue_payment:
                T.nilable(Increase::Transaction::Source::CardRevenuePayment),
              card_settlement:
                T.nilable(Increase::Transaction::Source::CardSettlement),
              cashback_payment:
                T.nilable(Increase::Transaction::Source::CashbackPayment),
              category: Increase::Transaction::Source::Category::TaggedSymbol,
              check_deposit_acceptance:
                T.nilable(
                  Increase::Transaction::Source::CheckDepositAcceptance
                ),
              check_deposit_return:
                T.nilable(Increase::Transaction::Source::CheckDepositReturn),
              check_transfer_deposit:
                T.nilable(Increase::Transaction::Source::CheckTransferDeposit),
              fednow_transfer_acknowledgement:
                T.nilable(
                  Increase::Transaction::Source::FednowTransferAcknowledgement
                ),
              fee_payment: T.nilable(Increase::Transaction::Source::FeePayment),
              inbound_ach_transfer:
                T.nilable(Increase::Transaction::Source::InboundACHTransfer),
              inbound_ach_transfer_return_intention:
                T.nilable(
                  Increase::Transaction::Source::InboundACHTransferReturnIntention
                ),
              inbound_check_adjustment:
                T.nilable(
                  Increase::Transaction::Source::InboundCheckAdjustment
                ),
              inbound_check_deposit_return_intention:
                T.nilable(
                  Increase::Transaction::Source::InboundCheckDepositReturnIntention
                ),
              inbound_fednow_transfer_confirmation:
                T.nilable(
                  Increase::Transaction::Source::InboundFednowTransferConfirmation
                ),
              inbound_real_time_payments_transfer_confirmation:
                T.nilable(
                  Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation
                ),
              inbound_wire_reversal:
                T.nilable(Increase::Transaction::Source::InboundWireReversal),
              inbound_wire_transfer:
                T.nilable(Increase::Transaction::Source::InboundWireTransfer),
              inbound_wire_transfer_reversal:
                T.nilable(
                  Increase::Transaction::Source::InboundWireTransferReversal
                ),
              interest_payment:
                T.nilable(Increase::Transaction::Source::InterestPayment),
              internal_source:
                T.nilable(Increase::Transaction::Source::InternalSource),
              other: T.nilable(Increase::Transaction::Source::Other),
              real_time_payments_transfer_acknowledgement:
                T.nilable(
                  Increase::Transaction::Source::RealTimePaymentsTransferAcknowledgement
                ),
              sample_funds:
                T.nilable(Increase::Transaction::Source::SampleFunds),
              swift_transfer_intention:
                T.nilable(
                  Increase::Transaction::Source::SwiftTransferIntention
                ),
              swift_transfer_return:
                T.nilable(Increase::Transaction::Source::SwiftTransferReturn),
              wire_transfer_intention:
                T.nilable(Increase::Transaction::Source::WireTransferIntention)
            }
          )
        end
        def to_hash
        end

        class AccountRevenuePayment < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::AccountRevenuePayment,
                Increase::Internal::AnyHash
              )
            end

          # The account on which the account revenue was accrued.
          sig { returns(String) }
          attr_accessor :accrued_on_account_id

          # The end of the period for which this transaction paid account revenue.
          sig { returns(Time) }
          attr_accessor :period_end

          # The start of the period for which this transaction paid account revenue.
          sig { returns(Time) }
          attr_accessor :period_start

          # An Account Revenue Payment object. This field will be present in the JSON
          # response if and only if `category` is equal to `account_revenue_payment`. An
          # Account Revenue Payment represents a payment made to an account from the bank.
          # Account revenue is a type of non-interest income.
          sig do
            params(
              accrued_on_account_id: String,
              period_end: Time,
              period_start: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # The account on which the account revenue was accrued.
            accrued_on_account_id:,
            # The end of the period for which this transaction paid account revenue.
            period_end:,
            # The start of the period for which this transaction paid account revenue.
            period_start:
          )
          end

          sig do
            override.returns(
              {
                accrued_on_account_id: String,
                period_end: Time,
                period_start: Time
              }
            )
          end
          def to_hash
          end
        end

        class AccountTransferIntention < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::AccountTransferIntention,
                Increase::Internal::AnyHash
              )
            end

          # The pending amount in the minor unit of the transaction's currency. For dollars,
          # for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          sig do
            returns(
              Increase::Transaction::Source::AccountTransferIntention::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The description you chose to give the transfer.
          sig { returns(String) }
          attr_accessor :description

          # The identifier of the Account to where the Account Transfer was sent.
          sig { returns(String) }
          attr_accessor :destination_account_id

          # The identifier of the Account from where the Account Transfer was sent.
          sig { returns(String) }
          attr_accessor :source_account_id

          # The identifier of the Account Transfer that led to this Pending Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An Account Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `account_transfer_intention`. Two
          # Account Transfer Intentions are created from each Account Transfer. One
          # decrements the source account, and the other increments the destination account.
          sig do
            params(
              amount: Integer,
              currency:
                Increase::Transaction::Source::AccountTransferIntention::Currency::OrSymbol,
              description: String,
              destination_account_id: String,
              source_account_id: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The pending amount in the minor unit of the transaction's currency. For dollars,
            # for example, this is cents.
            amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
            # account currency.
            currency:,
            # The description you chose to give the transfer.
            description:,
            # The identifier of the Account to where the Account Transfer was sent.
            destination_account_id:,
            # The identifier of the Account from where the Account Transfer was sent.
            source_account_id:,
            # The identifier of the Account Transfer that led to this Pending Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                currency:
                  Increase::Transaction::Source::AccountTransferIntention::Currency::TaggedSymbol,
                description: String,
                destination_account_id: String,
                source_account_id: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::AccountTransferIntention::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::AccountTransferIntention::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::AccountTransferIntention::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ACHTransferIntention < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::ACHTransferIntention,
                Increase::Internal::AnyHash
              )
            end

          # The account number for the destination account.
          sig { returns(String) }
          attr_accessor :account_number

          # The amount in the minor unit of the transaction's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
          # destination account.
          sig { returns(String) }
          attr_accessor :routing_number

          # A description set when the ACH Transfer was created.
          sig { returns(String) }
          attr_accessor :statement_descriptor

          # The identifier of the ACH Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An ACH Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `ach_transfer_intention`. An ACH
          # Transfer Intention is created from an ACH Transfer. It reflects the intention to
          # move money into or out of an Increase account via the ACH network.
          sig do
            params(
              account_number: String,
              amount: Integer,
              routing_number: String,
              statement_descriptor: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The account number for the destination account.
            account_number:,
            # The amount in the minor unit of the transaction's currency. For dollars, for
            # example, this is cents.
            amount:,
            # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
            # destination account.
            routing_number:,
            # A description set when the ACH Transfer was created.
            statement_descriptor:,
            # The identifier of the ACH Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                account_number: String,
                amount: Integer,
                routing_number: String,
                statement_descriptor: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end
        end

        class ACHTransferRejection < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::ACHTransferRejection,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the ACH Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An ACH Transfer Rejection object. This field will be present in the JSON
          # response if and only if `category` is equal to `ach_transfer_rejection`. An ACH
          # Transfer Rejection is created when an ACH Transfer is rejected by Increase. It
          # offsets the ACH Transfer Intention. These rejections are rare.
          sig { params(transfer_id: String).returns(T.attached_class) }
          def self.new(
            # The identifier of the ACH Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ transfer_id: String }) }
          def to_hash
          end
        end

        class ACHTransferReturn < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::ACHTransferReturn,
                Increase::Internal::AnyHash
              )
            end

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # The three character ACH return code, in the range R01 to R85.
          sig { returns(String) }
          attr_accessor :raw_return_reason_code

          # Why the ACH Transfer was returned. This reason code is sent by the receiving
          # bank back to Increase.
          sig do
            returns(
              Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
            )
          end
          attr_accessor :return_reason_code

          # A 15 digit number that was generated by the bank that initiated the return. The
          # trace number of the return is different than that of the original transfer. ACH
          # trace numbers are not unique, but along with the amount and date this number can
          # be used to identify the ACH return at the bank that initiated it.
          sig { returns(String) }
          attr_accessor :trace_number

          # The identifier of the Transaction associated with this return.
          sig { returns(String) }
          attr_accessor :transaction_id

          # The identifier of the ACH Transfer associated with this return.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An ACH Transfer Return object. This field will be present in the JSON response
          # if and only if `category` is equal to `ach_transfer_return`. An ACH Transfer
          # Return is created when an ACH Transfer is returned by the receiving bank. It
          # offsets the ACH Transfer Intention. ACH Transfer Returns usually occur within
          # the first two business days after the transfer is initiated, but can occur much
          # later.
          sig do
            params(
              created_at: Time,
              raw_return_reason_code: String,
              return_reason_code:
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::OrSymbol,
              trace_number: String,
              transaction_id: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the transfer was created.
            created_at:,
            # The three character ACH return code, in the range R01 to R85.
            raw_return_reason_code:,
            # Why the ACH Transfer was returned. This reason code is sent by the receiving
            # bank back to Increase.
            return_reason_code:,
            # A 15 digit number that was generated by the bank that initiated the return. The
            # trace number of the return is different than that of the original transfer. ACH
            # trace numbers are not unique, but along with the amount and date this number can
            # be used to identify the ACH return at the bank that initiated it.
            trace_number:,
            # The identifier of the Transaction associated with this return.
            transaction_id:,
            # The identifier of the ACH Transfer associated with this return.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                created_at: Time,
                raw_return_reason_code: String,
                return_reason_code:
                  Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol,
                trace_number: String,
                transaction_id: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end

          # Why the ACH Transfer was returned. This reason code is sent by the receiving
          # bank back to Increase.
          module ReturnReasonCode
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Code R01. Insufficient funds in the receiving account. Sometimes abbreviated to NSF.
            INSUFFICIENT_FUND =
              T.let(
                :insufficient_fund,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R03. The account does not exist or the receiving bank was unable to locate it.
            NO_ACCOUNT =
              T.let(
                :no_account,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R02. The account is closed at the receiving bank.
            ACCOUNT_CLOSED =
              T.let(
                :account_closed,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R04. The account number is invalid at the receiving bank.
            INVALID_ACCOUNT_NUMBER_STRUCTURE =
              T.let(
                :invalid_account_number_structure,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R16. The account at the receiving bank was frozen per the Office of Foreign Assets Control.
            ACCOUNT_FROZEN_ENTRY_RETURNED_PER_OFAC_INSTRUCTION =
              T.let(
                :account_frozen_entry_returned_per_ofac_instruction,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R23. The receiving bank account refused a credit transfer.
            CREDIT_ENTRY_REFUSED_BY_RECEIVER =
              T.let(
                :credit_entry_refused_by_receiver,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R05. The receiving bank rejected because of an incorrect Standard Entry Class code.
            UNAUTHORIZED_DEBIT_TO_CONSUMER_ACCOUNT_USING_CORPORATE_SEC_CODE =
              T.let(
                :unauthorized_debit_to_consumer_account_using_corporate_sec_code,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R29. The corporate customer at the receiving bank reversed the transfer.
            CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED =
              T.let(
                :corporate_customer_advised_not_authorized,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R08. The receiving bank stopped payment on this transfer.
            PAYMENT_STOPPED =
              T.let(
                :payment_stopped,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R20. The receiving bank account does not perform transfers.
            NON_TRANSACTION_ACCOUNT =
              T.let(
                :non_transaction_account,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R09. The receiving bank account does not have enough available balance for the transfer.
            UNCOLLECTED_FUNDS =
              T.let(
                :uncollected_funds,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R28. The routing number is incorrect.
            ROUTING_NUMBER_CHECK_DIGIT_ERROR =
              T.let(
                :routing_number_check_digit_error,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R10. The customer at the receiving bank reversed the transfer.
            CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
              T.let(
                :customer_advised_unauthorized_improper_ineligible_or_incomplete,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R19. The amount field is incorrect or too large.
            AMOUNT_FIELD_ERROR =
              T.let(
                :amount_field_error,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R07. The customer at the receiving institution informed their bank that they have revoked authorization for a previously authorized transfer.
            AUTHORIZATION_REVOKED_BY_CUSTOMER =
              T.let(
                :authorization_revoked_by_customer,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R13. The routing number is invalid.
            INVALID_ACH_ROUTING_NUMBER =
              T.let(
                :invalid_ach_routing_number,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R17. The receiving bank is unable to process a field in the transfer.
            FILE_RECORD_EDIT_CRITERIA =
              T.let(
                :file_record_edit_criteria,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R45. The individual name field was invalid.
            ENR_INVALID_INDIVIDUAL_NAME =
              T.let(
                :enr_invalid_individual_name,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R06. The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request.
            RETURNED_PER_ODFI_REQUEST =
              T.let(
                :returned_per_odfi_request,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R34. The receiving bank's regulatory supervisor has limited their participation in the ACH network.
            LIMITED_PARTICIPATION_DFI =
              T.let(
                :limited_participation_dfi,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R85. The outbound international ACH transfer was incorrect.
            INCORRECTLY_CODED_OUTBOUND_INTERNATIONAL_PAYMENT =
              T.let(
                :incorrectly_coded_outbound_international_payment,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R12. A rare return reason. The account was sold to another bank.
            ACCOUNT_SOLD_TO_ANOTHER_DFI =
              T.let(
                :account_sold_to_another_dfi,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R25. The addenda record is incorrect or missing.
            ADDENDA_ERROR =
              T.let(
                :addenda_error,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R15. A rare return reason. The account holder is deceased.
            BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED =
              T.let(
                :beneficiary_or_account_holder_deceased,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R11. A rare return reason. The customer authorized some payment to the sender, but this payment was not in error.
            CUSTOMER_ADVISED_NOT_WITHIN_AUTHORIZATION_TERMS =
              T.let(
                :customer_advised_not_within_authorization_terms,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R74. A rare return reason. Sent in response to a return that was returned with code `field_error`. The latest return should include the corrected field(s).
            CORRECTED_RETURN =
              T.let(
                :corrected_return,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R24. A rare return reason. The receiving bank received an exact duplicate entry with the same trace number and amount.
            DUPLICATE_ENTRY =
              T.let(
                :duplicate_entry,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R67. A rare return reason. The return this message refers to was a duplicate.
            DUPLICATE_RETURN =
              T.let(
                :duplicate_return,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R47. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_DUPLICATE_ENROLLMENT =
              T.let(
                :enr_duplicate_enrollment,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R43. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_INVALID_DFI_ACCOUNT_NUMBER =
              T.let(
                :enr_invalid_dfi_account_number,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R44. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_INVALID_INDIVIDUAL_ID_NUMBER =
              T.let(
                :enr_invalid_individual_id_number,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R46. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_INVALID_REPRESENTATIVE_PAYEE_INDICATOR =
              T.let(
                :enr_invalid_representative_payee_indicator,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R41. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_INVALID_TRANSACTION_CODE =
              T.let(
                :enr_invalid_transaction_code,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R40. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_RETURN_OF_ENR_ENTRY =
              T.let(
                :enr_return_of_enr_entry,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R42. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_ROUTING_NUMBER_CHECK_DIGIT_ERROR =
              T.let(
                :enr_routing_number_check_digit_error,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R84. A rare return reason. The International ACH Transfer cannot be processed by the gateway.
            ENTRY_NOT_PROCESSED_BY_GATEWAY =
              T.let(
                :entry_not_processed_by_gateway,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R69. A rare return reason. One or more of the fields in the ACH were malformed.
            FIELD_ERROR =
              T.let(
                :field_error,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R83. A rare return reason. The Foreign receiving bank was unable to settle this ACH transfer.
            FOREIGN_RECEIVING_DFI_UNABLE_TO_SETTLE =
              T.let(
                :foreign_receiving_dfi_unable_to_settle,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R80. A rare return reason. The International ACH Transfer is malformed.
            IAT_ENTRY_CODING_ERROR =
              T.let(
                :iat_entry_coding_error,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R18. A rare return reason. The ACH has an improper effective entry date field.
            IMPROPER_EFFECTIVE_ENTRY_DATE =
              T.let(
                :improper_effective_entry_date,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R39. A rare return reason. The source document related to this ACH, usually an ACH check conversion, was presented to the bank.
            IMPROPER_SOURCE_DOCUMENT_SOURCE_DOCUMENT_PRESENTED =
              T.let(
                :improper_source_document_source_document_presented,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R21. A rare return reason. The Company ID field of the ACH was invalid.
            INVALID_COMPANY_ID =
              T.let(
                :invalid_company_id,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R82. A rare return reason. The foreign receiving bank identifier for an International ACH Transfer was invalid.
            INVALID_FOREIGN_RECEIVING_DFI_IDENTIFICATION =
              T.let(
                :invalid_foreign_receiving_dfi_identification,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R22. A rare return reason. The Individual ID number field of the ACH was invalid.
            INVALID_INDIVIDUAL_ID_NUMBER =
              T.let(
                :invalid_individual_id_number,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R53. A rare return reason. Both the Represented Check ("RCK") entry and the original check were presented to the bank.
            ITEM_AND_RCK_ENTRY_PRESENTED_FOR_PAYMENT =
              T.let(
                :item_and_rck_entry_presented_for_payment,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R51. A rare return reason. The Represented Check ("RCK") entry is ineligible.
            ITEM_RELATED_TO_RCK_ENTRY_IS_INELIGIBLE =
              T.let(
                :item_related_to_rck_entry_is_ineligible,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R26. A rare return reason. The ACH is missing a required field.
            MANDATORY_FIELD_ERROR =
              T.let(
                :mandatory_field_error,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R71. A rare return reason. The receiving bank does not recognize the routing number in a dishonored return entry.
            MISROUTED_DISHONORED_RETURN =
              T.let(
                :misrouted_dishonored_return,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R61. A rare return reason. The receiving bank does not recognize the routing number in a return entry.
            MISROUTED_RETURN =
              T.let(
                :misrouted_return,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R76. A rare return reason. Sent in response to a return, the bank does not find the errors alleged by the returning bank.
            NO_ERRORS_FOUND =
              T.let(
                :no_errors_found,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R77. A rare return reason. The receiving bank does not accept the return of the erroneous debit. The funds are not available at the receiving bank.
            NON_ACCEPTANCE_OF_R62_DISHONORED_RETURN =
              T.let(
                :non_acceptance_of_r62_dishonored_return,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R81. A rare return reason. The receiving bank does not accept International ACH Transfers.
            NON_PARTICIPANT_IN_IAT_PROGRAM =
              T.let(
                :non_participant_in_iat_program,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R31. A rare return reason. A return that has been agreed to be accepted by the receiving bank, despite falling outside of the usual return timeframe.
            PERMISSIBLE_RETURN_ENTRY =
              T.let(
                :permissible_return_entry,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R70. A rare return reason. The receiving bank had not approved this return.
            PERMISSIBLE_RETURN_ENTRY_NOT_ACCEPTED =
              T.let(
                :permissible_return_entry_not_accepted,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R32. A rare return reason. The receiving bank could not settle this transaction.
            RDFI_NON_SETTLEMENT =
              T.let(
                :rdfi_non_settlement,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R30. A rare return reason. The receiving bank does not accept Check Truncation ACH transfers.
            RDFI_PARTICIPANT_IN_CHECK_TRUNCATION_PROGRAM =
              T.let(
                :rdfi_participant_in_check_truncation_program,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R14. A rare return reason. The payee is deceased.
            REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
              T.let(
                :representative_payee_deceased_or_unable_to_continue_in_that_capacity,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R75. A rare return reason. The originating bank disputes that an earlier `duplicate_entry` return was actually a duplicate.
            RETURN_NOT_A_DUPLICATE =
              T.let(
                :return_not_a_duplicate,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R62. A rare return reason. The originating financial institution made a mistake and this return corrects it.
            RETURN_OF_ERRONEOUS_OR_REVERSING_DEBIT =
              T.let(
                :return_of_erroneous_or_reversing_debit,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R36. A rare return reason. Return of a malformed credit entry.
            RETURN_OF_IMPROPER_CREDIT_ENTRY =
              T.let(
                :return_of_improper_credit_entry,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R35. A rare return reason. Return of a malformed debit entry.
            RETURN_OF_IMPROPER_DEBIT_ENTRY =
              T.let(
                :return_of_improper_debit_entry,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R33. A rare return reason. Return of a Destroyed Check ("XKC") entry.
            RETURN_OF_XCK_ENTRY =
              T.let(
                :return_of_xck_entry,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R37. A rare return reason. The source document related to this ACH, usually an ACH check conversion, was presented to the bank.
            SOURCE_DOCUMENT_PRESENTED_FOR_PAYMENT =
              T.let(
                :source_document_presented_for_payment,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R50. A rare return reason. State law prevents the bank from accepting the Represented Check ("RCK") entry.
            STATE_LAW_AFFECTING_RCK_ACCEPTANCE =
              T.let(
                :state_law_affecting_rck_acceptance,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R52. A rare return reason. A stop payment was issued on a Represented Check ("RCK") entry.
            STOP_PAYMENT_ON_ITEM_RELATED_TO_RCK_ENTRY =
              T.let(
                :stop_payment_on_item_related_to_rck_entry,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R38. A rare return reason. The source attached to the ACH, usually an ACH check conversion, includes a stop payment.
            STOP_PAYMENT_ON_SOURCE_DOCUMENT =
              T.let(
                :stop_payment_on_source_document,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R73. A rare return reason. The bank receiving an `untimely_return` believes it was on time.
            TIMELY_ORIGINAL_RETURN =
              T.let(
                :timely_original_return,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R27. A rare return reason. An ACH return's trace number does not match an originated ACH.
            TRACE_NUMBER_ERROR =
              T.let(
                :trace_number_error,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R72. A rare return reason. The dishonored return was sent too late.
            UNTIMELY_DISHONORED_RETURN =
              T.let(
                :untimely_dishonored_return,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            # Code R68. A rare return reason. The return was sent too late.
            UNTIMELY_RETURN =
              T.let(
                :untimely_return,
                Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardDisputeAcceptance < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CardDisputeAcceptance,
                Increase::Internal::AnyHash
              )
            end

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Card Dispute was accepted.
          sig { returns(Time) }
          attr_accessor :accepted_at

          # The identifier of the Transaction that was created to return the disputed funds
          # to your account.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A Legacy Card Dispute Acceptance object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_dispute_acceptance`.
          # Contains the details of a successful Card Dispute.
          sig do
            params(accepted_at: Time, transaction_id: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the Card Dispute was accepted.
            accepted_at:,
            # The identifier of the Transaction that was created to return the disputed funds
            # to your account.
            transaction_id:
          )
          end

          sig do
            override.returns({ accepted_at: Time, transaction_id: String })
          end
          def to_hash
          end
        end

        class CardDisputeFinancial < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CardDisputeFinancial,
                Increase::Internal::AnyHash
              )
            end

          # The amount of the financial event.
          sig { returns(Integer) }
          attr_accessor :amount

          # The network that the Card Dispute is associated with.
          sig do
            returns(
              Increase::Transaction::Source::CardDisputeFinancial::Network::TaggedSymbol
            )
          end
          attr_accessor :network

          # The identifier of the Transaction that was created to credit or debit the
          # disputed funds to or from your account.
          sig { returns(String) }
          attr_accessor :transaction_id

          # Information for events related to card dispute for card payments processed over
          # Visa's network. This field will be present in the JSON response if and only if
          # `network` is equal to `visa`.
          sig do
            returns(
              T.nilable(
                Increase::Transaction::Source::CardDisputeFinancial::Visa
              )
            )
          end
          attr_reader :visa

          sig do
            params(
              visa:
                T.nilable(
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::OrHash
                )
            ).void
          end
          attr_writer :visa

          # A Card Dispute Financial object. This field will be present in the JSON response
          # if and only if `category` is equal to `card_dispute_financial`. Financial event
          # related to a Card Dispute.
          sig do
            params(
              amount: Integer,
              network:
                Increase::Transaction::Source::CardDisputeFinancial::Network::OrSymbol,
              transaction_id: String,
              visa:
                T.nilable(
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The amount of the financial event.
            amount:,
            # The network that the Card Dispute is associated with.
            network:,
            # The identifier of the Transaction that was created to credit or debit the
            # disputed funds to or from your account.
            transaction_id:,
            # Information for events related to card dispute for card payments processed over
            # Visa's network. This field will be present in the JSON response if and only if
            # `network` is equal to `visa`.
            visa:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                network:
                  Increase::Transaction::Source::CardDisputeFinancial::Network::TaggedSymbol,
                transaction_id: String,
                visa:
                  T.nilable(
                    Increase::Transaction::Source::CardDisputeFinancial::Visa
                  )
              }
            )
          end
          def to_hash
          end

          # The network that the Card Dispute is associated with.
          module Network
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardDisputeFinancial::Network
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa: details will be under the `visa` object.
            VISA =
              T.let(
                :visa,
                Increase::Transaction::Source::CardDisputeFinancial::Network::TaggedSymbol
              )

            # Pulse: details will be under the `pulse` object.
            PULSE =
              T.let(
                :pulse,
                Increase::Transaction::Source::CardDisputeFinancial::Network::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardDisputeFinancial::Network::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Visa < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardDisputeFinancial::Visa,
                  Increase::Internal::AnyHash
                )
              end

            # The type of card dispute financial event.
            sig do
              returns(
                Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
              )
            end
            attr_accessor :event_type

            # Information for events related to card dispute for card payments processed over
            # Visa's network. This field will be present in the JSON response if and only if
            # `network` is equal to `visa`.
            sig do
              params(
                event_type:
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The type of card dispute financial event.
              event_type:
            )
            end

            sig do
              override.returns(
                {
                  event_type:
                    Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The type of card dispute financial event.
            module EventType
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # The user's chargeback was submitted.
              CHARGEBACK_SUBMITTED =
                T.let(
                  :chargeback_submitted,
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                )

              # The user declined the merchant's pre-arbitration submission.
              MERCHANT_PREARBITRATION_DECLINE_SUBMITTED =
                T.let(
                  :merchant_prearbitration_decline_submitted,
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                )

              # The merchant's pre-arbitration submission was received.
              MERCHANT_PREARBITRATION_RECEIVED =
                T.let(
                  :merchant_prearbitration_received,
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                )

              # The transaction was re-presented by the merchant.
              REPRESENTED =
                T.let(
                  :represented,
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                )

              # The user's pre-arbitration was declined by the merchant.
              USER_PREARBITRATION_DECLINE_RECEIVED =
                T.let(
                  :user_prearbitration_decline_received,
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                )

              # The user's pre-arbitration was submitted.
              USER_PREARBITRATION_SUBMITTED =
                T.let(
                  :user_prearbitration_submitted,
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                )

              # The user withdrew from the dispute.
              USER_WITHDRAWAL_SUBMITTED =
                T.let(
                  :user_withdrawal_submitted,
                  Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::CardDisputeFinancial::Visa::EventType::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class CardDisputeLoss < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CardDisputeLoss,
                Increase::Internal::AnyHash
              )
            end

          # Why the Card Dispute was lost.
          sig { returns(String) }
          attr_accessor :explanation

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Card Dispute was lost.
          sig { returns(Time) }
          attr_accessor :lost_at

          # The identifier of the Transaction that was created to debit the disputed funds
          # from your account.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A Legacy Card Dispute Loss object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_dispute_loss`. Contains the
          # details of a lost Card Dispute.
          sig do
            params(
              explanation: String,
              lost_at: Time,
              transaction_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Why the Card Dispute was lost.
            explanation:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the Card Dispute was lost.
            lost_at:,
            # The identifier of the Transaction that was created to debit the disputed funds
            # from your account.
            transaction_id:
          )
          end

          sig do
            override.returns(
              { explanation: String, lost_at: Time, transaction_id: String }
            )
          end
          def to_hash
          end
        end

        class CardFinancial < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CardFinancial,
                Increase::Internal::AnyHash
              )
            end

          # The Card Financial identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this financial was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          sig do
            returns(
              Increase::Transaction::Source::CardFinancial::Actioner::TaggedSymbol
            )
          end
          attr_accessor :actioner

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            returns(
              Increase::Transaction::Source::CardFinancial::AdditionalAmounts
            )
          end
          attr_reader :additional_amounts

          sig do
            params(
              additional_amounts:
                Increase::Transaction::Source::CardFinancial::AdditionalAmounts::OrHash
            ).void
          end
          attr_writer :additional_amounts

          # The pending amount in the minor unit of the transaction's currency. For dollars,
          # for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          sig do
            returns(
              Increase::Transaction::Source::CardFinancial::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :digital_wallet_token_id

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          sig do
            returns(
              Increase::Transaction::Source::CardFinancial::Direction::TaggedSymbol
            )
          end
          attr_accessor :direction

          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_acceptor_id

          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_category_code

          # The city the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_city

          # The country the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_country

          # The merchant descriptor of the merchant the card is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_descriptor

          # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          # ZIP code, where the first 5 and last 4 are separated by a dash.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_postal_code

          # The state the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_state

          # Fields specific to the `network`.
          sig do
            returns(
              Increase::Transaction::Source::CardFinancial::NetworkDetails
            )
          end
          attr_reader :network_details

          sig do
            params(
              network_details:
                Increase::Transaction::Source::CardFinancial::NetworkDetails::OrHash
            ).void
          end
          attr_writer :network_details

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::Transaction::Source::CardFinancial::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::Transaction::Source::CardFinancial::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          # score is from 0 to 999, where 999 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :physical_card_id

          # The pending amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # The processing category describes the intent behind the financial, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          sig do
            returns(
              Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
            )
          end
          attr_accessor :processing_category

          # The identifier of the Real-Time Decision sent to approve or decline this
          # transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # The identifier of the Transaction associated with this Transaction.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A constant representing the object's type. For this resource it will always be
          # `card_financial`.
          sig do
            returns(
              Increase::Transaction::Source::CardFinancial::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Fields related to verification of cardholder-provided values.
          sig do
            returns(Increase::Transaction::Source::CardFinancial::Verification)
          end
          attr_reader :verification

          sig do
            params(
              verification:
                Increase::Transaction::Source::CardFinancial::Verification::OrHash
            ).void
          end
          attr_writer :verification

          # A Card Financial object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_financial`. Card Financials are temporary
          # holds placed on a customers funds with the intent to later clear a transaction.
          sig do
            params(
              id: String,
              actioner:
                Increase::Transaction::Source::CardFinancial::Actioner::OrSymbol,
              additional_amounts:
                Increase::Transaction::Source::CardFinancial::AdditionalAmounts::OrHash,
              amount: Integer,
              card_payment_id: String,
              currency:
                Increase::Transaction::Source::CardFinancial::Currency::OrSymbol,
              digital_wallet_token_id: T.nilable(String),
              direction:
                Increase::Transaction::Source::CardFinancial::Direction::OrSymbol,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::Transaction::Source::CardFinancial::NetworkDetails::OrHash,
              network_identifiers:
                Increase::Transaction::Source::CardFinancial::NetworkIdentifiers::OrHash,
              network_risk_score: T.nilable(Integer),
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category:
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::OrSymbol,
              real_time_decision_id: T.nilable(String),
              terminal_id: T.nilable(String),
              transaction_id: String,
              type:
                Increase::Transaction::Source::CardFinancial::Type::OrSymbol,
              verification:
                Increase::Transaction::Source::CardFinancial::Verification::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Financial identifier.
            id:,
            # Whether this financial was approved by Increase, the card network through
            # stand-in processing, or the user through a real-time decision.
            actioner:,
            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            additional_amounts:,
            # The pending amount in the minor unit of the transaction's currency. For dollars,
            # for example, this is cents.
            amount:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's currency.
            currency:,
            # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
            # purchase), the identifier of the token that was used.
            digital_wallet_token_id:,
            # The direction describes the direction the funds will move, either from the
            # cardholder to the merchant or from the merchant to the cardholder.
            direction:,
            # The merchant identifier (commonly abbreviated as MID) of the merchant the card
            # is transacting with.
            merchant_acceptor_id:,
            # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
            # card is transacting with.
            merchant_category_code:,
            # The city the merchant resides in.
            merchant_city:,
            # The country the merchant resides in.
            merchant_country:,
            # The merchant descriptor of the merchant the card is transacting with.
            merchant_descriptor:,
            # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
            # ZIP code, where the first 5 and last 4 are separated by a dash.
            merchant_postal_code:,
            # The state the merchant resides in.
            merchant_state:,
            # Fields specific to the `network`.
            network_details:,
            # Network-specific identifiers for a specific request or transaction.
            network_identifiers:,
            # The risk score generated by the card network. For Visa this is the Visa Advanced
            # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
            # score is from 0 to 999, where 999 is the riskiest.
            network_risk_score:,
            # If the authorization was made in-person with a physical card, the Physical Card
            # that was used.
            physical_card_id:,
            # The pending amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # The processing category describes the intent behind the financial, such as
            # whether it was used for bill payments or an automatic fuel dispenser.
            processing_category:,
            # The identifier of the Real-Time Decision sent to approve or decline this
            # transaction.
            real_time_decision_id:,
            # The terminal identifier (commonly abbreviated as TID) of the terminal the card
            # is transacting with.
            terminal_id:,
            # The identifier of the Transaction associated with this Transaction.
            transaction_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_financial`.
            type:,
            # Fields related to verification of cardholder-provided values.
            verification:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                actioner:
                  Increase::Transaction::Source::CardFinancial::Actioner::TaggedSymbol,
                additional_amounts:
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts,
                amount: Integer,
                card_payment_id: String,
                currency:
                  Increase::Transaction::Source::CardFinancial::Currency::TaggedSymbol,
                digital_wallet_token_id: T.nilable(String),
                direction:
                  Increase::Transaction::Source::CardFinancial::Direction::TaggedSymbol,
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: T.nilable(String),
                merchant_country: String,
                merchant_descriptor: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_details:
                  Increase::Transaction::Source::CardFinancial::NetworkDetails,
                network_identifiers:
                  Increase::Transaction::Source::CardFinancial::NetworkIdentifiers,
                network_risk_score: T.nilable(Integer),
                physical_card_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                processing_category:
                  Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol,
                real_time_decision_id: T.nilable(String),
                terminal_id: T.nilable(String),
                transaction_id: String,
                type:
                  Increase::Transaction::Source::CardFinancial::Type::TaggedSymbol,
                verification:
                  Increase::Transaction::Source::CardFinancial::Verification
              }
            )
          end
          def to_hash
          end

          # Whether this financial was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          module Actioner
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardFinancial::Actioner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # This object was actioned by the user through a real-time decision.
            USER =
              T.let(
                :user,
                Increase::Transaction::Source::CardFinancial::Actioner::TaggedSymbol
              )

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(
                :increase,
                Increase::Transaction::Source::CardFinancial::Actioner::TaggedSymbol
              )

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(
                :network,
                Increase::Transaction::Source::CardFinancial::Actioner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardFinancial::Actioner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts,
                  Increase::Internal::AnyHash
                )
              end

            # The part of this transaction amount that was for clinic-related services.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Clinic
                )
              )
            end
            attr_reader :clinic

            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Clinic::OrHash
                  )
              ).void
            end
            attr_writer :clinic

            # The part of this transaction amount that was for dental-related services.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Dental
                )
              )
            end
            attr_reader :dental

            sig do
              params(
                dental:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Dental::OrHash
                  )
              ).void
            end
            attr_writer :dental

            # The original pre-authorized amount.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Original
                )
              )
            end
            attr_reader :original

            sig do
              params(
                original:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Original::OrHash
                  )
              ).void
            end
            attr_writer :original

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Prescription
                )
              )
            end
            attr_reader :prescription

            sig do
              params(
                prescription:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Prescription::OrHash
                  )
              ).void
            end
            attr_writer :prescription

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Surcharge
                )
              )
            end
            attr_reader :surcharge

            sig do
              params(
                surcharge:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Surcharge::OrHash
                  )
              ).void
            end
            attr_writer :surcharge

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalCumulative
                )
              )
            end
            attr_reader :total_cumulative

            sig do
              params(
                total_cumulative:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalCumulative::OrHash
                  )
              ).void
            end
            attr_writer :total_cumulative

            # The total amount of healthcare-related additional amounts.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalHealthcare
                )
              )
            end
            attr_reader :total_healthcare

            sig do
              params(
                total_healthcare:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalHealthcare::OrHash
                  )
              ).void
            end
            attr_writer :total_healthcare

            # The part of this transaction amount that was for transit-related services.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Transit
                )
              )
            end
            attr_reader :transit

            sig do
              params(
                transit:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Transit::OrHash
                  )
              ).void
            end
            attr_writer :transit

            # An unknown additional amount.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Unknown
                )
              )
            end
            attr_reader :unknown

            sig do
              params(
                unknown:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Unknown::OrHash
                  )
              ).void
            end
            attr_writer :unknown

            # The part of this transaction amount that was for vision-related services.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Vision
                )
              )
            end
            attr_reader :vision

            sig do
              params(
                vision:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Vision::OrHash
                  )
              ).void
            end
            attr_writer :vision

            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Clinic::OrHash
                  ),
                dental:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Dental::OrHash
                  ),
                original:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Original::OrHash
                  ),
                prescription:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Prescription::OrHash
                  ),
                surcharge:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Surcharge::OrHash
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalCumulative::OrHash
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalHealthcare::OrHash
                  ),
                transit:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Transit::OrHash
                  ),
                unknown:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Unknown::OrHash
                  ),
                vision:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Vision::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The part of this transaction amount that was for clinic-related services.
              clinic:,
              # The part of this transaction amount that was for dental-related services.
              dental:,
              # The original pre-authorized amount.
              original:,
              # The part of this transaction amount that was for healthcare prescriptions.
              prescription:,
              # The surcharge amount charged for this transaction by the merchant.
              surcharge:,
              # The total amount of a series of incremental authorizations, optionally provided.
              total_cumulative:,
              # The total amount of healthcare-related additional amounts.
              total_healthcare:,
              # The part of this transaction amount that was for transit-related services.
              transit:,
              # An unknown additional amount.
              unknown:,
              # The part of this transaction amount that was for vision-related services.
              vision:
            )
            end

            sig do
              override.returns(
                {
                  clinic:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Clinic
                    ),
                  dental:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Dental
                    ),
                  original:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Original
                    ),
                  prescription:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Prescription
                    ),
                  surcharge:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Surcharge
                    ),
                  total_cumulative:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalCumulative
                    ),
                  total_healthcare:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalHealthcare
                    ),
                  transit:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Transit
                    ),
                  unknown:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Unknown
                    ),
                  vision:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Vision
                    )
                }
              )
            end
            def to_hash
            end

            class Clinic < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Clinic,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for clinic-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Dental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Dental,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for dental-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Original < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Original,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The original pre-authorized amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Prescription < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Prescription,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for healthcare prescriptions.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Surcharge < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Surcharge,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The surcharge amount charged for this transaction by the merchant.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalCumulative < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalCumulative,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of a series of incremental authorizations, optionally provided.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalHealthcare < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::TotalHealthcare,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of healthcare-related additional amounts.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Transit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Transit,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for transit-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Unknown < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Unknown,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # An unknown additional amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Vision < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::AdditionalAmounts::Vision,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for vision-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardFinancial::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::CardFinancial::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardFinancial::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          module Direction
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardFinancial::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT =
              T.let(
                :settlement,
                Increase::Transaction::Source::CardFinancial::Direction::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::Transaction::Source::CardFinancial::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardFinancial::Direction::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NetworkDetails < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardFinancial::NetworkDetails,
                  Increase::Internal::AnyHash
                )
              end

            # The payment network used to process this card authorization.
            sig do
              returns(
                Increase::Transaction::Source::CardFinancial::NetworkDetails::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Fields specific to the `pulse` network.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::NetworkDetails::Pulse
                )
              )
            end
            attr_reader :pulse

            sig do
              params(
                pulse:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Pulse::OrHash
                  )
              ).void
            end
            attr_writer :pulse

            # Fields specific to the `visa` network.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa
                )
              )
            end
            attr_reader :visa

            sig do
              params(
                visa:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::OrHash
                  )
              ).void
            end
            attr_writer :visa

            # Fields specific to the `network`.
            sig do
              params(
                category:
                  Increase::Transaction::Source::CardFinancial::NetworkDetails::Category::OrSymbol,
                pulse:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Pulse::OrHash
                  ),
                visa:
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The payment network used to process this card authorization.
              category:,
              # Fields specific to the `pulse` network.
              pulse:,
              # Fields specific to the `visa` network.
              visa:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Category::TaggedSymbol,
                  pulse:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Pulse
                    ),
                  visa:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa
                    )
                }
              )
            end
            def to_hash
            end

            # The payment network used to process this card authorization.
            module Category
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Visa
              VISA =
                T.let(
                  :visa,
                  Increase::Transaction::Source::CardFinancial::NetworkDetails::Category::TaggedSymbol
                )

              # Pulse
              PULSE =
                T.let(
                  :pulse,
                  Increase::Transaction::Source::CardFinancial::NetworkDetails::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Pulse < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Pulse,
                    Increase::Internal::AnyHash
                  )
                end

              # Fields specific to the `pulse` network.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class Visa < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :electronic_commerce_indicator

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )
                )
              end
              attr_accessor :point_of_service_entry_mode

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )
                )
              end
              attr_accessor :stand_in_processing_reason

              # Fields specific to the `visa` network.
              sig do
                params(
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # For electronic commerce transactions, this identifies the level of security used
                # in obtaining the customer's payment credential. For mail or telephone order
                # transactions, identifies the type of mail or telephone order.
                electronic_commerce_indicator:,
                # The method used to enter the cardholder's primary account number and card
                # expiration date.
                point_of_service_entry_mode:,
                # Only present when `actioner: network`. Describes why a card authorization was
                # approved or declined by Visa through stand-in processing.
                stand_in_processing_reason:
              )
              end

              sig do
                override.returns(
                  {
                    electronic_commerce_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ),
                    point_of_service_entry_mode:
                      T.nilable(
                        Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ),
                    stand_in_processing_reason:
                      T.nilable(
                        Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                      )
                  }
                )
              end
              def to_hash
              end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              module ElectronicCommerceIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER =
                  T.let(
                    :mail_phone_order,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING =
                  T.let(
                    :recurring,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT =
                  T.let(
                    :installment,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER =
                  T.let(
                    :unknown_mail_phone_order,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE =
                  T.let(
                    :secure_electronic_commerce,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  T.let(
                    :non_authenticated_security_transaction_at_3ds_capable_merchant,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION =
                  T.let(
                    :non_authenticated_security_transaction,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION =
                  T.let(
                    :non_secure_transaction,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              module PointOfServiceEntryMode
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Unknown
                UNKNOWN =
                  T.let(
                    :unknown,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Manual key entry
                MANUAL =
                  T.let(
                    :manual,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV =
                  T.let(
                    :magnetic_stripe_no_cvv,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Optical code
                OPTICAL_CODE =
                  T.let(
                    :optical_code,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD =
                  T.let(
                    :integrated_circuit_card,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of chip card
                CONTACTLESS =
                  T.let(
                    :contactless,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE =
                  T.let(
                    :credential_on_file,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read
                MAGNETIC_STRIPE =
                  T.let(
                    :magnetic_stripe,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE =
                  T.let(
                    :contactless_magnetic_stripe,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV =
                  T.let(
                    :integrated_circuit_card_no_cvv,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              module StandInProcessingReason
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR =
                  T.let(
                    :issuer_error,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD =
                  T.let(
                    :invalid_physical_card,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  T.let(
                    :invalid_cardholder_authentication_verification_value,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR =
                  T.let(
                    :internal_visa_error,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  T.let(
                    :merchant_transaction_advisory_service_authentication_required,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                  T.let(
                    :payment_fraud_disruption_acquirer_block,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An unspecific reason for stand-in processing.
                OTHER =
                  T.let(
                    :other,
                    Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardFinancial::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

            # A life-cycle identifier used across e.g., an authorization and a reversal.
            # Expected to be unique per acquirer within a window of time. For some card
            # networks the retrieval reference number includes the trace counter.
            sig { returns(T.nilable(String)) }
            attr_accessor :retrieval_reference_number

            # A counter used to verify an individual authorization. Expected to be unique per
            # acquirer within a window of time.
            sig { returns(T.nilable(String)) }
            attr_accessor :trace_number

            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            sig { returns(T.nilable(String)) }
            attr_accessor :transaction_id

            # Network-specific identifiers for a specific request or transaction.
            sig do
              params(
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
              # A life-cycle identifier used across e.g., an authorization and a reversal.
              # Expected to be unique per acquirer within a window of time. For some card
              # networks the retrieval reference number includes the trace counter.
              retrieval_reference_number:,
              # A counter used to verify an individual authorization. Expected to be unique per
              # acquirer within a window of time.
              trace_number:,
              # A globally unique transaction identifier provided by the card network, used
              # across multiple life-cycle requests.
              transaction_id:
            )
            end

            sig do
              override.returns(
                {
                  authorization_identification_response: T.nilable(String),
                  retrieval_reference_number: T.nilable(String),
                  trace_number: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          # The processing category describes the intent behind the financial, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          module ProcessingCategory
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardFinancial::ProcessingCategory
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING =
              T.let(
                :account_funding,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER =
              T.let(
                :automatic_fuel_dispenser,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # A transaction used to pay a bill.
            BILL_PAYMENT =
              T.let(
                :bill_payment,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # Original credit transactions are used to send money to a cardholder.
            ORIGINAL_CREDIT =
              T.let(
                :original_credit,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # A regular purchase.
            PURCHASE =
              T.let(
                :purchase,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH =
              T.let(
                :quasi_cash,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
            CASH_DISBURSEMENT =
              T.let(
                :cash_disbursement,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # The processing category is unknown.
            UNKNOWN =
              T.let(
                :unknown,
                Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardFinancial::ProcessingCategory::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_financial`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardFinancial::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_FINANCIAL =
              T.let(
                :card_financial,
                Increase::Transaction::Source::CardFinancial::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardFinancial::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Verification < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardFinancial::Verification,
                  Increase::Internal::AnyHash
                )
              end

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              returns(
                Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode
              )
            end
            attr_reader :card_verification_code

            sig do
              params(
                card_verification_code:
                  Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::OrHash
              ).void
            end
            attr_writer :card_verification_code

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              returns(
                Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress
              )
            end
            attr_reader :cardholder_address

            sig do
              params(
                cardholder_address:
                  Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::OrHash
              ).void
            end
            attr_writer :cardholder_address

            # Fields related to verification of cardholder-provided values.
            sig do
              params(
                card_verification_code:
                  Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::OrHash,
                cardholder_address:
                  Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              card_verification_code:,
              # Cardholder address provided in the authorization request and the address on file
              # we verified it against.
              cardholder_address:
            )
            end

            sig do
              override.returns(
                {
                  card_verification_code:
                    Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode,
                  cardholder_address:
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress
                }
              )
            end
            def to_hash
            end

            class CardVerificationCode < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode,
                    Increase::Internal::AnyHash
                  )
                end

              # The result of verifying the Card Verification Code.
              sig do
                returns(
                  Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              sig do
                params(
                  result:
                    Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::Result::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # The result of verifying the Card Verification Code.
                result:
              )
              end

              sig do
                override.returns(
                  {
                    result:
                      Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # The result of verifying the Card Verification Code.
              module Result
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No card verification code was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code matched the one on file.
                MATCH =
                  T.let(
                    :match,
                    Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code did not match the one on file.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class CardholderAddress < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress,
                    Increase::Internal::AnyHash
                  )
                end

              # Line 1 of the address on file for the cardholder.
              sig { returns(T.nilable(String)) }
              attr_accessor :actual_line1

              # The postal code of the address on file for the cardholder.
              sig { returns(T.nilable(String)) }
              attr_accessor :actual_postal_code

              # The cardholder address line 1 provided for verification in the authorization
              # request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_line1

              # The postal code provided for verification in the authorization request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_postal_code

              # The address verification result returned to the card network.
              sig do
                returns(
                  Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Cardholder address provided in the authorization request and the address on file
              # we verified it against.
              sig do
                params(
                  actual_line1: T.nilable(String),
                  actual_postal_code: T.nilable(String),
                  provided_line1: T.nilable(String),
                  provided_postal_code: T.nilable(String),
                  result:
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Line 1 of the address on file for the cardholder.
                actual_line1:,
                # The postal code of the address on file for the cardholder.
                actual_postal_code:,
                # The cardholder address line 1 provided for verification in the authorization
                # request.
                provided_line1:,
                # The postal code provided for verification in the authorization request.
                provided_postal_code:,
                # The address verification result returned to the card network.
                result:
              )
              end

              sig do
                override.returns(
                  {
                    actual_line1: T.nilable(String),
                    actual_postal_code: T.nilable(String),
                    provided_line1: T.nilable(String),
                    provided_postal_code: T.nilable(String),
                    result:
                      Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # The address verification result returned to the card network.
              module Result
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No address information was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address does not match or was not provided.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                  T.let(
                    :postal_code_match_address_no_match,
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code does not match, but the street address matches or was not provided.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                  T.let(
                    :postal_code_no_match_address_match,
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address match.
                MATCH =
                  T.let(
                    :match,
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address do not match.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address was not verified. (deprecated)
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                  T.let(
                    :postal_code_match_address_not_checked,
                    Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end

        class CardPushTransferAcceptance < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CardPushTransferAcceptance,
                Increase::Internal::AnyHash
              )
            end

          # The transfer amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the Card Push Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Card Push Transfer Acceptance object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_push_transfer_acceptance`.
          # A Card Push Transfer Acceptance is created when an Outbound Card Push Transfer
          # sent from Increase is accepted by the receiving bank.
          sig do
            params(amount: Integer, transfer_id: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The transfer amount in USD cents.
            amount:,
            # The identifier of the Card Push Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ amount: Integer, transfer_id: String }) }
          def to_hash
          end
        end

        class CardRefund < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CardRefund,
                Increase::Internal::AnyHash
              )
            end

          # The Card Refund identifier.
          sig { returns(String) }
          attr_accessor :id

          # The amount in the minor unit of the transaction's settlement currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # Cashback debited for this transaction, if eligible. Cashback is paid out in
          # aggregate, monthly.
          sig do
            returns(
              T.nilable(Increase::Transaction::Source::CardRefund::Cashback)
            )
          end
          attr_reader :cashback

          sig do
            params(
              cashback:
                T.nilable(
                  Increase::Transaction::Source::CardRefund::Cashback::OrHash
                )
            ).void
          end
          attr_writer :cashback

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          sig do
            returns(
              Increase::Transaction::Source::CardRefund::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # Interchange assessed as a part of this transaciton.
          sig do
            returns(
              T.nilable(Increase::Transaction::Source::CardRefund::Interchange)
            )
          end
          attr_reader :interchange

          sig do
            params(
              interchange:
                T.nilable(
                  Increase::Transaction::Source::CardRefund::Interchange::OrHash
                )
            ).void
          end
          attr_writer :interchange

          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_acceptor_id

          # The 4-digit MCC describing the merchant's business.
          sig { returns(String) }
          attr_accessor :merchant_category_code

          # The city the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_city

          # The country the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_country

          # The name of the merchant.
          sig { returns(String) }
          attr_accessor :merchant_name

          # The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_postal_code

          # The state the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_state

          # Network-specific identifiers for this refund.
          sig do
            returns(
              Increase::Transaction::Source::CardRefund::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::Transaction::Source::CardRefund::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # Additional details about the card purchase, such as tax and industry-specific
          # fields.
          sig do
            returns(
              T.nilable(
                Increase::Transaction::Source::CardRefund::PurchaseDetails
              )
            )
          end
          attr_reader :purchase_details

          sig do
            params(
              purchase_details:
                T.nilable(
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::OrHash
                )
            ).void
          end
          attr_writer :purchase_details

          # The identifier of the Transaction associated with this Transaction.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A constant representing the object's type. For this resource it will always be
          # `card_refund`.
          sig do
            returns(
              Increase::Transaction::Source::CardRefund::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A Card Refund object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_refund`. Card Refunds move money back to
          # the cardholder. While they are usually connected to a Card Settlement an
          # acquirer can also refund money directly to a card without relation to a
          # transaction.
          sig do
            params(
              id: String,
              amount: Integer,
              card_payment_id: String,
              cashback:
                T.nilable(
                  Increase::Transaction::Source::CardRefund::Cashback::OrHash
                ),
              currency:
                Increase::Transaction::Source::CardRefund::Currency::OrSymbol,
              interchange:
                T.nilable(
                  Increase::Transaction::Source::CardRefund::Interchange::OrHash
                ),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: String,
              merchant_country: String,
              merchant_name: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_identifiers:
                Increase::Transaction::Source::CardRefund::NetworkIdentifiers::OrHash,
              presentment_amount: Integer,
              presentment_currency: String,
              purchase_details:
                T.nilable(
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::OrHash
                ),
              transaction_id: String,
              type: Increase::Transaction::Source::CardRefund::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Refund identifier.
            id:,
            # The amount in the minor unit of the transaction's settlement currency. For
            # dollars, for example, this is cents.
            amount:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # Cashback debited for this transaction, if eligible. Cashback is paid out in
            # aggregate, monthly.
            cashback:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's settlement currency.
            currency:,
            # Interchange assessed as a part of this transaciton.
            interchange:,
            # The merchant identifier (commonly abbreviated as MID) of the merchant the card
            # is transacting with.
            merchant_acceptor_id:,
            # The 4-digit MCC describing the merchant's business.
            merchant_category_code:,
            # The city the merchant resides in.
            merchant_city:,
            # The country the merchant resides in.
            merchant_country:,
            # The name of the merchant.
            merchant_name:,
            # The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
            merchant_postal_code:,
            # The state the merchant resides in.
            merchant_state:,
            # Network-specific identifiers for this refund.
            network_identifiers:,
            # The amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # Additional details about the card purchase, such as tax and industry-specific
            # fields.
            purchase_details:,
            # The identifier of the Transaction associated with this Transaction.
            transaction_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_refund`.
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                amount: Integer,
                card_payment_id: String,
                cashback:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::Cashback
                  ),
                currency:
                  Increase::Transaction::Source::CardRefund::Currency::TaggedSymbol,
                interchange:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::Interchange
                  ),
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: String,
                merchant_country: String,
                merchant_name: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_identifiers:
                  Increase::Transaction::Source::CardRefund::NetworkIdentifiers,
                presentment_amount: Integer,
                presentment_currency: String,
                purchase_details:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails
                  ),
                transaction_id: String,
                type:
                  Increase::Transaction::Source::CardRefund::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          class Cashback < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardRefund::Cashback,
                  Increase::Internal::AnyHash
                )
              end

            # The cashback amount given as a string containing a decimal number. The amount is
            # a positive number if it will be credited to you (e.g., settlements) and a
            # negative number if it will be debited (e.g., refunds).
            sig { returns(String) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            sig do
              returns(
                Increase::Transaction::Source::CardRefund::Cashback::Currency::TaggedSymbol
              )
            end
            attr_accessor :currency

            # Cashback debited for this transaction, if eligible. Cashback is paid out in
            # aggregate, monthly.
            sig do
              params(
                amount: String,
                currency:
                  Increase::Transaction::Source::CardRefund::Cashback::Currency::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The cashback amount given as a string containing a decimal number. The amount is
              # a positive number if it will be credited to you (e.g., settlements) and a
              # negative number if it will be debited (e.g., refunds).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
              currency:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  currency:
                    Increase::Transaction::Source::CardRefund::Cashback::Currency::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            module Currency
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::CardRefund::Cashback::Currency
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # US Dollar (USD)
              USD =
                T.let(
                  :USD,
                  Increase::Transaction::Source::CardRefund::Cashback::Currency::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::CardRefund::Cashback::Currency::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardRefund::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::CardRefund::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardRefund::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Interchange < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardRefund::Interchange,
                  Increase::Internal::AnyHash
                )
              end

            # The interchange amount given as a string containing a decimal number in major
            # units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
            # credited to Increase (e.g., settlements) and a negative number if it is debited
            # (e.g., refunds).
            sig { returns(String) }
            attr_accessor :amount

            # The card network specific interchange code.
            sig { returns(T.nilable(String)) }
            attr_accessor :code

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            sig do
              returns(
                Increase::Transaction::Source::CardRefund::Interchange::Currency::TaggedSymbol
              )
            end
            attr_accessor :currency

            # Interchange assessed as a part of this transaciton.
            sig do
              params(
                amount: String,
                code: T.nilable(String),
                currency:
                  Increase::Transaction::Source::CardRefund::Interchange::Currency::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The interchange amount given as a string containing a decimal number in major
              # units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
              # credited to Increase (e.g., settlements) and a negative number if it is debited
              # (e.g., refunds).
              amount:,
              # The card network specific interchange code.
              code:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
              # reimbursement.
              currency:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  code: T.nilable(String),
                  currency:
                    Increase::Transaction::Source::CardRefund::Interchange::Currency::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            module Currency
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::CardRefund::Interchange::Currency
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # US Dollar (USD)
              USD =
                T.let(
                  :USD,
                  Increase::Transaction::Source::CardRefund::Interchange::Currency::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::CardRefund::Interchange::Currency::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardRefund::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # A network assigned business ID that identifies the acquirer that processed this
            # transaction.
            sig { returns(String) }
            attr_accessor :acquirer_business_id

            # A globally unique identifier for this settlement.
            sig { returns(String) }
            attr_accessor :acquirer_reference_number

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            sig { returns(T.nilable(String)) }
            attr_accessor :transaction_id

            # Network-specific identifiers for this refund.
            sig do
              params(
                acquirer_business_id: String,
                acquirer_reference_number: String,
                authorization_identification_response: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # A network assigned business ID that identifies the acquirer that processed this
              # transaction.
              acquirer_business_id:,
              # A globally unique identifier for this settlement.
              acquirer_reference_number:,
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
              # A globally unique transaction identifier provided by the card network, used
              # across multiple life-cycle requests.
              transaction_id:
            )
            end

            sig do
              override.returns(
                {
                  acquirer_business_id: String,
                  acquirer_reference_number: String,
                  authorization_identification_response: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          class PurchaseDetails < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardRefund::PurchaseDetails,
                  Increase::Internal::AnyHash
                )
              end

            # Fields specific to car rentals.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental
                )
              )
            end
            attr_reader :car_rental

            sig do
              params(
                car_rental:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::OrHash
                  )
              ).void
            end
            attr_writer :car_rental

            # An identifier from the merchant for the customer or consumer.
            sig { returns(T.nilable(String)) }
            attr_accessor :customer_reference_identifier

            # The state or provincial tax amount in minor units.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :local_tax_amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            # assessed.
            sig { returns(T.nilable(String)) }
            attr_accessor :local_tax_currency

            # Fields specific to lodging.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging
                )
              )
            end
            attr_reader :lodging

            sig do
              params(
                lodging:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::OrHash
                  )
              ).void
            end
            attr_writer :lodging

            # The national tax amount in minor units.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :national_tax_amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            # assessed.
            sig { returns(T.nilable(String)) }
            attr_accessor :national_tax_currency

            # An identifier from the merchant for the purchase to the issuer and cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :purchase_identifier

            # The format of the purchase identifier.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )
              )
            end
            attr_accessor :purchase_identifier_format

            # Fields specific to travel.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel
                )
              )
            end
            attr_reader :travel

            sig do
              params(
                travel:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::OrHash
                  )
              ).void
            end
            attr_writer :travel

            # Additional details about the card purchase, such as tax and industry-specific
            # fields.
            sig do
              params(
                car_rental:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::OrHash
                  ),
                customer_reference_identifier: T.nilable(String),
                local_tax_amount: T.nilable(Integer),
                local_tax_currency: T.nilable(String),
                lodging:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::OrHash
                  ),
                national_tax_amount: T.nilable(Integer),
                national_tax_currency: T.nilable(String),
                purchase_identifier: T.nilable(String),
                purchase_identifier_format:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::OrSymbol
                  ),
                travel:
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Fields specific to car rentals.
              car_rental:,
              # An identifier from the merchant for the customer or consumer.
              customer_reference_identifier:,
              # The state or provincial tax amount in minor units.
              local_tax_amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
              # assessed.
              local_tax_currency:,
              # Fields specific to lodging.
              lodging:,
              # The national tax amount in minor units.
              national_tax_amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
              # assessed.
              national_tax_currency:,
              # An identifier from the merchant for the purchase to the issuer and cardholder.
              purchase_identifier:,
              # The format of the purchase identifier.
              purchase_identifier_format:,
              # Fields specific to travel.
              travel:
            )
            end

            sig do
              override.returns(
                {
                  car_rental:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental
                    ),
                  customer_reference_identifier: T.nilable(String),
                  local_tax_amount: T.nilable(Integer),
                  local_tax_currency: T.nilable(String),
                  lodging:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging
                    ),
                  national_tax_amount: T.nilable(Integer),
                  national_tax_currency: T.nilable(String),
                  purchase_identifier: T.nilable(String),
                  purchase_identifier_format:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                    ),
                  travel:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel
                    )
                }
              )
            end
            def to_hash
            end

            class CarRental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental,
                    Increase::Internal::AnyHash
                  )
                end

              # Code indicating the vehicle's class.
              sig { returns(T.nilable(String)) }
              attr_accessor :car_class_code

              # Date the customer picked up the car or, in the case of a no-show or pre-pay
              # transaction, the scheduled pick up date.
              sig { returns(T.nilable(Date)) }
              attr_accessor :checkout_date

              # Daily rate being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :daily_rental_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              # rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :daily_rental_rate_currency

              # Number of days the vehicle was rented.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :days_rented

              # Additional charges (gas, late fee, etc.) being billed.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )
                )
              end
              attr_accessor :extra_charges

              # Fuel charges for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :fuel_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              # assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :fuel_charges_currency

              # Any insurance being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :insurance_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
              # charges assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :insurance_charges_currency

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :no_show_indicator

              # Charges for returning the vehicle at a different location than where it was
              # picked up.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :one_way_drop_off_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
              # drop-off charges assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :one_way_drop_off_charges_currency

              # Name of the person renting the vehicle.
              sig { returns(T.nilable(String)) }
              attr_accessor :renter_name

              # Weekly rate being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :weekly_rental_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
              # rental rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :weekly_rental_rate_currency

              # Fields specific to car rentals.
              sig do
                params(
                  car_class_code: T.nilable(String),
                  checkout_date: T.nilable(Date),
                  daily_rental_rate_amount: T.nilable(Integer),
                  daily_rental_rate_currency: T.nilable(String),
                  days_rented: T.nilable(Integer),
                  extra_charges:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::OrSymbol
                    ),
                  fuel_charges_amount: T.nilable(Integer),
                  fuel_charges_currency: T.nilable(String),
                  insurance_charges_amount: T.nilable(Integer),
                  insurance_charges_currency: T.nilable(String),
                  no_show_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::OrSymbol
                    ),
                  one_way_drop_off_charges_amount: T.nilable(Integer),
                  one_way_drop_off_charges_currency: T.nilable(String),
                  renter_name: T.nilable(String),
                  weekly_rental_rate_amount: T.nilable(Integer),
                  weekly_rental_rate_currency: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Code indicating the vehicle's class.
                car_class_code:,
                # Date the customer picked up the car or, in the case of a no-show or pre-pay
                # transaction, the scheduled pick up date.
                checkout_date:,
                # Daily rate being charged for the vehicle.
                daily_rental_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
                # rate.
                daily_rental_rate_currency:,
                # Number of days the vehicle was rented.
                days_rented:,
                # Additional charges (gas, late fee, etc.) being billed.
                extra_charges:,
                # Fuel charges for the vehicle.
                fuel_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
                # assessed.
                fuel_charges_currency:,
                # Any insurance being charged for the vehicle.
                insurance_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
                # charges assessed.
                insurance_charges_currency:,
                # An indicator that the cardholder is being billed for a reserved vehicle that was
                # not actually rented (that is, a "no-show" charge).
                no_show_indicator:,
                # Charges for returning the vehicle at a different location than where it was
                # picked up.
                one_way_drop_off_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
                # drop-off charges assessed.
                one_way_drop_off_charges_currency:,
                # Name of the person renting the vehicle.
                renter_name:,
                # Weekly rate being charged for the vehicle.
                weekly_rental_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
                # rental rate.
                weekly_rental_rate_currency:
              )
              end

              sig do
                override.returns(
                  {
                    car_class_code: T.nilable(String),
                    checkout_date: T.nilable(Date),
                    daily_rental_rate_amount: T.nilable(Integer),
                    daily_rental_rate_currency: T.nilable(String),
                    days_rented: T.nilable(Integer),
                    extra_charges:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                      ),
                    fuel_charges_amount: T.nilable(Integer),
                    fuel_charges_currency: T.nilable(String),
                    insurance_charges_amount: T.nilable(Integer),
                    insurance_charges_currency: T.nilable(String),
                    no_show_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                      ),
                    one_way_drop_off_charges_amount: T.nilable(Integer),
                    one_way_drop_off_charges_currency: T.nilable(String),
                    renter_name: T.nilable(String),
                    weekly_rental_rate_amount: T.nilable(Integer),
                    weekly_rental_rate_currency: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Additional charges (gas, late fee, etc.) being billed.
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No extra charge
                NO_EXTRA_CHARGE =
                  T.let(
                    :no_extra_charge,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Gas
                GAS =
                  T.let(
                    :gas,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Extra mileage
                EXTRA_MILEAGE =
                  T.let(
                    :extra_mileage,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Late return
                LATE_RETURN =
                  T.let(
                    :late_return,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # One way service fee
                ONE_WAY_SERVICE_FEE =
                  T.let(
                    :one_way_service_fee,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Parking violation
                PARKING_VIOLATION =
                  T.let(
                    :parking_violation,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not applicable
                NOT_APPLICABLE =
                  T.let(
                    :not_applicable,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )

                # No show for specialized vehicle
                NO_SHOW_FOR_SPECIALIZED_VEHICLE =
                  T.let(
                    :no_show_for_specialized_vehicle,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Lodging < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging,
                    Increase::Internal::AnyHash
                  )
                end

              # Date the customer checked in.
              sig { returns(T.nilable(Date)) }
              attr_accessor :check_in_date

              # Daily rate being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :daily_room_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
              # rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :daily_room_rate_currency

              # Additional charges (phone, late check-out, etc.) being billed.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )
                )
              end
              attr_accessor :extra_charges

              # Folio cash advances for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :folio_cash_advances_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
              # advances.
              sig { returns(T.nilable(String)) }
              attr_accessor :folio_cash_advances_currency

              # Food and beverage charges for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :food_beverage_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
              # beverage charges.
              sig { returns(T.nilable(String)) }
              attr_accessor :food_beverage_charges_currency

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :no_show_indicator

              # Prepaid expenses being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :prepaid_expenses_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
              # expenses.
              sig { returns(T.nilable(String)) }
              attr_accessor :prepaid_expenses_currency

              # Number of nights the room was rented.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :room_nights

              # Total room tax being charged.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :total_room_tax_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
              # tax.
              sig { returns(T.nilable(String)) }
              attr_accessor :total_room_tax_currency

              # Total tax being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :total_tax_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
              # assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :total_tax_currency

              # Fields specific to lodging.
              sig do
                params(
                  check_in_date: T.nilable(Date),
                  daily_room_rate_amount: T.nilable(Integer),
                  daily_room_rate_currency: T.nilable(String),
                  extra_charges:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::OrSymbol
                    ),
                  folio_cash_advances_amount: T.nilable(Integer),
                  folio_cash_advances_currency: T.nilable(String),
                  food_beverage_charges_amount: T.nilable(Integer),
                  food_beverage_charges_currency: T.nilable(String),
                  no_show_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::OrSymbol
                    ),
                  prepaid_expenses_amount: T.nilable(Integer),
                  prepaid_expenses_currency: T.nilable(String),
                  room_nights: T.nilable(Integer),
                  total_room_tax_amount: T.nilable(Integer),
                  total_room_tax_currency: T.nilable(String),
                  total_tax_amount: T.nilable(Integer),
                  total_tax_currency: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Date the customer checked in.
                check_in_date:,
                # Daily rate being charged for the room.
                daily_room_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
                # rate.
                daily_room_rate_currency:,
                # Additional charges (phone, late check-out, etc.) being billed.
                extra_charges:,
                # Folio cash advances for the room.
                folio_cash_advances_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
                # advances.
                folio_cash_advances_currency:,
                # Food and beverage charges for the room.
                food_beverage_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
                # beverage charges.
                food_beverage_charges_currency:,
                # Indicator that the cardholder is being billed for a reserved room that was not
                # actually used.
                no_show_indicator:,
                # Prepaid expenses being charged for the room.
                prepaid_expenses_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
                # expenses.
                prepaid_expenses_currency:,
                # Number of nights the room was rented.
                room_nights:,
                # Total room tax being charged.
                total_room_tax_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
                # tax.
                total_room_tax_currency:,
                # Total tax being charged for the room.
                total_tax_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
                # assessed.
                total_tax_currency:
              )
              end

              sig do
                override.returns(
                  {
                    check_in_date: T.nilable(Date),
                    daily_room_rate_amount: T.nilable(Integer),
                    daily_room_rate_currency: T.nilable(String),
                    extra_charges:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                      ),
                    folio_cash_advances_amount: T.nilable(Integer),
                    folio_cash_advances_currency: T.nilable(String),
                    food_beverage_charges_amount: T.nilable(Integer),
                    food_beverage_charges_currency: T.nilable(String),
                    no_show_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                      ),
                    prepaid_expenses_amount: T.nilable(Integer),
                    prepaid_expenses_currency: T.nilable(String),
                    room_nights: T.nilable(Integer),
                    total_room_tax_amount: T.nilable(Integer),
                    total_room_tax_currency: T.nilable(String),
                    total_tax_amount: T.nilable(Integer),
                    total_tax_currency: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Additional charges (phone, late check-out, etc.) being billed.
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No extra charge
                NO_EXTRA_CHARGE =
                  T.let(
                    :no_extra_charge,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Restaurant
                RESTAURANT =
                  T.let(
                    :restaurant,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Gift shop
                GIFT_SHOP =
                  T.let(
                    :gift_shop,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Mini bar
                MINI_BAR =
                  T.let(
                    :mini_bar,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Telephone
                TELEPHONE =
                  T.let(
                    :telephone,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Other
                OTHER =
                  T.let(
                    :other,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Laundry
                LAUNDRY =
                  T.let(
                    :laundry,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not applicable
                NOT_APPLICABLE =
                  T.let(
                    :not_applicable,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )

                # No show
                NO_SHOW =
                  T.let(
                    :no_show,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            # The format of the purchase identifier.
            module PurchaseIdentifierFormat
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Free text
              FREE_TEXT =
                T.let(
                  :free_text,
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Order number
              ORDER_NUMBER =
                T.let(
                  :order_number,
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Rental agreement number
              RENTAL_AGREEMENT_NUMBER =
                T.let(
                  :rental_agreement_number,
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Hotel folio number
              HOTEL_FOLIO_NUMBER =
                T.let(
                  :hotel_folio_number,
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Invoice number
              INVOICE_NUMBER =
                T.let(
                  :invoice_number,
                  Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Travel < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel,
                    Increase::Internal::AnyHash
                  )
                end

              # Ancillary purchases in addition to the airfare.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary
                  )
                )
              end
              attr_reader :ancillary

              sig do
                params(
                  ancillary:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::OrHash
                    )
                ).void
              end
              attr_writer :ancillary

              # Indicates the computerized reservation system used to book the ticket.
              sig { returns(T.nilable(String)) }
              attr_accessor :computerized_reservation_system

              # Indicates the reason for a credit to the cardholder.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :credit_reason_indicator

              # Date of departure.
              sig { returns(T.nilable(Date)) }
              attr_accessor :departure_date

              # Code for the originating city or airport.
              sig { returns(T.nilable(String)) }
              attr_accessor :origination_city_airport_code

              # Name of the passenger.
              sig { returns(T.nilable(String)) }
              attr_accessor :passenger_name

              # Indicates whether this ticket is non-refundable.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :restricted_ticket_indicator

              # Indicates why a ticket was changed.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :ticket_change_indicator

              # Ticket number.
              sig { returns(T.nilable(String)) }
              attr_accessor :ticket_number

              # Code for the travel agency if the ticket was issued by a travel agency.
              sig { returns(T.nilable(String)) }
              attr_accessor :travel_agency_code

              # Name of the travel agency if the ticket was issued by a travel agency.
              sig { returns(T.nilable(String)) }
              attr_accessor :travel_agency_name

              # Fields specific to each leg of the journey.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg
                    ]
                  )
                )
              end
              attr_accessor :trip_legs

              # Fields specific to travel.
              sig do
                params(
                  ancillary:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::OrHash
                    ),
                  computerized_reservation_system: T.nilable(String),
                  credit_reason_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::OrSymbol
                    ),
                  departure_date: T.nilable(Date),
                  origination_city_airport_code: T.nilable(String),
                  passenger_name: T.nilable(String),
                  restricted_ticket_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::OrSymbol
                    ),
                  ticket_change_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::OrSymbol
                    ),
                  ticket_number: T.nilable(String),
                  travel_agency_code: T.nilable(String),
                  travel_agency_name: T.nilable(String),
                  trip_legs:
                    T.nilable(
                      T::Array[
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::OrHash
                      ]
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Ancillary purchases in addition to the airfare.
                ancillary:,
                # Indicates the computerized reservation system used to book the ticket.
                computerized_reservation_system:,
                # Indicates the reason for a credit to the cardholder.
                credit_reason_indicator:,
                # Date of departure.
                departure_date:,
                # Code for the originating city or airport.
                origination_city_airport_code:,
                # Name of the passenger.
                passenger_name:,
                # Indicates whether this ticket is non-refundable.
                restricted_ticket_indicator:,
                # Indicates why a ticket was changed.
                ticket_change_indicator:,
                # Ticket number.
                ticket_number:,
                # Code for the travel agency if the ticket was issued by a travel agency.
                travel_agency_code:,
                # Name of the travel agency if the ticket was issued by a travel agency.
                travel_agency_name:,
                # Fields specific to each leg of the journey.
                trip_legs:
              )
              end

              sig do
                override.returns(
                  {
                    ancillary:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary
                      ),
                    computerized_reservation_system: T.nilable(String),
                    credit_reason_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                      ),
                    departure_date: T.nilable(Date),
                    origination_city_airport_code: T.nilable(String),
                    passenger_name: T.nilable(String),
                    restricted_ticket_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                      ),
                    ticket_change_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                      ),
                    ticket_number: T.nilable(String),
                    travel_agency_code: T.nilable(String),
                    travel_agency_name: T.nilable(String),
                    trip_legs:
                      T.nilable(
                        T::Array[
                          Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg
                        ]
                      )
                  }
                )
              end
              def to_hash
              end

              class Ancillary < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary,
                      Increase::Internal::AnyHash
                    )
                  end

                # If this purchase has a connection or relationship to another purchase, such as a
                # baggage fee for a passenger transport ticket, this field should contain the
                # ticket document number for the other purchase.
                sig { returns(T.nilable(String)) }
                attr_accessor :connected_ticket_document_number

                # Indicates the reason for a credit to the cardholder.
                sig do
                  returns(
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )
                  )
                end
                attr_accessor :credit_reason_indicator

                # Name of the passenger or description of the ancillary purchase.
                sig { returns(T.nilable(String)) }
                attr_accessor :passenger_name_or_description

                # Additional travel charges, such as baggage fees.
                sig do
                  returns(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service
                    ]
                  )
                end
                attr_accessor :services

                # Ticket document number.
                sig { returns(T.nilable(String)) }
                attr_accessor :ticket_document_number

                # Ancillary purchases in addition to the airfare.
                sig do
                  params(
                    connected_ticket_document_number: T.nilable(String),
                    credit_reason_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::OrSymbol
                      ),
                    passenger_name_or_description: T.nilable(String),
                    services:
                      T::Array[
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::OrHash
                      ],
                    ticket_document_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # If this purchase has a connection or relationship to another purchase, such as a
                  # baggage fee for a passenger transport ticket, this field should contain the
                  # ticket document number for the other purchase.
                  connected_ticket_document_number:,
                  # Indicates the reason for a credit to the cardholder.
                  credit_reason_indicator:,
                  # Name of the passenger or description of the ancillary purchase.
                  passenger_name_or_description:,
                  # Additional travel charges, such as baggage fees.
                  services:,
                  # Ticket document number.
                  ticket_document_number:
                )
                end

                sig do
                  override.returns(
                    {
                      connected_ticket_document_number: T.nilable(String),
                      credit_reason_indicator:
                        T.nilable(
                          Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                        ),
                      passenger_name_or_description: T.nilable(String),
                      services:
                        T::Array[
                          Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service
                        ],
                      ticket_document_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Indicates the reason for a credit to the cardholder.
                module CreditReasonIndicator
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # No credit
                  NO_CREDIT =
                    T.let(
                      :no_credit,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Passenger transport ancillary purchase cancellation
                  PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    T.let(
                      :passenger_transport_ancillary_purchase_cancellation,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Airline ticket and passenger transport ancillary purchase cancellation
                  AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    T.let(
                      :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Other
                  OTHER =
                    T.let(
                      :other,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Service < Increase::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service,
                        Increase::Internal::AnyHash
                      )
                    end

                  # Category of the ancillary service.
                  sig do
                    returns(
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )
                    )
                  end
                  attr_accessor :category

                  # Sub-category of the ancillary service, free-form.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :sub_category

                  sig do
                    params(
                      category:
                        T.nilable(
                          Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::OrSymbol
                        ),
                      sub_category: T.nilable(String)
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Category of the ancillary service.
                    category:,
                    # Sub-category of the ancillary service, free-form.
                    sub_category:
                  )
                  end

                  sig do
                    override.returns(
                      {
                        category:
                          T.nilable(
                            Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                          ),
                        sub_category: T.nilable(String)
                      }
                    )
                  end
                  def to_hash
                  end

                  # Category of the ancillary service.
                  module Category
                    extend Increase::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    # None
                    NONE =
                      T.let(
                        :none,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Bundled service
                    BUNDLED_SERVICE =
                      T.let(
                        :bundled_service,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Baggage fee
                    BAGGAGE_FEE =
                      T.let(
                        :baggage_fee,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Change fee
                    CHANGE_FEE =
                      T.let(
                        :change_fee,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Cargo
                    CARGO =
                      T.let(
                        :cargo,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Carbon offset
                    CARBON_OFFSET =
                      T.let(
                        :carbon_offset,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Frequent flyer
                    FREQUENT_FLYER =
                      T.let(
                        :frequent_flyer,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Gift card
                    GIFT_CARD =
                      T.let(
                        :gift_card,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Ground transport
                    GROUND_TRANSPORT =
                      T.let(
                        :ground_transport,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # In-flight entertainment
                    IN_FLIGHT_ENTERTAINMENT =
                      T.let(
                        :in_flight_entertainment,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Lounge
                    LOUNGE =
                      T.let(
                        :lounge,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Medical
                    MEDICAL =
                      T.let(
                        :medical,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Meal beverage
                    MEAL_BEVERAGE =
                      T.let(
                        :meal_beverage,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Other
                    OTHER =
                      T.let(
                        :other,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Passenger assist fee
                    PASSENGER_ASSIST_FEE =
                      T.let(
                        :passenger_assist_fee,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Pets
                    PETS =
                      T.let(
                        :pets,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Seat fees
                    SEAT_FEES =
                      T.let(
                        :seat_fees,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Standby
                    STANDBY =
                      T.let(
                        :standby,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Service fee
                    SERVICE_FEE =
                      T.let(
                        :service_fee,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Store
                    STORE =
                      T.let(
                        :store,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Travel service
                    TRAVEL_SERVICE =
                      T.let(
                        :travel_service,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Unaccompanied travel
                    UNACCOMPANIED_TRAVEL =
                      T.let(
                        :unaccompanied_travel,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Upgrades
                    UPGRADES =
                      T.let(
                        :upgrades,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Wi-fi
                    WIFI =
                      T.let(
                        :wifi,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end
              end

              # Indicates the reason for a credit to the cardholder.
              module CreditReasonIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No credit
                NO_CREDIT =
                  T.let(
                    :no_credit,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Passenger transport ancillary purchase cancellation
                PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  T.let(
                    :passenger_transport_ancillary_purchase_cancellation,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Airline ticket and passenger transport ancillary purchase cancellation
                AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  T.let(
                    :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Airline ticket cancellation
                AIRLINE_TICKET_CANCELLATION =
                  T.let(
                    :airline_ticket_cancellation,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Other
                OTHER =
                  T.let(
                    :other,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Partial refund of airline ticket
                PARTIAL_REFUND_OF_AIRLINE_TICKET =
                  T.let(
                    :partial_refund_of_airline_ticket,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicates whether this ticket is non-refundable.
              module RestrictedTicketIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No restrictions
                NO_RESTRICTIONS =
                  T.let(
                    :no_restrictions,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )

                # Restricted non-refundable ticket
                RESTRICTED_NON_REFUNDABLE_TICKET =
                  T.let(
                    :restricted_non_refundable_ticket,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicates why a ticket was changed.
              module TicketChangeIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # None
                NONE =
                  T.let(
                    :none,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                # Change to existing ticket
                CHANGE_TO_EXISTING_TICKET =
                  T.let(
                    :change_to_existing_ticket,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                # New ticket
                NEW_TICKET =
                  T.let(
                    :new_ticket,
                    Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class TripLeg < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg,
                      Increase::Internal::AnyHash
                    )
                  end

                # Carrier code (e.g., United Airlines, Jet Blue, etc.).
                sig { returns(T.nilable(String)) }
                attr_accessor :carrier_code

                # Code for the destination city or airport.
                sig { returns(T.nilable(String)) }
                attr_accessor :destination_city_airport_code

                # Fare basis code.
                sig { returns(T.nilable(String)) }
                attr_accessor :fare_basis_code

                # Flight number.
                sig { returns(T.nilable(String)) }
                attr_accessor :flight_number

                # Service class (e.g., first class, business class, etc.).
                sig { returns(T.nilable(String)) }
                attr_accessor :service_class

                # Indicates whether a stopover is allowed on this ticket.
                sig do
                  returns(
                    T.nilable(
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )
                  )
                end
                attr_accessor :stop_over_code

                sig do
                  params(
                    carrier_code: T.nilable(String),
                    destination_city_airport_code: T.nilable(String),
                    fare_basis_code: T.nilable(String),
                    flight_number: T.nilable(String),
                    service_class: T.nilable(String),
                    stop_over_code:
                      T.nilable(
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::OrSymbol
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Carrier code (e.g., United Airlines, Jet Blue, etc.).
                  carrier_code:,
                  # Code for the destination city or airport.
                  destination_city_airport_code:,
                  # Fare basis code.
                  fare_basis_code:,
                  # Flight number.
                  flight_number:,
                  # Service class (e.g., first class, business class, etc.).
                  service_class:,
                  # Indicates whether a stopover is allowed on this ticket.
                  stop_over_code:
                )
                end

                sig do
                  override.returns(
                    {
                      carrier_code: T.nilable(String),
                      destination_city_airport_code: T.nilable(String),
                      fare_basis_code: T.nilable(String),
                      flight_number: T.nilable(String),
                      service_class: T.nilable(String),
                      stop_over_code:
                        T.nilable(
                          Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                        )
                    }
                  )
                end
                def to_hash
                end

                # Indicates whether a stopover is allowed on this ticket.
                module StopOverCode
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # None
                  NONE =
                    T.let(
                      :none,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  # Stop over allowed
                  STOP_OVER_ALLOWED =
                    T.let(
                      :stop_over_allowed,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  # Stop over not allowed
                  STOP_OVER_NOT_ALLOWED =
                    T.let(
                      :stop_over_not_allowed,
                      Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_refund`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Increase::Transaction::Source::CardRefund::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_REFUND =
              T.let(
                :card_refund,
                Increase::Transaction::Source::CardRefund::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardRefund::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardRevenuePayment < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CardRevenuePayment,
                Increase::Internal::AnyHash
              )
            end

          # The amount in the minor unit of the transaction's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          sig do
            returns(
              Increase::Transaction::Source::CardRevenuePayment::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The end of the period for which this transaction paid interest.
          sig { returns(Time) }
          attr_accessor :period_end

          # The start of the period for which this transaction paid interest.
          sig { returns(Time) }
          attr_accessor :period_start

          # The account the card belonged to.
          sig { returns(T.nilable(String)) }
          attr_accessor :transacted_on_account_id

          # A Card Revenue Payment object. This field will be present in the JSON response
          # if and only if `category` is equal to `card_revenue_payment`. Card Revenue
          # Payments reflect earnings from fees on card transactions.
          sig do
            params(
              amount: Integer,
              currency:
                Increase::Transaction::Source::CardRevenuePayment::Currency::OrSymbol,
              period_end: Time,
              period_start: Time,
              transacted_on_account_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The amount in the minor unit of the transaction's currency. For dollars, for
            # example, this is cents.
            amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
            # currency.
            currency:,
            # The end of the period for which this transaction paid interest.
            period_end:,
            # The start of the period for which this transaction paid interest.
            period_start:,
            # The account the card belonged to.
            transacted_on_account_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                currency:
                  Increase::Transaction::Source::CardRevenuePayment::Currency::TaggedSymbol,
                period_end: Time,
                period_start: Time,
                transacted_on_account_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardRevenuePayment::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::CardRevenuePayment::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardRevenuePayment::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardSettlement < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CardSettlement,
                Increase::Internal::AnyHash
              )
            end

          # The Card Settlement identifier.
          sig { returns(String) }
          attr_accessor :id

          # The amount in the minor unit of the transaction's settlement currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The Card Authorization that was created prior to this Card Settlement, if one
          # exists.
          sig { returns(T.nilable(String)) }
          attr_accessor :card_authorization

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # Cashback earned on this transaction, if eligible. Cashback is paid out in
          # aggregate, monthly.
          sig do
            returns(
              T.nilable(Increase::Transaction::Source::CardSettlement::Cashback)
            )
          end
          attr_reader :cashback

          sig do
            params(
              cashback:
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::Cashback::OrHash
                )
            ).void
          end
          attr_writer :cashback

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          sig do
            returns(
              Increase::Transaction::Source::CardSettlement::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # Interchange assessed as a part of this transaction.
          sig do
            returns(
              T.nilable(
                Increase::Transaction::Source::CardSettlement::Interchange
              )
            )
          end
          attr_reader :interchange

          sig do
            params(
              interchange:
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::Interchange::OrHash
                )
            ).void
          end
          attr_writer :interchange

          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_acceptor_id

          # The 4-digit MCC describing the merchant's business.
          sig { returns(String) }
          attr_accessor :merchant_category_code

          # The city the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_city

          # The country the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_country

          # The name of the merchant.
          sig { returns(String) }
          attr_accessor :merchant_name

          # The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_postal_code

          # The state the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_state

          # The card network on which this transaction was processed.
          sig do
            returns(
              Increase::Transaction::Source::CardSettlement::Network::TaggedSymbol
            )
          end
          attr_accessor :network

          # Network-specific identifiers for this refund.
          sig do
            returns(
              Increase::Transaction::Source::CardSettlement::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::Transaction::Source::CardSettlement::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The identifier of the Pending Transaction associated with this Transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :pending_transaction_id

          # The amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # Additional details about the card purchase, such as tax and industry-specific
          # fields.
          sig do
            returns(
              T.nilable(
                Increase::Transaction::Source::CardSettlement::PurchaseDetails
              )
            )
          end
          attr_reader :purchase_details

          sig do
            params(
              purchase_details:
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::OrHash
                )
            ).void
          end
          attr_writer :purchase_details

          # Surcharge amount details, if applicable. The amount is positive if the surcharge
          # is added to to the overall transaction amount (surcharge), and negative if the
          # surcharge is deducted from the overall transaction amount (discount).
          sig do
            returns(
              T.nilable(
                Increase::Transaction::Source::CardSettlement::Surcharge
              )
            )
          end
          attr_reader :surcharge

          sig do
            params(
              surcharge:
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::Surcharge::OrHash
                )
            ).void
          end
          attr_writer :surcharge

          # The identifier of the Transaction associated with this Transaction.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A constant representing the object's type. For this resource it will always be
          # `card_settlement`.
          sig do
            returns(
              Increase::Transaction::Source::CardSettlement::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A Card Settlement object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_settlement`. Card Settlements are card
          # transactions that have cleared and settled. While a settlement is usually
          # preceded by an authorization, an acquirer can also directly clear a transaction
          # without first authorizing it.
          sig do
            params(
              id: String,
              amount: Integer,
              card_authorization: T.nilable(String),
              card_payment_id: String,
              cashback:
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::Cashback::OrHash
                ),
              currency:
                Increase::Transaction::Source::CardSettlement::Currency::OrSymbol,
              interchange:
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::Interchange::OrHash
                ),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: String,
              merchant_country: String,
              merchant_name: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network:
                Increase::Transaction::Source::CardSettlement::Network::OrSymbol,
              network_identifiers:
                Increase::Transaction::Source::CardSettlement::NetworkIdentifiers::OrHash,
              pending_transaction_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              purchase_details:
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::OrHash
                ),
              surcharge:
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::Surcharge::OrHash
                ),
              transaction_id: String,
              type:
                Increase::Transaction::Source::CardSettlement::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Settlement identifier.
            id:,
            # The amount in the minor unit of the transaction's settlement currency. For
            # dollars, for example, this is cents.
            amount:,
            # The Card Authorization that was created prior to this Card Settlement, if one
            # exists.
            card_authorization:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # Cashback earned on this transaction, if eligible. Cashback is paid out in
            # aggregate, monthly.
            cashback:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's settlement currency.
            currency:,
            # Interchange assessed as a part of this transaction.
            interchange:,
            # The merchant identifier (commonly abbreviated as MID) of the merchant the card
            # is transacting with.
            merchant_acceptor_id:,
            # The 4-digit MCC describing the merchant's business.
            merchant_category_code:,
            # The city the merchant resides in.
            merchant_city:,
            # The country the merchant resides in.
            merchant_country:,
            # The name of the merchant.
            merchant_name:,
            # The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
            merchant_postal_code:,
            # The state the merchant resides in.
            merchant_state:,
            # The card network on which this transaction was processed.
            network:,
            # Network-specific identifiers for this refund.
            network_identifiers:,
            # The identifier of the Pending Transaction associated with this Transaction.
            pending_transaction_id:,
            # The amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # Additional details about the card purchase, such as tax and industry-specific
            # fields.
            purchase_details:,
            # Surcharge amount details, if applicable. The amount is positive if the surcharge
            # is added to to the overall transaction amount (surcharge), and negative if the
            # surcharge is deducted from the overall transaction amount (discount).
            surcharge:,
            # The identifier of the Transaction associated with this Transaction.
            transaction_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_settlement`.
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                amount: Integer,
                card_authorization: T.nilable(String),
                card_payment_id: String,
                cashback:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::Cashback
                  ),
                currency:
                  Increase::Transaction::Source::CardSettlement::Currency::TaggedSymbol,
                interchange:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::Interchange
                  ),
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: String,
                merchant_country: String,
                merchant_name: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network:
                  Increase::Transaction::Source::CardSettlement::Network::TaggedSymbol,
                network_identifiers:
                  Increase::Transaction::Source::CardSettlement::NetworkIdentifiers,
                pending_transaction_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                purchase_details:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails
                  ),
                surcharge:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::Surcharge
                  ),
                transaction_id: String,
                type:
                  Increase::Transaction::Source::CardSettlement::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          class Cashback < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardSettlement::Cashback,
                  Increase::Internal::AnyHash
                )
              end

            # The cashback amount given as a string containing a decimal number. The amount is
            # a positive number if it will be credited to you (e.g., settlements) and a
            # negative number if it will be debited (e.g., refunds).
            sig { returns(String) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            sig do
              returns(
                Increase::Transaction::Source::CardSettlement::Cashback::Currency::TaggedSymbol
              )
            end
            attr_accessor :currency

            # Cashback earned on this transaction, if eligible. Cashback is paid out in
            # aggregate, monthly.
            sig do
              params(
                amount: String,
                currency:
                  Increase::Transaction::Source::CardSettlement::Cashback::Currency::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The cashback amount given as a string containing a decimal number. The amount is
              # a positive number if it will be credited to you (e.g., settlements) and a
              # negative number if it will be debited (e.g., refunds).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
              currency:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  currency:
                    Increase::Transaction::Source::CardSettlement::Cashback::Currency::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            module Currency
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::CardSettlement::Cashback::Currency
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # US Dollar (USD)
              USD =
                T.let(
                  :USD,
                  Increase::Transaction::Source::CardSettlement::Cashback::Currency::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::CardSettlement::Cashback::Currency::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardSettlement::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::CardSettlement::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardSettlement::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Interchange < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardSettlement::Interchange,
                  Increase::Internal::AnyHash
                )
              end

            # The interchange amount given as a string containing a decimal number in major
            # units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
            # credited to Increase (e.g., settlements) and a negative number if it is debited
            # (e.g., refunds).
            sig { returns(String) }
            attr_accessor :amount

            # The card network specific interchange code.
            sig { returns(T.nilable(String)) }
            attr_accessor :code

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            sig do
              returns(
                Increase::Transaction::Source::CardSettlement::Interchange::Currency::TaggedSymbol
              )
            end
            attr_accessor :currency

            # Interchange assessed as a part of this transaction.
            sig do
              params(
                amount: String,
                code: T.nilable(String),
                currency:
                  Increase::Transaction::Source::CardSettlement::Interchange::Currency::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The interchange amount given as a string containing a decimal number in major
              # units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
              # credited to Increase (e.g., settlements) and a negative number if it is debited
              # (e.g., refunds).
              amount:,
              # The card network specific interchange code.
              code:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
              # reimbursement.
              currency:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  code: T.nilable(String),
                  currency:
                    Increase::Transaction::Source::CardSettlement::Interchange::Currency::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            module Currency
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::CardSettlement::Interchange::Currency
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # US Dollar (USD)
              USD =
                T.let(
                  :USD,
                  Increase::Transaction::Source::CardSettlement::Interchange::Currency::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::CardSettlement::Interchange::Currency::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The card network on which this transaction was processed.
          module Network
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardSettlement::Network
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::Transaction::Source::CardSettlement::Network::TaggedSymbol
              )

            # Pulse
            PULSE =
              T.let(
                :pulse,
                Increase::Transaction::Source::CardSettlement::Network::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardSettlement::Network::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardSettlement::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # A network assigned business ID that identifies the acquirer that processed this
            # transaction.
            sig { returns(String) }
            attr_accessor :acquirer_business_id

            # A globally unique identifier for this settlement.
            sig { returns(String) }
            attr_accessor :acquirer_reference_number

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            sig { returns(T.nilable(String)) }
            attr_accessor :transaction_id

            # Network-specific identifiers for this refund.
            sig do
              params(
                acquirer_business_id: String,
                acquirer_reference_number: String,
                authorization_identification_response: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # A network assigned business ID that identifies the acquirer that processed this
              # transaction.
              acquirer_business_id:,
              # A globally unique identifier for this settlement.
              acquirer_reference_number:,
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
              # A globally unique transaction identifier provided by the card network, used
              # across multiple life-cycle requests.
              transaction_id:
            )
            end

            sig do
              override.returns(
                {
                  acquirer_business_id: String,
                  acquirer_reference_number: String,
                  authorization_identification_response: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          class PurchaseDetails < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails,
                  Increase::Internal::AnyHash
                )
              end

            # Fields specific to car rentals.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental
                )
              )
            end
            attr_reader :car_rental

            sig do
              params(
                car_rental:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::OrHash
                  )
              ).void
            end
            attr_writer :car_rental

            # An identifier from the merchant for the customer or consumer.
            sig { returns(T.nilable(String)) }
            attr_accessor :customer_reference_identifier

            # The state or provincial tax amount in minor units.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :local_tax_amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            # assessed.
            sig { returns(T.nilable(String)) }
            attr_accessor :local_tax_currency

            # Fields specific to lodging.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging
                )
              )
            end
            attr_reader :lodging

            sig do
              params(
                lodging:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::OrHash
                  )
              ).void
            end
            attr_writer :lodging

            # The national tax amount in minor units.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :national_tax_amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            # assessed.
            sig { returns(T.nilable(String)) }
            attr_accessor :national_tax_currency

            # An identifier from the merchant for the purchase to the issuer and cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :purchase_identifier

            # The format of the purchase identifier.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )
              )
            end
            attr_accessor :purchase_identifier_format

            # Fields specific to travel.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel
                )
              )
            end
            attr_reader :travel

            sig do
              params(
                travel:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::OrHash
                  )
              ).void
            end
            attr_writer :travel

            # Additional details about the card purchase, such as tax and industry-specific
            # fields.
            sig do
              params(
                car_rental:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::OrHash
                  ),
                customer_reference_identifier: T.nilable(String),
                local_tax_amount: T.nilable(Integer),
                local_tax_currency: T.nilable(String),
                lodging:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::OrHash
                  ),
                national_tax_amount: T.nilable(Integer),
                national_tax_currency: T.nilable(String),
                purchase_identifier: T.nilable(String),
                purchase_identifier_format:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::OrSymbol
                  ),
                travel:
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Fields specific to car rentals.
              car_rental:,
              # An identifier from the merchant for the customer or consumer.
              customer_reference_identifier:,
              # The state or provincial tax amount in minor units.
              local_tax_amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
              # assessed.
              local_tax_currency:,
              # Fields specific to lodging.
              lodging:,
              # The national tax amount in minor units.
              national_tax_amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
              # assessed.
              national_tax_currency:,
              # An identifier from the merchant for the purchase to the issuer and cardholder.
              purchase_identifier:,
              # The format of the purchase identifier.
              purchase_identifier_format:,
              # Fields specific to travel.
              travel:
            )
            end

            sig do
              override.returns(
                {
                  car_rental:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental
                    ),
                  customer_reference_identifier: T.nilable(String),
                  local_tax_amount: T.nilable(Integer),
                  local_tax_currency: T.nilable(String),
                  lodging:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging
                    ),
                  national_tax_amount: T.nilable(Integer),
                  national_tax_currency: T.nilable(String),
                  purchase_identifier: T.nilable(String),
                  purchase_identifier_format:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                    ),
                  travel:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel
                    )
                }
              )
            end
            def to_hash
            end

            class CarRental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental,
                    Increase::Internal::AnyHash
                  )
                end

              # Code indicating the vehicle's class.
              sig { returns(T.nilable(String)) }
              attr_accessor :car_class_code

              # Date the customer picked up the car or, in the case of a no-show or pre-pay
              # transaction, the scheduled pick up date.
              sig { returns(T.nilable(Date)) }
              attr_accessor :checkout_date

              # Daily rate being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :daily_rental_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              # rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :daily_rental_rate_currency

              # Number of days the vehicle was rented.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :days_rented

              # Additional charges (gas, late fee, etc.) being billed.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )
                )
              end
              attr_accessor :extra_charges

              # Fuel charges for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :fuel_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              # assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :fuel_charges_currency

              # Any insurance being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :insurance_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
              # charges assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :insurance_charges_currency

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :no_show_indicator

              # Charges for returning the vehicle at a different location than where it was
              # picked up.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :one_way_drop_off_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
              # drop-off charges assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :one_way_drop_off_charges_currency

              # Name of the person renting the vehicle.
              sig { returns(T.nilable(String)) }
              attr_accessor :renter_name

              # Weekly rate being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :weekly_rental_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
              # rental rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :weekly_rental_rate_currency

              # Fields specific to car rentals.
              sig do
                params(
                  car_class_code: T.nilable(String),
                  checkout_date: T.nilable(Date),
                  daily_rental_rate_amount: T.nilable(Integer),
                  daily_rental_rate_currency: T.nilable(String),
                  days_rented: T.nilable(Integer),
                  extra_charges:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::OrSymbol
                    ),
                  fuel_charges_amount: T.nilable(Integer),
                  fuel_charges_currency: T.nilable(String),
                  insurance_charges_amount: T.nilable(Integer),
                  insurance_charges_currency: T.nilable(String),
                  no_show_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::OrSymbol
                    ),
                  one_way_drop_off_charges_amount: T.nilable(Integer),
                  one_way_drop_off_charges_currency: T.nilable(String),
                  renter_name: T.nilable(String),
                  weekly_rental_rate_amount: T.nilable(Integer),
                  weekly_rental_rate_currency: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Code indicating the vehicle's class.
                car_class_code:,
                # Date the customer picked up the car or, in the case of a no-show or pre-pay
                # transaction, the scheduled pick up date.
                checkout_date:,
                # Daily rate being charged for the vehicle.
                daily_rental_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
                # rate.
                daily_rental_rate_currency:,
                # Number of days the vehicle was rented.
                days_rented:,
                # Additional charges (gas, late fee, etc.) being billed.
                extra_charges:,
                # Fuel charges for the vehicle.
                fuel_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
                # assessed.
                fuel_charges_currency:,
                # Any insurance being charged for the vehicle.
                insurance_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
                # charges assessed.
                insurance_charges_currency:,
                # An indicator that the cardholder is being billed for a reserved vehicle that was
                # not actually rented (that is, a "no-show" charge).
                no_show_indicator:,
                # Charges for returning the vehicle at a different location than where it was
                # picked up.
                one_way_drop_off_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
                # drop-off charges assessed.
                one_way_drop_off_charges_currency:,
                # Name of the person renting the vehicle.
                renter_name:,
                # Weekly rate being charged for the vehicle.
                weekly_rental_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
                # rental rate.
                weekly_rental_rate_currency:
              )
              end

              sig do
                override.returns(
                  {
                    car_class_code: T.nilable(String),
                    checkout_date: T.nilable(Date),
                    daily_rental_rate_amount: T.nilable(Integer),
                    daily_rental_rate_currency: T.nilable(String),
                    days_rented: T.nilable(Integer),
                    extra_charges:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                      ),
                    fuel_charges_amount: T.nilable(Integer),
                    fuel_charges_currency: T.nilable(String),
                    insurance_charges_amount: T.nilable(Integer),
                    insurance_charges_currency: T.nilable(String),
                    no_show_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                      ),
                    one_way_drop_off_charges_amount: T.nilable(Integer),
                    one_way_drop_off_charges_currency: T.nilable(String),
                    renter_name: T.nilable(String),
                    weekly_rental_rate_amount: T.nilable(Integer),
                    weekly_rental_rate_currency: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Additional charges (gas, late fee, etc.) being billed.
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No extra charge
                NO_EXTRA_CHARGE =
                  T.let(
                    :no_extra_charge,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Gas
                GAS =
                  T.let(
                    :gas,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Extra mileage
                EXTRA_MILEAGE =
                  T.let(
                    :extra_mileage,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Late return
                LATE_RETURN =
                  T.let(
                    :late_return,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # One way service fee
                ONE_WAY_SERVICE_FEE =
                  T.let(
                    :one_way_service_fee,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Parking violation
                PARKING_VIOLATION =
                  T.let(
                    :parking_violation,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not applicable
                NOT_APPLICABLE =
                  T.let(
                    :not_applicable,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )

                # No show for specialized vehicle
                NO_SHOW_FOR_SPECIALIZED_VEHICLE =
                  T.let(
                    :no_show_for_specialized_vehicle,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Lodging < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging,
                    Increase::Internal::AnyHash
                  )
                end

              # Date the customer checked in.
              sig { returns(T.nilable(Date)) }
              attr_accessor :check_in_date

              # Daily rate being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :daily_room_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
              # rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :daily_room_rate_currency

              # Additional charges (phone, late check-out, etc.) being billed.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )
                )
              end
              attr_accessor :extra_charges

              # Folio cash advances for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :folio_cash_advances_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
              # advances.
              sig { returns(T.nilable(String)) }
              attr_accessor :folio_cash_advances_currency

              # Food and beverage charges for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :food_beverage_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
              # beverage charges.
              sig { returns(T.nilable(String)) }
              attr_accessor :food_beverage_charges_currency

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :no_show_indicator

              # Prepaid expenses being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :prepaid_expenses_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
              # expenses.
              sig { returns(T.nilable(String)) }
              attr_accessor :prepaid_expenses_currency

              # Number of nights the room was rented.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :room_nights

              # Total room tax being charged.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :total_room_tax_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
              # tax.
              sig { returns(T.nilable(String)) }
              attr_accessor :total_room_tax_currency

              # Total tax being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :total_tax_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
              # assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :total_tax_currency

              # Fields specific to lodging.
              sig do
                params(
                  check_in_date: T.nilable(Date),
                  daily_room_rate_amount: T.nilable(Integer),
                  daily_room_rate_currency: T.nilable(String),
                  extra_charges:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::OrSymbol
                    ),
                  folio_cash_advances_amount: T.nilable(Integer),
                  folio_cash_advances_currency: T.nilable(String),
                  food_beverage_charges_amount: T.nilable(Integer),
                  food_beverage_charges_currency: T.nilable(String),
                  no_show_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::OrSymbol
                    ),
                  prepaid_expenses_amount: T.nilable(Integer),
                  prepaid_expenses_currency: T.nilable(String),
                  room_nights: T.nilable(Integer),
                  total_room_tax_amount: T.nilable(Integer),
                  total_room_tax_currency: T.nilable(String),
                  total_tax_amount: T.nilable(Integer),
                  total_tax_currency: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Date the customer checked in.
                check_in_date:,
                # Daily rate being charged for the room.
                daily_room_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
                # rate.
                daily_room_rate_currency:,
                # Additional charges (phone, late check-out, etc.) being billed.
                extra_charges:,
                # Folio cash advances for the room.
                folio_cash_advances_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
                # advances.
                folio_cash_advances_currency:,
                # Food and beverage charges for the room.
                food_beverage_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
                # beverage charges.
                food_beverage_charges_currency:,
                # Indicator that the cardholder is being billed for a reserved room that was not
                # actually used.
                no_show_indicator:,
                # Prepaid expenses being charged for the room.
                prepaid_expenses_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
                # expenses.
                prepaid_expenses_currency:,
                # Number of nights the room was rented.
                room_nights:,
                # Total room tax being charged.
                total_room_tax_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
                # tax.
                total_room_tax_currency:,
                # Total tax being charged for the room.
                total_tax_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
                # assessed.
                total_tax_currency:
              )
              end

              sig do
                override.returns(
                  {
                    check_in_date: T.nilable(Date),
                    daily_room_rate_amount: T.nilable(Integer),
                    daily_room_rate_currency: T.nilable(String),
                    extra_charges:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                      ),
                    folio_cash_advances_amount: T.nilable(Integer),
                    folio_cash_advances_currency: T.nilable(String),
                    food_beverage_charges_amount: T.nilable(Integer),
                    food_beverage_charges_currency: T.nilable(String),
                    no_show_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                      ),
                    prepaid_expenses_amount: T.nilable(Integer),
                    prepaid_expenses_currency: T.nilable(String),
                    room_nights: T.nilable(Integer),
                    total_room_tax_amount: T.nilable(Integer),
                    total_room_tax_currency: T.nilable(String),
                    total_tax_amount: T.nilable(Integer),
                    total_tax_currency: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Additional charges (phone, late check-out, etc.) being billed.
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No extra charge
                NO_EXTRA_CHARGE =
                  T.let(
                    :no_extra_charge,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Restaurant
                RESTAURANT =
                  T.let(
                    :restaurant,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Gift shop
                GIFT_SHOP =
                  T.let(
                    :gift_shop,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Mini bar
                MINI_BAR =
                  T.let(
                    :mini_bar,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Telephone
                TELEPHONE =
                  T.let(
                    :telephone,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Other
                OTHER =
                  T.let(
                    :other,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Laundry
                LAUNDRY =
                  T.let(
                    :laundry,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not applicable
                NOT_APPLICABLE =
                  T.let(
                    :not_applicable,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )

                # No show
                NO_SHOW =
                  T.let(
                    :no_show,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            # The format of the purchase identifier.
            module PurchaseIdentifierFormat
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Free text
              FREE_TEXT =
                T.let(
                  :free_text,
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Order number
              ORDER_NUMBER =
                T.let(
                  :order_number,
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Rental agreement number
              RENTAL_AGREEMENT_NUMBER =
                T.let(
                  :rental_agreement_number,
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Hotel folio number
              HOTEL_FOLIO_NUMBER =
                T.let(
                  :hotel_folio_number,
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Invoice number
              INVOICE_NUMBER =
                T.let(
                  :invoice_number,
                  Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Travel < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel,
                    Increase::Internal::AnyHash
                  )
                end

              # Ancillary purchases in addition to the airfare.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary
                  )
                )
              end
              attr_reader :ancillary

              sig do
                params(
                  ancillary:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::OrHash
                    )
                ).void
              end
              attr_writer :ancillary

              # Indicates the computerized reservation system used to book the ticket.
              sig { returns(T.nilable(String)) }
              attr_accessor :computerized_reservation_system

              # Indicates the reason for a credit to the cardholder.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :credit_reason_indicator

              # Date of departure.
              sig { returns(T.nilable(Date)) }
              attr_accessor :departure_date

              # Code for the originating city or airport.
              sig { returns(T.nilable(String)) }
              attr_accessor :origination_city_airport_code

              # Name of the passenger.
              sig { returns(T.nilable(String)) }
              attr_accessor :passenger_name

              # Indicates whether this ticket is non-refundable.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :restricted_ticket_indicator

              # Indicates why a ticket was changed.
              sig do
                returns(
                  T.nilable(
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :ticket_change_indicator

              # Ticket number.
              sig { returns(T.nilable(String)) }
              attr_accessor :ticket_number

              # Code for the travel agency if the ticket was issued by a travel agency.
              sig { returns(T.nilable(String)) }
              attr_accessor :travel_agency_code

              # Name of the travel agency if the ticket was issued by a travel agency.
              sig { returns(T.nilable(String)) }
              attr_accessor :travel_agency_name

              # Fields specific to each leg of the journey.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg
                    ]
                  )
                )
              end
              attr_accessor :trip_legs

              # Fields specific to travel.
              sig do
                params(
                  ancillary:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::OrHash
                    ),
                  computerized_reservation_system: T.nilable(String),
                  credit_reason_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::OrSymbol
                    ),
                  departure_date: T.nilable(Date),
                  origination_city_airport_code: T.nilable(String),
                  passenger_name: T.nilable(String),
                  restricted_ticket_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::OrSymbol
                    ),
                  ticket_change_indicator:
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::OrSymbol
                    ),
                  ticket_number: T.nilable(String),
                  travel_agency_code: T.nilable(String),
                  travel_agency_name: T.nilable(String),
                  trip_legs:
                    T.nilable(
                      T::Array[
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::OrHash
                      ]
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Ancillary purchases in addition to the airfare.
                ancillary:,
                # Indicates the computerized reservation system used to book the ticket.
                computerized_reservation_system:,
                # Indicates the reason for a credit to the cardholder.
                credit_reason_indicator:,
                # Date of departure.
                departure_date:,
                # Code for the originating city or airport.
                origination_city_airport_code:,
                # Name of the passenger.
                passenger_name:,
                # Indicates whether this ticket is non-refundable.
                restricted_ticket_indicator:,
                # Indicates why a ticket was changed.
                ticket_change_indicator:,
                # Ticket number.
                ticket_number:,
                # Code for the travel agency if the ticket was issued by a travel agency.
                travel_agency_code:,
                # Name of the travel agency if the ticket was issued by a travel agency.
                travel_agency_name:,
                # Fields specific to each leg of the journey.
                trip_legs:
              )
              end

              sig do
                override.returns(
                  {
                    ancillary:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary
                      ),
                    computerized_reservation_system: T.nilable(String),
                    credit_reason_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                      ),
                    departure_date: T.nilable(Date),
                    origination_city_airport_code: T.nilable(String),
                    passenger_name: T.nilable(String),
                    restricted_ticket_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                      ),
                    ticket_change_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                      ),
                    ticket_number: T.nilable(String),
                    travel_agency_code: T.nilable(String),
                    travel_agency_name: T.nilable(String),
                    trip_legs:
                      T.nilable(
                        T::Array[
                          Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg
                        ]
                      )
                  }
                )
              end
              def to_hash
              end

              class Ancillary < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary,
                      Increase::Internal::AnyHash
                    )
                  end

                # If this purchase has a connection or relationship to another purchase, such as a
                # baggage fee for a passenger transport ticket, this field should contain the
                # ticket document number for the other purchase.
                sig { returns(T.nilable(String)) }
                attr_accessor :connected_ticket_document_number

                # Indicates the reason for a credit to the cardholder.
                sig do
                  returns(
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )
                  )
                end
                attr_accessor :credit_reason_indicator

                # Name of the passenger or description of the ancillary purchase.
                sig { returns(T.nilable(String)) }
                attr_accessor :passenger_name_or_description

                # Additional travel charges, such as baggage fees.
                sig do
                  returns(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service
                    ]
                  )
                end
                attr_accessor :services

                # Ticket document number.
                sig { returns(T.nilable(String)) }
                attr_accessor :ticket_document_number

                # Ancillary purchases in addition to the airfare.
                sig do
                  params(
                    connected_ticket_document_number: T.nilable(String),
                    credit_reason_indicator:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::OrSymbol
                      ),
                    passenger_name_or_description: T.nilable(String),
                    services:
                      T::Array[
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::OrHash
                      ],
                    ticket_document_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # If this purchase has a connection or relationship to another purchase, such as a
                  # baggage fee for a passenger transport ticket, this field should contain the
                  # ticket document number for the other purchase.
                  connected_ticket_document_number:,
                  # Indicates the reason for a credit to the cardholder.
                  credit_reason_indicator:,
                  # Name of the passenger or description of the ancillary purchase.
                  passenger_name_or_description:,
                  # Additional travel charges, such as baggage fees.
                  services:,
                  # Ticket document number.
                  ticket_document_number:
                )
                end

                sig do
                  override.returns(
                    {
                      connected_ticket_document_number: T.nilable(String),
                      credit_reason_indicator:
                        T.nilable(
                          Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                        ),
                      passenger_name_or_description: T.nilable(String),
                      services:
                        T::Array[
                          Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service
                        ],
                      ticket_document_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Indicates the reason for a credit to the cardholder.
                module CreditReasonIndicator
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # No credit
                  NO_CREDIT =
                    T.let(
                      :no_credit,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Passenger transport ancillary purchase cancellation
                  PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    T.let(
                      :passenger_transport_ancillary_purchase_cancellation,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Airline ticket and passenger transport ancillary purchase cancellation
                  AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    T.let(
                      :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Other
                  OTHER =
                    T.let(
                      :other,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Service < Increase::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service,
                        Increase::Internal::AnyHash
                      )
                    end

                  # Category of the ancillary service.
                  sig do
                    returns(
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )
                    )
                  end
                  attr_accessor :category

                  # Sub-category of the ancillary service, free-form.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :sub_category

                  sig do
                    params(
                      category:
                        T.nilable(
                          Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::OrSymbol
                        ),
                      sub_category: T.nilable(String)
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Category of the ancillary service.
                    category:,
                    # Sub-category of the ancillary service, free-form.
                    sub_category:
                  )
                  end

                  sig do
                    override.returns(
                      {
                        category:
                          T.nilable(
                            Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                          ),
                        sub_category: T.nilable(String)
                      }
                    )
                  end
                  def to_hash
                  end

                  # Category of the ancillary service.
                  module Category
                    extend Increase::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    # None
                    NONE =
                      T.let(
                        :none,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Bundled service
                    BUNDLED_SERVICE =
                      T.let(
                        :bundled_service,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Baggage fee
                    BAGGAGE_FEE =
                      T.let(
                        :baggage_fee,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Change fee
                    CHANGE_FEE =
                      T.let(
                        :change_fee,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Cargo
                    CARGO =
                      T.let(
                        :cargo,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Carbon offset
                    CARBON_OFFSET =
                      T.let(
                        :carbon_offset,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Frequent flyer
                    FREQUENT_FLYER =
                      T.let(
                        :frequent_flyer,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Gift card
                    GIFT_CARD =
                      T.let(
                        :gift_card,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Ground transport
                    GROUND_TRANSPORT =
                      T.let(
                        :ground_transport,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # In-flight entertainment
                    IN_FLIGHT_ENTERTAINMENT =
                      T.let(
                        :in_flight_entertainment,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Lounge
                    LOUNGE =
                      T.let(
                        :lounge,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Medical
                    MEDICAL =
                      T.let(
                        :medical,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Meal beverage
                    MEAL_BEVERAGE =
                      T.let(
                        :meal_beverage,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Other
                    OTHER =
                      T.let(
                        :other,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Passenger assist fee
                    PASSENGER_ASSIST_FEE =
                      T.let(
                        :passenger_assist_fee,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Pets
                    PETS =
                      T.let(
                        :pets,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Seat fees
                    SEAT_FEES =
                      T.let(
                        :seat_fees,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Standby
                    STANDBY =
                      T.let(
                        :standby,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Service fee
                    SERVICE_FEE =
                      T.let(
                        :service_fee,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Store
                    STORE =
                      T.let(
                        :store,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Travel service
                    TRAVEL_SERVICE =
                      T.let(
                        :travel_service,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Unaccompanied travel
                    UNACCOMPANIED_TRAVEL =
                      T.let(
                        :unaccompanied_travel,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Upgrades
                    UPGRADES =
                      T.let(
                        :upgrades,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Wi-fi
                    WIFI =
                      T.let(
                        :wifi,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end
              end

              # Indicates the reason for a credit to the cardholder.
              module CreditReasonIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No credit
                NO_CREDIT =
                  T.let(
                    :no_credit,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Passenger transport ancillary purchase cancellation
                PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  T.let(
                    :passenger_transport_ancillary_purchase_cancellation,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Airline ticket and passenger transport ancillary purchase cancellation
                AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  T.let(
                    :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Airline ticket cancellation
                AIRLINE_TICKET_CANCELLATION =
                  T.let(
                    :airline_ticket_cancellation,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Other
                OTHER =
                  T.let(
                    :other,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Partial refund of airline ticket
                PARTIAL_REFUND_OF_AIRLINE_TICKET =
                  T.let(
                    :partial_refund_of_airline_ticket,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicates whether this ticket is non-refundable.
              module RestrictedTicketIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No restrictions
                NO_RESTRICTIONS =
                  T.let(
                    :no_restrictions,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )

                # Restricted non-refundable ticket
                RESTRICTED_NON_REFUNDABLE_TICKET =
                  T.let(
                    :restricted_non_refundable_ticket,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicates why a ticket was changed.
              module TicketChangeIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # None
                NONE =
                  T.let(
                    :none,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                # Change to existing ticket
                CHANGE_TO_EXISTING_TICKET =
                  T.let(
                    :change_to_existing_ticket,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                # New ticket
                NEW_TICKET =
                  T.let(
                    :new_ticket,
                    Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class TripLeg < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg,
                      Increase::Internal::AnyHash
                    )
                  end

                # Carrier code (e.g., United Airlines, Jet Blue, etc.).
                sig { returns(T.nilable(String)) }
                attr_accessor :carrier_code

                # Code for the destination city or airport.
                sig { returns(T.nilable(String)) }
                attr_accessor :destination_city_airport_code

                # Fare basis code.
                sig { returns(T.nilable(String)) }
                attr_accessor :fare_basis_code

                # Flight number.
                sig { returns(T.nilable(String)) }
                attr_accessor :flight_number

                # Service class (e.g., first class, business class, etc.).
                sig { returns(T.nilable(String)) }
                attr_accessor :service_class

                # Indicates whether a stopover is allowed on this ticket.
                sig do
                  returns(
                    T.nilable(
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )
                  )
                end
                attr_accessor :stop_over_code

                sig do
                  params(
                    carrier_code: T.nilable(String),
                    destination_city_airport_code: T.nilable(String),
                    fare_basis_code: T.nilable(String),
                    flight_number: T.nilable(String),
                    service_class: T.nilable(String),
                    stop_over_code:
                      T.nilable(
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::OrSymbol
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Carrier code (e.g., United Airlines, Jet Blue, etc.).
                  carrier_code:,
                  # Code for the destination city or airport.
                  destination_city_airport_code:,
                  # Fare basis code.
                  fare_basis_code:,
                  # Flight number.
                  flight_number:,
                  # Service class (e.g., first class, business class, etc.).
                  service_class:,
                  # Indicates whether a stopover is allowed on this ticket.
                  stop_over_code:
                )
                end

                sig do
                  override.returns(
                    {
                      carrier_code: T.nilable(String),
                      destination_city_airport_code: T.nilable(String),
                      fare_basis_code: T.nilable(String),
                      flight_number: T.nilable(String),
                      service_class: T.nilable(String),
                      stop_over_code:
                        T.nilable(
                          Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                        )
                    }
                  )
                end
                def to_hash
                end

                # Indicates whether a stopover is allowed on this ticket.
                module StopOverCode
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # None
                  NONE =
                    T.let(
                      :none,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  # Stop over allowed
                  STOP_OVER_ALLOWED =
                    T.let(
                      :stop_over_allowed,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  # Stop over not allowed
                  STOP_OVER_NOT_ALLOWED =
                    T.let(
                      :stop_over_not_allowed,
                      Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end
          end

          class Surcharge < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::CardSettlement::Surcharge,
                  Increase::Internal::AnyHash
                )
              end

            # The surcharge amount in the minor unit of the transaction's settlement currency.
            sig { returns(Integer) }
            attr_accessor :amount

            # The surcharge amount in the minor unit of the transaction's presentment
            # currency.
            sig { returns(Integer) }
            attr_accessor :presentment_amount

            # Surcharge amount details, if applicable. The amount is positive if the surcharge
            # is added to to the overall transaction amount (surcharge), and negative if the
            # surcharge is deducted from the overall transaction amount (discount).
            sig do
              params(amount: Integer, presentment_amount: Integer).returns(
                T.attached_class
              )
            end
            def self.new(
              # The surcharge amount in the minor unit of the transaction's settlement currency.
              amount:,
              # The surcharge amount in the minor unit of the transaction's presentment
              # currency.
              presentment_amount:
            )
            end

            sig do
              override.returns({ amount: Integer, presentment_amount: Integer })
            end
            def to_hash
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_settlement`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CardSettlement::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_SETTLEMENT =
              T.let(
                :card_settlement,
                Increase::Transaction::Source::CardSettlement::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CardSettlement::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CashbackPayment < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CashbackPayment,
                Increase::Internal::AnyHash
              )
            end

          # The card on which the cashback was accrued.
          sig { returns(T.nilable(String)) }
          attr_accessor :accrued_on_card_id

          # The amount in the minor unit of the transaction's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          sig do
            returns(
              Increase::Transaction::Source::CashbackPayment::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The end of the period for which this transaction paid cashback.
          sig { returns(Time) }
          attr_accessor :period_end

          # The start of the period for which this transaction paid cashback.
          sig { returns(Time) }
          attr_accessor :period_start

          # A Cashback Payment object. This field will be present in the JSON response if
          # and only if `category` is equal to `cashback_payment`. A Cashback Payment
          # represents the cashback paid to a cardholder for a given period. Cashback is
          # usually paid monthly for the prior month's transactions.
          sig do
            params(
              accrued_on_card_id: T.nilable(String),
              amount: Integer,
              currency:
                Increase::Transaction::Source::CashbackPayment::Currency::OrSymbol,
              period_end: Time,
              period_start: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # The card on which the cashback was accrued.
            accrued_on_card_id:,
            # The amount in the minor unit of the transaction's currency. For dollars, for
            # example, this is cents.
            amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
            # currency.
            currency:,
            # The end of the period for which this transaction paid cashback.
            period_end:,
            # The start of the period for which this transaction paid cashback.
            period_start:
          )
          end

          sig do
            override.returns(
              {
                accrued_on_card_id: T.nilable(String),
                amount: Integer,
                currency:
                  Increase::Transaction::Source::CashbackPayment::Currency::TaggedSymbol,
                period_end: Time,
                period_start: Time
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CashbackPayment::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::CashbackPayment::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CashbackPayment::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::Transaction::Source::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Account Transfer Intention: details will be under the `account_transfer_intention` object.
          ACCOUNT_TRANSFER_INTENTION =
            T.let(
              :account_transfer_intention,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # ACH Transfer Intention: details will be under the `ach_transfer_intention` object.
          ACH_TRANSFER_INTENTION =
            T.let(
              :ach_transfer_intention,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # ACH Transfer Rejection: details will be under the `ach_transfer_rejection` object.
          ACH_TRANSFER_REJECTION =
            T.let(
              :ach_transfer_rejection,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # ACH Transfer Return: details will be under the `ach_transfer_return` object.
          ACH_TRANSFER_RETURN =
            T.let(
              :ach_transfer_return,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Cashback Payment: details will be under the `cashback_payment` object.
          CASHBACK_PAYMENT =
            T.let(
              :cashback_payment,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Legacy Card Dispute Acceptance: details will be under the `card_dispute_acceptance` object.
          CARD_DISPUTE_ACCEPTANCE =
            T.let(
              :card_dispute_acceptance,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Card Dispute Financial: details will be under the `card_dispute_financial` object.
          CARD_DISPUTE_FINANCIAL =
            T.let(
              :card_dispute_financial,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Legacy Card Dispute Loss: details will be under the `card_dispute_loss` object.
          CARD_DISPUTE_LOSS =
            T.let(
              :card_dispute_loss,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Card Refund: details will be under the `card_refund` object.
          CARD_REFUND =
            T.let(
              :card_refund,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Card Settlement: details will be under the `card_settlement` object.
          CARD_SETTLEMENT =
            T.let(
              :card_settlement,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Card Financial: details will be under the `card_financial` object.
          CARD_FINANCIAL =
            T.let(
              :card_financial,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Card Revenue Payment: details will be under the `card_revenue_payment` object.
          CARD_REVENUE_PAYMENT =
            T.let(
              :card_revenue_payment,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Check Deposit Acceptance: details will be under the `check_deposit_acceptance` object.
          CHECK_DEPOSIT_ACCEPTANCE =
            T.let(
              :check_deposit_acceptance,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Check Deposit Return: details will be under the `check_deposit_return` object.
          CHECK_DEPOSIT_RETURN =
            T.let(
              :check_deposit_return,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # FedNow Transfer Acknowledgement: details will be under the `fednow_transfer_acknowledgement` object.
          FEDNOW_TRANSFER_ACKNOWLEDGEMENT =
            T.let(
              :fednow_transfer_acknowledgement,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Check Transfer Deposit: details will be under the `check_transfer_deposit` object.
          CHECK_TRANSFER_DEPOSIT =
            T.let(
              :check_transfer_deposit,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Fee Payment: details will be under the `fee_payment` object.
          FEE_PAYMENT =
            T.let(
              :fee_payment,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound ACH Transfer Intention: details will be under the `inbound_ach_transfer` object.
          INBOUND_ACH_TRANSFER =
            T.let(
              :inbound_ach_transfer,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound ACH Transfer Return Intention: details will be under the `inbound_ach_transfer_return_intention` object.
          INBOUND_ACH_TRANSFER_RETURN_INTENTION =
            T.let(
              :inbound_ach_transfer_return_intention,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound Check Deposit Return Intention: details will be under the `inbound_check_deposit_return_intention` object.
          INBOUND_CHECK_DEPOSIT_RETURN_INTENTION =
            T.let(
              :inbound_check_deposit_return_intention,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound Check Adjustment: details will be under the `inbound_check_adjustment` object.
          INBOUND_CHECK_ADJUSTMENT =
            T.let(
              :inbound_check_adjustment,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound FedNow Transfer Confirmation: details will be under the `inbound_fednow_transfer_confirmation` object.
          INBOUND_FEDNOW_TRANSFER_CONFIRMATION =
            T.let(
              :inbound_fednow_transfer_confirmation,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound Real-Time Payments Transfer Confirmation: details will be under the `inbound_real_time_payments_transfer_confirmation` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_CONFIRMATION =
            T.let(
              :inbound_real_time_payments_transfer_confirmation,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound Wire Reversal: details will be under the `inbound_wire_reversal` object.
          INBOUND_WIRE_REVERSAL =
            T.let(
              :inbound_wire_reversal,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound Wire Transfer Intention: details will be under the `inbound_wire_transfer` object.
          INBOUND_WIRE_TRANSFER =
            T.let(
              :inbound_wire_transfer,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Inbound Wire Transfer Reversal Intention: details will be under the `inbound_wire_transfer_reversal` object.
          INBOUND_WIRE_TRANSFER_REVERSAL =
            T.let(
              :inbound_wire_transfer_reversal,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Interest Payment: details will be under the `interest_payment` object.
          INTEREST_PAYMENT =
            T.let(
              :interest_payment,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Internal Source: details will be under the `internal_source` object.
          INTERNAL_SOURCE =
            T.let(
              :internal_source,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Real-Time Payments Transfer Acknowledgement: details will be under the `real_time_payments_transfer_acknowledgement` object.
          REAL_TIME_PAYMENTS_TRANSFER_ACKNOWLEDGEMENT =
            T.let(
              :real_time_payments_transfer_acknowledgement,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Sample Funds: details will be under the `sample_funds` object.
          SAMPLE_FUNDS =
            T.let(
              :sample_funds,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Wire Transfer Intention: details will be under the `wire_transfer_intention` object.
          WIRE_TRANSFER_INTENTION =
            T.let(
              :wire_transfer_intention,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Swift Transfer Intention: details will be under the `swift_transfer_intention` object.
          SWIFT_TRANSFER_INTENTION =
            T.let(
              :swift_transfer_intention,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Swift Transfer Return: details will be under the `swift_transfer_return` object.
          SWIFT_TRANSFER_RETURN =
            T.let(
              :swift_transfer_return,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Card Push Transfer Acceptance: details will be under the `card_push_transfer_acceptance` object.
          CARD_PUSH_TRANSFER_ACCEPTANCE =
            T.let(
              :card_push_transfer_acceptance,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # Account Revenue Payment: details will be under the `account_revenue_payment` object.
          ACCOUNT_REVENUE_PAYMENT =
            T.let(
              :account_revenue_payment,
              Increase::Transaction::Source::Category::TaggedSymbol
            )

          # The Transaction was made for an undocumented or deprecated reason.
          OTHER =
            T.let(:other, Increase::Transaction::Source::Category::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Increase::Transaction::Source::Category::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class CheckDepositAcceptance < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CheckDepositAcceptance,
                Increase::Internal::AnyHash
              )
            end

          # The account number printed on the check. This is an account at the bank that
          # issued the check.
          sig { returns(String) }
          attr_accessor :account_number

          # The amount to be deposited in the minor unit of the transaction's currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # An additional line of metadata printed on the check. This typically includes the
          # check number for business checks.
          sig { returns(T.nilable(String)) }
          attr_accessor :auxiliary_on_us

          # The ID of the Check Deposit that was accepted.
          sig { returns(String) }
          attr_accessor :check_deposit_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          sig do
            returns(
              Increase::Transaction::Source::CheckDepositAcceptance::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The routing number printed on the check. This is a routing number for the bank
          # that issued the check.
          sig { returns(String) }
          attr_accessor :routing_number

          # The check serial number, if present, for consumer checks. For business checks,
          # the serial number is usually in the `auxiliary_on_us` field.
          sig { returns(T.nilable(String)) }
          attr_accessor :serial_number

          # A Check Deposit Acceptance object. This field will be present in the JSON
          # response if and only if `category` is equal to `check_deposit_acceptance`. A
          # Check Deposit Acceptance is created when a Check Deposit is processed and its
          # details confirmed. Check Deposits may be returned by the receiving bank, which
          # will appear as a Check Deposit Return.
          sig do
            params(
              account_number: String,
              amount: Integer,
              auxiliary_on_us: T.nilable(String),
              check_deposit_id: String,
              currency:
                Increase::Transaction::Source::CheckDepositAcceptance::Currency::OrSymbol,
              routing_number: String,
              serial_number: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The account number printed on the check. This is an account at the bank that
            # issued the check.
            account_number:,
            # The amount to be deposited in the minor unit of the transaction's currency. For
            # dollars, for example, this is cents.
            amount:,
            # An additional line of metadata printed on the check. This typically includes the
            # check number for business checks.
            auxiliary_on_us:,
            # The ID of the Check Deposit that was accepted.
            check_deposit_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's currency.
            currency:,
            # The routing number printed on the check. This is a routing number for the bank
            # that issued the check.
            routing_number:,
            # The check serial number, if present, for consumer checks. For business checks,
            # the serial number is usually in the `auxiliary_on_us` field.
            serial_number:
          )
          end

          sig do
            override.returns(
              {
                account_number: String,
                amount: Integer,
                auxiliary_on_us: T.nilable(String),
                check_deposit_id: String,
                currency:
                  Increase::Transaction::Source::CheckDepositAcceptance::Currency::TaggedSymbol,
                routing_number: String,
                serial_number: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CheckDepositAcceptance::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::CheckDepositAcceptance::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CheckDepositAcceptance::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CheckDepositReturn < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CheckDepositReturn,
                Increase::Internal::AnyHash
              )
            end

          # The returned amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the Check Deposit that was returned.
          sig { returns(String) }
          attr_accessor :check_deposit_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          sig do
            returns(
              Increase::Transaction::Source::CheckDepositReturn::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # Why this check was returned by the bank holding the account it was drawn
          # against.
          sig do
            returns(
              Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
            )
          end
          attr_accessor :return_reason

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the check deposit was returned.
          sig { returns(Time) }
          attr_accessor :returned_at

          # The identifier of the transaction that reversed the original check deposit
          # transaction.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A Check Deposit Return object. This field will be present in the JSON response
          # if and only if `category` is equal to `check_deposit_return`. A Check Deposit
          # Return is created when a Check Deposit is returned by the bank holding the
          # account it was drawn against. Check Deposits may be returned for a variety of
          # reasons, including insufficient funds or a mismatched account number. Usually,
          # checks are returned within the first 7 days after the deposit is made.
          sig do
            params(
              amount: Integer,
              check_deposit_id: String,
              currency:
                Increase::Transaction::Source::CheckDepositReturn::Currency::OrSymbol,
              return_reason:
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::OrSymbol,
              returned_at: Time,
              transaction_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The returned amount in USD cents.
            amount:,
            # The identifier of the Check Deposit that was returned.
            check_deposit_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's currency.
            currency:,
            # Why this check was returned by the bank holding the account it was drawn
            # against.
            return_reason:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the check deposit was returned.
            returned_at:,
            # The identifier of the transaction that reversed the original check deposit
            # transaction.
            transaction_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                check_deposit_id: String,
                currency:
                  Increase::Transaction::Source::CheckDepositReturn::Currency::TaggedSymbol,
                return_reason:
                  Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol,
                returned_at: Time,
                transaction_id: String
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CheckDepositReturn::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::CheckDepositReturn::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CheckDepositReturn::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Why this check was returned by the bank holding the account it was drawn
          # against.
          module ReturnReason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CheckDepositReturn::ReturnReason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The check doesn't allow ACH conversion.
            ACH_CONVERSION_NOT_SUPPORTED =
              T.let(
                :ach_conversion_not_supported,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The account is closed. (Check21 return code `D`)
            CLOSED_ACCOUNT =
              T.let(
                :closed_account,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check has already been deposited. (Check21 return code `Y`)
            DUPLICATE_SUBMISSION =
              T.let(
                :duplicate_submission,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # Insufficient funds (Check21 return code `A`)
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # No account was found matching the check details. (Check21 return code `E`)
            NO_ACCOUNT =
              T.let(
                :no_account,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check was not authorized. (Check21 return code `Q`)
            NOT_AUTHORIZED =
              T.let(
                :not_authorized,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check is too old. (Check21 return code `G`)
            STALE_DATED =
              T.let(
                :stale_dated,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The payment has been stopped by the account holder. (Check21 return code `C`)
            STOP_PAYMENT =
              T.let(
                :stop_payment,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The reason for the return is unknown.
            UNKNOWN_REASON =
              T.let(
                :unknown_reason,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The image doesn't match the details submitted.
            UNMATCHED_DETAILS =
              T.let(
                :unmatched_details,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The image could not be read. (Check21 return code `U`)
            UNREADABLE_IMAGE =
              T.let(
                :unreadable_image,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check endorsement was irregular. (Check21 return code `J`)
            ENDORSEMENT_IRREGULAR =
              T.let(
                :endorsement_irregular,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check present was either altered or fake. (Check21 return code `N`)
            ALTERED_OR_FICTITIOUS_ITEM =
              T.let(
                :altered_or_fictitious_item,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The account this check is drawn on is frozen. (Check21 return code `F`)
            FROZEN_OR_BLOCKED_ACCOUNT =
              T.let(
                :frozen_or_blocked_account,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check is post dated. (Check21 return code `H`)
            POST_DATED =
              T.let(
                :post_dated,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The endorsement was missing. (Check21 return code `I`)
            ENDORSEMENT_MISSING =
              T.let(
                :endorsement_missing,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check signature was missing. (Check21 return code `K`)
            SIGNATURE_MISSING =
              T.let(
                :signature_missing,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The bank suspects a stop payment will be placed. (Check21 return code `T`)
            STOP_PAYMENT_SUSPECT =
              T.let(
                :stop_payment_suspect,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The bank cannot read the image. (Check21 return code `U`)
            UNUSABLE_IMAGE =
              T.let(
                :unusable_image,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check image fails the bank's security check. (Check21 return code `V`)
            IMAGE_FAILS_SECURITY_CHECK =
              T.let(
                :image_fails_security_check,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The bank cannot determine the amount. (Check21 return code `W`)
            CANNOT_DETERMINE_AMOUNT =
              T.let(
                :cannot_determine_amount,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The signature is inconsistent with prior signatures. (Check21 return code `L`)
            SIGNATURE_IRREGULAR =
              T.let(
                :signature_irregular,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check is a non-cash item and cannot be drawn against the account. (Check21 return code `M`)
            NON_CASH_ITEM =
              T.let(
                :non_cash_item,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The bank is unable to process this check. (Check21 return code `O`)
            UNABLE_TO_PROCESS =
              T.let(
                :unable_to_process,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The check exceeds the bank or customer's limit. (Check21 return code `P`)
            ITEM_EXCEEDS_DOLLAR_LIMIT =
              T.let(
                :item_exceeds_dollar_limit,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            # The bank sold this account and no longer services this customer. (Check21 return code `R`)
            BRANCH_OR_ACCOUNT_SOLD =
              T.let(
                :branch_or_account_sold,
                Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CheckDepositReturn::ReturnReason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CheckTransferDeposit < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::CheckTransferDeposit,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the API File object containing an image of the back of the
          # deposited check.
          sig { returns(T.nilable(String)) }
          attr_accessor :back_image_file_id

          # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
          # bank depositing this check. In some rare cases, this is not transmitted via
          # Check21 and the value will be null.
          sig { returns(T.nilable(String)) }
          attr_accessor :bank_of_first_deposit_routing_number

          # When the check was deposited.
          sig { returns(Time) }
          attr_accessor :deposited_at

          # The identifier of the API File object containing an image of the front of the
          # deposited check.
          sig { returns(T.nilable(String)) }
          attr_accessor :front_image_file_id

          # The identifier of the Inbound Check Deposit object associated with this
          # transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :inbound_check_deposit_id

          # The identifier of the Transaction object created when the check was deposited.
          sig { returns(T.nilable(String)) }
          attr_accessor :transaction_id

          # The identifier of the Check Transfer object that was deposited.
          sig { returns(T.nilable(String)) }
          attr_accessor :transfer_id

          # A constant representing the object's type. For this resource it will always be
          # `check_transfer_deposit`.
          sig do
            returns(
              Increase::Transaction::Source::CheckTransferDeposit::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A Check Transfer Deposit object. This field will be present in the JSON response
          # if and only if `category` is equal to `check_transfer_deposit`. An Inbound Check
          # is a check drawn on an Increase account that has been deposited by an external
          # bank account. These types of checks are not pre-registered.
          sig do
            params(
              back_image_file_id: T.nilable(String),
              bank_of_first_deposit_routing_number: T.nilable(String),
              deposited_at: Time,
              front_image_file_id: T.nilable(String),
              inbound_check_deposit_id: T.nilable(String),
              transaction_id: T.nilable(String),
              transfer_id: T.nilable(String),
              type:
                Increase::Transaction::Source::CheckTransferDeposit::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The identifier of the API File object containing an image of the back of the
            # deposited check.
            back_image_file_id:,
            # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
            # bank depositing this check. In some rare cases, this is not transmitted via
            # Check21 and the value will be null.
            bank_of_first_deposit_routing_number:,
            # When the check was deposited.
            deposited_at:,
            # The identifier of the API File object containing an image of the front of the
            # deposited check.
            front_image_file_id:,
            # The identifier of the Inbound Check Deposit object associated with this
            # transaction.
            inbound_check_deposit_id:,
            # The identifier of the Transaction object created when the check was deposited.
            transaction_id:,
            # The identifier of the Check Transfer object that was deposited.
            transfer_id:,
            # A constant representing the object's type. For this resource it will always be
            # `check_transfer_deposit`.
            type:
          )
          end

          sig do
            override.returns(
              {
                back_image_file_id: T.nilable(String),
                bank_of_first_deposit_routing_number: T.nilable(String),
                deposited_at: Time,
                front_image_file_id: T.nilable(String),
                inbound_check_deposit_id: T.nilable(String),
                transaction_id: T.nilable(String),
                transfer_id: T.nilable(String),
                type:
                  Increase::Transaction::Source::CheckTransferDeposit::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # A constant representing the object's type. For this resource it will always be
          # `check_transfer_deposit`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::CheckTransferDeposit::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CHECK_TRANSFER_DEPOSIT =
              T.let(
                :check_transfer_deposit,
                Increase::Transaction::Source::CheckTransferDeposit::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::CheckTransferDeposit::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class FednowTransferAcknowledgement < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::FednowTransferAcknowledgement,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the FedNow Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A FedNow Transfer Acknowledgement object. This field will be present in the JSON
          # response if and only if `category` is equal to
          # `fednow_transfer_acknowledgement`. A FedNow Transfer Acknowledgement is created
          # when a FedNow Transfer sent from Increase is acknowledged by the receiving bank.
          sig { params(transfer_id: String).returns(T.attached_class) }
          def self.new(
            # The identifier of the FedNow Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ transfer_id: String }) }
          def to_hash
          end
        end

        class FeePayment < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::FeePayment,
                Increase::Internal::AnyHash
              )
            end

          # The amount in the minor unit of the transaction's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          sig do
            returns(
              Increase::Transaction::Source::FeePayment::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The start of this payment's fee period, usually the first day of a month.
          sig { returns(Date) }
          attr_accessor :fee_period_start

          # The Program for which this fee was incurred.
          sig { returns(T.nilable(String)) }
          attr_accessor :program_id

          # A Fee Payment object. This field will be present in the JSON response if and
          # only if `category` is equal to `fee_payment`. A Fee Payment represents a payment
          # made to Increase.
          sig do
            params(
              amount: Integer,
              currency:
                Increase::Transaction::Source::FeePayment::Currency::OrSymbol,
              fee_period_start: Date,
              program_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The amount in the minor unit of the transaction's currency. For dollars, for
            # example, this is cents.
            amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
            # currency.
            currency:,
            # The start of this payment's fee period, usually the first day of a month.
            fee_period_start:,
            # The Program for which this fee was incurred.
            program_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                currency:
                  Increase::Transaction::Source::FeePayment::Currency::TaggedSymbol,
                fee_period_start: Date,
                program_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::FeePayment::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::FeePayment::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::FeePayment::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class InboundACHTransfer < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundACHTransfer,
                Increase::Internal::AnyHash
              )
            end

          # Additional information sent from the originator.
          sig do
            returns(
              T.nilable(
                Increase::Transaction::Source::InboundACHTransfer::Addenda
              )
            )
          end
          attr_reader :addenda

          sig do
            params(
              addenda:
                T.nilable(
                  Increase::Transaction::Source::InboundACHTransfer::Addenda::OrHash
                )
            ).void
          end
          attr_writer :addenda

          # The transfer amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The description of the date of the transfer, usually in the format `YYMMDD`.
          sig { returns(T.nilable(String)) }
          attr_accessor :originator_company_descriptive_date

          # Data set by the originator.
          sig { returns(T.nilable(String)) }
          attr_accessor :originator_company_discretionary_data

          # An informational description of the transfer.
          sig { returns(String) }
          attr_accessor :originator_company_entry_description

          # An identifier for the originating company. This is generally, but not always, a
          # stable identifier across multiple transfers.
          sig { returns(String) }
          attr_accessor :originator_company_id

          # A name set by the originator to identify themselves.
          sig { returns(String) }
          attr_accessor :originator_company_name

          # The originator's identifier for the transfer recipient.
          sig { returns(T.nilable(String)) }
          attr_accessor :receiver_id_number

          # The name of the transfer recipient. This value is informational and not verified
          # by Increase.
          sig { returns(T.nilable(String)) }
          attr_accessor :receiver_name

          # A 15 digit number recorded in the Nacha file and available to both the
          # originating and receiving bank. Along with the amount, date, and originating
          # routing number, this can be used to identify the ACH transfer at either bank.
          # ACH trace numbers are not unique, but are
          # [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
          sig { returns(String) }
          attr_accessor :trace_number

          # The Inbound ACH Transfer's identifier.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An Inbound ACH Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `inbound_ach_transfer`. An
          # Inbound ACH Transfer Intention is created when an ACH transfer is initiated at
          # another bank and received by Increase.
          sig do
            params(
              addenda:
                T.nilable(
                  Increase::Transaction::Source::InboundACHTransfer::Addenda::OrHash
                ),
              amount: Integer,
              originator_company_descriptive_date: T.nilable(String),
              originator_company_discretionary_data: T.nilable(String),
              originator_company_entry_description: String,
              originator_company_id: String,
              originator_company_name: String,
              receiver_id_number: T.nilable(String),
              receiver_name: T.nilable(String),
              trace_number: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Additional information sent from the originator.
            addenda:,
            # The transfer amount in USD cents.
            amount:,
            # The description of the date of the transfer, usually in the format `YYMMDD`.
            originator_company_descriptive_date:,
            # Data set by the originator.
            originator_company_discretionary_data:,
            # An informational description of the transfer.
            originator_company_entry_description:,
            # An identifier for the originating company. This is generally, but not always, a
            # stable identifier across multiple transfers.
            originator_company_id:,
            # A name set by the originator to identify themselves.
            originator_company_name:,
            # The originator's identifier for the transfer recipient.
            receiver_id_number:,
            # The name of the transfer recipient. This value is informational and not verified
            # by Increase.
            receiver_name:,
            # A 15 digit number recorded in the Nacha file and available to both the
            # originating and receiving bank. Along with the amount, date, and originating
            # routing number, this can be used to identify the ACH transfer at either bank.
            # ACH trace numbers are not unique, but are
            # [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
            trace_number:,
            # The Inbound ACH Transfer's identifier.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                addenda:
                  T.nilable(
                    Increase::Transaction::Source::InboundACHTransfer::Addenda
                  ),
                amount: Integer,
                originator_company_descriptive_date: T.nilable(String),
                originator_company_discretionary_data: T.nilable(String),
                originator_company_entry_description: String,
                originator_company_id: String,
                originator_company_name: String,
                receiver_id_number: T.nilable(String),
                receiver_name: T.nilable(String),
                trace_number: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end

          class Addenda < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Transaction::Source::InboundACHTransfer::Addenda,
                  Increase::Internal::AnyHash
                )
              end

            # The type of addendum.
            sig do
              returns(
                Increase::Transaction::Source::InboundACHTransfer::Addenda::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Unstructured `payment_related_information` passed through by the originator.
            sig do
              returns(
                T.nilable(
                  Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform
                )
              )
            end
            attr_reader :freeform

            sig do
              params(
                freeform:
                  T.nilable(
                    Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform::OrHash
                  )
              ).void
            end
            attr_writer :freeform

            # Additional information sent from the originator.
            sig do
              params(
                category:
                  Increase::Transaction::Source::InboundACHTransfer::Addenda::Category::OrSymbol,
                freeform:
                  T.nilable(
                    Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The type of addendum.
              category:,
              # Unstructured `payment_related_information` passed through by the originator.
              freeform:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::Transaction::Source::InboundACHTransfer::Addenda::Category::TaggedSymbol,
                  freeform:
                    T.nilable(
                      Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform
                    )
                }
              )
            end
            def to_hash
            end

            # The type of addendum.
            module Category
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Transaction::Source::InboundACHTransfer::Addenda::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Unstructured addendum.
              FREEFORM =
                T.let(
                  :freeform,
                  Increase::Transaction::Source::InboundACHTransfer::Addenda::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Transaction::Source::InboundACHTransfer::Addenda::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Freeform < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform,
                    Increase::Internal::AnyHash
                  )
                end

              # Each entry represents an addendum received from the originator.
              sig do
                returns(
                  T::Array[
                    Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform::Entry
                  ]
                )
              end
              attr_accessor :entries

              # Unstructured `payment_related_information` passed through by the originator.
              sig do
                params(
                  entries:
                    T::Array[
                      Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform::Entry::OrHash
                    ]
                ).returns(T.attached_class)
              end
              def self.new(
                # Each entry represents an addendum received from the originator.
                entries:
              )
              end

              sig do
                override.returns(
                  {
                    entries:
                      T::Array[
                        Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform::Entry
                      ]
                  }
                )
              end
              def to_hash
              end

              class Entry < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform::Entry,
                      Increase::Internal::AnyHash
                    )
                  end

                # The payment related information passed in the addendum.
                sig { returns(String) }
                attr_accessor :payment_related_information

                sig do
                  params(payment_related_information: String).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # The payment related information passed in the addendum.
                  payment_related_information:
                )
                end

                sig do
                  override.returns({ payment_related_information: String })
                end
                def to_hash
                end
              end
            end
          end
        end

        class InboundACHTransferReturnIntention < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundACHTransferReturnIntention,
                Increase::Internal::AnyHash
              )
            end

          # The ID of the Inbound ACH Transfer that is being returned.
          sig { returns(String) }
          attr_accessor :inbound_ach_transfer_id

          # An Inbound ACH Transfer Return Intention object. This field will be present in
          # the JSON response if and only if `category` is equal to
          # `inbound_ach_transfer_return_intention`. An Inbound ACH Transfer Return
          # Intention is created when an ACH transfer is initiated at another bank and
          # returned by Increase.
          sig do
            params(inbound_ach_transfer_id: String).returns(T.attached_class)
          end
          def self.new(
            # The ID of the Inbound ACH Transfer that is being returned.
            inbound_ach_transfer_id:
          )
          end

          sig { override.returns({ inbound_ach_transfer_id: String }) }
          def to_hash
          end
        end

        class InboundCheckAdjustment < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundCheckAdjustment,
                Increase::Internal::AnyHash
              )
            end

          # The ID of the transaction that was adjusted.
          sig { returns(String) }
          attr_accessor :adjusted_transaction_id

          # The amount of the check adjustment.
          sig { returns(Integer) }
          attr_accessor :amount

          # The reason for the adjustment.
          sig do
            returns(
              Increase::Transaction::Source::InboundCheckAdjustment::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # An Inbound Check Adjustment object. This field will be present in the JSON
          # response if and only if `category` is equal to `inbound_check_adjustment`. An
          # Inbound Check Adjustment is created when Increase receives an adjustment for a
          # check or return deposited through Check21.
          sig do
            params(
              adjusted_transaction_id: String,
              amount: Integer,
              reason:
                Increase::Transaction::Source::InboundCheckAdjustment::Reason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the transaction that was adjusted.
            adjusted_transaction_id:,
            # The amount of the check adjustment.
            amount:,
            # The reason for the adjustment.
            reason:
          )
          end

          sig do
            override.returns(
              {
                adjusted_transaction_id: String,
                amount: Integer,
                reason:
                  Increase::Transaction::Source::InboundCheckAdjustment::Reason::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The reason for the adjustment.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::InboundCheckAdjustment::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The return was initiated too late and the receiving institution has responded with a Late Return Claim.
            LATE_RETURN =
              T.let(
                :late_return,
                Increase::Transaction::Source::InboundCheckAdjustment::Reason::TaggedSymbol
              )

            # The check was deposited to the wrong payee and the depositing institution has reimbursed the funds with a Wrong Payee Credit.
            WRONG_PAYEE_CREDIT =
              T.let(
                :wrong_payee_credit,
                Increase::Transaction::Source::InboundCheckAdjustment::Reason::TaggedSymbol
              )

            # The check was deposited with a different amount than what was written on the check.
            ADJUSTED_AMOUNT =
              T.let(
                :adjusted_amount,
                Increase::Transaction::Source::InboundCheckAdjustment::Reason::TaggedSymbol
              )

            # The recipient was not able to process the check. This usually happens for e.g., low quality images.
            NON_CONFORMING_ITEM =
              T.let(
                :non_conforming_item,
                Increase::Transaction::Source::InboundCheckAdjustment::Reason::TaggedSymbol
              )

            # The check has already been deposited elsewhere and so this is a duplicate.
            PAID =
              T.let(
                :paid,
                Increase::Transaction::Source::InboundCheckAdjustment::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::InboundCheckAdjustment::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class InboundCheckDepositReturnIntention < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundCheckDepositReturnIntention,
                Increase::Internal::AnyHash
              )
            end

          # The ID of the Inbound Check Deposit that is being returned.
          sig { returns(String) }
          attr_accessor :inbound_check_deposit_id

          # The identifier of the Check Transfer object that was deposited.
          sig { returns(T.nilable(String)) }
          attr_accessor :transfer_id

          # An Inbound Check Deposit Return Intention object. This field will be present in
          # the JSON response if and only if `category` is equal to
          # `inbound_check_deposit_return_intention`. An Inbound Check Deposit Return
          # Intention is created when Increase receives an Inbound Check and the User
          # requests that it be returned.
          sig do
            params(
              inbound_check_deposit_id: String,
              transfer_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the Inbound Check Deposit that is being returned.
            inbound_check_deposit_id:,
            # The identifier of the Check Transfer object that was deposited.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                inbound_check_deposit_id: String,
                transfer_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class InboundFednowTransferConfirmation < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundFednowTransferConfirmation,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the FedNow Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An Inbound FedNow Transfer Confirmation object. This field will be present in
          # the JSON response if and only if `category` is equal to
          # `inbound_fednow_transfer_confirmation`. An Inbound FedNow Transfer Confirmation
          # is created when a FedNow transfer is initiated at another bank and received by
          # Increase.
          sig { params(transfer_id: String).returns(T.attached_class) }
          def self.new(
            # The identifier of the FedNow Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ transfer_id: String }) }
          def to_hash
          end
        end

        class InboundRealTimePaymentsTransferConfirmation < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation,
                Increase::Internal::AnyHash
              )
            end

          # The amount in the minor unit of the transfer's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The name the sender of the transfer specified as the recipient of the transfer.
          sig { returns(String) }
          attr_accessor :creditor_name

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
          # currency. This will always be "USD" for a Real-Time Payments transfer.
          sig do
            returns(
              Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The account number of the account that sent the transfer.
          sig { returns(String) }
          attr_accessor :debtor_account_number

          # The name provided by the sender of the transfer.
          sig { returns(String) }
          attr_accessor :debtor_name

          # The routing number of the account that sent the transfer.
          sig { returns(String) }
          attr_accessor :debtor_routing_number

          # Additional information included with the transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :remittance_information

          # The Real-Time Payments network identification of the transfer.
          sig { returns(String) }
          attr_accessor :transaction_identification

          # The identifier of the Real-Time Payments Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An Inbound Real-Time Payments Transfer Confirmation object. This field will be
          # present in the JSON response if and only if `category` is equal to
          # `inbound_real_time_payments_transfer_confirmation`. An Inbound Real-Time
          # Payments Transfer Confirmation is created when a Real-Time Payments transfer is
          # initiated at another bank and received by Increase.
          sig do
            params(
              amount: Integer,
              creditor_name: String,
              currency:
                Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency::OrSymbol,
              debtor_account_number: String,
              debtor_name: String,
              debtor_routing_number: String,
              remittance_information: T.nilable(String),
              transaction_identification: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The amount in the minor unit of the transfer's currency. For dollars, for
            # example, this is cents.
            amount:,
            # The name the sender of the transfer specified as the recipient of the transfer.
            creditor_name:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
            # currency. This will always be "USD" for a Real-Time Payments transfer.
            currency:,
            # The account number of the account that sent the transfer.
            debtor_account_number:,
            # The name provided by the sender of the transfer.
            debtor_name:,
            # The routing number of the account that sent the transfer.
            debtor_routing_number:,
            # Additional information included with the transfer.
            remittance_information:,
            # The Real-Time Payments network identification of the transfer.
            transaction_identification:,
            # The identifier of the Real-Time Payments Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                creditor_name: String,
                currency:
                  Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency::TaggedSymbol,
                debtor_account_number: String,
                debtor_name: String,
                debtor_routing_number: String,
                remittance_information: T.nilable(String),
                transaction_identification: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
          # currency. This will always be "USD" for a Real-Time Payments transfer.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class InboundWireReversal < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundWireReversal,
                Increase::Internal::AnyHash
              )
            end

          # The amount that was reversed in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the reversal was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # The debtor's routing number.
          sig { returns(T.nilable(String)) }
          attr_accessor :debtor_routing_number

          # The description on the reversal message from Fedwire, set by the reversing bank.
          sig { returns(String) }
          attr_accessor :description

          # The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00
          # PM Eastern Time on the evening before the `cycle date`.
          sig { returns(Date) }
          attr_accessor :input_cycle_date

          # The Fedwire transaction identifier.
          sig { returns(String) }
          attr_accessor :input_message_accountability_data

          # The Fedwire sequence number.
          sig { returns(String) }
          attr_accessor :input_sequence_number

          # The Fedwire input source identifier.
          sig { returns(String) }
          attr_accessor :input_source

          # The sending bank's identifier for the reversal.
          sig { returns(T.nilable(String)) }
          attr_accessor :instruction_identification

          # Additional information about the reason for the reversal.
          sig { returns(T.nilable(String)) }
          attr_accessor :return_reason_additional_information

          # A code provided by the sending bank giving a reason for the reversal. It will
          # generally be one of the codes defined in the ISO20022
          # `ExternalReturnReason1Code` code set, but this is not enforced by the network.
          sig { returns(T.nilable(String)) }
          attr_accessor :return_reason_code

          # An Increase-generated description of the `return_reason_code`.
          sig { returns(T.nilable(String)) }
          attr_accessor :return_reason_code_description

          # The ID for the Transaction associated with the transfer reversal.
          sig { returns(String) }
          attr_accessor :transaction_id

          # The ID for the Wire Transfer that is being reversed.
          sig { returns(String) }
          attr_accessor :wire_transfer_id

          # An Inbound Wire Reversal object. This field will be present in the JSON response
          # if and only if `category` is equal to `inbound_wire_reversal`. An Inbound Wire
          # Reversal represents a reversal of a wire transfer that was initiated via
          # Increase. The other bank is sending the money back. This most often happens when
          # the original destination account details were incorrect.
          sig do
            params(
              amount: Integer,
              created_at: Time,
              debtor_routing_number: T.nilable(String),
              description: String,
              input_cycle_date: Date,
              input_message_accountability_data: String,
              input_sequence_number: String,
              input_source: String,
              instruction_identification: T.nilable(String),
              return_reason_additional_information: T.nilable(String),
              return_reason_code: T.nilable(String),
              return_reason_code_description: T.nilable(String),
              transaction_id: String,
              wire_transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The amount that was reversed in USD cents.
            amount:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the reversal was created.
            created_at:,
            # The debtor's routing number.
            debtor_routing_number:,
            # The description on the reversal message from Fedwire, set by the reversing bank.
            description:,
            # The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00
            # PM Eastern Time on the evening before the `cycle date`.
            input_cycle_date:,
            # The Fedwire transaction identifier.
            input_message_accountability_data:,
            # The Fedwire sequence number.
            input_sequence_number:,
            # The Fedwire input source identifier.
            input_source:,
            # The sending bank's identifier for the reversal.
            instruction_identification:,
            # Additional information about the reason for the reversal.
            return_reason_additional_information:,
            # A code provided by the sending bank giving a reason for the reversal. It will
            # generally be one of the codes defined in the ISO20022
            # `ExternalReturnReason1Code` code set, but this is not enforced by the network.
            return_reason_code:,
            # An Increase-generated description of the `return_reason_code`.
            return_reason_code_description:,
            # The ID for the Transaction associated with the transfer reversal.
            transaction_id:,
            # The ID for the Wire Transfer that is being reversed.
            wire_transfer_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                created_at: Time,
                debtor_routing_number: T.nilable(String),
                description: String,
                input_cycle_date: Date,
                input_message_accountability_data: String,
                input_sequence_number: String,
                input_source: String,
                instruction_identification: T.nilable(String),
                return_reason_additional_information: T.nilable(String),
                return_reason_code: T.nilable(String),
                return_reason_code_description: T.nilable(String),
                transaction_id: String,
                wire_transfer_id: String
              }
            )
          end
          def to_hash
          end
        end

        class InboundWireTransfer < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundWireTransfer,
                Increase::Internal::AnyHash
              )
            end

          # The amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # A free-form address field set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :creditor_address_line1

          # A free-form address field set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :creditor_address_line2

          # A free-form address field set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :creditor_address_line3

          # A name set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :creditor_name

          # A free-form address field set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :debtor_address_line1

          # A free-form address field set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :debtor_address_line2

          # A free-form address field set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :debtor_address_line3

          # A name set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :debtor_name

          # An Increase-constructed description of the transfer.
          sig { returns(String) }
          attr_accessor :description

          # A free-form reference string set by the sender, to help identify the transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :end_to_end_identification

          # A unique identifier available to the originating and receiving banks, commonly
          # abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
          # service and is helpful when debugging wires with the originating bank.
          sig { returns(T.nilable(String)) }
          attr_accessor :input_message_accountability_data

          # The American Banking Association (ABA) routing number of the bank that sent the
          # wire.
          sig { returns(T.nilable(String)) }
          attr_accessor :instructing_agent_routing_number

          # The sending bank's identifier for the wire transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :instruction_identification

          # The ID of the Inbound Wire Transfer object that resulted in this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # The Unique End-to-end Transaction Reference
          # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
          # of the transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :unique_end_to_end_transaction_reference

          # A free-form message set by the sender.
          sig { returns(T.nilable(String)) }
          attr_accessor :unstructured_remittance_information

          # An Inbound Wire Transfer Intention object. This field will be present in the
          # JSON response if and only if `category` is equal to `inbound_wire_transfer`. An
          # Inbound Wire Transfer Intention is created when a wire transfer is initiated at
          # another bank and received by Increase.
          sig do
            params(
              amount: Integer,
              creditor_address_line1: T.nilable(String),
              creditor_address_line2: T.nilable(String),
              creditor_address_line3: T.nilable(String),
              creditor_name: T.nilable(String),
              debtor_address_line1: T.nilable(String),
              debtor_address_line2: T.nilable(String),
              debtor_address_line3: T.nilable(String),
              debtor_name: T.nilable(String),
              description: String,
              end_to_end_identification: T.nilable(String),
              input_message_accountability_data: T.nilable(String),
              instructing_agent_routing_number: T.nilable(String),
              instruction_identification: T.nilable(String),
              transfer_id: String,
              unique_end_to_end_transaction_reference: T.nilable(String),
              unstructured_remittance_information: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The amount in USD cents.
            amount:,
            # A free-form address field set by the sender.
            creditor_address_line1:,
            # A free-form address field set by the sender.
            creditor_address_line2:,
            # A free-form address field set by the sender.
            creditor_address_line3:,
            # A name set by the sender.
            creditor_name:,
            # A free-form address field set by the sender.
            debtor_address_line1:,
            # A free-form address field set by the sender.
            debtor_address_line2:,
            # A free-form address field set by the sender.
            debtor_address_line3:,
            # A name set by the sender.
            debtor_name:,
            # An Increase-constructed description of the transfer.
            description:,
            # A free-form reference string set by the sender, to help identify the transfer.
            end_to_end_identification:,
            # A unique identifier available to the originating and receiving banks, commonly
            # abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
            # service and is helpful when debugging wires with the originating bank.
            input_message_accountability_data:,
            # The American Banking Association (ABA) routing number of the bank that sent the
            # wire.
            instructing_agent_routing_number:,
            # The sending bank's identifier for the wire transfer.
            instruction_identification:,
            # The ID of the Inbound Wire Transfer object that resulted in this Transaction.
            transfer_id:,
            # The Unique End-to-end Transaction Reference
            # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
            # of the transfer.
            unique_end_to_end_transaction_reference:,
            # A free-form message set by the sender.
            unstructured_remittance_information:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                creditor_address_line1: T.nilable(String),
                creditor_address_line2: T.nilable(String),
                creditor_address_line3: T.nilable(String),
                creditor_name: T.nilable(String),
                debtor_address_line1: T.nilable(String),
                debtor_address_line2: T.nilable(String),
                debtor_address_line3: T.nilable(String),
                debtor_name: T.nilable(String),
                description: String,
                end_to_end_identification: T.nilable(String),
                input_message_accountability_data: T.nilable(String),
                instructing_agent_routing_number: T.nilable(String),
                instruction_identification: T.nilable(String),
                transfer_id: String,
                unique_end_to_end_transaction_reference: T.nilable(String),
                unstructured_remittance_information: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class InboundWireTransferReversal < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InboundWireTransferReversal,
                Increase::Internal::AnyHash
              )
            end

          # The ID of the Inbound Wire Transfer that is being reversed.
          sig { returns(String) }
          attr_accessor :inbound_wire_transfer_id

          # An Inbound Wire Transfer Reversal Intention object. This field will be present
          # in the JSON response if and only if `category` is equal to
          # `inbound_wire_transfer_reversal`. An Inbound Wire Transfer Reversal Intention is
          # created when Increase has received a wire and the User requests that it be
          # reversed.
          sig do
            params(inbound_wire_transfer_id: String).returns(T.attached_class)
          end
          def self.new(
            # The ID of the Inbound Wire Transfer that is being reversed.
            inbound_wire_transfer_id:
          )
          end

          sig { override.returns({ inbound_wire_transfer_id: String }) }
          def to_hash
          end
        end

        class InterestPayment < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InterestPayment,
                Increase::Internal::AnyHash
              )
            end

          # The account on which the interest was accrued.
          sig { returns(String) }
          attr_accessor :accrued_on_account_id

          # The amount in the minor unit of the transaction's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          sig do
            returns(
              Increase::Transaction::Source::InterestPayment::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The end of the period for which this transaction paid interest.
          sig { returns(Time) }
          attr_accessor :period_end

          # The start of the period for which this transaction paid interest.
          sig { returns(Time) }
          attr_accessor :period_start

          # An Interest Payment object. This field will be present in the JSON response if
          # and only if `category` is equal to `interest_payment`. An Interest Payment
          # represents a payment of interest on an account. Interest is usually paid
          # monthly.
          sig do
            params(
              accrued_on_account_id: String,
              amount: Integer,
              currency:
                Increase::Transaction::Source::InterestPayment::Currency::OrSymbol,
              period_end: Time,
              period_start: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # The account on which the interest was accrued.
            accrued_on_account_id:,
            # The amount in the minor unit of the transaction's currency. For dollars, for
            # example, this is cents.
            amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
            # currency.
            currency:,
            # The end of the period for which this transaction paid interest.
            period_end:,
            # The start of the period for which this transaction paid interest.
            period_start:
          )
          end

          sig do
            override.returns(
              {
                accrued_on_account_id: String,
                amount: Integer,
                currency:
                  Increase::Transaction::Source::InterestPayment::Currency::TaggedSymbol,
                period_end: Time,
                period_start: Time
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::InterestPayment::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::InterestPayment::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::InterestPayment::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class InternalSource < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::InternalSource,
                Increase::Internal::AnyHash
              )
            end

          # The amount in the minor unit of the transaction's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          sig do
            returns(
              Increase::Transaction::Source::InternalSource::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # An Internal Source is a transaction between you and Increase. This describes the
          # reason for the transaction.
          sig do
            returns(
              Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # An Internal Source object. This field will be present in the JSON response if
          # and only if `category` is equal to `internal_source`. A transaction between the
          # user and Increase. See the `reason` attribute for more information.
          sig do
            params(
              amount: Integer,
              currency:
                Increase::Transaction::Source::InternalSource::Currency::OrSymbol,
              reason:
                Increase::Transaction::Source::InternalSource::Reason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The amount in the minor unit of the transaction's currency. For dollars, for
            # example, this is cents.
            amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
            # currency.
            currency:,
            # An Internal Source is a transaction between you and Increase. This describes the
            # reason for the transaction.
            reason:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                currency:
                  Increase::Transaction::Source::InternalSource::Currency::TaggedSymbol,
                reason:
                  Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::InternalSource::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Transaction::Source::InternalSource::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::InternalSource::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # An Internal Source is a transaction between you and Increase. This describes the
          # reason for the transaction.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Transaction::Source::InternalSource::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account closure
            ACCOUNT_CLOSURE =
              T.let(
                :account_closure,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Account revenue payment distribution
            ACCOUNT_REVENUE_PAYMENT_DISTRIBUTION =
              T.let(
                :account_revenue_payment_distribution,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Bank-drawn check
            BANK_DRAWN_CHECK =
              T.let(
                :bank_drawn_check,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Bank-drawn check credit
            BANK_DRAWN_CHECK_CREDIT =
              T.let(
                :bank_drawn_check_credit,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Bank migration
            BANK_MIGRATION =
              T.let(
                :bank_migration,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Check adjustment
            CHECK_ADJUSTMENT =
              T.let(
                :check_adjustment,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Collection payment
            COLLECTION_PAYMENT =
              T.let(
                :collection_payment,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Collection receivable
            COLLECTION_RECEIVABLE =
              T.let(
                :collection_receivable,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Dishonored ACH return
            DISHONORED_ACH_RETURN =
              T.let(
                :dishonored_ach_return,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Empyreal adjustment
            EMPYREAL_ADJUSTMENT =
              T.let(
                :empyreal_adjustment,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Error
            ERROR =
              T.let(
                :error,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Error correction
            ERROR_CORRECTION =
              T.let(
                :error_correction,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Fees
            FEES =
              T.let(
                :fees,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Interest
            INTEREST =
              T.let(
                :interest,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Negative balance forgiveness
            NEGATIVE_BALANCE_FORGIVENESS =
              T.let(
                :negative_balance_forgiveness,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Sample funds
            SAMPLE_FUNDS =
              T.let(
                :sample_funds,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            # Sample funds return
            SAMPLE_FUNDS_RETURN =
              T.let(
                :sample_funds_return,
                Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Transaction::Source::InternalSource::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Other < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::Other,
                Increase::Internal::AnyHash
              )
            end

          # If the category of this Transaction source is equal to `other`, this field will
          # contain an empty object, otherwise it will contain null.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class RealTimePaymentsTransferAcknowledgement < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::RealTimePaymentsTransferAcknowledgement,
                Increase::Internal::AnyHash
              )
            end

          # The transfer amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The destination account number.
          sig { returns(String) }
          attr_accessor :destination_account_number

          # The American Bankers' Association (ABA) Routing Transit Number (RTN).
          sig { returns(String) }
          attr_accessor :destination_routing_number

          # Unstructured information that will show on the recipient's bank statement.
          sig { returns(String) }
          attr_accessor :remittance_information

          # The identifier of the Real-Time Payments Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Real-Time Payments Transfer Acknowledgement object. This field will be present
          # in the JSON response if and only if `category` is equal to
          # `real_time_payments_transfer_acknowledgement`. A Real-Time Payments Transfer
          # Acknowledgement is created when a Real-Time Payments Transfer sent from Increase
          # is acknowledged by the receiving bank.
          sig do
            params(
              amount: Integer,
              destination_account_number: String,
              destination_routing_number: String,
              remittance_information: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The transfer amount in USD cents.
            amount:,
            # The destination account number.
            destination_account_number:,
            # The American Bankers' Association (ABA) Routing Transit Number (RTN).
            destination_routing_number:,
            # Unstructured information that will show on the recipient's bank statement.
            remittance_information:,
            # The identifier of the Real-Time Payments Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                destination_account_number: String,
                destination_routing_number: String,
                remittance_information: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end
        end

        class SampleFunds < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::SampleFunds,
                Increase::Internal::AnyHash
              )
            end

          # Where the sample funds came from.
          sig { returns(String) }
          attr_accessor :originator

          # A Sample Funds object. This field will be present in the JSON response if and
          # only if `category` is equal to `sample_funds`. Sample funds for testing
          # purposes.
          sig { params(originator: String).returns(T.attached_class) }
          def self.new(
            # Where the sample funds came from.
            originator:
          )
          end

          sig { override.returns({ originator: String }) }
          def to_hash
          end
        end

        class SwiftTransferIntention < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::SwiftTransferIntention,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the Swift Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Swift Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `swift_transfer_intention`. A
          # Swift Transfer initiated via Increase.
          sig { params(transfer_id: String).returns(T.attached_class) }
          def self.new(
            # The identifier of the Swift Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ transfer_id: String }) }
          def to_hash
          end
        end

        class SwiftTransferReturn < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::SwiftTransferReturn,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the Swift Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Swift Transfer Return object. This field will be present in the JSON response
          # if and only if `category` is equal to `swift_transfer_return`. A Swift Transfer
          # Return is created when a Swift Transfer is returned by the receiving bank.
          sig { params(transfer_id: String).returns(T.attached_class) }
          def self.new(
            # The identifier of the Swift Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ transfer_id: String }) }
          def to_hash
          end
        end

        class WireTransferIntention < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Transaction::Source::WireTransferIntention,
                Increase::Internal::AnyHash
              )
            end

          # The destination account number.
          sig { returns(String) }
          attr_accessor :account_number

          # The transfer amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The message that will show on the recipient's bank statement.
          sig { returns(String) }
          attr_accessor :message_to_recipient

          # The American Bankers' Association (ABA) Routing Transit Number (RTN).
          sig { returns(String) }
          attr_accessor :routing_number

          # The identifier of the Wire Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Wire Transfer Intention object. This field will be present in the JSON
          # response if and only if `category` is equal to `wire_transfer_intention`. A Wire
          # Transfer initiated via Increase and sent to a different bank.
          sig do
            params(
              account_number: String,
              amount: Integer,
              message_to_recipient: String,
              routing_number: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The destination account number.
            account_number:,
            # The transfer amount in USD cents.
            amount:,
            # The message that will show on the recipient's bank statement.
            message_to_recipient:,
            # The American Bankers' Association (ABA) Routing Transit Number (RTN).
            routing_number:,
            # The identifier of the Wire Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                account_number: String,
                amount: Integer,
                message_to_recipient: String,
                routing_number: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `transaction`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Transaction::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRANSACTION =
          T.let(:transaction, Increase::Transaction::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Transaction::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
