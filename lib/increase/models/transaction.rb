# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Transactions#retrieve
    class Transaction < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Transaction identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the Account the Transaction belongs to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The Transaction amount in the minor unit of its currency. For dollars, for
      #   example, this is cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the
      #   Transaction occurred.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
      #   Transaction's currency. This will match the currency on the Transaction's
      #   Account.
      #
      #   @return [Symbol, Increase::Models::Transaction::Currency]
      required :currency, enum: -> { Increase::Transaction::Currency }

      # @!attribute description
      #   An informational message describing this transaction. Use the fields in `source`
      #   to get more detailed information. This field appears as the line-item on the
      #   statement.
      #
      #   @return [String]
      required :description, String

      # @!attribute route_id
      #   The identifier for the route this Transaction came through. Routes are things
      #   like cards and ACH details.
      #
      #   @return [String, nil]
      required :route_id, String, nil?: true

      # @!attribute route_type
      #   The type of the route this Transaction came through.
      #
      #   @return [Symbol, Increase::Models::Transaction::RouteType, nil]
      required :route_type, enum: -> { Increase::Transaction::RouteType }, nil?: true

      # @!attribute source
      #   This is an object giving more details on the network-level event that caused the
      #   Transaction. Note that for backwards compatibility reasons, additional
      #   undocumented keys may appear in this object. These should be treated as
      #   deprecated and will be removed in the future.
      #
      #   @return [Increase::Models::Transaction::Source]
      required :source, -> { Increase::Transaction::Source }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `transaction`.
      #
      #   @return [Symbol, Increase::Models::Transaction::Type]
      required :type, enum: -> { Increase::Transaction::Type }

      # @!method initialize(id:, account_id:, amount:, created_at:, currency:, description:, route_id:, route_type:, source:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::Transaction} for more details.
      #
      #   Transactions are the immutable additions and removals of money from your bank
      #   account. They're the equivalent of line items on your bank statement.
      #
      #   @param id [String] The Transaction identifier.
      #
      #   @param account_id [String] The identifier for the Account the Transaction belongs to.
      #
      #   @param amount [Integer] The Transaction amount in the minor unit of its currency. For dollars, for examp
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Transac
      #
      #   @param currency [Symbol, Increase::Models::Transaction::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Transaction'
      #
      #   @param description [String] An informational message describing this transaction. Use the fields in `source`
      #
      #   @param route_id [String, nil] The identifier for the route this Transaction came through. Routes are things li
      #
      #   @param route_type [Symbol, Increase::Models::Transaction::RouteType, nil] The type of the route this Transaction came through.
      #
      #   @param source [Increase::Models::Transaction::Source] This is an object giving more details on the network-level event that caused the
      #
      #   @param type [Symbol, Increase::Models::Transaction::Type] A constant representing the object's type. For this resource it will always be `

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
      # Transaction's currency. This will match the currency on the Transaction's
      # Account.
      #
      # @see Increase::Models::Transaction#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # Canadian Dollar (CAD)
        CAD = :CAD

        # Swiss Franc (CHF)
        CHF = :CHF

        # Euro (EUR)
        EUR = :EUR

        # British Pound (GBP)
        GBP = :GBP

        # Japanese Yen (JPY)
        JPY = :JPY

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of the route this Transaction came through.
      #
      # @see Increase::Models::Transaction#route_type
      module RouteType
        extend Increase::Internal::Type::Enum

        # An Account Number.
        ACCOUNT_NUMBER = :account_number

        # A Card.
        CARD = :card

        # A Lockbox.
        LOCKBOX = :lockbox

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::Transaction#source
      class Source < Increase::Internal::Type::BaseModel
        # @!attribute account_transfer_intention
        #   An Account Transfer Intention object. This field will be present in the JSON
        #   response if and only if `category` is equal to `account_transfer_intention`. Two
        #   Account Transfer Intentions are created from each Account Transfer. One
        #   decrements the source account, and the other increments the destination account.
        #
        #   @return [Increase::Models::Transaction::Source::AccountTransferIntention, nil]
        required :account_transfer_intention,
                 -> { Increase::Transaction::Source::AccountTransferIntention },
                 nil?: true

        # @!attribute ach_transfer_intention
        #   An ACH Transfer Intention object. This field will be present in the JSON
        #   response if and only if `category` is equal to `ach_transfer_intention`. An ACH
        #   Transfer Intention is created from an ACH Transfer. It reflects the intention to
        #   move money into or out of an Increase account via the ACH network.
        #
        #   @return [Increase::Models::Transaction::Source::ACHTransferIntention, nil]
        required :ach_transfer_intention,
                 -> {
                   Increase::Transaction::Source::ACHTransferIntention
                 },
                 nil?: true

        # @!attribute ach_transfer_rejection
        #   An ACH Transfer Rejection object. This field will be present in the JSON
        #   response if and only if `category` is equal to `ach_transfer_rejection`. An ACH
        #   Transfer Rejection is created when an ACH Transfer is rejected by Increase. It
        #   offsets the ACH Transfer Intention. These rejections are rare.
        #
        #   @return [Increase::Models::Transaction::Source::ACHTransferRejection, nil]
        required :ach_transfer_rejection,
                 -> {
                   Increase::Transaction::Source::ACHTransferRejection
                 },
                 nil?: true

        # @!attribute ach_transfer_return
        #   An ACH Transfer Return object. This field will be present in the JSON response
        #   if and only if `category` is equal to `ach_transfer_return`. An ACH Transfer
        #   Return is created when an ACH Transfer is returned by the receiving bank. It
        #   offsets the ACH Transfer Intention. ACH Transfer Returns usually occur within
        #   the first two business days after the transfer is initiated, but can occur much
        #   later.
        #
        #   @return [Increase::Models::Transaction::Source::ACHTransferReturn, nil]
        required :ach_transfer_return, -> { Increase::Transaction::Source::ACHTransferReturn }, nil?: true

        # @!attribute card_dispute_acceptance
        #   A Card Dispute Acceptance object. This field will be present in the JSON
        #   response if and only if `category` is equal to `card_dispute_acceptance`.
        #   Contains the details of a successful Card Dispute.
        #
        #   @return [Increase::Models::Transaction::Source::CardDisputeAcceptance, nil]
        required :card_dispute_acceptance,
                 -> {
                   Increase::Transaction::Source::CardDisputeAcceptance
                 },
                 nil?: true

        # @!attribute card_dispute_loss
        #   A Card Dispute Loss object. This field will be present in the JSON response if
        #   and only if `category` is equal to `card_dispute_loss`. Contains the details of
        #   a lost Card Dispute.
        #
        #   @return [Increase::Models::Transaction::Source::CardDisputeLoss, nil]
        required :card_dispute_loss, -> { Increase::Transaction::Source::CardDisputeLoss }, nil?: true

        # @!attribute card_refund
        #   A Card Refund object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_refund`. Card Refunds move money back to
        #   the cardholder. While they are usually connected to a Card Settlement an
        #   acquirer can also refund money directly to a card without relation to a
        #   transaction.
        #
        #   @return [Increase::Models::Transaction::Source::CardRefund, nil]
        required :card_refund, -> { Increase::Transaction::Source::CardRefund }, nil?: true

        # @!attribute card_revenue_payment
        #   A Card Revenue Payment object. This field will be present in the JSON response
        #   if and only if `category` is equal to `card_revenue_payment`. Card Revenue
        #   Payments reflect earnings from fees on card transactions.
        #
        #   @return [Increase::Models::Transaction::Source::CardRevenuePayment, nil]
        required :card_revenue_payment, -> { Increase::Transaction::Source::CardRevenuePayment }, nil?: true

        # @!attribute card_settlement
        #   A Card Settlement object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_settlement`. Card Settlements are card
        #   transactions that have cleared and settled. While a settlement is usually
        #   preceded by an authorization, an acquirer can also directly clear a transaction
        #   without first authorizing it.
        #
        #   @return [Increase::Models::Transaction::Source::CardSettlement, nil]
        required :card_settlement, -> { Increase::Transaction::Source::CardSettlement }, nil?: true

        # @!attribute cashback_payment
        #   A Cashback Payment object. This field will be present in the JSON response if
        #   and only if `category` is equal to `cashback_payment`. A Cashback Payment
        #   represents the cashback paid to a cardholder for a given period. Cashback is
        #   usually paid monthly for the prior month's transactions.
        #
        #   @return [Increase::Models::Transaction::Source::CashbackPayment, nil]
        required :cashback_payment, -> { Increase::Transaction::Source::CashbackPayment }, nil?: true

        # @!attribute category
        #   The type of the resource. We may add additional possible values for this enum
        #   over time; your application should be able to handle such additions gracefully.
        #
        #   @return [Symbol, Increase::Models::Transaction::Source::Category]
        required :category, enum: -> { Increase::Transaction::Source::Category }

        # @!attribute check_deposit_acceptance
        #   A Check Deposit Acceptance object. This field will be present in the JSON
        #   response if and only if `category` is equal to `check_deposit_acceptance`. A
        #   Check Deposit Acceptance is created when a Check Deposit is processed and its
        #   details confirmed. Check Deposits may be returned by the receiving bank, which
        #   will appear as a Check Deposit Return.
        #
        #   @return [Increase::Models::Transaction::Source::CheckDepositAcceptance, nil]
        required :check_deposit_acceptance,
                 -> { Increase::Transaction::Source::CheckDepositAcceptance },
                 nil?: true

        # @!attribute check_deposit_return
        #   A Check Deposit Return object. This field will be present in the JSON response
        #   if and only if `category` is equal to `check_deposit_return`. A Check Deposit
        #   Return is created when a Check Deposit is returned by the bank holding the
        #   account it was drawn against. Check Deposits may be returned for a variety of
        #   reasons, including insufficient funds or a mismatched account number. Usually,
        #   checks are returned within the first 7 days after the deposit is made.
        #
        #   @return [Increase::Models::Transaction::Source::CheckDepositReturn, nil]
        required :check_deposit_return, -> { Increase::Transaction::Source::CheckDepositReturn }, nil?: true

        # @!attribute check_transfer_deposit
        #   A Check Transfer Deposit object. This field will be present in the JSON response
        #   if and only if `category` is equal to `check_transfer_deposit`. An Inbound Check
        #   is a check drawn on an Increase account that has been deposited by an external
        #   bank account. These types of checks are not pre-registered.
        #
        #   @return [Increase::Models::Transaction::Source::CheckTransferDeposit, nil]
        required :check_transfer_deposit,
                 -> {
                   Increase::Transaction::Source::CheckTransferDeposit
                 },
                 nil?: true

        # @!attribute fee_payment
        #   A Fee Payment object. This field will be present in the JSON response if and
        #   only if `category` is equal to `fee_payment`. A Fee Payment represents a payment
        #   made to Increase.
        #
        #   @return [Increase::Models::Transaction::Source::FeePayment, nil]
        required :fee_payment, -> { Increase::Transaction::Source::FeePayment }, nil?: true

        # @!attribute inbound_ach_transfer
        #   An Inbound ACH Transfer Intention object. This field will be present in the JSON
        #   response if and only if `category` is equal to `inbound_ach_transfer`. An
        #   Inbound ACH Transfer Intention is created when an ACH transfer is initiated at
        #   another bank and received by Increase.
        #
        #   @return [Increase::Models::Transaction::Source::InboundACHTransfer, nil]
        required :inbound_ach_transfer, -> { Increase::Transaction::Source::InboundACHTransfer }, nil?: true

        # @!attribute inbound_ach_transfer_return_intention
        #   An Inbound ACH Transfer Return Intention object. This field will be present in
        #   the JSON response if and only if `category` is equal to
        #   `inbound_ach_transfer_return_intention`. An Inbound ACH Transfer Return
        #   Intention is created when an ACH transfer is initiated at another bank and
        #   returned by Increase.
        #
        #   @return [Increase::Models::Transaction::Source::InboundACHTransferReturnIntention, nil]
        required :inbound_ach_transfer_return_intention,
                 -> { Increase::Transaction::Source::InboundACHTransferReturnIntention },
                 nil?: true

        # @!attribute inbound_check_adjustment
        #   An Inbound Check Adjustment object. This field will be present in the JSON
        #   response if and only if `category` is equal to `inbound_check_adjustment`. An
        #   Inbound Check Adjustment is created when Increase receives an adjustment for a
        #   check or return deposited through Check21.
        #
        #   @return [Increase::Models::Transaction::Source::InboundCheckAdjustment, nil]
        required :inbound_check_adjustment,
                 -> { Increase::Transaction::Source::InboundCheckAdjustment },
                 nil?: true

        # @!attribute inbound_check_deposit_return_intention
        #   An Inbound Check Deposit Return Intention object. This field will be present in
        #   the JSON response if and only if `category` is equal to
        #   `inbound_check_deposit_return_intention`. An Inbound Check Deposit Return
        #   Intention is created when Increase receives an Inbound Check and the User
        #   requests that it be returned.
        #
        #   @return [Increase::Models::Transaction::Source::InboundCheckDepositReturnIntention, nil]
        required :inbound_check_deposit_return_intention,
                 -> { Increase::Transaction::Source::InboundCheckDepositReturnIntention },
                 nil?: true

        # @!attribute inbound_real_time_payments_transfer_confirmation
        #   An Inbound Real-Time Payments Transfer Confirmation object. This field will be
        #   present in the JSON response if and only if `category` is equal to
        #   `inbound_real_time_payments_transfer_confirmation`. An Inbound Real-Time
        #   Payments Transfer Confirmation is created when a Real-Time Payments transfer is
        #   initiated at another bank and received by Increase.
        #
        #   @return [Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferConfirmation, nil]
        required :inbound_real_time_payments_transfer_confirmation,
                 -> { Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation },
                 nil?: true

        # @!attribute inbound_real_time_payments_transfer_decline
        #   An Inbound Real-Time Payments Transfer Decline object. This field will be
        #   present in the JSON response if and only if `category` is equal to
        #   `inbound_real_time_payments_transfer_decline`.
        #
        #   @return [Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline, nil]
        required :inbound_real_time_payments_transfer_decline,
                 -> { Increase::Transaction::Source::InboundRealTimePaymentsTransferDecline },
                 nil?: true

        # @!attribute inbound_wire_reversal
        #   An Inbound Wire Reversal object. This field will be present in the JSON response
        #   if and only if `category` is equal to `inbound_wire_reversal`. An Inbound Wire
        #   Reversal represents a reversal of a wire transfer that was initiated via
        #   Increase. The other bank is sending the money back. This most often happens when
        #   the original destination account details were incorrect.
        #
        #   @return [Increase::Models::Transaction::Source::InboundWireReversal, nil]
        required :inbound_wire_reversal, -> { Increase::Transaction::Source::InboundWireReversal }, nil?: true

        # @!attribute inbound_wire_transfer
        #   An Inbound Wire Transfer Intention object. This field will be present in the
        #   JSON response if and only if `category` is equal to `inbound_wire_transfer`. An
        #   Inbound Wire Transfer Intention is created when a wire transfer is initiated at
        #   another bank and received by Increase.
        #
        #   @return [Increase::Models::Transaction::Source::InboundWireTransfer, nil]
        required :inbound_wire_transfer, -> { Increase::Transaction::Source::InboundWireTransfer }, nil?: true

        # @!attribute inbound_wire_transfer_reversal
        #   An Inbound Wire Transfer Reversal Intention object. This field will be present
        #   in the JSON response if and only if `category` is equal to
        #   `inbound_wire_transfer_reversal`. An Inbound Wire Transfer Reversal Intention is
        #   created when Increase has received a wire and the User requests that it be
        #   reversed.
        #
        #   @return [Increase::Models::Transaction::Source::InboundWireTransferReversal, nil]
        required :inbound_wire_transfer_reversal,
                 -> { Increase::Transaction::Source::InboundWireTransferReversal },
                 nil?: true

        # @!attribute interest_payment
        #   An Interest Payment object. This field will be present in the JSON response if
        #   and only if `category` is equal to `interest_payment`. An Interest Payment
        #   represents a payment of interest on an account. Interest is usually paid
        #   monthly.
        #
        #   @return [Increase::Models::Transaction::Source::InterestPayment, nil]
        required :interest_payment, -> { Increase::Transaction::Source::InterestPayment }, nil?: true

        # @!attribute internal_source
        #   An Internal Source object. This field will be present in the JSON response if
        #   and only if `category` is equal to `internal_source`. A transaction between the
        #   user and Increase. See the `reason` attribute for more information.
        #
        #   @return [Increase::Models::Transaction::Source::InternalSource, nil]
        required :internal_source, -> { Increase::Transaction::Source::InternalSource }, nil?: true

        # @!attribute other
        #   If the category of this Transaction source is equal to `other`, this field will
        #   contain an empty object, otherwise it will contain null.
        #
        #   @return [Object, nil]
        required :other, Increase::Internal::Type::Unknown, nil?: true

        # @!attribute outbound_card_push_transfer_acceptance
        #   An Outbound Card Push Transfer Acceptance object. This field will be present in
        #   the JSON response if and only if `category` is equal to
        #   `outbound_card_push_transfer_acceptance`. An Outbound Card Push Transfer
        #   Acceptance is created when an Outbound Card Push Transfer sent from Increase is
        #   accepted by the receiving bank.
        #
        #   @return [Increase::Models::Transaction::Source::OutboundCardPushTransferAcceptance, nil]
        required :outbound_card_push_transfer_acceptance,
                 -> { Increase::Transaction::Source::OutboundCardPushTransferAcceptance },
                 nil?: true

        # @!attribute real_time_payments_transfer_acknowledgement
        #   A Real-Time Payments Transfer Acknowledgement object. This field will be present
        #   in the JSON response if and only if `category` is equal to
        #   `real_time_payments_transfer_acknowledgement`. A Real-Time Payments Transfer
        #   Acknowledgement is created when a Real-Time Payments Transfer sent from Increase
        #   is acknowledged by the receiving bank.
        #
        #   @return [Increase::Models::Transaction::Source::RealTimePaymentsTransferAcknowledgement, nil]
        required :real_time_payments_transfer_acknowledgement,
                 -> { Increase::Transaction::Source::RealTimePaymentsTransferAcknowledgement },
                 nil?: true

        # @!attribute sample_funds
        #   A Sample Funds object. This field will be present in the JSON response if and
        #   only if `category` is equal to `sample_funds`. Sample funds for testing
        #   purposes.
        #
        #   @return [Increase::Models::Transaction::Source::SampleFunds, nil]
        required :sample_funds, -> { Increase::Transaction::Source::SampleFunds }, nil?: true

        # @!attribute swift_transfer_intention
        #   A Swift Transfer Intention object. This field will be present in the JSON
        #   response if and only if `category` is equal to `swift_transfer_intention`. A
        #   Swift Transfer initiated via Increase.
        #
        #   @return [Increase::Models::Transaction::Source::SwiftTransferIntention, nil]
        required :swift_transfer_intention,
                 -> { Increase::Transaction::Source::SwiftTransferIntention },
                 nil?: true

        # @!attribute wire_transfer_intention
        #   A Wire Transfer Intention object. This field will be present in the JSON
        #   response if and only if `category` is equal to `wire_transfer_intention`. A Wire
        #   Transfer initiated via Increase and sent to a different bank.
        #
        #   @return [Increase::Models::Transaction::Source::WireTransferIntention, nil]
        required :wire_transfer_intention,
                 -> {
                   Increase::Transaction::Source::WireTransferIntention
                 },
                 nil?: true

        # @!method initialize(account_transfer_intention:, ach_transfer_intention:, ach_transfer_rejection:, ach_transfer_return:, card_dispute_acceptance:, card_dispute_loss:, card_refund:, card_revenue_payment:, card_settlement:, cashback_payment:, category:, check_deposit_acceptance:, check_deposit_return:, check_transfer_deposit:, fee_payment:, inbound_ach_transfer:, inbound_ach_transfer_return_intention:, inbound_check_adjustment:, inbound_check_deposit_return_intention:, inbound_real_time_payments_transfer_confirmation:, inbound_real_time_payments_transfer_decline:, inbound_wire_reversal:, inbound_wire_transfer:, inbound_wire_transfer_reversal:, interest_payment:, internal_source:, other:, outbound_card_push_transfer_acceptance:, real_time_payments_transfer_acknowledgement:, sample_funds:, swift_transfer_intention:, wire_transfer_intention:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Transaction::Source} for more details.
        #
        #   This is an object giving more details on the network-level event that caused the
        #   Transaction. Note that for backwards compatibility reasons, additional
        #   undocumented keys may appear in this object. These should be treated as
        #   deprecated and will be removed in the future.
        #
        #   @param account_transfer_intention [Increase::Models::Transaction::Source::AccountTransferIntention, nil] An Account Transfer Intention object. This field will be present in the JSON res
        #
        #   @param ach_transfer_intention [Increase::Models::Transaction::Source::ACHTransferIntention, nil] An ACH Transfer Intention object. This field will be present in the JSON respons
        #
        #   @param ach_transfer_rejection [Increase::Models::Transaction::Source::ACHTransferRejection, nil] An ACH Transfer Rejection object. This field will be present in the JSON respons
        #
        #   @param ach_transfer_return [Increase::Models::Transaction::Source::ACHTransferReturn, nil] An ACH Transfer Return object. This field will be present in the JSON response i
        #
        #   @param card_dispute_acceptance [Increase::Models::Transaction::Source::CardDisputeAcceptance, nil] A Card Dispute Acceptance object. This field will be present in the JSON respons
        #
        #   @param card_dispute_loss [Increase::Models::Transaction::Source::CardDisputeLoss, nil] A Card Dispute Loss object. This field will be present in the JSON response if a
        #
        #   @param card_refund [Increase::Models::Transaction::Source::CardRefund, nil] A Card Refund object. This field will be present in the JSON response if and onl
        #
        #   @param card_revenue_payment [Increase::Models::Transaction::Source::CardRevenuePayment, nil] A Card Revenue Payment object. This field will be present in the JSON response i
        #
        #   @param card_settlement [Increase::Models::Transaction::Source::CardSettlement, nil] A Card Settlement object. This field will be present in the JSON response if and
        #
        #   @param cashback_payment [Increase::Models::Transaction::Source::CashbackPayment, nil] A Cashback Payment object. This field will be present in the JSON response if an
        #
        #   @param category [Symbol, Increase::Models::Transaction::Source::Category] The type of the resource. We may add additional possible values for this enum ov
        #
        #   @param check_deposit_acceptance [Increase::Models::Transaction::Source::CheckDepositAcceptance, nil] A Check Deposit Acceptance object. This field will be present in the JSON respon
        #
        #   @param check_deposit_return [Increase::Models::Transaction::Source::CheckDepositReturn, nil] A Check Deposit Return object. This field will be present in the JSON response i
        #
        #   @param check_transfer_deposit [Increase::Models::Transaction::Source::CheckTransferDeposit, nil] A Check Transfer Deposit object. This field will be present in the JSON response
        #
        #   @param fee_payment [Increase::Models::Transaction::Source::FeePayment, nil] A Fee Payment object. This field will be present in the JSON response if and onl
        #
        #   @param inbound_ach_transfer [Increase::Models::Transaction::Source::InboundACHTransfer, nil] An Inbound ACH Transfer Intention object. This field will be present in the JSON
        #
        #   @param inbound_ach_transfer_return_intention [Increase::Models::Transaction::Source::InboundACHTransferReturnIntention, nil] An Inbound ACH Transfer Return Intention object. This field will be present in t
        #
        #   @param inbound_check_adjustment [Increase::Models::Transaction::Source::InboundCheckAdjustment, nil] An Inbound Check Adjustment object. This field will be present in the JSON respo
        #
        #   @param inbound_check_deposit_return_intention [Increase::Models::Transaction::Source::InboundCheckDepositReturnIntention, nil] An Inbound Check Deposit Return Intention object. This field will be present in
        #
        #   @param inbound_real_time_payments_transfer_confirmation [Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferConfirmation, nil] An Inbound Real-Time Payments Transfer Confirmation object. This field will be p
        #
        #   @param inbound_real_time_payments_transfer_decline [Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline, nil] An Inbound Real-Time Payments Transfer Decline object. This field will be presen
        #
        #   @param inbound_wire_reversal [Increase::Models::Transaction::Source::InboundWireReversal, nil] An Inbound Wire Reversal object. This field will be present in the JSON response
        #
        #   @param inbound_wire_transfer [Increase::Models::Transaction::Source::InboundWireTransfer, nil] An Inbound Wire Transfer Intention object. This field will be present in the JSO
        #
        #   @param inbound_wire_transfer_reversal [Increase::Models::Transaction::Source::InboundWireTransferReversal, nil] An Inbound Wire Transfer Reversal Intention object. This field will be present i
        #
        #   @param interest_payment [Increase::Models::Transaction::Source::InterestPayment, nil] An Interest Payment object. This field will be present in the JSON response if a
        #
        #   @param internal_source [Increase::Models::Transaction::Source::InternalSource, nil] An Internal Source object. This field will be present in the JSON response if an
        #
        #   @param other [Object, nil] If the category of this Transaction source is equal to `other`, this field will
        #
        #   @param outbound_card_push_transfer_acceptance [Increase::Models::Transaction::Source::OutboundCardPushTransferAcceptance, nil] An Outbound Card Push Transfer Acceptance object. This field will be present in
        #
        #   @param real_time_payments_transfer_acknowledgement [Increase::Models::Transaction::Source::RealTimePaymentsTransferAcknowledgement, nil] A Real-Time Payments Transfer Acknowledgement object. This field will be present
        #
        #   @param sample_funds [Increase::Models::Transaction::Source::SampleFunds, nil] A Sample Funds object. This field will be present in the JSON response if and on
        #
        #   @param swift_transfer_intention [Increase::Models::Transaction::Source::SwiftTransferIntention, nil] A Swift Transfer Intention object. This field will be present in the JSON respon
        #
        #   @param wire_transfer_intention [Increase::Models::Transaction::Source::WireTransferIntention, nil] A Wire Transfer Intention object. This field will be present in the JSON respons

        # @see Increase::Models::Transaction::Source#account_transfer_intention
        class AccountTransferIntention < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The pending amount in the minor unit of the transaction's currency. For dollars,
          #   for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #   account currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::AccountTransferIntention::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::AccountTransferIntention::Currency }

          # @!attribute description
          #   The description you chose to give the transfer.
          #
          #   @return [String]
          required :description, String

          # @!attribute destination_account_id
          #   The identifier of the Account to where the Account Transfer was sent.
          #
          #   @return [String]
          required :destination_account_id, String

          # @!attribute source_account_id
          #   The identifier of the Account from where the Account Transfer was sent.
          #
          #   @return [String]
          required :source_account_id, String

          # @!attribute transfer_id
          #   The identifier of the Account Transfer that led to this Pending Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, currency:, description:, destination_account_id:, source_account_id:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::AccountTransferIntention} for more
          #   details.
          #
          #   An Account Transfer Intention object. This field will be present in the JSON
          #   response if and only if `category` is equal to `account_transfer_intention`. Two
          #   Account Transfer Intentions are created from each Account Transfer. One
          #   decrements the source account, and the other increments the destination account.
          #
          #   @param amount [Integer] The pending amount in the minor unit of the transaction's currency. For dollars,
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::AccountTransferIntention::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #
          #   @param description [String] The description you chose to give the transfer.
          #
          #   @param destination_account_id [String] The identifier of the Account to where the Account Transfer was sent.
          #
          #   @param source_account_id [String] The identifier of the Account from where the Account Transfer was sent.
          #
          #   @param transfer_id [String] The identifier of the Account Transfer that led to this Pending Transaction.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          #
          # @see Increase::Models::Transaction::Source::AccountTransferIntention#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#ach_transfer_intention
        class ACHTransferIntention < Increase::Internal::Type::BaseModel
          # @!attribute account_number
          #   The account number for the destination account.
          #
          #   @return [String]
          required :account_number, String

          # @!attribute amount
          #   The amount in the minor unit of the transaction's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute routing_number
          #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
          #   destination account.
          #
          #   @return [String]
          required :routing_number, String

          # @!attribute statement_descriptor
          #   A description set when the ACH Transfer was created.
          #
          #   @return [String]
          required :statement_descriptor, String

          # @!attribute transfer_id
          #   The identifier of the ACH Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(account_number:, amount:, routing_number:, statement_descriptor:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::ACHTransferIntention} for more details.
          #
          #   An ACH Transfer Intention object. This field will be present in the JSON
          #   response if and only if `category` is equal to `ach_transfer_intention`. An ACH
          #   Transfer Intention is created from an ACH Transfer. It reflects the intention to
          #   move money into or out of an Increase account via the ACH network.
          #
          #   @param account_number [String] The account number for the destination account.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's currency. For dollars, for exa
          #
          #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the des
          #
          #   @param statement_descriptor [String] A description set when the ACH Transfer was created.
          #
          #   @param transfer_id [String] The identifier of the ACH Transfer that led to this Transaction.
        end

        # @see Increase::Models::Transaction::Source#ach_transfer_rejection
        class ACHTransferRejection < Increase::Internal::Type::BaseModel
          # @!attribute transfer_id
          #   The identifier of the ACH Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(transfer_id:)
          #   An ACH Transfer Rejection object. This field will be present in the JSON
          #   response if and only if `category` is equal to `ach_transfer_rejection`. An ACH
          #   Transfer Rejection is created when an ACH Transfer is rejected by Increase. It
          #   offsets the ACH Transfer Intention. These rejections are rare.
          #
          #   @param transfer_id [String] The identifier of the ACH Transfer that led to this Transaction.
        end

        # @see Increase::Models::Transaction::Source#ach_transfer_return
        class ACHTransferReturn < Increase::Internal::Type::BaseModel
          # @!attribute created_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the transfer was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute raw_return_reason_code
          #   The three character ACH return code, in the range R01 to R85.
          #
          #   @return [String]
          required :raw_return_reason_code, String

          # @!attribute return_reason_code
          #   Why the ACH Transfer was returned. This reason code is sent by the receiving
          #   bank back to Increase.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::ACHTransferReturn::ReturnReasonCode]
          required :return_reason_code,
                   enum: -> { Increase::Transaction::Source::ACHTransferReturn::ReturnReasonCode }

          # @!attribute trace_number
          #   A 15 digit number that was generated by the bank that initiated the return. The
          #   trace number of the return is different than that of the original transfer. ACH
          #   trace numbers are not unique, but along with the amount and date this number can
          #   be used to identify the ACH return at the bank that initiated it.
          #
          #   @return [String]
          required :trace_number, String

          # @!attribute transaction_id
          #   The identifier of the Transaction associated with this return.
          #
          #   @return [String]
          required :transaction_id, String

          # @!attribute transfer_id
          #   The identifier of the ACH Transfer associated with this return.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(created_at:, raw_return_reason_code:, return_reason_code:, trace_number:, transaction_id:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::ACHTransferReturn} for more details.
          #
          #   An ACH Transfer Return object. This field will be present in the JSON response
          #   if and only if `category` is equal to `ach_transfer_return`. An ACH Transfer
          #   Return is created when an ACH Transfer is returned by the receiving bank. It
          #   offsets the ACH Transfer Intention. ACH Transfer Returns usually occur within
          #   the first two business days after the transfer is initiated, but can occur much
          #   later.
          #
          #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param raw_return_reason_code [String] The three character ACH return code, in the range R01 to R85.
          #
          #   @param return_reason_code [Symbol, Increase::Models::Transaction::Source::ACHTransferReturn::ReturnReasonCode] Why the ACH Transfer was returned. This reason code is sent by the receiving ban
          #
          #   @param trace_number [String] A 15 digit number that was generated by the bank that initiated the return. The
          #
          #   @param transaction_id [String] The identifier of the Transaction associated with this return.
          #
          #   @param transfer_id [String] The identifier of the ACH Transfer associated with this return.

          # Why the ACH Transfer was returned. This reason code is sent by the receiving
          # bank back to Increase.
          #
          # @see Increase::Models::Transaction::Source::ACHTransferReturn#return_reason_code
          module ReturnReasonCode
            extend Increase::Internal::Type::Enum

            # Code R01. Insufficient funds in the receiving account. Sometimes abbreviated to NSF.
            INSUFFICIENT_FUND = :insufficient_fund

            # Code R03. The account does not exist or the receiving bank was unable to locate it.
            NO_ACCOUNT = :no_account

            # Code R02. The account is closed at the receiving bank.
            ACCOUNT_CLOSED = :account_closed

            # Code R04. The account number is invalid at the receiving bank.
            INVALID_ACCOUNT_NUMBER_STRUCTURE = :invalid_account_number_structure

            # Code R16. The account at the receiving bank was frozen per the Office of Foreign Assets Control.
            ACCOUNT_FROZEN_ENTRY_RETURNED_PER_OFAC_INSTRUCTION = :account_frozen_entry_returned_per_ofac_instruction

            # Code R23. The receiving bank account refused a credit transfer.
            CREDIT_ENTRY_REFUSED_BY_RECEIVER = :credit_entry_refused_by_receiver

            # Code R05. The receiving bank rejected because of an incorrect Standard Entry Class code.
            UNAUTHORIZED_DEBIT_TO_CONSUMER_ACCOUNT_USING_CORPORATE_SEC_CODE =
              :unauthorized_debit_to_consumer_account_using_corporate_sec_code

            # Code R29. The corporate customer at the receiving bank reversed the transfer.
            CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED = :corporate_customer_advised_not_authorized

            # Code R08. The receiving bank stopped payment on this transfer.
            PAYMENT_STOPPED = :payment_stopped

            # Code R20. The receiving bank account does not perform transfers.
            NON_TRANSACTION_ACCOUNT = :non_transaction_account

            # Code R09. The receiving bank account does not have enough available balance for the transfer.
            UNCOLLECTED_FUNDS = :uncollected_funds

            # Code R28. The routing number is incorrect.
            ROUTING_NUMBER_CHECK_DIGIT_ERROR = :routing_number_check_digit_error

            # Code R10. The customer at the receiving bank reversed the transfer.
            CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
              :customer_advised_unauthorized_improper_ineligible_or_incomplete

            # Code R19. The amount field is incorrect or too large.
            AMOUNT_FIELD_ERROR = :amount_field_error

            # Code R07. The customer at the receiving institution informed their bank that they have revoked authorization for a previously authorized transfer.
            AUTHORIZATION_REVOKED_BY_CUSTOMER = :authorization_revoked_by_customer

            # Code R13. The routing number is invalid.
            INVALID_ACH_ROUTING_NUMBER = :invalid_ach_routing_number

            # Code R17. The receiving bank is unable to process a field in the transfer.
            FILE_RECORD_EDIT_CRITERIA = :file_record_edit_criteria

            # Code R45. The individual name field was invalid.
            ENR_INVALID_INDIVIDUAL_NAME = :enr_invalid_individual_name

            # Code R06. The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request.
            RETURNED_PER_ODFI_REQUEST = :returned_per_odfi_request

            # Code R34. The receiving bank's regulatory supervisor has limited their participation in the ACH network.
            LIMITED_PARTICIPATION_DFI = :limited_participation_dfi

            # Code R85. The outbound international ACH transfer was incorrect.
            INCORRECTLY_CODED_OUTBOUND_INTERNATIONAL_PAYMENT = :incorrectly_coded_outbound_international_payment

            # Code R12. A rare return reason. The account was sold to another bank.
            ACCOUNT_SOLD_TO_ANOTHER_DFI = :account_sold_to_another_dfi

            # Code R25. The addenda record is incorrect or missing.
            ADDENDA_ERROR = :addenda_error

            # Code R15. A rare return reason. The account holder is deceased.
            BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED = :beneficiary_or_account_holder_deceased

            # Code R11. A rare return reason. The customer authorized some payment to the sender, but this payment was not in error.
            CUSTOMER_ADVISED_NOT_WITHIN_AUTHORIZATION_TERMS = :customer_advised_not_within_authorization_terms

            # Code R74. A rare return reason. Sent in response to a return that was returned with code `field_error`. The latest return should include the corrected field(s).
            CORRECTED_RETURN = :corrected_return

            # Code R24. A rare return reason. The receiving bank received an exact duplicate entry with the same trace number and amount.
            DUPLICATE_ENTRY = :duplicate_entry

            # Code R67. A rare return reason. The return this message refers to was a duplicate.
            DUPLICATE_RETURN = :duplicate_return

            # Code R47. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_DUPLICATE_ENROLLMENT = :enr_duplicate_enrollment

            # Code R43. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_INVALID_DFI_ACCOUNT_NUMBER = :enr_invalid_dfi_account_number

            # Code R44. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_INVALID_INDIVIDUAL_ID_NUMBER = :enr_invalid_individual_id_number

            # Code R46. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_INVALID_REPRESENTATIVE_PAYEE_INDICATOR = :enr_invalid_representative_payee_indicator

            # Code R41. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_INVALID_TRANSACTION_CODE = :enr_invalid_transaction_code

            # Code R40. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_RETURN_OF_ENR_ENTRY = :enr_return_of_enr_entry

            # Code R42. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
            ENR_ROUTING_NUMBER_CHECK_DIGIT_ERROR = :enr_routing_number_check_digit_error

            # Code R84. A rare return reason. The International ACH Transfer cannot be processed by the gateway.
            ENTRY_NOT_PROCESSED_BY_GATEWAY = :entry_not_processed_by_gateway

            # Code R69. A rare return reason. One or more of the fields in the ACH were malformed.
            FIELD_ERROR = :field_error

            # Code R83. A rare return reason. The Foreign receiving bank was unable to settle this ACH transfer.
            FOREIGN_RECEIVING_DFI_UNABLE_TO_SETTLE = :foreign_receiving_dfi_unable_to_settle

            # Code R80. A rare return reason. The International ACH Transfer is malformed.
            IAT_ENTRY_CODING_ERROR = :iat_entry_coding_error

            # Code R18. A rare return reason. The ACH has an improper effective entry date field.
            IMPROPER_EFFECTIVE_ENTRY_DATE = :improper_effective_entry_date

            # Code R39. A rare return reason. The source document related to this ACH, usually an ACH check conversion, was presented to the bank.
            IMPROPER_SOURCE_DOCUMENT_SOURCE_DOCUMENT_PRESENTED = :improper_source_document_source_document_presented

            # Code R21. A rare return reason. The Company ID field of the ACH was invalid.
            INVALID_COMPANY_ID = :invalid_company_id

            # Code R82. A rare return reason. The foreign receiving bank identifier for an International ACH Transfer was invalid.
            INVALID_FOREIGN_RECEIVING_DFI_IDENTIFICATION = :invalid_foreign_receiving_dfi_identification

            # Code R22. A rare return reason. The Individual ID number field of the ACH was invalid.
            INVALID_INDIVIDUAL_ID_NUMBER = :invalid_individual_id_number

            # Code R53. A rare return reason. Both the Represented Check ("RCK") entry and the original check were presented to the bank.
            ITEM_AND_RCK_ENTRY_PRESENTED_FOR_PAYMENT = :item_and_rck_entry_presented_for_payment

            # Code R51. A rare return reason. The Represented Check ("RCK") entry is ineligible.
            ITEM_RELATED_TO_RCK_ENTRY_IS_INELIGIBLE = :item_related_to_rck_entry_is_ineligible

            # Code R26. A rare return reason. The ACH is missing a required field.
            MANDATORY_FIELD_ERROR = :mandatory_field_error

            # Code R71. A rare return reason. The receiving bank does not recognize the routing number in a dishonored return entry.
            MISROUTED_DISHONORED_RETURN = :misrouted_dishonored_return

            # Code R61. A rare return reason. The receiving bank does not recognize the routing number in a return entry.
            MISROUTED_RETURN = :misrouted_return

            # Code R76. A rare return reason. Sent in response to a return, the bank does not find the errors alleged by the returning bank.
            NO_ERRORS_FOUND = :no_errors_found

            # Code R77. A rare return reason. The receiving bank does not accept the return of the erroneous debit. The funds are not available at the receiving bank.
            NON_ACCEPTANCE_OF_R62_DISHONORED_RETURN = :non_acceptance_of_r62_dishonored_return

            # Code R81. A rare return reason. The receiving bank does not accept International ACH Transfers.
            NON_PARTICIPANT_IN_IAT_PROGRAM = :non_participant_in_iat_program

            # Code R31. A rare return reason. A return that has been agreed to be accepted by the receiving bank, despite falling outside of the usual return timeframe.
            PERMISSIBLE_RETURN_ENTRY = :permissible_return_entry

            # Code R70. A rare return reason. The receiving bank had not approved this return.
            PERMISSIBLE_RETURN_ENTRY_NOT_ACCEPTED = :permissible_return_entry_not_accepted

            # Code R32. A rare return reason. The receiving bank could not settle this transaction.
            RDFI_NON_SETTLEMENT = :rdfi_non_settlement

            # Code R30. A rare return reason. The receiving bank does not accept Check Truncation ACH transfers.
            RDFI_PARTICIPANT_IN_CHECK_TRUNCATION_PROGRAM = :rdfi_participant_in_check_truncation_program

            # Code R14. A rare return reason. The payee is deceased.
            REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
              :representative_payee_deceased_or_unable_to_continue_in_that_capacity

            # Code R75. A rare return reason. The originating bank disputes that an earlier `duplicate_entry` return was actually a duplicate.
            RETURN_NOT_A_DUPLICATE = :return_not_a_duplicate

            # Code R62. A rare return reason. The originating financial institution made a mistake and this return corrects it.
            RETURN_OF_ERRONEOUS_OR_REVERSING_DEBIT = :return_of_erroneous_or_reversing_debit

            # Code R36. A rare return reason. Return of a malformed credit entry.
            RETURN_OF_IMPROPER_CREDIT_ENTRY = :return_of_improper_credit_entry

            # Code R35. A rare return reason. Return of a malformed debit entry.
            RETURN_OF_IMPROPER_DEBIT_ENTRY = :return_of_improper_debit_entry

            # Code R33. A rare return reason. Return of a Destroyed Check ("XKC") entry.
            RETURN_OF_XCK_ENTRY = :return_of_xck_entry

            # Code R37. A rare return reason. The source document related to this ACH, usually an ACH check conversion, was presented to the bank.
            SOURCE_DOCUMENT_PRESENTED_FOR_PAYMENT = :source_document_presented_for_payment

            # Code R50. A rare return reason. State law prevents the bank from accepting the Represented Check ("RCK") entry.
            STATE_LAW_AFFECTING_RCK_ACCEPTANCE = :state_law_affecting_rck_acceptance

            # Code R52. A rare return reason. A stop payment was issued on a Represented Check ("RCK") entry.
            STOP_PAYMENT_ON_ITEM_RELATED_TO_RCK_ENTRY = :stop_payment_on_item_related_to_rck_entry

            # Code R38. A rare return reason. The source attached to the ACH, usually an ACH check conversion, includes a stop payment.
            STOP_PAYMENT_ON_SOURCE_DOCUMENT = :stop_payment_on_source_document

            # Code R73. A rare return reason. The bank receiving an `untimely_return` believes it was on time.
            TIMELY_ORIGINAL_RETURN = :timely_original_return

            # Code R27. A rare return reason. An ACH return's trace number does not match an originated ACH.
            TRACE_NUMBER_ERROR = :trace_number_error

            # Code R72. A rare return reason. The dishonored return was sent too late.
            UNTIMELY_DISHONORED_RETURN = :untimely_dishonored_return

            # Code R68. A rare return reason. The return was sent too late.
            UNTIMELY_RETURN = :untimely_return

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#card_dispute_acceptance
        class CardDisputeAcceptance < Increase::Internal::Type::BaseModel
          # @!attribute accepted_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the Card Dispute was accepted.
          #
          #   @return [Time]
          required :accepted_at, Time

          # @!attribute card_dispute_id
          #   The identifier of the Card Dispute that was accepted.
          #
          #   @return [String]
          required :card_dispute_id, String

          # @!attribute transaction_id
          #   The identifier of the Transaction that was created to return the disputed funds
          #   to your account.
          #
          #   @return [String]
          required :transaction_id, String

          # @!method initialize(accepted_at:, card_dispute_id:, transaction_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CardDisputeAcceptance} for more details.
          #
          #   A Card Dispute Acceptance object. This field will be present in the JSON
          #   response if and only if `category` is equal to `card_dispute_acceptance`.
          #   Contains the details of a successful Card Dispute.
          #
          #   @param accepted_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param card_dispute_id [String] The identifier of the Card Dispute that was accepted.
          #
          #   @param transaction_id [String] The identifier of the Transaction that was created to return the disputed funds
        end

        # @see Increase::Models::Transaction::Source#card_dispute_loss
        class CardDisputeLoss < Increase::Internal::Type::BaseModel
          # @!attribute card_dispute_id
          #   The identifier of the Card Dispute that was lost.
          #
          #   @return [String]
          required :card_dispute_id, String

          # @!attribute explanation
          #   Why the Card Dispute was lost.
          #
          #   @return [String]
          required :explanation, String

          # @!attribute lost_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the Card Dispute was lost.
          #
          #   @return [Time]
          required :lost_at, Time

          # @!attribute transaction_id
          #   The identifier of the Transaction that was created to debit the disputed funds
          #   from your account.
          #
          #   @return [String]
          required :transaction_id, String

          # @!method initialize(card_dispute_id:, explanation:, lost_at:, transaction_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CardDisputeLoss} for more details.
          #
          #   A Card Dispute Loss object. This field will be present in the JSON response if
          #   and only if `category` is equal to `card_dispute_loss`. Contains the details of
          #   a lost Card Dispute.
          #
          #   @param card_dispute_id [String] The identifier of the Card Dispute that was lost.
          #
          #   @param explanation [String] Why the Card Dispute was lost.
          #
          #   @param lost_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param transaction_id [String] The identifier of the Transaction that was created to debit the disputed funds f
        end

        # @see Increase::Models::Transaction::Source#card_refund
        class CardRefund < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Refund identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute amount
          #   The amount in the minor unit of the transaction's settlement currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute cashback
          #   Cashback debited for this transaction, if eligible. Cashback is paid out in
          #   aggregate, monthly.
          #
          #   @return [Increase::Models::Transaction::Source::CardRefund::Cashback, nil]
          required :cashback, -> { Increase::Transaction::Source::CardRefund::Cashback }, nil?: true

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's settlement currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::CardRefund::Currency }

          # @!attribute interchange
          #   Interchange assessed as a part of this transaciton.
          #
          #   @return [Increase::Models::Transaction::Source::CardRefund::Interchange, nil]
          required :interchange, -> { Increase::Transaction::Source::CardRefund::Interchange }, nil?: true

          # @!attribute merchant_acceptor_id
          #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
          #   is transacting with.
          #
          #   @return [String]
          required :merchant_acceptor_id, String

          # @!attribute merchant_category_code
          #   The 4-digit MCC describing the merchant's business.
          #
          #   @return [String]
          required :merchant_category_code, String

          # @!attribute merchant_city
          #   The city the merchant resides in.
          #
          #   @return [String]
          required :merchant_city, String

          # @!attribute merchant_country
          #   The country the merchant resides in.
          #
          #   @return [String]
          required :merchant_country, String

          # @!attribute merchant_name
          #   The name of the merchant.
          #
          #   @return [String]
          required :merchant_name, String

          # @!attribute merchant_postal_code
          #   The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          #
          #   @return [String, nil]
          required :merchant_postal_code, String, nil?: true

          # @!attribute merchant_state
          #   The state the merchant resides in.
          #
          #   @return [String, nil]
          required :merchant_state, String, nil?: true

          # @!attribute network_identifiers
          #   Network-specific identifiers for this refund.
          #
          #   @return [Increase::Models::Transaction::Source::CardRefund::NetworkIdentifiers]
          required :network_identifiers, -> { Increase::Transaction::Source::CardRefund::NetworkIdentifiers }

          # @!attribute presentment_amount
          #   The amount in the minor unit of the transaction's presentment currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute purchase_details
          #   Additional details about the card purchase, such as tax and industry-specific
          #   fields.
          #
          #   @return [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails, nil]
          required :purchase_details,
                   -> {
                     Increase::Transaction::Source::CardRefund::PurchaseDetails
                   },
                   nil?: true

          # @!attribute transaction_id
          #   The identifier of the Transaction associated with this Transaction.
          #
          #   @return [String]
          required :transaction_id, String

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_refund`.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::Type]
          required :type, enum: -> { Increase::Transaction::Source::CardRefund::Type }

          # @!method initialize(id:, amount:, card_payment_id:, cashback:, currency:, interchange:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_name:, merchant_postal_code:, merchant_state:, network_identifiers:, presentment_amount:, presentment_currency:, purchase_details:, transaction_id:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CardRefund} for more details.
          #
          #   A Card Refund object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_refund`. Card Refunds move money back to
          #   the cardholder. While they are usually connected to a Card Settlement an
          #   acquirer can also refund money directly to a card without relation to a
          #   transaction.
          #
          #   @param id [String] The Card Refund identifier.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's settlement currency. For dolla
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param cashback [Increase::Models::Transaction::Source::CardRefund::Cashback, nil] Cashback debited for this transaction, if eligible. Cashback is paid out in aggr
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::CardRefund::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param interchange [Increase::Models::Transaction::Source::CardRefund::Interchange, nil] Interchange assessed as a part of this transaciton.
          #
          #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
          #
          #   @param merchant_category_code [String] The 4-digit MCC describing the merchant's business.
          #
          #   @param merchant_city [String] The city the merchant resides in.
          #
          #   @param merchant_country [String] The country the merchant resides in.
          #
          #   @param merchant_name [String] The name of the merchant.
          #
          #   @param merchant_postal_code [String, nil] The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          #
          #   @param merchant_state [String, nil] The state the merchant resides in.
          #
          #   @param network_identifiers [Increase::Models::Transaction::Source::CardRefund::NetworkIdentifiers] Network-specific identifiers for this refund.
          #
          #   @param presentment_amount [Integer] The amount in the minor unit of the transaction's presentment currency.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param purchase_details [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails, nil] Additional details about the card purchase, such as tax and industry-specific fi
          #
          #   @param transaction_id [String] The identifier of the Transaction associated with this Transaction.
          #
          #   @param type [Symbol, Increase::Models::Transaction::Source::CardRefund::Type] A constant representing the object's type. For this resource it will always be `

          # @see Increase::Models::Transaction::Source::CardRefund#cashback
          class Cashback < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The cashback amount given as a string containing a decimal number. The amount is
            #   a positive number if it will be credited to you (e.g., settlements) and a
            #   negative number if it will be debited (e.g., refunds).
            #
            #   @return [String]
            required :amount, String

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            #
            #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::Cashback::Currency]
            required :currency, enum: -> { Increase::Transaction::Source::CardRefund::Cashback::Currency }

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::Transaction::Source::CardRefund::Cashback} for more details.
            #
            #   Cashback debited for this transaction, if eligible. Cashback is paid out in
            #   aggregate, monthly.
            #
            #   @param amount [String] The cashback amount given as a string containing a decimal number. The amount is
            #
            #   @param currency [Symbol, Increase::Models::Transaction::Source::CardRefund::Cashback::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            #
            # @see Increase::Models::Transaction::Source::CardRefund::Cashback#currency
            module Currency
              extend Increase::Internal::Type::Enum

              # Canadian Dollar (CAD)
              CAD = :CAD

              # Swiss Franc (CHF)
              CHF = :CHF

              # Euro (EUR)
              EUR = :EUR

              # British Pound (GBP)
              GBP = :GBP

              # Japanese Yen (JPY)
              JPY = :JPY

              # US Dollar (USD)
              USD = :USD

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          #
          # @see Increase::Models::Transaction::Source::CardRefund#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::Transaction::Source::CardRefund#interchange
          class Interchange < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The interchange amount given as a string containing a decimal number in major
            #   units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
            #   credited to Increase (e.g., settlements) and a negative number if it is debited
            #   (e.g., refunds).
            #
            #   @return [String]
            required :amount, String

            # @!attribute code
            #   The card network specific interchange code.
            #
            #   @return [String, nil]
            required :code, String, nil?: true

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            #   reimbursement.
            #
            #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::Interchange::Currency]
            required :currency, enum: -> { Increase::Transaction::Source::CardRefund::Interchange::Currency }

            # @!method initialize(amount:, code:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::Transaction::Source::CardRefund::Interchange} for more
            #   details.
            #
            #   Interchange assessed as a part of this transaciton.
            #
            #   @param amount [String] The interchange amount given as a string containing a decimal number in major un
            #
            #   @param code [String, nil] The card network specific interchange code.
            #
            #   @param currency [Symbol, Increase::Models::Transaction::Source::CardRefund::Interchange::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            #
            # @see Increase::Models::Transaction::Source::CardRefund::Interchange#currency
            module Currency
              extend Increase::Internal::Type::Enum

              # Canadian Dollar (CAD)
              CAD = :CAD

              # Swiss Franc (CHF)
              CHF = :CHF

              # Euro (EUR)
              EUR = :EUR

              # British Pound (GBP)
              GBP = :GBP

              # Japanese Yen (JPY)
              JPY = :JPY

              # US Dollar (USD)
              USD = :USD

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::Transaction::Source::CardRefund#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            # @!attribute acquirer_business_id
            #   A network assigned business ID that identifies the acquirer that processed this
            #   transaction.
            #
            #   @return [String]
            required :acquirer_business_id, String

            # @!attribute acquirer_reference_number
            #   A globally unique identifier for this settlement.
            #
            #   @return [String]
            required :acquirer_reference_number, String

            # @!attribute transaction_id
            #   A globally unique transaction identifier provided by the card network, used
            #   across multiple life-cycle requests.
            #
            #   @return [String, nil]
            required :transaction_id, String, nil?: true

            # @!method initialize(acquirer_business_id:, acquirer_reference_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::Transaction::Source::CardRefund::NetworkIdentifiers} for more
            #   details.
            #
            #   Network-specific identifiers for this refund.
            #
            #   @param acquirer_business_id [String] A network assigned business ID that identifies the acquirer that processed this
            #
            #   @param acquirer_reference_number [String] A globally unique identifier for this settlement.
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # @see Increase::Models::Transaction::Source::CardRefund#purchase_details
          class PurchaseDetails < Increase::Internal::Type::BaseModel
            # @!attribute car_rental
            #   Fields specific to car rentals.
            #
            #   @return [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental, nil]
            required :car_rental,
                     -> { Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental },
                     nil?: true

            # @!attribute customer_reference_identifier
            #   An identifier from the merchant for the customer or consumer.
            #
            #   @return [String, nil]
            required :customer_reference_identifier, String, nil?: true

            # @!attribute local_tax_amount
            #   The state or provincial tax amount in minor units.
            #
            #   @return [Integer, nil]
            required :local_tax_amount, Integer, nil?: true

            # @!attribute local_tax_currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            #   assessed.
            #
            #   @return [String, nil]
            required :local_tax_currency, String, nil?: true

            # @!attribute lodging
            #   Fields specific to lodging.
            #
            #   @return [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging, nil]
            required :lodging,
                     -> {
                       Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging
                     },
                     nil?: true

            # @!attribute national_tax_amount
            #   The national tax amount in minor units.
            #
            #   @return [Integer, nil]
            required :national_tax_amount, Integer, nil?: true

            # @!attribute national_tax_currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            #   assessed.
            #
            #   @return [String, nil]
            required :national_tax_currency, String, nil?: true

            # @!attribute purchase_identifier
            #   An identifier from the merchant for the purchase to the issuer and cardholder.
            #
            #   @return [String, nil]
            required :purchase_identifier, String, nil?: true

            # @!attribute purchase_identifier_format
            #   The format of the purchase identifier.
            #
            #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat, nil]
            required :purchase_identifier_format,
                     enum: -> {
                       Increase::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat
                     },
                     nil?: true

            # @!attribute travel
            #   Fields specific to travel.
            #
            #   @return [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel, nil]
            required :travel,
                     -> {
                       Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel
                     },
                     nil?: true

            # @!method initialize(car_rental:, customer_reference_identifier:, local_tax_amount:, local_tax_currency:, lodging:, national_tax_amount:, national_tax_currency:, purchase_identifier:, purchase_identifier_format:, travel:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::Transaction::Source::CardRefund::PurchaseDetails} for more
            #   details.
            #
            #   Additional details about the card purchase, such as tax and industry-specific
            #   fields.
            #
            #   @param car_rental [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental, nil] Fields specific to car rentals.
            #
            #   @param customer_reference_identifier [String, nil] An identifier from the merchant for the customer or consumer.
            #
            #   @param local_tax_amount [Integer, nil] The state or provincial tax amount in minor units.
            #
            #   @param local_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax as
            #
            #   @param lodging [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging, nil] Fields specific to lodging.
            #
            #   @param national_tax_amount [Integer, nil] The national tax amount in minor units.
            #
            #   @param national_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax as
            #
            #   @param purchase_identifier [String, nil] An identifier from the merchant for the purchase to the issuer and cardholder.
            #
            #   @param purchase_identifier_format [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::PurchaseIdentifierFormat, nil] The format of the purchase identifier.
            #
            #   @param travel [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel, nil] Fields specific to travel.

            # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails#car_rental
            class CarRental < Increase::Internal::Type::BaseModel
              # @!attribute car_class_code
              #   Code indicating the vehicle's class.
              #
              #   @return [String, nil]
              required :car_class_code, String, nil?: true

              # @!attribute checkout_date
              #   Date the customer picked up the car or, in the case of a no-show or pre-pay
              #   transaction, the scheduled pick up date.
              #
              #   @return [Date, nil]
              required :checkout_date, Date, nil?: true

              # @!attribute daily_rental_rate_amount
              #   Daily rate being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :daily_rental_rate_amount, Integer, nil?: true

              # @!attribute daily_rental_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              #   rate.
              #
              #   @return [String, nil]
              required :daily_rental_rate_currency, String, nil?: true

              # @!attribute days_rented
              #   Number of days the vehicle was rented.
              #
              #   @return [Integer, nil]
              required :days_rented, Integer, nil?: true

              # @!attribute extra_charges
              #   Additional charges (gas, late fee, etc.) being billed.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges, nil]
              required :extra_charges,
                       enum: -> {
                         Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges
                       },
                       nil?: true

              # @!attribute fuel_charges_amount
              #   Fuel charges for the vehicle.
              #
              #   @return [Integer, nil]
              required :fuel_charges_amount, Integer, nil?: true

              # @!attribute fuel_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              #   assessed.
              #
              #   @return [String, nil]
              required :fuel_charges_currency, String, nil?: true

              # @!attribute insurance_charges_amount
              #   Any insurance being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :insurance_charges_amount, Integer, nil?: true

              # @!attribute insurance_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
              #   charges assessed.
              #
              #   @return [String, nil]
              required :insurance_charges_currency, String, nil?: true

              # @!attribute no_show_indicator
              #   An indicator that the cardholder is being billed for a reserved vehicle that was
              #   not actually rented (that is, a "no-show" charge).
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator, nil]
              required :no_show_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator
                       },
                       nil?: true

              # @!attribute one_way_drop_off_charges_amount
              #   Charges for returning the vehicle at a different location than where it was
              #   picked up.
              #
              #   @return [Integer, nil]
              required :one_way_drop_off_charges_amount, Integer, nil?: true

              # @!attribute one_way_drop_off_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
              #   drop-off charges assessed.
              #
              #   @return [String, nil]
              required :one_way_drop_off_charges_currency, String, nil?: true

              # @!attribute renter_name
              #   Name of the person renting the vehicle.
              #
              #   @return [String, nil]
              required :renter_name, String, nil?: true

              # @!attribute weekly_rental_rate_amount
              #   Weekly rate being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :weekly_rental_rate_amount, Integer, nil?: true

              # @!attribute weekly_rental_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
              #   rental rate.
              #
              #   @return [String, nil]
              required :weekly_rental_rate_currency, String, nil?: true

              # @!method initialize(car_class_code:, checkout_date:, daily_rental_rate_amount:, daily_rental_rate_currency:, days_rented:, extra_charges:, fuel_charges_amount:, fuel_charges_currency:, insurance_charges_amount:, insurance_charges_currency:, no_show_indicator:, one_way_drop_off_charges_amount:, one_way_drop_off_charges_currency:, renter_name:, weekly_rental_rate_amount:, weekly_rental_rate_currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental}
              #   for more details.
              #
              #   Fields specific to car rentals.
              #
              #   @param car_class_code [String, nil] Code indicating the vehicle's class.
              #
              #   @param checkout_date [Date, nil] Date the customer picked up the car or, in the case of a no-show or pre-pay tran
              #
              #   @param daily_rental_rate_amount [Integer, nil] Daily rate being charged for the vehicle.
              #
              #   @param daily_rental_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              #
              #   @param days_rented [Integer, nil] Number of days the vehicle was rented.
              #
              #   @param extra_charges [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental::ExtraCharges, nil] Additional charges (gas, late fee, etc.) being billed.
              #
              #   @param fuel_charges_amount [Integer, nil] Fuel charges for the vehicle.
              #
              #   @param fuel_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              #
              #   @param insurance_charges_amount [Integer, nil] Any insurance being charged for the vehicle.
              #
              #   @param insurance_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance ch
              #
              #   @param no_show_indicator [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental::NoShowIndicator, nil] An indicator that the cardholder is being billed for a reserved vehicle that was
              #
              #   @param one_way_drop_off_charges_amount [Integer, nil] Charges for returning the vehicle at a different location than where it was pick
              #
              #   @param one_way_drop_off_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way drop
              #
              #   @param renter_name [String, nil] Name of the person renting the vehicle.
              #
              #   @param weekly_rental_rate_amount [Integer, nil] Weekly rate being charged for the vehicle.
              #
              #   @param weekly_rental_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly renta

              # Additional charges (gas, late fee, etc.) being billed.
              #
              # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental#extra_charges
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                # No extra charge
                NO_EXTRA_CHARGE = :no_extra_charge

                # Gas
                GAS = :gas

                # Extra mileage
                EXTRA_MILEAGE = :extra_mileage

                # Late return
                LATE_RETURN = :late_return

                # One way service fee
                ONE_WAY_SERVICE_FEE = :one_way_service_fee

                # Parking violation
                PARKING_VIOLATION = :parking_violation

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              #
              # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::CarRental#no_show_indicator
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                # Not applicable
                NOT_APPLICABLE = :not_applicable

                # No show for specialized vehicle
                NO_SHOW_FOR_SPECIALIZED_VEHICLE = :no_show_for_specialized_vehicle

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails#lodging
            class Lodging < Increase::Internal::Type::BaseModel
              # @!attribute check_in_date
              #   Date the customer checked in.
              #
              #   @return [Date, nil]
              required :check_in_date, Date, nil?: true

              # @!attribute daily_room_rate_amount
              #   Daily rate being charged for the room.
              #
              #   @return [Integer, nil]
              required :daily_room_rate_amount, Integer, nil?: true

              # @!attribute daily_room_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
              #   rate.
              #
              #   @return [String, nil]
              required :daily_room_rate_currency, String, nil?: true

              # @!attribute extra_charges
              #   Additional charges (phone, late check-out, etc.) being billed.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges, nil]
              required :extra_charges,
                       enum: -> {
                         Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges
                       },
                       nil?: true

              # @!attribute folio_cash_advances_amount
              #   Folio cash advances for the room.
              #
              #   @return [Integer, nil]
              required :folio_cash_advances_amount, Integer, nil?: true

              # @!attribute folio_cash_advances_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
              #   advances.
              #
              #   @return [String, nil]
              required :folio_cash_advances_currency, String, nil?: true

              # @!attribute food_beverage_charges_amount
              #   Food and beverage charges for the room.
              #
              #   @return [Integer, nil]
              required :food_beverage_charges_amount, Integer, nil?: true

              # @!attribute food_beverage_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
              #   beverage charges.
              #
              #   @return [String, nil]
              required :food_beverage_charges_currency, String, nil?: true

              # @!attribute no_show_indicator
              #   Indicator that the cardholder is being billed for a reserved room that was not
              #   actually used.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator, nil]
              required :no_show_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator
                       },
                       nil?: true

              # @!attribute prepaid_expenses_amount
              #   Prepaid expenses being charged for the room.
              #
              #   @return [Integer, nil]
              required :prepaid_expenses_amount, Integer, nil?: true

              # @!attribute prepaid_expenses_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
              #   expenses.
              #
              #   @return [String, nil]
              required :prepaid_expenses_currency, String, nil?: true

              # @!attribute room_nights
              #   Number of nights the room was rented.
              #
              #   @return [Integer, nil]
              required :room_nights, Integer, nil?: true

              # @!attribute total_room_tax_amount
              #   Total room tax being charged.
              #
              #   @return [Integer, nil]
              required :total_room_tax_amount, Integer, nil?: true

              # @!attribute total_room_tax_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
              #   tax.
              #
              #   @return [String, nil]
              required :total_room_tax_currency, String, nil?: true

              # @!attribute total_tax_amount
              #   Total tax being charged for the room.
              #
              #   @return [Integer, nil]
              required :total_tax_amount, Integer, nil?: true

              # @!attribute total_tax_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
              #   assessed.
              #
              #   @return [String, nil]
              required :total_tax_currency, String, nil?: true

              # @!method initialize(check_in_date:, daily_room_rate_amount:, daily_room_rate_currency:, extra_charges:, folio_cash_advances_amount:, folio_cash_advances_currency:, food_beverage_charges_amount:, food_beverage_charges_currency:, no_show_indicator:, prepaid_expenses_amount:, prepaid_expenses_currency:, room_nights:, total_room_tax_amount:, total_room_tax_currency:, total_tax_amount:, total_tax_currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging}
              #   for more details.
              #
              #   Fields specific to lodging.
              #
              #   @param check_in_date [Date, nil] Date the customer checked in.
              #
              #   @param daily_room_rate_amount [Integer, nil] Daily rate being charged for the room.
              #
              #   @param daily_room_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room r
              #
              #   @param extra_charges [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging::ExtraCharges, nil] Additional charges (phone, late check-out, etc.) being billed.
              #
              #   @param folio_cash_advances_amount [Integer, nil] Folio cash advances for the room.
              #
              #   @param folio_cash_advances_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash a
              #
              #   @param food_beverage_charges_amount [Integer, nil] Food and beverage charges for the room.
              #
              #   @param food_beverage_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and bev
              #
              #   @param no_show_indicator [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging::NoShowIndicator, nil] Indicator that the cardholder is being billed for a reserved room that was not a
              #
              #   @param prepaid_expenses_amount [Integer, nil] Prepaid expenses being charged for the room.
              #
              #   @param prepaid_expenses_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid expe
              #
              #   @param room_nights [Integer, nil] Number of nights the room was rented.
              #
              #   @param total_room_tax_amount [Integer, nil] Total room tax being charged.
              #
              #   @param total_room_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room t
              #
              #   @param total_tax_amount [Integer, nil] Total tax being charged for the room.
              #
              #   @param total_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax as

              # Additional charges (phone, late check-out, etc.) being billed.
              #
              # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging#extra_charges
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                # No extra charge
                NO_EXTRA_CHARGE = :no_extra_charge

                # Restaurant
                RESTAURANT = :restaurant

                # Gift shop
                GIFT_SHOP = :gift_shop

                # Mini bar
                MINI_BAR = :mini_bar

                # Telephone
                TELEPHONE = :telephone

                # Other
                OTHER = :other

                # Laundry
                LAUNDRY = :laundry

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              #
              # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Lodging#no_show_indicator
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                # Not applicable
                NOT_APPLICABLE = :not_applicable

                # No show
                NO_SHOW = :no_show

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # The format of the purchase identifier.
            #
            # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails#purchase_identifier_format
            module PurchaseIdentifierFormat
              extend Increase::Internal::Type::Enum

              # Free text
              FREE_TEXT = :free_text

              # Order number
              ORDER_NUMBER = :order_number

              # Rental agreement number
              RENTAL_AGREEMENT_NUMBER = :rental_agreement_number

              # Hotel folio number
              HOTEL_FOLIO_NUMBER = :hotel_folio_number

              # Invoice number
              INVOICE_NUMBER = :invoice_number

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails#travel
            class Travel < Increase::Internal::Type::BaseModel
              # @!attribute ancillary
              #   Ancillary purchases in addition to the airfare.
              #
              #   @return [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary, nil]
              required :ancillary,
                       -> { Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary },
                       nil?: true

              # @!attribute computerized_reservation_system
              #   Indicates the computerized reservation system used to book the ticket.
              #
              #   @return [String, nil]
              required :computerized_reservation_system, String, nil?: true

              # @!attribute credit_reason_indicator
              #   Indicates the reason for a credit to the cardholder.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator, nil]
              required :credit_reason_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator
                       },
                       nil?: true

              # @!attribute departure_date
              #   Date of departure.
              #
              #   @return [Date, nil]
              required :departure_date, Date, nil?: true

              # @!attribute origination_city_airport_code
              #   Code for the originating city or airport.
              #
              #   @return [String, nil]
              required :origination_city_airport_code, String, nil?: true

              # @!attribute passenger_name
              #   Name of the passenger.
              #
              #   @return [String, nil]
              required :passenger_name, String, nil?: true

              # @!attribute restricted_ticket_indicator
              #   Indicates whether this ticket is non-refundable.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator, nil]
              required :restricted_ticket_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator
                       },
                       nil?: true

              # @!attribute ticket_change_indicator
              #   Indicates why a ticket was changed.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator, nil]
              required :ticket_change_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator
                       },
                       nil?: true

              # @!attribute ticket_number
              #   Ticket number.
              #
              #   @return [String, nil]
              required :ticket_number, String, nil?: true

              # @!attribute travel_agency_code
              #   Code for the travel agency if the ticket was issued by a travel agency.
              #
              #   @return [String, nil]
              required :travel_agency_code, String, nil?: true

              # @!attribute travel_agency_name
              #   Name of the travel agency if the ticket was issued by a travel agency.
              #
              #   @return [String, nil]
              required :travel_agency_name, String, nil?: true

              # @!attribute trip_legs
              #   Fields specific to each leg of the journey.
              #
              #   @return [Array<Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg>, nil]
              required :trip_legs,
                       -> {
                         Increase::Internal::Type::ArrayOf[Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg]
                       },
                       nil?: true

              # @!method initialize(ancillary:, computerized_reservation_system:, credit_reason_indicator:, departure_date:, origination_city_airport_code:, passenger_name:, restricted_ticket_indicator:, ticket_change_indicator:, ticket_number:, travel_agency_code:, travel_agency_name:, trip_legs:)
              #   Fields specific to travel.
              #
              #   @param ancillary [Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary, nil] Ancillary purchases in addition to the airfare.
              #
              #   @param computerized_reservation_system [String, nil] Indicates the computerized reservation system used to book the ticket.
              #
              #   @param credit_reason_indicator [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator, nil] Indicates the reason for a credit to the cardholder.
              #
              #   @param departure_date [Date, nil] Date of departure.
              #
              #   @param origination_city_airport_code [String, nil] Code for the originating city or airport.
              #
              #   @param passenger_name [String, nil] Name of the passenger.
              #
              #   @param restricted_ticket_indicator [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator, nil] Indicates whether this ticket is non-refundable.
              #
              #   @param ticket_change_indicator [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator, nil] Indicates why a ticket was changed.
              #
              #   @param ticket_number [String, nil] Ticket number.
              #
              #   @param travel_agency_code [String, nil] Code for the travel agency if the ticket was issued by a travel agency.
              #
              #   @param travel_agency_name [String, nil] Name of the travel agency if the ticket was issued by a travel agency.
              #
              #   @param trip_legs [Array<Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg>, nil] Fields specific to each leg of the journey.

              # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel#ancillary
              class Ancillary < Increase::Internal::Type::BaseModel
                # @!attribute connected_ticket_document_number
                #   If this purchase has a connection or relationship to another purchase, such as a
                #   baggage fee for a passenger transport ticket, this field should contain the
                #   ticket document number for the other purchase.
                #
                #   @return [String, nil]
                required :connected_ticket_document_number, String, nil?: true

                # @!attribute credit_reason_indicator
                #   Indicates the reason for a credit to the cardholder.
                #
                #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator, nil]
                required :credit_reason_indicator,
                         enum: -> {
                           Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator
                         },
                         nil?: true

                # @!attribute passenger_name_or_description
                #   Name of the passenger or description of the ancillary purchase.
                #
                #   @return [String, nil]
                required :passenger_name_or_description, String, nil?: true

                # @!attribute services
                #   Additional travel charges, such as baggage fees.
                #
                #   @return [Array<Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service>]
                required :services,
                         -> {
                           Increase::Internal::Type::ArrayOf[Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service]
                         }

                # @!attribute ticket_document_number
                #   Ticket document number.
                #
                #   @return [String, nil]
                required :ticket_document_number, String, nil?: true

                # @!method initialize(connected_ticket_document_number:, credit_reason_indicator:, passenger_name_or_description:, services:, ticket_document_number:)
                #   Some parameter documentations has been truncated, see
                #   {Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary}
                #   for more details.
                #
                #   Ancillary purchases in addition to the airfare.
                #
                #   @param connected_ticket_document_number [String, nil] If this purchase has a connection or relationship to another purchase, such as a
                #
                #   @param credit_reason_indicator [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator, nil] Indicates the reason for a credit to the cardholder.
                #
                #   @param passenger_name_or_description [String, nil] Name of the passenger or description of the ancillary purchase.
                #
                #   @param services [Array<Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service>] Additional travel charges, such as baggage fees.
                #
                #   @param ticket_document_number [String, nil] Ticket document number.

                # Indicates the reason for a credit to the cardholder.
                #
                # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary#credit_reason_indicator
                module CreditReasonIndicator
                  extend Increase::Internal::Type::Enum

                  # No credit
                  NO_CREDIT = :no_credit

                  # Passenger transport ancillary purchase cancellation
                  PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    :passenger_transport_ancillary_purchase_cancellation

                  # Airline ticket and passenger transport ancillary purchase cancellation
                  AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation

                  # Other
                  OTHER = :other

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                class Service < Increase::Internal::Type::BaseModel
                  # @!attribute category
                  #   Category of the ancillary service.
                  #
                  #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category, nil]
                  required :category,
                           enum: -> {
                             Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category
                           },
                           nil?: true

                  # @!attribute sub_category
                  #   Sub-category of the ancillary service, free-form.
                  #
                  #   @return [String, nil]
                  required :sub_category, String, nil?: true

                  # @!method initialize(category:, sub_category:)
                  #   @param category [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category, nil] Category of the ancillary service.
                  #
                  #   @param sub_category [String, nil] Sub-category of the ancillary service, free-form.

                  # Category of the ancillary service.
                  #
                  # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::Ancillary::Service#category
                  module Category
                    extend Increase::Internal::Type::Enum

                    # None
                    NONE = :none

                    # Bundled service
                    BUNDLED_SERVICE = :bundled_service

                    # Baggage fee
                    BAGGAGE_FEE = :baggage_fee

                    # Change fee
                    CHANGE_FEE = :change_fee

                    # Cargo
                    CARGO = :cargo

                    # Carbon offset
                    CARBON_OFFSET = :carbon_offset

                    # Frequent flyer
                    FREQUENT_FLYER = :frequent_flyer

                    # Gift card
                    GIFT_CARD = :gift_card

                    # Ground transport
                    GROUND_TRANSPORT = :ground_transport

                    # In-flight entertainment
                    IN_FLIGHT_ENTERTAINMENT = :in_flight_entertainment

                    # Lounge
                    LOUNGE = :lounge

                    # Medical
                    MEDICAL = :medical

                    # Meal beverage
                    MEAL_BEVERAGE = :meal_beverage

                    # Other
                    OTHER = :other

                    # Passenger assist fee
                    PASSENGER_ASSIST_FEE = :passenger_assist_fee

                    # Pets
                    PETS = :pets

                    # Seat fees
                    SEAT_FEES = :seat_fees

                    # Standby
                    STANDBY = :standby

                    # Service fee
                    SERVICE_FEE = :service_fee

                    # Store
                    STORE = :store

                    # Travel service
                    TRAVEL_SERVICE = :travel_service

                    # Unaccompanied travel
                    UNACCOMPANIED_TRAVEL = :unaccompanied_travel

                    # Upgrades
                    UPGRADES = :upgrades

                    # Wi-fi
                    WIFI = :wifi

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end
              end

              # Indicates the reason for a credit to the cardholder.
              #
              # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel#credit_reason_indicator
              module CreditReasonIndicator
                extend Increase::Internal::Type::Enum

                # No credit
                NO_CREDIT = :no_credit

                # Passenger transport ancillary purchase cancellation
                PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  :passenger_transport_ancillary_purchase_cancellation

                # Airline ticket and passenger transport ancillary purchase cancellation
                AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation

                # Airline ticket cancellation
                AIRLINE_TICKET_CANCELLATION = :airline_ticket_cancellation

                # Other
                OTHER = :other

                # Partial refund of airline ticket
                PARTIAL_REFUND_OF_AIRLINE_TICKET = :partial_refund_of_airline_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicates whether this ticket is non-refundable.
              #
              # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel#restricted_ticket_indicator
              module RestrictedTicketIndicator
                extend Increase::Internal::Type::Enum

                # No restrictions
                NO_RESTRICTIONS = :no_restrictions

                # Restricted non-refundable ticket
                RESTRICTED_NON_REFUNDABLE_TICKET = :restricted_non_refundable_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicates why a ticket was changed.
              #
              # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel#ticket_change_indicator
              module TicketChangeIndicator
                extend Increase::Internal::Type::Enum

                # None
                NONE = :none

                # Change to existing ticket
                CHANGE_TO_EXISTING_TICKET = :change_to_existing_ticket

                # New ticket
                NEW_TICKET = :new_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              class TripLeg < Increase::Internal::Type::BaseModel
                # @!attribute carrier_code
                #   Carrier code (e.g., United Airlines, Jet Blue, etc.).
                #
                #   @return [String, nil]
                required :carrier_code, String, nil?: true

                # @!attribute destination_city_airport_code
                #   Code for the destination city or airport.
                #
                #   @return [String, nil]
                required :destination_city_airport_code, String, nil?: true

                # @!attribute fare_basis_code
                #   Fare basis code.
                #
                #   @return [String, nil]
                required :fare_basis_code, String, nil?: true

                # @!attribute flight_number
                #   Flight number.
                #
                #   @return [String, nil]
                required :flight_number, String, nil?: true

                # @!attribute service_class
                #   Service class (e.g., first class, business class, etc.).
                #
                #   @return [String, nil]
                required :service_class, String, nil?: true

                # @!attribute stop_over_code
                #   Indicates whether a stopover is allowed on this ticket.
                #
                #   @return [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode, nil]
                required :stop_over_code,
                         enum: -> {
                           Increase::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode
                         },
                         nil?: true

                # @!method initialize(carrier_code:, destination_city_airport_code:, fare_basis_code:, flight_number:, service_class:, stop_over_code:)
                #   @param carrier_code [String, nil] Carrier code (e.g., United Airlines, Jet Blue, etc.).
                #
                #   @param destination_city_airport_code [String, nil] Code for the destination city or airport.
                #
                #   @param fare_basis_code [String, nil] Fare basis code.
                #
                #   @param flight_number [String, nil] Flight number.
                #
                #   @param service_class [String, nil] Service class (e.g., first class, business class, etc.).
                #
                #   @param stop_over_code [Symbol, Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode, nil] Indicates whether a stopover is allowed on this ticket.

                # Indicates whether a stopover is allowed on this ticket.
                #
                # @see Increase::Models::Transaction::Source::CardRefund::PurchaseDetails::Travel::TripLeg#stop_over_code
                module StopOverCode
                  extend Increase::Internal::Type::Enum

                  # None
                  NONE = :none

                  # Stop over allowed
                  STOP_OVER_ALLOWED = :stop_over_allowed

                  # Stop over not allowed
                  STOP_OVER_NOT_ALLOWED = :stop_over_not_allowed

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_refund`.
          #
          # @see Increase::Models::Transaction::Source::CardRefund#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_REFUND = :card_refund

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#card_revenue_payment
        class CardRevenuePayment < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The amount in the minor unit of the transaction's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #   currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CardRevenuePayment::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::CardRevenuePayment::Currency }

          # @!attribute period_end
          #   The end of the period for which this transaction paid interest.
          #
          #   @return [Time]
          required :period_end, Time

          # @!attribute period_start
          #   The start of the period for which this transaction paid interest.
          #
          #   @return [Time]
          required :period_start, Time

          # @!attribute transacted_on_account_id
          #   The account the card belonged to.
          #
          #   @return [String, nil]
          required :transacted_on_account_id, String, nil?: true

          # @!method initialize(amount:, currency:, period_end:, period_start:, transacted_on_account_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CardRevenuePayment} for more details.
          #
          #   A Card Revenue Payment object. This field will be present in the JSON response
          #   if and only if `category` is equal to `card_revenue_payment`. Card Revenue
          #   Payments reflect earnings from fees on card transactions.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's currency. For dollars, for exa
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::CardRevenuePayment::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #
          #   @param period_end [Time] The end of the period for which this transaction paid interest.
          #
          #   @param period_start [Time] The start of the period for which this transaction paid interest.
          #
          #   @param transacted_on_account_id [String, nil] The account the card belonged to.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          #
          # @see Increase::Models::Transaction::Source::CardRevenuePayment#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#card_settlement
        class CardSettlement < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Settlement identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute amount
          #   The amount in the minor unit of the transaction's settlement currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_authorization
          #   The Card Authorization that was created prior to this Card Settlement, if one
          #   exists.
          #
          #   @return [String, nil]
          required :card_authorization, String, nil?: true

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute cashback
          #   Cashback earned on this transaction, if eligible. Cashback is paid out in
          #   aggregate, monthly.
          #
          #   @return [Increase::Models::Transaction::Source::CardSettlement::Cashback, nil]
          required :cashback, -> { Increase::Transaction::Source::CardSettlement::Cashback }, nil?: true

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's settlement currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::CardSettlement::Currency }

          # @!attribute interchange
          #   Interchange assessed as a part of this transaction.
          #
          #   @return [Increase::Models::Transaction::Source::CardSettlement::Interchange, nil]
          required :interchange, -> { Increase::Transaction::Source::CardSettlement::Interchange }, nil?: true

          # @!attribute merchant_acceptor_id
          #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
          #   is transacting with.
          #
          #   @return [String]
          required :merchant_acceptor_id, String

          # @!attribute merchant_category_code
          #   The 4-digit MCC describing the merchant's business.
          #
          #   @return [String]
          required :merchant_category_code, String

          # @!attribute merchant_city
          #   The city the merchant resides in.
          #
          #   @return [String]
          required :merchant_city, String

          # @!attribute merchant_country
          #   The country the merchant resides in.
          #
          #   @return [String]
          required :merchant_country, String

          # @!attribute merchant_name
          #   The name of the merchant.
          #
          #   @return [String]
          required :merchant_name, String

          # @!attribute merchant_postal_code
          #   The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          #
          #   @return [String, nil]
          required :merchant_postal_code, String, nil?: true

          # @!attribute merchant_state
          #   The state the merchant resides in.
          #
          #   @return [String, nil]
          required :merchant_state, String, nil?: true

          # @!attribute network_identifiers
          #   Network-specific identifiers for this refund.
          #
          #   @return [Increase::Models::Transaction::Source::CardSettlement::NetworkIdentifiers]
          required :network_identifiers,
                   -> {
                     Increase::Transaction::Source::CardSettlement::NetworkIdentifiers
                   }

          # @!attribute pending_transaction_id
          #   The identifier of the Pending Transaction associated with this Transaction.
          #
          #   @return [String, nil]
          required :pending_transaction_id, String, nil?: true

          # @!attribute presentment_amount
          #   The amount in the minor unit of the transaction's presentment currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute purchase_details
          #   Additional details about the card purchase, such as tax and industry-specific
          #   fields.
          #
          #   @return [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails, nil]
          required :purchase_details,
                   -> { Increase::Transaction::Source::CardSettlement::PurchaseDetails },
                   nil?: true

          # @!attribute transaction_id
          #   The identifier of the Transaction associated with this Transaction.
          #
          #   @return [String]
          required :transaction_id, String

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_settlement`.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::Type]
          required :type, enum: -> { Increase::Transaction::Source::CardSettlement::Type }

          # @!method initialize(id:, amount:, card_authorization:, card_payment_id:, cashback:, currency:, interchange:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_name:, merchant_postal_code:, merchant_state:, network_identifiers:, pending_transaction_id:, presentment_amount:, presentment_currency:, purchase_details:, transaction_id:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CardSettlement} for more details.
          #
          #   A Card Settlement object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_settlement`. Card Settlements are card
          #   transactions that have cleared and settled. While a settlement is usually
          #   preceded by an authorization, an acquirer can also directly clear a transaction
          #   without first authorizing it.
          #
          #   @param id [String] The Card Settlement identifier.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's settlement currency. For dolla
          #
          #   @param card_authorization [String, nil] The Card Authorization that was created prior to this Card Settlement, if one ex
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param cashback [Increase::Models::Transaction::Source::CardSettlement::Cashback, nil] Cashback earned on this transaction, if eligible. Cashback is paid out in aggreg
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::CardSettlement::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param interchange [Increase::Models::Transaction::Source::CardSettlement::Interchange, nil] Interchange assessed as a part of this transaction.
          #
          #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
          #
          #   @param merchant_category_code [String] The 4-digit MCC describing the merchant's business.
          #
          #   @param merchant_city [String] The city the merchant resides in.
          #
          #   @param merchant_country [String] The country the merchant resides in.
          #
          #   @param merchant_name [String] The name of the merchant.
          #
          #   @param merchant_postal_code [String, nil] The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          #
          #   @param merchant_state [String, nil] The state the merchant resides in.
          #
          #   @param network_identifiers [Increase::Models::Transaction::Source::CardSettlement::NetworkIdentifiers] Network-specific identifiers for this refund.
          #
          #   @param pending_transaction_id [String, nil] The identifier of the Pending Transaction associated with this Transaction.
          #
          #   @param presentment_amount [Integer] The amount in the minor unit of the transaction's presentment currency.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param purchase_details [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails, nil] Additional details about the card purchase, such as tax and industry-specific fi
          #
          #   @param transaction_id [String] The identifier of the Transaction associated with this Transaction.
          #
          #   @param type [Symbol, Increase::Models::Transaction::Source::CardSettlement::Type] A constant representing the object's type. For this resource it will always be `

          # @see Increase::Models::Transaction::Source::CardSettlement#cashback
          class Cashback < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The cashback amount given as a string containing a decimal number. The amount is
            #   a positive number if it will be credited to you (e.g., settlements) and a
            #   negative number if it will be debited (e.g., refunds).
            #
            #   @return [String]
            required :amount, String

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            #
            #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::Cashback::Currency]
            required :currency, enum: -> { Increase::Transaction::Source::CardSettlement::Cashback::Currency }

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::Transaction::Source::CardSettlement::Cashback} for more
            #   details.
            #
            #   Cashback earned on this transaction, if eligible. Cashback is paid out in
            #   aggregate, monthly.
            #
            #   @param amount [String] The cashback amount given as a string containing a decimal number. The amount is
            #
            #   @param currency [Symbol, Increase::Models::Transaction::Source::CardSettlement::Cashback::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            #
            # @see Increase::Models::Transaction::Source::CardSettlement::Cashback#currency
            module Currency
              extend Increase::Internal::Type::Enum

              # Canadian Dollar (CAD)
              CAD = :CAD

              # Swiss Franc (CHF)
              CHF = :CHF

              # Euro (EUR)
              EUR = :EUR

              # British Pound (GBP)
              GBP = :GBP

              # Japanese Yen (JPY)
              JPY = :JPY

              # US Dollar (USD)
              USD = :USD

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          #
          # @see Increase::Models::Transaction::Source::CardSettlement#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::Transaction::Source::CardSettlement#interchange
          class Interchange < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The interchange amount given as a string containing a decimal number in major
            #   units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
            #   credited to Increase (e.g., settlements) and a negative number if it is debited
            #   (e.g., refunds).
            #
            #   @return [String]
            required :amount, String

            # @!attribute code
            #   The card network specific interchange code.
            #
            #   @return [String, nil]
            required :code, String, nil?: true

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            #   reimbursement.
            #
            #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::Interchange::Currency]
            required :currency,
                     enum: -> {
                       Increase::Transaction::Source::CardSettlement::Interchange::Currency
                     }

            # @!method initialize(amount:, code:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::Transaction::Source::CardSettlement::Interchange} for more
            #   details.
            #
            #   Interchange assessed as a part of this transaction.
            #
            #   @param amount [String] The interchange amount given as a string containing a decimal number in major un
            #
            #   @param code [String, nil] The card network specific interchange code.
            #
            #   @param currency [Symbol, Increase::Models::Transaction::Source::CardSettlement::Interchange::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            #
            # @see Increase::Models::Transaction::Source::CardSettlement::Interchange#currency
            module Currency
              extend Increase::Internal::Type::Enum

              # Canadian Dollar (CAD)
              CAD = :CAD

              # Swiss Franc (CHF)
              CHF = :CHF

              # Euro (EUR)
              EUR = :EUR

              # British Pound (GBP)
              GBP = :GBP

              # Japanese Yen (JPY)
              JPY = :JPY

              # US Dollar (USD)
              USD = :USD

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::Transaction::Source::CardSettlement#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            # @!attribute acquirer_business_id
            #   A network assigned business ID that identifies the acquirer that processed this
            #   transaction.
            #
            #   @return [String]
            required :acquirer_business_id, String

            # @!attribute acquirer_reference_number
            #   A globally unique identifier for this settlement.
            #
            #   @return [String]
            required :acquirer_reference_number, String

            # @!attribute transaction_id
            #   A globally unique transaction identifier provided by the card network, used
            #   across multiple life-cycle requests.
            #
            #   @return [String, nil]
            required :transaction_id, String, nil?: true

            # @!method initialize(acquirer_business_id:, acquirer_reference_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::Transaction::Source::CardSettlement::NetworkIdentifiers} for
            #   more details.
            #
            #   Network-specific identifiers for this refund.
            #
            #   @param acquirer_business_id [String] A network assigned business ID that identifies the acquirer that processed this
            #
            #   @param acquirer_reference_number [String] A globally unique identifier for this settlement.
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # @see Increase::Models::Transaction::Source::CardSettlement#purchase_details
          class PurchaseDetails < Increase::Internal::Type::BaseModel
            # @!attribute car_rental
            #   Fields specific to car rentals.
            #
            #   @return [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental, nil]
            required :car_rental,
                     -> { Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental },
                     nil?: true

            # @!attribute customer_reference_identifier
            #   An identifier from the merchant for the customer or consumer.
            #
            #   @return [String, nil]
            required :customer_reference_identifier, String, nil?: true

            # @!attribute local_tax_amount
            #   The state or provincial tax amount in minor units.
            #
            #   @return [Integer, nil]
            required :local_tax_amount, Integer, nil?: true

            # @!attribute local_tax_currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            #   assessed.
            #
            #   @return [String, nil]
            required :local_tax_currency, String, nil?: true

            # @!attribute lodging
            #   Fields specific to lodging.
            #
            #   @return [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging, nil]
            required :lodging,
                     -> { Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging },
                     nil?: true

            # @!attribute national_tax_amount
            #   The national tax amount in minor units.
            #
            #   @return [Integer, nil]
            required :national_tax_amount, Integer, nil?: true

            # @!attribute national_tax_currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            #   assessed.
            #
            #   @return [String, nil]
            required :national_tax_currency, String, nil?: true

            # @!attribute purchase_identifier
            #   An identifier from the merchant for the purchase to the issuer and cardholder.
            #
            #   @return [String, nil]
            required :purchase_identifier, String, nil?: true

            # @!attribute purchase_identifier_format
            #   The format of the purchase identifier.
            #
            #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat, nil]
            required :purchase_identifier_format,
                     enum: -> {
                       Increase::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat
                     },
                     nil?: true

            # @!attribute travel
            #   Fields specific to travel.
            #
            #   @return [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel, nil]
            required :travel,
                     -> { Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel },
                     nil?: true

            # @!method initialize(car_rental:, customer_reference_identifier:, local_tax_amount:, local_tax_currency:, lodging:, national_tax_amount:, national_tax_currency:, purchase_identifier:, purchase_identifier_format:, travel:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails} for
            #   more details.
            #
            #   Additional details about the card purchase, such as tax and industry-specific
            #   fields.
            #
            #   @param car_rental [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental, nil] Fields specific to car rentals.
            #
            #   @param customer_reference_identifier [String, nil] An identifier from the merchant for the customer or consumer.
            #
            #   @param local_tax_amount [Integer, nil] The state or provincial tax amount in minor units.
            #
            #   @param local_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax as
            #
            #   @param lodging [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging, nil] Fields specific to lodging.
            #
            #   @param national_tax_amount [Integer, nil] The national tax amount in minor units.
            #
            #   @param national_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax as
            #
            #   @param purchase_identifier [String, nil] An identifier from the merchant for the purchase to the issuer and cardholder.
            #
            #   @param purchase_identifier_format [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat, nil] The format of the purchase identifier.
            #
            #   @param travel [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel, nil] Fields specific to travel.

            # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails#car_rental
            class CarRental < Increase::Internal::Type::BaseModel
              # @!attribute car_class_code
              #   Code indicating the vehicle's class.
              #
              #   @return [String, nil]
              required :car_class_code, String, nil?: true

              # @!attribute checkout_date
              #   Date the customer picked up the car or, in the case of a no-show or pre-pay
              #   transaction, the scheduled pick up date.
              #
              #   @return [Date, nil]
              required :checkout_date, Date, nil?: true

              # @!attribute daily_rental_rate_amount
              #   Daily rate being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :daily_rental_rate_amount, Integer, nil?: true

              # @!attribute daily_rental_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              #   rate.
              #
              #   @return [String, nil]
              required :daily_rental_rate_currency, String, nil?: true

              # @!attribute days_rented
              #   Number of days the vehicle was rented.
              #
              #   @return [Integer, nil]
              required :days_rented, Integer, nil?: true

              # @!attribute extra_charges
              #   Additional charges (gas, late fee, etc.) being billed.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges, nil]
              required :extra_charges,
                       enum: -> {
                         Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges
                       },
                       nil?: true

              # @!attribute fuel_charges_amount
              #   Fuel charges for the vehicle.
              #
              #   @return [Integer, nil]
              required :fuel_charges_amount, Integer, nil?: true

              # @!attribute fuel_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              #   assessed.
              #
              #   @return [String, nil]
              required :fuel_charges_currency, String, nil?: true

              # @!attribute insurance_charges_amount
              #   Any insurance being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :insurance_charges_amount, Integer, nil?: true

              # @!attribute insurance_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
              #   charges assessed.
              #
              #   @return [String, nil]
              required :insurance_charges_currency, String, nil?: true

              # @!attribute no_show_indicator
              #   An indicator that the cardholder is being billed for a reserved vehicle that was
              #   not actually rented (that is, a "no-show" charge).
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator, nil]
              required :no_show_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator
                       },
                       nil?: true

              # @!attribute one_way_drop_off_charges_amount
              #   Charges for returning the vehicle at a different location than where it was
              #   picked up.
              #
              #   @return [Integer, nil]
              required :one_way_drop_off_charges_amount, Integer, nil?: true

              # @!attribute one_way_drop_off_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
              #   drop-off charges assessed.
              #
              #   @return [String, nil]
              required :one_way_drop_off_charges_currency, String, nil?: true

              # @!attribute renter_name
              #   Name of the person renting the vehicle.
              #
              #   @return [String, nil]
              required :renter_name, String, nil?: true

              # @!attribute weekly_rental_rate_amount
              #   Weekly rate being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :weekly_rental_rate_amount, Integer, nil?: true

              # @!attribute weekly_rental_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
              #   rental rate.
              #
              #   @return [String, nil]
              required :weekly_rental_rate_currency, String, nil?: true

              # @!method initialize(car_class_code:, checkout_date:, daily_rental_rate_amount:, daily_rental_rate_currency:, days_rented:, extra_charges:, fuel_charges_amount:, fuel_charges_currency:, insurance_charges_amount:, insurance_charges_currency:, no_show_indicator:, one_way_drop_off_charges_amount:, one_way_drop_off_charges_currency:, renter_name:, weekly_rental_rate_amount:, weekly_rental_rate_currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental}
              #   for more details.
              #
              #   Fields specific to car rentals.
              #
              #   @param car_class_code [String, nil] Code indicating the vehicle's class.
              #
              #   @param checkout_date [Date, nil] Date the customer picked up the car or, in the case of a no-show or pre-pay tran
              #
              #   @param daily_rental_rate_amount [Integer, nil] Daily rate being charged for the vehicle.
              #
              #   @param daily_rental_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              #
              #   @param days_rented [Integer, nil] Number of days the vehicle was rented.
              #
              #   @param extra_charges [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::ExtraCharges, nil] Additional charges (gas, late fee, etc.) being billed.
              #
              #   @param fuel_charges_amount [Integer, nil] Fuel charges for the vehicle.
              #
              #   @param fuel_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              #
              #   @param insurance_charges_amount [Integer, nil] Any insurance being charged for the vehicle.
              #
              #   @param insurance_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance ch
              #
              #   @param no_show_indicator [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator, nil] An indicator that the cardholder is being billed for a reserved vehicle that was
              #
              #   @param one_way_drop_off_charges_amount [Integer, nil] Charges for returning the vehicle at a different location than where it was pick
              #
              #   @param one_way_drop_off_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way drop
              #
              #   @param renter_name [String, nil] Name of the person renting the vehicle.
              #
              #   @param weekly_rental_rate_amount [Integer, nil] Weekly rate being charged for the vehicle.
              #
              #   @param weekly_rental_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly renta

              # Additional charges (gas, late fee, etc.) being billed.
              #
              # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental#extra_charges
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                # No extra charge
                NO_EXTRA_CHARGE = :no_extra_charge

                # Gas
                GAS = :gas

                # Extra mileage
                EXTRA_MILEAGE = :extra_mileage

                # Late return
                LATE_RETURN = :late_return

                # One way service fee
                ONE_WAY_SERVICE_FEE = :one_way_service_fee

                # Parking violation
                PARKING_VIOLATION = :parking_violation

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              #
              # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::CarRental#no_show_indicator
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                # Not applicable
                NOT_APPLICABLE = :not_applicable

                # No show for specialized vehicle
                NO_SHOW_FOR_SPECIALIZED_VEHICLE = :no_show_for_specialized_vehicle

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails#lodging
            class Lodging < Increase::Internal::Type::BaseModel
              # @!attribute check_in_date
              #   Date the customer checked in.
              #
              #   @return [Date, nil]
              required :check_in_date, Date, nil?: true

              # @!attribute daily_room_rate_amount
              #   Daily rate being charged for the room.
              #
              #   @return [Integer, nil]
              required :daily_room_rate_amount, Integer, nil?: true

              # @!attribute daily_room_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
              #   rate.
              #
              #   @return [String, nil]
              required :daily_room_rate_currency, String, nil?: true

              # @!attribute extra_charges
              #   Additional charges (phone, late check-out, etc.) being billed.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges, nil]
              required :extra_charges,
                       enum: -> {
                         Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges
                       },
                       nil?: true

              # @!attribute folio_cash_advances_amount
              #   Folio cash advances for the room.
              #
              #   @return [Integer, nil]
              required :folio_cash_advances_amount, Integer, nil?: true

              # @!attribute folio_cash_advances_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
              #   advances.
              #
              #   @return [String, nil]
              required :folio_cash_advances_currency, String, nil?: true

              # @!attribute food_beverage_charges_amount
              #   Food and beverage charges for the room.
              #
              #   @return [Integer, nil]
              required :food_beverage_charges_amount, Integer, nil?: true

              # @!attribute food_beverage_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
              #   beverage charges.
              #
              #   @return [String, nil]
              required :food_beverage_charges_currency, String, nil?: true

              # @!attribute no_show_indicator
              #   Indicator that the cardholder is being billed for a reserved room that was not
              #   actually used.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator, nil]
              required :no_show_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator
                       },
                       nil?: true

              # @!attribute prepaid_expenses_amount
              #   Prepaid expenses being charged for the room.
              #
              #   @return [Integer, nil]
              required :prepaid_expenses_amount, Integer, nil?: true

              # @!attribute prepaid_expenses_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
              #   expenses.
              #
              #   @return [String, nil]
              required :prepaid_expenses_currency, String, nil?: true

              # @!attribute room_nights
              #   Number of nights the room was rented.
              #
              #   @return [Integer, nil]
              required :room_nights, Integer, nil?: true

              # @!attribute total_room_tax_amount
              #   Total room tax being charged.
              #
              #   @return [Integer, nil]
              required :total_room_tax_amount, Integer, nil?: true

              # @!attribute total_room_tax_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
              #   tax.
              #
              #   @return [String, nil]
              required :total_room_tax_currency, String, nil?: true

              # @!attribute total_tax_amount
              #   Total tax being charged for the room.
              #
              #   @return [Integer, nil]
              required :total_tax_amount, Integer, nil?: true

              # @!attribute total_tax_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
              #   assessed.
              #
              #   @return [String, nil]
              required :total_tax_currency, String, nil?: true

              # @!method initialize(check_in_date:, daily_room_rate_amount:, daily_room_rate_currency:, extra_charges:, folio_cash_advances_amount:, folio_cash_advances_currency:, food_beverage_charges_amount:, food_beverage_charges_currency:, no_show_indicator:, prepaid_expenses_amount:, prepaid_expenses_currency:, room_nights:, total_room_tax_amount:, total_room_tax_currency:, total_tax_amount:, total_tax_currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging}
              #   for more details.
              #
              #   Fields specific to lodging.
              #
              #   @param check_in_date [Date, nil] Date the customer checked in.
              #
              #   @param daily_room_rate_amount [Integer, nil] Daily rate being charged for the room.
              #
              #   @param daily_room_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room r
              #
              #   @param extra_charges [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::ExtraCharges, nil] Additional charges (phone, late check-out, etc.) being billed.
              #
              #   @param folio_cash_advances_amount [Integer, nil] Folio cash advances for the room.
              #
              #   @param folio_cash_advances_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash a
              #
              #   @param food_beverage_charges_amount [Integer, nil] Food and beverage charges for the room.
              #
              #   @param food_beverage_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and bev
              #
              #   @param no_show_indicator [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator, nil] Indicator that the cardholder is being billed for a reserved room that was not a
              #
              #   @param prepaid_expenses_amount [Integer, nil] Prepaid expenses being charged for the room.
              #
              #   @param prepaid_expenses_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid expe
              #
              #   @param room_nights [Integer, nil] Number of nights the room was rented.
              #
              #   @param total_room_tax_amount [Integer, nil] Total room tax being charged.
              #
              #   @param total_room_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room t
              #
              #   @param total_tax_amount [Integer, nil] Total tax being charged for the room.
              #
              #   @param total_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax as

              # Additional charges (phone, late check-out, etc.) being billed.
              #
              # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging#extra_charges
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                # No extra charge
                NO_EXTRA_CHARGE = :no_extra_charge

                # Restaurant
                RESTAURANT = :restaurant

                # Gift shop
                GIFT_SHOP = :gift_shop

                # Mini bar
                MINI_BAR = :mini_bar

                # Telephone
                TELEPHONE = :telephone

                # Other
                OTHER = :other

                # Laundry
                LAUNDRY = :laundry

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              #
              # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Lodging#no_show_indicator
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                # Not applicable
                NOT_APPLICABLE = :not_applicable

                # No show
                NO_SHOW = :no_show

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # The format of the purchase identifier.
            #
            # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails#purchase_identifier_format
            module PurchaseIdentifierFormat
              extend Increase::Internal::Type::Enum

              # Free text
              FREE_TEXT = :free_text

              # Order number
              ORDER_NUMBER = :order_number

              # Rental agreement number
              RENTAL_AGREEMENT_NUMBER = :rental_agreement_number

              # Hotel folio number
              HOTEL_FOLIO_NUMBER = :hotel_folio_number

              # Invoice number
              INVOICE_NUMBER = :invoice_number

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails#travel
            class Travel < Increase::Internal::Type::BaseModel
              # @!attribute ancillary
              #   Ancillary purchases in addition to the airfare.
              #
              #   @return [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary, nil]
              required :ancillary,
                       -> {
                         Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary
                       },
                       nil?: true

              # @!attribute computerized_reservation_system
              #   Indicates the computerized reservation system used to book the ticket.
              #
              #   @return [String, nil]
              required :computerized_reservation_system, String, nil?: true

              # @!attribute credit_reason_indicator
              #   Indicates the reason for a credit to the cardholder.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator, nil]
              required :credit_reason_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator
                       },
                       nil?: true

              # @!attribute departure_date
              #   Date of departure.
              #
              #   @return [Date, nil]
              required :departure_date, Date, nil?: true

              # @!attribute origination_city_airport_code
              #   Code for the originating city or airport.
              #
              #   @return [String, nil]
              required :origination_city_airport_code, String, nil?: true

              # @!attribute passenger_name
              #   Name of the passenger.
              #
              #   @return [String, nil]
              required :passenger_name, String, nil?: true

              # @!attribute restricted_ticket_indicator
              #   Indicates whether this ticket is non-refundable.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator, nil]
              required :restricted_ticket_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator
                       },
                       nil?: true

              # @!attribute ticket_change_indicator
              #   Indicates why a ticket was changed.
              #
              #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator, nil]
              required :ticket_change_indicator,
                       enum: -> {
                         Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator
                       },
                       nil?: true

              # @!attribute ticket_number
              #   Ticket number.
              #
              #   @return [String, nil]
              required :ticket_number, String, nil?: true

              # @!attribute travel_agency_code
              #   Code for the travel agency if the ticket was issued by a travel agency.
              #
              #   @return [String, nil]
              required :travel_agency_code, String, nil?: true

              # @!attribute travel_agency_name
              #   Name of the travel agency if the ticket was issued by a travel agency.
              #
              #   @return [String, nil]
              required :travel_agency_name, String, nil?: true

              # @!attribute trip_legs
              #   Fields specific to each leg of the journey.
              #
              #   @return [Array<Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg>, nil]
              required :trip_legs,
                       -> {
                         Increase::Internal::Type::ArrayOf[Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg]
                       },
                       nil?: true

              # @!method initialize(ancillary:, computerized_reservation_system:, credit_reason_indicator:, departure_date:, origination_city_airport_code:, passenger_name:, restricted_ticket_indicator:, ticket_change_indicator:, ticket_number:, travel_agency_code:, travel_agency_name:, trip_legs:)
              #   Fields specific to travel.
              #
              #   @param ancillary [Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary, nil] Ancillary purchases in addition to the airfare.
              #
              #   @param computerized_reservation_system [String, nil] Indicates the computerized reservation system used to book the ticket.
              #
              #   @param credit_reason_indicator [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator, nil] Indicates the reason for a credit to the cardholder.
              #
              #   @param departure_date [Date, nil] Date of departure.
              #
              #   @param origination_city_airport_code [String, nil] Code for the originating city or airport.
              #
              #   @param passenger_name [String, nil] Name of the passenger.
              #
              #   @param restricted_ticket_indicator [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator, nil] Indicates whether this ticket is non-refundable.
              #
              #   @param ticket_change_indicator [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator, nil] Indicates why a ticket was changed.
              #
              #   @param ticket_number [String, nil] Ticket number.
              #
              #   @param travel_agency_code [String, nil] Code for the travel agency if the ticket was issued by a travel agency.
              #
              #   @param travel_agency_name [String, nil] Name of the travel agency if the ticket was issued by a travel agency.
              #
              #   @param trip_legs [Array<Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg>, nil] Fields specific to each leg of the journey.

              # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel#ancillary
              class Ancillary < Increase::Internal::Type::BaseModel
                # @!attribute connected_ticket_document_number
                #   If this purchase has a connection or relationship to another purchase, such as a
                #   baggage fee for a passenger transport ticket, this field should contain the
                #   ticket document number for the other purchase.
                #
                #   @return [String, nil]
                required :connected_ticket_document_number, String, nil?: true

                # @!attribute credit_reason_indicator
                #   Indicates the reason for a credit to the cardholder.
                #
                #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator, nil]
                required :credit_reason_indicator,
                         enum: -> {
                           Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator
                         },
                         nil?: true

                # @!attribute passenger_name_or_description
                #   Name of the passenger or description of the ancillary purchase.
                #
                #   @return [String, nil]
                required :passenger_name_or_description, String, nil?: true

                # @!attribute services
                #   Additional travel charges, such as baggage fees.
                #
                #   @return [Array<Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service>]
                required :services,
                         -> {
                           Increase::Internal::Type::ArrayOf[Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service]
                         }

                # @!attribute ticket_document_number
                #   Ticket document number.
                #
                #   @return [String, nil]
                required :ticket_document_number, String, nil?: true

                # @!method initialize(connected_ticket_document_number:, credit_reason_indicator:, passenger_name_or_description:, services:, ticket_document_number:)
                #   Some parameter documentations has been truncated, see
                #   {Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary}
                #   for more details.
                #
                #   Ancillary purchases in addition to the airfare.
                #
                #   @param connected_ticket_document_number [String, nil] If this purchase has a connection or relationship to another purchase, such as a
                #
                #   @param credit_reason_indicator [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator, nil] Indicates the reason for a credit to the cardholder.
                #
                #   @param passenger_name_or_description [String, nil] Name of the passenger or description of the ancillary purchase.
                #
                #   @param services [Array<Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service>] Additional travel charges, such as baggage fees.
                #
                #   @param ticket_document_number [String, nil] Ticket document number.

                # Indicates the reason for a credit to the cardholder.
                #
                # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary#credit_reason_indicator
                module CreditReasonIndicator
                  extend Increase::Internal::Type::Enum

                  # No credit
                  NO_CREDIT = :no_credit

                  # Passenger transport ancillary purchase cancellation
                  PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    :passenger_transport_ancillary_purchase_cancellation

                  # Airline ticket and passenger transport ancillary purchase cancellation
                  AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation

                  # Other
                  OTHER = :other

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                class Service < Increase::Internal::Type::BaseModel
                  # @!attribute category
                  #   Category of the ancillary service.
                  #
                  #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category, nil]
                  required :category,
                           enum: -> {
                             Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category
                           },
                           nil?: true

                  # @!attribute sub_category
                  #   Sub-category of the ancillary service, free-form.
                  #
                  #   @return [String, nil]
                  required :sub_category, String, nil?: true

                  # @!method initialize(category:, sub_category:)
                  #   @param category [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category, nil] Category of the ancillary service.
                  #
                  #   @param sub_category [String, nil] Sub-category of the ancillary service, free-form.

                  # Category of the ancillary service.
                  #
                  # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::Ancillary::Service#category
                  module Category
                    extend Increase::Internal::Type::Enum

                    # None
                    NONE = :none

                    # Bundled service
                    BUNDLED_SERVICE = :bundled_service

                    # Baggage fee
                    BAGGAGE_FEE = :baggage_fee

                    # Change fee
                    CHANGE_FEE = :change_fee

                    # Cargo
                    CARGO = :cargo

                    # Carbon offset
                    CARBON_OFFSET = :carbon_offset

                    # Frequent flyer
                    FREQUENT_FLYER = :frequent_flyer

                    # Gift card
                    GIFT_CARD = :gift_card

                    # Ground transport
                    GROUND_TRANSPORT = :ground_transport

                    # In-flight entertainment
                    IN_FLIGHT_ENTERTAINMENT = :in_flight_entertainment

                    # Lounge
                    LOUNGE = :lounge

                    # Medical
                    MEDICAL = :medical

                    # Meal beverage
                    MEAL_BEVERAGE = :meal_beverage

                    # Other
                    OTHER = :other

                    # Passenger assist fee
                    PASSENGER_ASSIST_FEE = :passenger_assist_fee

                    # Pets
                    PETS = :pets

                    # Seat fees
                    SEAT_FEES = :seat_fees

                    # Standby
                    STANDBY = :standby

                    # Service fee
                    SERVICE_FEE = :service_fee

                    # Store
                    STORE = :store

                    # Travel service
                    TRAVEL_SERVICE = :travel_service

                    # Unaccompanied travel
                    UNACCOMPANIED_TRAVEL = :unaccompanied_travel

                    # Upgrades
                    UPGRADES = :upgrades

                    # Wi-fi
                    WIFI = :wifi

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end
              end

              # Indicates the reason for a credit to the cardholder.
              #
              # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel#credit_reason_indicator
              module CreditReasonIndicator
                extend Increase::Internal::Type::Enum

                # No credit
                NO_CREDIT = :no_credit

                # Passenger transport ancillary purchase cancellation
                PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  :passenger_transport_ancillary_purchase_cancellation

                # Airline ticket and passenger transport ancillary purchase cancellation
                AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation

                # Airline ticket cancellation
                AIRLINE_TICKET_CANCELLATION = :airline_ticket_cancellation

                # Other
                OTHER = :other

                # Partial refund of airline ticket
                PARTIAL_REFUND_OF_AIRLINE_TICKET = :partial_refund_of_airline_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicates whether this ticket is non-refundable.
              #
              # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel#restricted_ticket_indicator
              module RestrictedTicketIndicator
                extend Increase::Internal::Type::Enum

                # No restrictions
                NO_RESTRICTIONS = :no_restrictions

                # Restricted non-refundable ticket
                RESTRICTED_NON_REFUNDABLE_TICKET = :restricted_non_refundable_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicates why a ticket was changed.
              #
              # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel#ticket_change_indicator
              module TicketChangeIndicator
                extend Increase::Internal::Type::Enum

                # None
                NONE = :none

                # Change to existing ticket
                CHANGE_TO_EXISTING_TICKET = :change_to_existing_ticket

                # New ticket
                NEW_TICKET = :new_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              class TripLeg < Increase::Internal::Type::BaseModel
                # @!attribute carrier_code
                #   Carrier code (e.g., United Airlines, Jet Blue, etc.).
                #
                #   @return [String, nil]
                required :carrier_code, String, nil?: true

                # @!attribute destination_city_airport_code
                #   Code for the destination city or airport.
                #
                #   @return [String, nil]
                required :destination_city_airport_code, String, nil?: true

                # @!attribute fare_basis_code
                #   Fare basis code.
                #
                #   @return [String, nil]
                required :fare_basis_code, String, nil?: true

                # @!attribute flight_number
                #   Flight number.
                #
                #   @return [String, nil]
                required :flight_number, String, nil?: true

                # @!attribute service_class
                #   Service class (e.g., first class, business class, etc.).
                #
                #   @return [String, nil]
                required :service_class, String, nil?: true

                # @!attribute stop_over_code
                #   Indicates whether a stopover is allowed on this ticket.
                #
                #   @return [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode, nil]
                required :stop_over_code,
                         enum: -> {
                           Increase::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode
                         },
                         nil?: true

                # @!method initialize(carrier_code:, destination_city_airport_code:, fare_basis_code:, flight_number:, service_class:, stop_over_code:)
                #   @param carrier_code [String, nil] Carrier code (e.g., United Airlines, Jet Blue, etc.).
                #
                #   @param destination_city_airport_code [String, nil] Code for the destination city or airport.
                #
                #   @param fare_basis_code [String, nil] Fare basis code.
                #
                #   @param flight_number [String, nil] Flight number.
                #
                #   @param service_class [String, nil] Service class (e.g., first class, business class, etc.).
                #
                #   @param stop_over_code [Symbol, Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode, nil] Indicates whether a stopover is allowed on this ticket.

                # Indicates whether a stopover is allowed on this ticket.
                #
                # @see Increase::Models::Transaction::Source::CardSettlement::PurchaseDetails::Travel::TripLeg#stop_over_code
                module StopOverCode
                  extend Increase::Internal::Type::Enum

                  # None
                  NONE = :none

                  # Stop over allowed
                  STOP_OVER_ALLOWED = :stop_over_allowed

                  # Stop over not allowed
                  STOP_OVER_NOT_ALLOWED = :stop_over_not_allowed

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_settlement`.
          #
          # @see Increase::Models::Transaction::Source::CardSettlement#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_SETTLEMENT = :card_settlement

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#cashback_payment
        class CashbackPayment < Increase::Internal::Type::BaseModel
          # @!attribute accrued_on_card_id
          #   The card on which the cashback was accrued.
          #
          #   @return [String, nil]
          required :accrued_on_card_id, String, nil?: true

          # @!attribute amount
          #   The amount in the minor unit of the transaction's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #   currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CashbackPayment::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::CashbackPayment::Currency }

          # @!attribute period_end
          #   The end of the period for which this transaction paid cashback.
          #
          #   @return [Time]
          required :period_end, Time

          # @!attribute period_start
          #   The start of the period for which this transaction paid cashback.
          #
          #   @return [Time]
          required :period_start, Time

          # @!method initialize(accrued_on_card_id:, amount:, currency:, period_end:, period_start:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CashbackPayment} for more details.
          #
          #   A Cashback Payment object. This field will be present in the JSON response if
          #   and only if `category` is equal to `cashback_payment`. A Cashback Payment
          #   represents the cashback paid to a cardholder for a given period. Cashback is
          #   usually paid monthly for the prior month's transactions.
          #
          #   @param accrued_on_card_id [String, nil] The card on which the cashback was accrued.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's currency. For dollars, for exa
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::CashbackPayment::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #
          #   @param period_end [Time] The end of the period for which this transaction paid cashback.
          #
          #   @param period_start [Time] The start of the period for which this transaction paid cashback.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          #
          # @see Increase::Models::Transaction::Source::CashbackPayment#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        #
        # @see Increase::Models::Transaction::Source#category
        module Category
          extend Increase::Internal::Type::Enum

          # Account Transfer Intention: details will be under the `account_transfer_intention` object.
          ACCOUNT_TRANSFER_INTENTION = :account_transfer_intention

          # ACH Transfer Intention: details will be under the `ach_transfer_intention` object.
          ACH_TRANSFER_INTENTION = :ach_transfer_intention

          # ACH Transfer Rejection: details will be under the `ach_transfer_rejection` object.
          ACH_TRANSFER_REJECTION = :ach_transfer_rejection

          # ACH Transfer Return: details will be under the `ach_transfer_return` object.
          ACH_TRANSFER_RETURN = :ach_transfer_return

          # Cashback Payment: details will be under the `cashback_payment` object.
          CASHBACK_PAYMENT = :cashback_payment

          # Card Dispute Acceptance: details will be under the `card_dispute_acceptance` object.
          CARD_DISPUTE_ACCEPTANCE = :card_dispute_acceptance

          # Card Dispute Loss: details will be under the `card_dispute_loss` object.
          CARD_DISPUTE_LOSS = :card_dispute_loss

          # Card Refund: details will be under the `card_refund` object.
          CARD_REFUND = :card_refund

          # Card Settlement: details will be under the `card_settlement` object.
          CARD_SETTLEMENT = :card_settlement

          # Card Revenue Payment: details will be under the `card_revenue_payment` object.
          CARD_REVENUE_PAYMENT = :card_revenue_payment

          # Check Deposit Acceptance: details will be under the `check_deposit_acceptance` object.
          CHECK_DEPOSIT_ACCEPTANCE = :check_deposit_acceptance

          # Check Deposit Return: details will be under the `check_deposit_return` object.
          CHECK_DEPOSIT_RETURN = :check_deposit_return

          # Check Transfer Deposit: details will be under the `check_transfer_deposit` object.
          CHECK_TRANSFER_DEPOSIT = :check_transfer_deposit

          # Fee Payment: details will be under the `fee_payment` object.
          FEE_PAYMENT = :fee_payment

          # Inbound ACH Transfer Intention: details will be under the `inbound_ach_transfer` object.
          INBOUND_ACH_TRANSFER = :inbound_ach_transfer

          # Inbound ACH Transfer Return Intention: details will be under the `inbound_ach_transfer_return_intention` object.
          INBOUND_ACH_TRANSFER_RETURN_INTENTION = :inbound_ach_transfer_return_intention

          # Inbound Check Deposit Return Intention: details will be under the `inbound_check_deposit_return_intention` object.
          INBOUND_CHECK_DEPOSIT_RETURN_INTENTION = :inbound_check_deposit_return_intention

          # Inbound Check Adjustment: details will be under the `inbound_check_adjustment` object.
          INBOUND_CHECK_ADJUSTMENT = :inbound_check_adjustment

          # Inbound Real-Time Payments Transfer Confirmation: details will be under the `inbound_real_time_payments_transfer_confirmation` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_CONFIRMATION = :inbound_real_time_payments_transfer_confirmation

          # Inbound Real-Time Payments Transfer Decline: details will be under the `inbound_real_time_payments_transfer_decline` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_DECLINE = :inbound_real_time_payments_transfer_decline

          # Inbound Wire Reversal: details will be under the `inbound_wire_reversal` object.
          INBOUND_WIRE_REVERSAL = :inbound_wire_reversal

          # Inbound Wire Transfer Intention: details will be under the `inbound_wire_transfer` object.
          INBOUND_WIRE_TRANSFER = :inbound_wire_transfer

          # Inbound Wire Transfer Reversal Intention: details will be under the `inbound_wire_transfer_reversal` object.
          INBOUND_WIRE_TRANSFER_REVERSAL = :inbound_wire_transfer_reversal

          # Interest Payment: details will be under the `interest_payment` object.
          INTEREST_PAYMENT = :interest_payment

          # Internal Source: details will be under the `internal_source` object.
          INTERNAL_SOURCE = :internal_source

          # Real-Time Payments Transfer Acknowledgement: details will be under the `real_time_payments_transfer_acknowledgement` object.
          REAL_TIME_PAYMENTS_TRANSFER_ACKNOWLEDGEMENT = :real_time_payments_transfer_acknowledgement

          # Sample Funds: details will be under the `sample_funds` object.
          SAMPLE_FUNDS = :sample_funds

          # Wire Transfer Intention: details will be under the `wire_transfer_intention` object.
          WIRE_TRANSFER_INTENTION = :wire_transfer_intention

          # Swift Transfer Intention: details will be under the `swift_transfer_intention` object.
          SWIFT_TRANSFER_INTENTION = :swift_transfer_intention

          # Outbound Card Push Transfer Acceptance: details will be under the `outbound_card_push_transfer_acceptance` object.
          OUTBOUND_CARD_PUSH_TRANSFER_ACCEPTANCE = :outbound_card_push_transfer_acceptance

          # The Transaction was made for an undocumented or deprecated reason.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::Transaction::Source#check_deposit_acceptance
        class CheckDepositAcceptance < Increase::Internal::Type::BaseModel
          # @!attribute account_number
          #   The account number printed on the check.
          #
          #   @return [String]
          required :account_number, String

          # @!attribute amount
          #   The amount to be deposited in the minor unit of the transaction's currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute auxiliary_on_us
          #   An additional line of metadata printed on the check. This typically includes the
          #   check number for business checks.
          #
          #   @return [String, nil]
          required :auxiliary_on_us, String, nil?: true

          # @!attribute check_deposit_id
          #   The ID of the Check Deposit that was accepted.
          #
          #   @return [String]
          required :check_deposit_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CheckDepositAcceptance::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::CheckDepositAcceptance::Currency }

          # @!attribute routing_number
          #   The routing number printed on the check.
          #
          #   @return [String]
          required :routing_number, String

          # @!attribute serial_number
          #   The check serial number, if present, for consumer checks. For business checks,
          #   the serial number is usually in the `auxiliary_on_us` field.
          #
          #   @return [String, nil]
          required :serial_number, String, nil?: true

          # @!method initialize(account_number:, amount:, auxiliary_on_us:, check_deposit_id:, currency:, routing_number:, serial_number:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CheckDepositAcceptance} for more
          #   details.
          #
          #   A Check Deposit Acceptance object. This field will be present in the JSON
          #   response if and only if `category` is equal to `check_deposit_acceptance`. A
          #   Check Deposit Acceptance is created when a Check Deposit is processed and its
          #   details confirmed. Check Deposits may be returned by the receiving bank, which
          #   will appear as a Check Deposit Return.
          #
          #   @param account_number [String] The account number printed on the check.
          #
          #   @param amount [Integer] The amount to be deposited in the minor unit of the transaction's currency. For
          #
          #   @param auxiliary_on_us [String, nil] An additional line of metadata printed on the check. This typically includes the
          #
          #   @param check_deposit_id [String] The ID of the Check Deposit that was accepted.
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::CheckDepositAcceptance::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param routing_number [String] The routing number printed on the check.
          #
          #   @param serial_number [String, nil] The check serial number, if present, for consumer checks. For business checks, t

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          #
          # @see Increase::Models::Transaction::Source::CheckDepositAcceptance#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#check_deposit_return
        class CheckDepositReturn < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The returned amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute check_deposit_id
          #   The identifier of the Check Deposit that was returned.
          #
          #   @return [String]
          required :check_deposit_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CheckDepositReturn::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::CheckDepositReturn::Currency }

          # @!attribute return_reason
          #   Why this check was returned by the bank holding the account it was drawn
          #   against.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CheckDepositReturn::ReturnReason]
          required :return_reason,
                   enum: -> {
                     Increase::Transaction::Source::CheckDepositReturn::ReturnReason
                   }

          # @!attribute returned_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the check deposit was returned.
          #
          #   @return [Time]
          required :returned_at, Time

          # @!attribute transaction_id
          #   The identifier of the transaction that reversed the original check deposit
          #   transaction.
          #
          #   @return [String]
          required :transaction_id, String

          # @!method initialize(amount:, check_deposit_id:, currency:, return_reason:, returned_at:, transaction_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CheckDepositReturn} for more details.
          #
          #   A Check Deposit Return object. This field will be present in the JSON response
          #   if and only if `category` is equal to `check_deposit_return`. A Check Deposit
          #   Return is created when a Check Deposit is returned by the bank holding the
          #   account it was drawn against. Check Deposits may be returned for a variety of
          #   reasons, including insufficient funds or a mismatched account number. Usually,
          #   checks are returned within the first 7 days after the deposit is made.
          #
          #   @param amount [Integer] The returned amount in USD cents.
          #
          #   @param check_deposit_id [String] The identifier of the Check Deposit that was returned.
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::CheckDepositReturn::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param return_reason [Symbol, Increase::Models::Transaction::Source::CheckDepositReturn::ReturnReason] Why this check was returned by the bank holding the account it was drawn against
          #
          #   @param returned_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param transaction_id [String] The identifier of the transaction that reversed the original check deposit trans

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          #
          # @see Increase::Models::Transaction::Source::CheckDepositReturn#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Why this check was returned by the bank holding the account it was drawn
          # against.
          #
          # @see Increase::Models::Transaction::Source::CheckDepositReturn#return_reason
          module ReturnReason
            extend Increase::Internal::Type::Enum

            # The check doesn't allow ACH conversion.
            ACH_CONVERSION_NOT_SUPPORTED = :ach_conversion_not_supported

            # The account is closed. (Check21 return code `D`)
            CLOSED_ACCOUNT = :closed_account

            # The check has already been deposited. (Check21 return code `Y`)
            DUPLICATE_SUBMISSION = :duplicate_submission

            # Insufficient funds (Check21 return code `A`)
            INSUFFICIENT_FUNDS = :insufficient_funds

            # No account was found matching the check details. (Check21 return code `E`)
            NO_ACCOUNT = :no_account

            # The check was not authorized. (Check21 return code `Q`)
            NOT_AUTHORIZED = :not_authorized

            # The check is too old. (Check21 return code `G`)
            STALE_DATED = :stale_dated

            # The payment has been stopped by the account holder. (Check21 return code `C`)
            STOP_PAYMENT = :stop_payment

            # The reason for the return is unknown.
            UNKNOWN_REASON = :unknown_reason

            # The image doesn't match the details submitted.
            UNMATCHED_DETAILS = :unmatched_details

            # The image could not be read. (Check21 return code `U`)
            UNREADABLE_IMAGE = :unreadable_image

            # The check endorsement was irregular. (Check21 return code `J`)
            ENDORSEMENT_IRREGULAR = :endorsement_irregular

            # The check present was either altered or fake. (Check21 return code `N`)
            ALTERED_OR_FICTITIOUS_ITEM = :altered_or_fictitious_item

            # The account this check is drawn on is frozen. (Check21 return code `F`)
            FROZEN_OR_BLOCKED_ACCOUNT = :frozen_or_blocked_account

            # The check is post dated. (Check21 return code `H`)
            POST_DATED = :post_dated

            # The endorsement was missing. (Check21 return code `I`)
            ENDORSEMENT_MISSING = :endorsement_missing

            # The check signature was missing. (Check21 return code `K`)
            SIGNATURE_MISSING = :signature_missing

            # The bank suspects a stop payment will be placed. (Check21 return code `T`)
            STOP_PAYMENT_SUSPECT = :stop_payment_suspect

            # The bank cannot read the image. (Check21 return code `U`)
            UNUSABLE_IMAGE = :unusable_image

            # The check image fails the bank's security check. (Check21 return code `V`)
            IMAGE_FAILS_SECURITY_CHECK = :image_fails_security_check

            # The bank cannot determine the amount. (Check21 return code `W`)
            CANNOT_DETERMINE_AMOUNT = :cannot_determine_amount

            # The signature is inconsistent with prior signatures. (Check21 return code `L`)
            SIGNATURE_IRREGULAR = :signature_irregular

            # The check is a non-cash item and cannot be drawn against the account. (Check21 return code `M`)
            NON_CASH_ITEM = :non_cash_item

            # The bank is unable to process this check. (Check21 return code `O`)
            UNABLE_TO_PROCESS = :unable_to_process

            # The check exceeds the bank or customer's limit. (Check21 return code `P`)
            ITEM_EXCEEDS_DOLLAR_LIMIT = :item_exceeds_dollar_limit

            # The bank sold this account and no longer services this customer. (Check21 return code `R`)
            BRANCH_OR_ACCOUNT_SOLD = :branch_or_account_sold

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#check_transfer_deposit
        class CheckTransferDeposit < Increase::Internal::Type::BaseModel
          # @!attribute back_image_file_id
          #   The identifier of the API File object containing an image of the back of the
          #   deposited check.
          #
          #   @return [String, nil]
          required :back_image_file_id, String, nil?: true

          # @!attribute bank_of_first_deposit_routing_number
          #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
          #   bank depositing this check. In some rare cases, this is not transmitted via
          #   Check21 and the value will be null.
          #
          #   @return [String, nil]
          required :bank_of_first_deposit_routing_number, String, nil?: true

          # @!attribute deposited_at
          #   When the check was deposited.
          #
          #   @return [Time]
          required :deposited_at, Time

          # @!attribute front_image_file_id
          #   The identifier of the API File object containing an image of the front of the
          #   deposited check.
          #
          #   @return [String, nil]
          required :front_image_file_id, String, nil?: true

          # @!attribute inbound_check_deposit_id
          #   The identifier of the Inbound Check Deposit object associated with this
          #   transaction.
          #
          #   @return [String, nil]
          required :inbound_check_deposit_id, String, nil?: true

          # @!attribute transaction_id
          #   The identifier of the Transaction object created when the check was deposited.
          #
          #   @return [String, nil]
          required :transaction_id, String, nil?: true

          # @!attribute transfer_id
          #   The identifier of the Check Transfer object that was deposited.
          #
          #   @return [String, nil]
          required :transfer_id, String, nil?: true

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `check_transfer_deposit`.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::CheckTransferDeposit::Type]
          required :type, enum: -> { Increase::Transaction::Source::CheckTransferDeposit::Type }

          # @!method initialize(back_image_file_id:, bank_of_first_deposit_routing_number:, deposited_at:, front_image_file_id:, inbound_check_deposit_id:, transaction_id:, transfer_id:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::CheckTransferDeposit} for more details.
          #
          #   A Check Transfer Deposit object. This field will be present in the JSON response
          #   if and only if `category` is equal to `check_transfer_deposit`. An Inbound Check
          #   is a check drawn on an Increase account that has been deposited by an external
          #   bank account. These types of checks are not pre-registered.
          #
          #   @param back_image_file_id [String, nil] The identifier of the API File object containing an image of the back of the dep
          #
          #   @param bank_of_first_deposit_routing_number [String, nil] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the ban
          #
          #   @param deposited_at [Time] When the check was deposited.
          #
          #   @param front_image_file_id [String, nil] The identifier of the API File object containing an image of the front of the de
          #
          #   @param inbound_check_deposit_id [String, nil] The identifier of the Inbound Check Deposit object associated with this transact
          #
          #   @param transaction_id [String, nil] The identifier of the Transaction object created when the check was deposited.
          #
          #   @param transfer_id [String, nil] The identifier of the Check Transfer object that was deposited.
          #
          #   @param type [Symbol, Increase::Models::Transaction::Source::CheckTransferDeposit::Type] A constant representing the object's type. For this resource it will always be `

          # A constant representing the object's type. For this resource it will always be
          # `check_transfer_deposit`.
          #
          # @see Increase::Models::Transaction::Source::CheckTransferDeposit#type
          module Type
            extend Increase::Internal::Type::Enum

            CHECK_TRANSFER_DEPOSIT = :check_transfer_deposit

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#fee_payment
        class FeePayment < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The amount in the minor unit of the transaction's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #   currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::FeePayment::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::FeePayment::Currency }

          # @!attribute fee_period_start
          #   The start of this payment's fee period, usually the first day of a month.
          #
          #   @return [Date]
          required :fee_period_start, Date

          # @!attribute program_id
          #   The Program for which this fee was incurred.
          #
          #   @return [String, nil]
          required :program_id, String, nil?: true

          # @!method initialize(amount:, currency:, fee_period_start:, program_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::FeePayment} for more details.
          #
          #   A Fee Payment object. This field will be present in the JSON response if and
          #   only if `category` is equal to `fee_payment`. A Fee Payment represents a payment
          #   made to Increase.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's currency. For dollars, for exa
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::FeePayment::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #
          #   @param fee_period_start [Date] The start of this payment's fee period, usually the first day of a month.
          #
          #   @param program_id [String, nil] The Program for which this fee was incurred.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          #
          # @see Increase::Models::Transaction::Source::FeePayment#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#inbound_ach_transfer
        class InboundACHTransfer < Increase::Internal::Type::BaseModel
          # @!attribute addenda
          #   Additional information sent from the originator.
          #
          #   @return [Increase::Models::Transaction::Source::InboundACHTransfer::Addenda, nil]
          required :addenda, -> { Increase::Transaction::Source::InboundACHTransfer::Addenda }, nil?: true

          # @!attribute amount
          #   The transfer amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute originator_company_descriptive_date
          #   The description of the date of the transfer, usually in the format `YYMMDD`.
          #
          #   @return [String, nil]
          required :originator_company_descriptive_date, String, nil?: true

          # @!attribute originator_company_discretionary_data
          #   Data set by the originator.
          #
          #   @return [String, nil]
          required :originator_company_discretionary_data, String, nil?: true

          # @!attribute originator_company_entry_description
          #   An informational description of the transfer.
          #
          #   @return [String]
          required :originator_company_entry_description, String

          # @!attribute originator_company_id
          #   An identifier for the originating company. This is generally, but not always, a
          #   stable identifier across multiple transfers.
          #
          #   @return [String]
          required :originator_company_id, String

          # @!attribute originator_company_name
          #   A name set by the originator to identify themselves.
          #
          #   @return [String]
          required :originator_company_name, String

          # @!attribute receiver_id_number
          #   The originator's identifier for the transfer recipient.
          #
          #   @return [String, nil]
          required :receiver_id_number, String, nil?: true

          # @!attribute receiver_name
          #   The name of the transfer recipient. This value is informational and not verified
          #   by Increase.
          #
          #   @return [String, nil]
          required :receiver_name, String, nil?: true

          # @!attribute trace_number
          #   A 15 digit number recorded in the Nacha file and available to both the
          #   originating and receiving bank. Along with the amount, date, and originating
          #   routing number, this can be used to identify the ACH transfer at either bank.
          #   ACH trace numbers are not unique, but are
          #   [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
          #
          #   @return [String]
          required :trace_number, String

          # @!attribute transfer_id
          #   The Inbound ACH Transfer's identifier.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(addenda:, amount:, originator_company_descriptive_date:, originator_company_discretionary_data:, originator_company_entry_description:, originator_company_id:, originator_company_name:, receiver_id_number:, receiver_name:, trace_number:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::InboundACHTransfer} for more details.
          #
          #   An Inbound ACH Transfer Intention object. This field will be present in the JSON
          #   response if and only if `category` is equal to `inbound_ach_transfer`. An
          #   Inbound ACH Transfer Intention is created when an ACH transfer is initiated at
          #   another bank and received by Increase.
          #
          #   @param addenda [Increase::Models::Transaction::Source::InboundACHTransfer::Addenda, nil] Additional information sent from the originator.
          #
          #   @param amount [Integer] The transfer amount in USD cents.
          #
          #   @param originator_company_descriptive_date [String, nil] The description of the date of the transfer, usually in the format `YYMMDD`.
          #
          #   @param originator_company_discretionary_data [String, nil] Data set by the originator.
          #
          #   @param originator_company_entry_description [String] An informational description of the transfer.
          #
          #   @param originator_company_id [String] An identifier for the originating company. This is generally, but not always, a
          #
          #   @param originator_company_name [String] A name set by the originator to identify themselves.
          #
          #   @param receiver_id_number [String, nil] The originator's identifier for the transfer recipient.
          #
          #   @param receiver_name [String, nil] The name of the transfer recipient. This value is informational and not verified
          #
          #   @param trace_number [String] A 15 digit number recorded in the Nacha file and available to both the originati
          #
          #   @param transfer_id [String] The Inbound ACH Transfer's identifier.

          # @see Increase::Models::Transaction::Source::InboundACHTransfer#addenda
          class Addenda < Increase::Internal::Type::BaseModel
            # @!attribute category
            #   The type of addendum.
            #
            #   @return [Symbol, Increase::Models::Transaction::Source::InboundACHTransfer::Addenda::Category]
            required :category,
                     enum: -> {
                       Increase::Transaction::Source::InboundACHTransfer::Addenda::Category
                     }

            # @!attribute freeform
            #   Unstructured `payment_related_information` passed through by the originator.
            #
            #   @return [Increase::Models::Transaction::Source::InboundACHTransfer::Addenda::Freeform, nil]
            required :freeform,
                     -> { Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform },
                     nil?: true

            # @!method initialize(category:, freeform:)
            #   Additional information sent from the originator.
            #
            #   @param category [Symbol, Increase::Models::Transaction::Source::InboundACHTransfer::Addenda::Category] The type of addendum.
            #
            #   @param freeform [Increase::Models::Transaction::Source::InboundACHTransfer::Addenda::Freeform, nil] Unstructured `payment_related_information` passed through by the originator.

            # The type of addendum.
            #
            # @see Increase::Models::Transaction::Source::InboundACHTransfer::Addenda#category
            module Category
              extend Increase::Internal::Type::Enum

              # Unstructured addendum.
              FREEFORM = :freeform

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::Transaction::Source::InboundACHTransfer::Addenda#freeform
            class Freeform < Increase::Internal::Type::BaseModel
              # @!attribute entries
              #   Each entry represents an addendum received from the originator.
              #
              #   @return [Array<Increase::Models::Transaction::Source::InboundACHTransfer::Addenda::Freeform::Entry>]
              required :entries,
                       -> {
                         Increase::Internal::Type::ArrayOf[Increase::Transaction::Source::InboundACHTransfer::Addenda::Freeform::Entry]
                       }

              # @!method initialize(entries:)
              #   Unstructured `payment_related_information` passed through by the originator.
              #
              #   @param entries [Array<Increase::Models::Transaction::Source::InboundACHTransfer::Addenda::Freeform::Entry>] Each entry represents an addendum received from the originator.

              class Entry < Increase::Internal::Type::BaseModel
                # @!attribute payment_related_information
                #   The payment related information passed in the addendum.
                #
                #   @return [String]
                required :payment_related_information, String

                # @!method initialize(payment_related_information:)
                #   @param payment_related_information [String] The payment related information passed in the addendum.
              end
            end
          end
        end

        # @see Increase::Models::Transaction::Source#inbound_ach_transfer_return_intention
        class InboundACHTransferReturnIntention < Increase::Internal::Type::BaseModel
          # @!attribute inbound_ach_transfer_id
          #   The ID of the Inbound ACH Transfer that is being returned.
          #
          #   @return [String]
          required :inbound_ach_transfer_id, String

          # @!method initialize(inbound_ach_transfer_id:)
          #   An Inbound ACH Transfer Return Intention object. This field will be present in
          #   the JSON response if and only if `category` is equal to
          #   `inbound_ach_transfer_return_intention`. An Inbound ACH Transfer Return
          #   Intention is created when an ACH transfer is initiated at another bank and
          #   returned by Increase.
          #
          #   @param inbound_ach_transfer_id [String] The ID of the Inbound ACH Transfer that is being returned.
        end

        # @see Increase::Models::Transaction::Source#inbound_check_adjustment
        class InboundCheckAdjustment < Increase::Internal::Type::BaseModel
          # @!attribute adjusted_transaction_id
          #   The ID of the transaction that was adjusted.
          #
          #   @return [String]
          required :adjusted_transaction_id, String

          # @!attribute amount
          #   The amount of the check adjustment.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute reason
          #   The reason for the adjustment.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::InboundCheckAdjustment::Reason]
          required :reason, enum: -> { Increase::Transaction::Source::InboundCheckAdjustment::Reason }

          # @!method initialize(adjusted_transaction_id:, amount:, reason:)
          #   An Inbound Check Adjustment object. This field will be present in the JSON
          #   response if and only if `category` is equal to `inbound_check_adjustment`. An
          #   Inbound Check Adjustment is created when Increase receives an adjustment for a
          #   check or return deposited through Check21.
          #
          #   @param adjusted_transaction_id [String] The ID of the transaction that was adjusted.
          #
          #   @param amount [Integer] The amount of the check adjustment.
          #
          #   @param reason [Symbol, Increase::Models::Transaction::Source::InboundCheckAdjustment::Reason] The reason for the adjustment.

          # The reason for the adjustment.
          #
          # @see Increase::Models::Transaction::Source::InboundCheckAdjustment#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The return was initiated too late and the receiving institution has responded with a Late Return Claim.
            LATE_RETURN = :late_return

            # The check was deposited to the wrong payee and the depositing institution has reimbursed the funds with a Wrong Payee Credit.
            WRONG_PAYEE_CREDIT = :wrong_payee_credit

            # The check was deposited with a different amount than what was written on the check.
            ADJUSTED_AMOUNT = :adjusted_amount

            # The recipient was not able to process the check. This usually happens for e.g., low quality images.
            NON_CONFORMING_ITEM = :non_conforming_item

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#inbound_check_deposit_return_intention
        class InboundCheckDepositReturnIntention < Increase::Internal::Type::BaseModel
          # @!attribute inbound_check_deposit_id
          #   The ID of the Inbound Check Deposit that is being returned.
          #
          #   @return [String]
          required :inbound_check_deposit_id, String

          # @!attribute transfer_id
          #   The identifier of the Check Transfer object that was deposited.
          #
          #   @return [String, nil]
          required :transfer_id, String, nil?: true

          # @!method initialize(inbound_check_deposit_id:, transfer_id:)
          #   An Inbound Check Deposit Return Intention object. This field will be present in
          #   the JSON response if and only if `category` is equal to
          #   `inbound_check_deposit_return_intention`. An Inbound Check Deposit Return
          #   Intention is created when Increase receives an Inbound Check and the User
          #   requests that it be returned.
          #
          #   @param inbound_check_deposit_id [String] The ID of the Inbound Check Deposit that is being returned.
          #
          #   @param transfer_id [String, nil] The identifier of the Check Transfer object that was deposited.
        end

        # @see Increase::Models::Transaction::Source#inbound_real_time_payments_transfer_confirmation
        class InboundRealTimePaymentsTransferConfirmation < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The amount in the minor unit of the transfer's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute creditor_name
          #   The name the sender of the transfer specified as the recipient of the transfer.
          #
          #   @return [String]
          required :creditor_name, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
          #   currency. This will always be "USD" for a Real-Time Payments transfer.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency]
          required :currency,
                   enum: -> {
                     Increase::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency
                   }

          # @!attribute debtor_account_number
          #   The account number of the account that sent the transfer.
          #
          #   @return [String]
          required :debtor_account_number, String

          # @!attribute debtor_name
          #   The name provided by the sender of the transfer.
          #
          #   @return [String]
          required :debtor_name, String

          # @!attribute debtor_routing_number
          #   The routing number of the account that sent the transfer.
          #
          #   @return [String]
          required :debtor_routing_number, String

          # @!attribute remittance_information
          #   Additional information included with the transfer.
          #
          #   @return [String, nil]
          required :remittance_information, String, nil?: true

          # @!attribute transaction_identification
          #   The Real-Time Payments network identification of the transfer.
          #
          #   @return [String]
          required :transaction_identification, String

          # @!attribute transfer_id
          #   The identifier of the Real-Time Payments Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, creditor_name:, currency:, debtor_account_number:, debtor_name:, debtor_routing_number:, remittance_information:, transaction_identification:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferConfirmation}
          #   for more details.
          #
          #   An Inbound Real-Time Payments Transfer Confirmation object. This field will be
          #   present in the JSON response if and only if `category` is equal to
          #   `inbound_real_time_payments_transfer_confirmation`. An Inbound Real-Time
          #   Payments Transfer Confirmation is created when a Real-Time Payments transfer is
          #   initiated at another bank and received by Increase.
          #
          #   @param amount [Integer] The amount in the minor unit of the transfer's currency. For dollars, for exampl
          #
          #   @param creditor_name [String] The name the sender of the transfer specified as the recipient of the transfer.
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferConfirmation::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's cu
          #
          #   @param debtor_account_number [String] The account number of the account that sent the transfer.
          #
          #   @param debtor_name [String] The name provided by the sender of the transfer.
          #
          #   @param debtor_routing_number [String] The routing number of the account that sent the transfer.
          #
          #   @param remittance_information [String, nil] Additional information included with the transfer.
          #
          #   @param transaction_identification [String] The Real-Time Payments network identification of the transfer.
          #
          #   @param transfer_id [String] The identifier of the Real-Time Payments Transfer that led to this Transaction.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
          # currency. This will always be "USD" for a Real-Time Payments transfer.
          #
          # @see Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferConfirmation#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#inbound_real_time_payments_transfer_decline
        class InboundRealTimePaymentsTransferDecline < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The declined amount in the minor unit of the destination account currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute creditor_name
          #   The name the sender of the transfer specified as the recipient of the transfer.
          #
          #   @return [String]
          required :creditor_name, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
          #   transfer's currency. This will always be "USD" for a Real-Time Payments
          #   transfer.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline::Currency]
          required :currency,
                   enum: -> {
                     Increase::Transaction::Source::InboundRealTimePaymentsTransferDecline::Currency
                   }

          # @!attribute debtor_account_number
          #   The account number of the account that sent the transfer.
          #
          #   @return [String]
          required :debtor_account_number, String

          # @!attribute debtor_name
          #   The name provided by the sender of the transfer.
          #
          #   @return [String]
          required :debtor_name, String

          # @!attribute debtor_routing_number
          #   The routing number of the account that sent the transfer.
          #
          #   @return [String]
          required :debtor_routing_number, String

          # @!attribute reason
          #   Why the transfer was declined.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline::Reason]
          required :reason,
                   enum: -> { Increase::Transaction::Source::InboundRealTimePaymentsTransferDecline::Reason }

          # @!attribute remittance_information
          #   Additional information included with the transfer.
          #
          #   @return [String, nil]
          required :remittance_information, String, nil?: true

          # @!attribute transaction_identification
          #   The Real-Time Payments network identification of the declined transfer.
          #
          #   @return [String]
          required :transaction_identification, String

          # @!attribute transfer_id
          #   The identifier of the Real-Time Payments Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, creditor_name:, currency:, debtor_account_number:, debtor_name:, debtor_routing_number:, reason:, remittance_information:, transaction_identification:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline}
          #   for more details.
          #
          #   An Inbound Real-Time Payments Transfer Decline object. This field will be
          #   present in the JSON response if and only if `category` is equal to
          #   `inbound_real_time_payments_transfer_decline`.
          #
          #   @param amount [Integer] The declined amount in the minor unit of the destination account currency. For d
          #
          #   @param creditor_name [String] The name the sender of the transfer specified as the recipient of the transfer.
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined tran
          #
          #   @param debtor_account_number [String] The account number of the account that sent the transfer.
          #
          #   @param debtor_name [String] The name provided by the sender of the transfer.
          #
          #   @param debtor_routing_number [String] The routing number of the account that sent the transfer.
          #
          #   @param reason [Symbol, Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline::Reason] Why the transfer was declined.
          #
          #   @param remittance_information [String, nil] Additional information included with the transfer.
          #
          #   @param transaction_identification [String] The Real-Time Payments network identification of the declined transfer.
          #
          #   @param transfer_id [String] The identifier of the Real-Time Payments Transfer that led to this Transaction.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
          # transfer's currency. This will always be "USD" for a Real-Time Payments
          # transfer.
          #
          # @see Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Why the transfer was declined.
          #
          # @see Increase::Models::Transaction::Source::InboundRealTimePaymentsTransferDecline#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED = :account_number_canceled

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED = :account_number_disabled

            # Your account is restricted.
            ACCOUNT_RESTRICTED = :account_restricted

            # Your account is inactive.
            GROUP_LOCKED = :group_locked

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE = :entity_not_active

            # Your account is not enabled to receive Real-Time Payments transfers.
            REAL_TIME_PAYMENTS_NOT_ENABLED = :real_time_payments_not_enabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#inbound_wire_reversal
        class InboundWireReversal < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The amount that was reversed in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute created_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the reversal was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute description
          #   The description on the reversal message from Fedwire, set by the reversing bank.
          #
          #   @return [String]
          required :description, String

          # @!attribute financial_institution_to_financial_institution_information
          #   Additional financial institution information included in the wire reversal.
          #
          #   @return [String, nil]
          required :financial_institution_to_financial_institution_information, String, nil?: true

          # @!attribute input_cycle_date
          #   The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00
          #   PM Eastern Time on the evening before the `cycle date`.
          #
          #   @return [Date]
          required :input_cycle_date, Date

          # @!attribute input_message_accountability_data
          #   The Fedwire transaction identifier.
          #
          #   @return [String]
          required :input_message_accountability_data, String

          # @!attribute input_sequence_number
          #   The Fedwire sequence number.
          #
          #   @return [String]
          required :input_sequence_number, String

          # @!attribute input_source
          #   The Fedwire input source identifier.
          #
          #   @return [String]
          required :input_source, String

          # @!attribute originator_routing_number
          #   The American Banking Association (ABA) routing number of the bank originating
          #   the transfer.
          #
          #   @return [String, nil]
          required :originator_routing_number, String, nil?: true

          # @!attribute previous_message_input_cycle_date
          #   The Fedwire cycle date for the wire transfer that is being reversed by this
          #   message.
          #
          #   @return [Date]
          required :previous_message_input_cycle_date, Date

          # @!attribute previous_message_input_message_accountability_data
          #   The Fedwire transaction identifier for the wire transfer that was reversed.
          #
          #   @return [String]
          required :previous_message_input_message_accountability_data, String

          # @!attribute previous_message_input_sequence_number
          #   The Fedwire sequence number for the wire transfer that was reversed.
          #
          #   @return [String]
          required :previous_message_input_sequence_number, String

          # @!attribute previous_message_input_source
          #   The Fedwire input source identifier for the wire transfer that was reversed.
          #
          #   @return [String]
          required :previous_message_input_source, String

          # @!attribute receiver_financial_institution_information
          #   Information included in the wire reversal for the receiving financial
          #   institution.
          #
          #   @return [String, nil]
          required :receiver_financial_institution_information, String, nil?: true

          # @!attribute sender_reference
          #   The sending bank's reference number for the wire reversal.
          #
          #   @return [String, nil]
          required :sender_reference, String, nil?: true

          # @!attribute transaction_id
          #   The ID for the Transaction associated with the transfer reversal.
          #
          #   @return [String]
          required :transaction_id, String

          # @!attribute wire_transfer_id
          #   The ID for the Wire Transfer that is being reversed.
          #
          #   @return [String]
          required :wire_transfer_id, String

          # @!method initialize(amount:, created_at:, description:, financial_institution_to_financial_institution_information:, input_cycle_date:, input_message_accountability_data:, input_sequence_number:, input_source:, originator_routing_number:, previous_message_input_cycle_date:, previous_message_input_message_accountability_data:, previous_message_input_sequence_number:, previous_message_input_source:, receiver_financial_institution_information:, sender_reference:, transaction_id:, wire_transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::InboundWireReversal} for more details.
          #
          #   An Inbound Wire Reversal object. This field will be present in the JSON response
          #   if and only if `category` is equal to `inbound_wire_reversal`. An Inbound Wire
          #   Reversal represents a reversal of a wire transfer that was initiated via
          #   Increase. The other bank is sending the money back. This most often happens when
          #   the original destination account details were incorrect.
          #
          #   @param amount [Integer] The amount that was reversed in USD cents.
          #
          #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param description [String] The description on the reversal message from Fedwire, set by the reversing bank.
          #
          #   @param financial_institution_to_financial_institution_information [String, nil] Additional financial institution information included in the wire reversal.
          #
          #   @param input_cycle_date [Date] The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00 P
          #
          #   @param input_message_accountability_data [String] The Fedwire transaction identifier.
          #
          #   @param input_sequence_number [String] The Fedwire sequence number.
          #
          #   @param input_source [String] The Fedwire input source identifier.
          #
          #   @param originator_routing_number [String, nil] The American Banking Association (ABA) routing number of the bank originating th
          #
          #   @param previous_message_input_cycle_date [Date] The Fedwire cycle date for the wire transfer that is being reversed by this mess
          #
          #   @param previous_message_input_message_accountability_data [String] The Fedwire transaction identifier for the wire transfer that was reversed.
          #
          #   @param previous_message_input_sequence_number [String] The Fedwire sequence number for the wire transfer that was reversed.
          #
          #   @param previous_message_input_source [String] The Fedwire input source identifier for the wire transfer that was reversed.
          #
          #   @param receiver_financial_institution_information [String, nil] Information included in the wire reversal for the receiving financial institutio
          #
          #   @param sender_reference [String, nil] The sending bank's reference number for the wire reversal.
          #
          #   @param transaction_id [String] The ID for the Transaction associated with the transfer reversal.
          #
          #   @param wire_transfer_id [String] The ID for the Wire Transfer that is being reversed.
        end

        # @see Increase::Models::Transaction::Source#inbound_wire_transfer
        class InboundWireTransfer < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute beneficiary_address_line1
          #   A free-form address field set by the sender.
          #
          #   @return [String, nil]
          required :beneficiary_address_line1, String, nil?: true

          # @!attribute beneficiary_address_line2
          #   A free-form address field set by the sender.
          #
          #   @return [String, nil]
          required :beneficiary_address_line2, String, nil?: true

          # @!attribute beneficiary_address_line3
          #   A free-form address field set by the sender.
          #
          #   @return [String, nil]
          required :beneficiary_address_line3, String, nil?: true

          # @!attribute beneficiary_name
          #   A name set by the sender.
          #
          #   @return [String, nil]
          required :beneficiary_name, String, nil?: true

          # @!attribute beneficiary_reference
          #   A free-form reference string set by the sender, to help identify the transfer.
          #
          #   @return [String, nil]
          required :beneficiary_reference, String, nil?: true

          # @!attribute description
          #   An Increase-constructed description of the transfer.
          #
          #   @return [String]
          required :description, String

          # @!attribute input_message_accountability_data
          #   A unique identifier available to the originating and receiving banks, commonly
          #   abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
          #   service and is helpful when debugging wires with the originating bank.
          #
          #   @return [String, nil]
          required :input_message_accountability_data, String, nil?: true

          # @!attribute originator_address_line1
          #   The address of the wire originator, set by the sending bank.
          #
          #   @return [String, nil]
          required :originator_address_line1, String, nil?: true

          # @!attribute originator_address_line2
          #   The address of the wire originator, set by the sending bank.
          #
          #   @return [String, nil]
          required :originator_address_line2, String, nil?: true

          # @!attribute originator_address_line3
          #   The address of the wire originator, set by the sending bank.
          #
          #   @return [String, nil]
          required :originator_address_line3, String, nil?: true

          # @!attribute originator_name
          #   The originator of the wire, set by the sending bank.
          #
          #   @return [String, nil]
          required :originator_name, String, nil?: true

          # @!attribute originator_routing_number
          #   The American Banking Association (ABA) routing number of the bank originating
          #   the transfer.
          #
          #   @return [String, nil]
          required :originator_routing_number, String, nil?: true

          # @!attribute originator_to_beneficiary_information
          #   An Increase-created concatenation of the Originator-to-Beneficiary lines.
          #
          #   @return [String, nil]
          required :originator_to_beneficiary_information, String, nil?: true

          # @!attribute originator_to_beneficiary_information_line1
          #   A free-form message set by the wire originator.
          #
          #   @return [String, nil]
          required :originator_to_beneficiary_information_line1, String, nil?: true

          # @!attribute originator_to_beneficiary_information_line2
          #   A free-form message set by the wire originator.
          #
          #   @return [String, nil]
          required :originator_to_beneficiary_information_line2, String, nil?: true

          # @!attribute originator_to_beneficiary_information_line3
          #   A free-form message set by the wire originator.
          #
          #   @return [String, nil]
          required :originator_to_beneficiary_information_line3, String, nil?: true

          # @!attribute originator_to_beneficiary_information_line4
          #   A free-form message set by the wire originator.
          #
          #   @return [String, nil]
          required :originator_to_beneficiary_information_line4, String, nil?: true

          # @!attribute transfer_id
          #   The ID of the Inbound Wire Transfer object that resulted in this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, beneficiary_address_line1:, beneficiary_address_line2:, beneficiary_address_line3:, beneficiary_name:, beneficiary_reference:, description:, input_message_accountability_data:, originator_address_line1:, originator_address_line2:, originator_address_line3:, originator_name:, originator_routing_number:, originator_to_beneficiary_information:, originator_to_beneficiary_information_line1:, originator_to_beneficiary_information_line2:, originator_to_beneficiary_information_line3:, originator_to_beneficiary_information_line4:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::InboundWireTransfer} for more details.
          #
          #   An Inbound Wire Transfer Intention object. This field will be present in the
          #   JSON response if and only if `category` is equal to `inbound_wire_transfer`. An
          #   Inbound Wire Transfer Intention is created when a wire transfer is initiated at
          #   another bank and received by Increase.
          #
          #   @param amount [Integer] The amount in USD cents.
          #
          #   @param beneficiary_address_line1 [String, nil] A free-form address field set by the sender.
          #
          #   @param beneficiary_address_line2 [String, nil] A free-form address field set by the sender.
          #
          #   @param beneficiary_address_line3 [String, nil] A free-form address field set by the sender.
          #
          #   @param beneficiary_name [String, nil] A name set by the sender.
          #
          #   @param beneficiary_reference [String, nil] A free-form reference string set by the sender, to help identify the transfer.
          #
          #   @param description [String] An Increase-constructed description of the transfer.
          #
          #   @param input_message_accountability_data [String, nil] A unique identifier available to the originating and receiving banks, commonly a
          #
          #   @param originator_address_line1 [String, nil] The address of the wire originator, set by the sending bank.
          #
          #   @param originator_address_line2 [String, nil] The address of the wire originator, set by the sending bank.
          #
          #   @param originator_address_line3 [String, nil] The address of the wire originator, set by the sending bank.
          #
          #   @param originator_name [String, nil] The originator of the wire, set by the sending bank.
          #
          #   @param originator_routing_number [String, nil] The American Banking Association (ABA) routing number of the bank originating th
          #
          #   @param originator_to_beneficiary_information [String, nil] An Increase-created concatenation of the Originator-to-Beneficiary lines.
          #
          #   @param originator_to_beneficiary_information_line1 [String, nil] A free-form message set by the wire originator.
          #
          #   @param originator_to_beneficiary_information_line2 [String, nil] A free-form message set by the wire originator.
          #
          #   @param originator_to_beneficiary_information_line3 [String, nil] A free-form message set by the wire originator.
          #
          #   @param originator_to_beneficiary_information_line4 [String, nil] A free-form message set by the wire originator.
          #
          #   @param transfer_id [String] The ID of the Inbound Wire Transfer object that resulted in this Transaction.
        end

        # @see Increase::Models::Transaction::Source#inbound_wire_transfer_reversal
        class InboundWireTransferReversal < Increase::Internal::Type::BaseModel
          # @!attribute inbound_wire_transfer_id
          #   The ID of the Inbound Wire Transfer that is being reversed.
          #
          #   @return [String]
          required :inbound_wire_transfer_id, String

          # @!method initialize(inbound_wire_transfer_id:)
          #   An Inbound Wire Transfer Reversal Intention object. This field will be present
          #   in the JSON response if and only if `category` is equal to
          #   `inbound_wire_transfer_reversal`. An Inbound Wire Transfer Reversal Intention is
          #   created when Increase has received a wire and the User requests that it be
          #   reversed.
          #
          #   @param inbound_wire_transfer_id [String] The ID of the Inbound Wire Transfer that is being reversed.
        end

        # @see Increase::Models::Transaction::Source#interest_payment
        class InterestPayment < Increase::Internal::Type::BaseModel
          # @!attribute accrued_on_account_id
          #   The account on which the interest was accrued.
          #
          #   @return [String]
          required :accrued_on_account_id, String

          # @!attribute amount
          #   The amount in the minor unit of the transaction's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #   currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::InterestPayment::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::InterestPayment::Currency }

          # @!attribute period_end
          #   The end of the period for which this transaction paid interest.
          #
          #   @return [Time]
          required :period_end, Time

          # @!attribute period_start
          #   The start of the period for which this transaction paid interest.
          #
          #   @return [Time]
          required :period_start, Time

          # @!method initialize(accrued_on_account_id:, amount:, currency:, period_end:, period_start:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::InterestPayment} for more details.
          #
          #   An Interest Payment object. This field will be present in the JSON response if
          #   and only if `category` is equal to `interest_payment`. An Interest Payment
          #   represents a payment of interest on an account. Interest is usually paid
          #   monthly.
          #
          #   @param accrued_on_account_id [String] The account on which the interest was accrued.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's currency. For dollars, for exa
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::InterestPayment::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #
          #   @param period_end [Time] The end of the period for which this transaction paid interest.
          #
          #   @param period_start [Time] The start of the period for which this transaction paid interest.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          #
          # @see Increase::Models::Transaction::Source::InterestPayment#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#internal_source
        class InternalSource < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The amount in the minor unit of the transaction's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #   currency.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::InternalSource::Currency]
          required :currency, enum: -> { Increase::Transaction::Source::InternalSource::Currency }

          # @!attribute reason
          #   An Internal Source is a transaction between you and Increase. This describes the
          #   reason for the transaction.
          #
          #   @return [Symbol, Increase::Models::Transaction::Source::InternalSource::Reason]
          required :reason, enum: -> { Increase::Transaction::Source::InternalSource::Reason }

          # @!method initialize(amount:, currency:, reason:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Transaction::Source::InternalSource} for more details.
          #
          #   An Internal Source object. This field will be present in the JSON response if
          #   and only if `category` is equal to `internal_source`. A transaction between the
          #   user and Increase. See the `reason` attribute for more information.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's currency. For dollars, for exa
          #
          #   @param currency [Symbol, Increase::Models::Transaction::Source::InternalSource::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          #
          #   @param reason [Symbol, Increase::Models::Transaction::Source::InternalSource::Reason] An Internal Source is a transaction between you and Increase. This describes the

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction
          # currency.
          #
          # @see Increase::Models::Transaction::Source::InternalSource#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # An Internal Source is a transaction between you and Increase. This describes the
          # reason for the transaction.
          #
          # @see Increase::Models::Transaction::Source::InternalSource#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # Account closure
            ACCOUNT_CLOSURE = :account_closure

            # Bank-drawn check
            BANK_DRAWN_CHECK = :bank_drawn_check

            # Bank-drawn check credit
            BANK_DRAWN_CHECK_CREDIT = :bank_drawn_check_credit

            # Bank migration
            BANK_MIGRATION = :bank_migration

            # Check adjustment
            CHECK_ADJUSTMENT = :check_adjustment

            # Collection payment
            COLLECTION_PAYMENT = :collection_payment

            # Collection receivable
            COLLECTION_RECEIVABLE = :collection_receivable

            # Empyreal adjustment
            EMPYREAL_ADJUSTMENT = :empyreal_adjustment

            # Error
            ERROR = :error

            # Error correction
            ERROR_CORRECTION = :error_correction

            # Fees
            FEES = :fees

            # Interest
            INTEREST = :interest

            # Negative balance forgiveness
            NEGATIVE_BALANCE_FORGIVENESS = :negative_balance_forgiveness

            # Sample funds
            SAMPLE_FUNDS = :sample_funds

            # Sample funds return
            SAMPLE_FUNDS_RETURN = :sample_funds_return

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::Transaction::Source#outbound_card_push_transfer_acceptance
        class OutboundCardPushTransferAcceptance < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The transfer amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute transfer_id
          #   The identifier of the Outbound Card Push Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, transfer_id:)
          #   An Outbound Card Push Transfer Acceptance object. This field will be present in
          #   the JSON response if and only if `category` is equal to
          #   `outbound_card_push_transfer_acceptance`. An Outbound Card Push Transfer
          #   Acceptance is created when an Outbound Card Push Transfer sent from Increase is
          #   accepted by the receiving bank.
          #
          #   @param amount [Integer] The transfer amount in USD cents.
          #
          #   @param transfer_id [String] The identifier of the Outbound Card Push Transfer that led to this Transaction.
        end

        # @see Increase::Models::Transaction::Source#real_time_payments_transfer_acknowledgement
        class RealTimePaymentsTransferAcknowledgement < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The transfer amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute destination_account_number
          #   The destination account number.
          #
          #   @return [String]
          required :destination_account_number, String

          # @!attribute destination_routing_number
          #   The American Bankers' Association (ABA) Routing Transit Number (RTN).
          #
          #   @return [String]
          required :destination_routing_number, String

          # @!attribute remittance_information
          #   Unstructured information that will show on the recipient's bank statement.
          #
          #   @return [String]
          required :remittance_information, String

          # @!attribute transfer_id
          #   The identifier of the Real-Time Payments Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, destination_account_number:, destination_routing_number:, remittance_information:, transfer_id:)
          #   A Real-Time Payments Transfer Acknowledgement object. This field will be present
          #   in the JSON response if and only if `category` is equal to
          #   `real_time_payments_transfer_acknowledgement`. A Real-Time Payments Transfer
          #   Acknowledgement is created when a Real-Time Payments Transfer sent from Increase
          #   is acknowledged by the receiving bank.
          #
          #   @param amount [Integer] The transfer amount in USD cents.
          #
          #   @param destination_account_number [String] The destination account number.
          #
          #   @param destination_routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN).
          #
          #   @param remittance_information [String] Unstructured information that will show on the recipient's bank statement.
          #
          #   @param transfer_id [String] The identifier of the Real-Time Payments Transfer that led to this Transaction.
        end

        # @see Increase::Models::Transaction::Source#sample_funds
        class SampleFunds < Increase::Internal::Type::BaseModel
          # @!attribute originator
          #   Where the sample funds came from.
          #
          #   @return [String]
          required :originator, String

          # @!method initialize(originator:)
          #   A Sample Funds object. This field will be present in the JSON response if and
          #   only if `category` is equal to `sample_funds`. Sample funds for testing
          #   purposes.
          #
          #   @param originator [String] Where the sample funds came from.
        end

        # @see Increase::Models::Transaction::Source#swift_transfer_intention
        class SwiftTransferIntention < Increase::Internal::Type::BaseModel
          # @!attribute transfer_id
          #   The identifier of the Swift Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(transfer_id:)
          #   A Swift Transfer Intention object. This field will be present in the JSON
          #   response if and only if `category` is equal to `swift_transfer_intention`. A
          #   Swift Transfer initiated via Increase.
          #
          #   @param transfer_id [String] The identifier of the Swift Transfer that led to this Transaction.
        end

        # @see Increase::Models::Transaction::Source#wire_transfer_intention
        class WireTransferIntention < Increase::Internal::Type::BaseModel
          # @!attribute account_number
          #   The destination account number.
          #
          #   @return [String]
          required :account_number, String

          # @!attribute amount
          #   The transfer amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute message_to_recipient
          #   The message that will show on the recipient's bank statement.
          #
          #   @return [String]
          required :message_to_recipient, String

          # @!attribute routing_number
          #   The American Bankers' Association (ABA) Routing Transit Number (RTN).
          #
          #   @return [String]
          required :routing_number, String

          # @!attribute transfer_id
          #   The identifier of the Wire Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(account_number:, amount:, message_to_recipient:, routing_number:, transfer_id:)
          #   A Wire Transfer Intention object. This field will be present in the JSON
          #   response if and only if `category` is equal to `wire_transfer_intention`. A Wire
          #   Transfer initiated via Increase and sent to a different bank.
          #
          #   @param account_number [String] The destination account number.
          #
          #   @param amount [Integer] The transfer amount in USD cents.
          #
          #   @param message_to_recipient [String] The message that will show on the recipient's bank statement.
          #
          #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN).
          #
          #   @param transfer_id [String] The identifier of the Wire Transfer that led to this Transaction.
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `transaction`.
      #
      # @see Increase::Models::Transaction#type
      module Type
        extend Increase::Internal::Type::Enum

        TRANSACTION = :transaction

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
