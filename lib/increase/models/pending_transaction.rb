# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PendingTransactions#create
    class PendingTransaction < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Pending Transaction identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the account this Pending Transaction belongs to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The Pending Transaction amount in the minor unit of its currency. For dollars,
      #   for example, this is cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute completed_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Pending
      #   Transaction was completed.
      #
      #   @return [Time, nil]
      required :completed_at, Time, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Pending
      #   Transaction occurred.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Pending
      #   Transaction's currency. This will match the currency on the Pending
      #   Transaction's Account.
      #
      #   @return [Symbol, Increase::Models::PendingTransaction::Currency]
      required :currency, enum: -> { Increase::PendingTransaction::Currency }

      # @!attribute description
      #   For a Pending Transaction related to a transfer, this is the description you
      #   provide. For a Pending Transaction related to a payment, this is the description
      #   the vendor provides.
      #
      #   @return [String]
      required :description, String

      # @!attribute held_amount
      #   The amount that this Pending Transaction decrements the available balance of its
      #   Account. This is usually the same as `amount`, but will differ if the amount is
      #   positive.
      #
      #   @return [Integer]
      required :held_amount, Integer

      # @!attribute route_id
      #   The identifier for the route this Pending Transaction came through. Routes are
      #   things like cards and ACH details.
      #
      #   @return [String, nil]
      required :route_id, String, nil?: true

      # @!attribute route_type
      #   The type of the route this Pending Transaction came through.
      #
      #   @return [Symbol, Increase::Models::PendingTransaction::RouteType, nil]
      required :route_type, enum: -> { Increase::PendingTransaction::RouteType }, nil?: true

      # @!attribute source
      #   This is an object giving more details on the network-level event that caused the
      #   Pending Transaction. For example, for a card transaction this lists the
      #   merchant's industry and location.
      #
      #   @return [Increase::Models::PendingTransaction::Source]
      required :source, -> { Increase::PendingTransaction::Source }

      # @!attribute status
      #   Whether the Pending Transaction has been confirmed and has an associated
      #   Transaction.
      #
      #   @return [Symbol, Increase::Models::PendingTransaction::Status]
      required :status, enum: -> { Increase::PendingTransaction::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `pending_transaction`.
      #
      #   @return [Symbol, Increase::Models::PendingTransaction::Type]
      required :type, enum: -> { Increase::PendingTransaction::Type }

      # @!method initialize(id:, account_id:, amount:, completed_at:, created_at:, currency:, description:, held_amount:, route_id:, route_type:, source:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PendingTransaction} for more details.
      #
      #   Pending Transactions are potential future additions and removals of money from
      #   your bank account. They impact your available balance, but not your current
      #   balance. To learn more, see
      #   [Transactions and Transfers](/documentation/transactions-transfers).
      #
      #   @param id [String] The Pending Transaction identifier.
      #
      #   @param account_id [String] The identifier for the account this Pending Transaction belongs to.
      #
      #   @param amount [Integer] The Pending Transaction amount in the minor unit of its currency. For dollars, f
      #
      #   @param completed_at [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Pending
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Pending
      #
      #   @param currency [Symbol, Increase::Models::PendingTransaction::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Pending Tran
      #
      #   @param description [String] For a Pending Transaction related to a transfer, this is the description you pro
      #
      #   @param held_amount [Integer] The amount that this Pending Transaction decrements the available balance of its
      #
      #   @param route_id [String, nil] The identifier for the route this Pending Transaction came through. Routes are t
      #
      #   @param route_type [Symbol, Increase::Models::PendingTransaction::RouteType, nil] The type of the route this Pending Transaction came through.
      #
      #   @param source [Increase::Models::PendingTransaction::Source] This is an object giving more details on the network-level event that caused the
      #
      #   @param status [Symbol, Increase::Models::PendingTransaction::Status] Whether the Pending Transaction has been confirmed and has an associated Transac
      #
      #   @param type [Symbol, Increase::Models::PendingTransaction::Type] A constant representing the object's type. For this resource it will always be `

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Pending
      # Transaction's currency. This will match the currency on the Pending
      # Transaction's Account.
      #
      # @see Increase::Models::PendingTransaction#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of the route this Pending Transaction came through.
      #
      # @see Increase::Models::PendingTransaction#route_type
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

      # @see Increase::Models::PendingTransaction#source
      class Source < Increase::Internal::Type::BaseModel
        # @!attribute account_transfer_instruction
        #   An Account Transfer Instruction object. This field will be present in the JSON
        #   response if and only if `category` is equal to `account_transfer_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::AccountTransferInstruction, nil]
        required :account_transfer_instruction,
                 -> { Increase::PendingTransaction::Source::AccountTransferInstruction },
                 nil?: true

        # @!attribute ach_transfer_instruction
        #   An ACH Transfer Instruction object. This field will be present in the JSON
        #   response if and only if `category` is equal to `ach_transfer_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::ACHTransferInstruction, nil]
        required :ach_transfer_instruction,
                 -> { Increase::PendingTransaction::Source::ACHTransferInstruction },
                 nil?: true

        # @!attribute card_authorization
        #   A Card Authorization object. This field will be present in the JSON response if
        #   and only if `category` is equal to `card_authorization`. Card Authorizations are
        #   temporary holds placed on a customers funds with the intent to later clear a
        #   transaction.
        #
        #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization, nil]
        required :card_authorization,
                 -> {
                   Increase::PendingTransaction::Source::CardAuthorization
                 },
                 nil?: true

        # @!attribute card_push_transfer_instruction
        #   A Card Push Transfer Instruction object. This field will be present in the JSON
        #   response if and only if `category` is equal to `card_push_transfer_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::CardPushTransferInstruction, nil]
        required :card_push_transfer_instruction,
                 -> { Increase::PendingTransaction::Source::CardPushTransferInstruction },
                 nil?: true

        # @!attribute category
        #   The type of the resource. We may add additional possible values for this enum
        #   over time; your application should be able to handle such additions gracefully.
        #
        #   @return [Symbol, Increase::Models::PendingTransaction::Source::Category]
        required :category, enum: -> { Increase::PendingTransaction::Source::Category }

        # @!attribute check_deposit_instruction
        #   A Check Deposit Instruction object. This field will be present in the JSON
        #   response if and only if `category` is equal to `check_deposit_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::CheckDepositInstruction, nil]
        required :check_deposit_instruction,
                 -> { Increase::PendingTransaction::Source::CheckDepositInstruction },
                 nil?: true

        # @!attribute check_transfer_instruction
        #   A Check Transfer Instruction object. This field will be present in the JSON
        #   response if and only if `category` is equal to `check_transfer_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::CheckTransferInstruction, nil]
        required :check_transfer_instruction,
                 -> { Increase::PendingTransaction::Source::CheckTransferInstruction },
                 nil?: true

        # @!attribute fednow_transfer_instruction
        #   A FedNow Transfer Instruction object. This field will be present in the JSON
        #   response if and only if `category` is equal to `fednow_transfer_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::FednowTransferInstruction, nil]
        required :fednow_transfer_instruction,
                 -> { Increase::PendingTransaction::Source::FednowTransferInstruction },
                 nil?: true

        # @!attribute inbound_funds_hold
        #   An Inbound Funds Hold object. This field will be present in the JSON response if
        #   and only if `category` is equal to `inbound_funds_hold`. We hold funds for
        #   certain transaction types to account for return windows where funds might still
        #   be clawed back by the sending institution.
        #
        #   @return [Increase::Models::PendingTransaction::Source::InboundFundsHold, nil]
        required :inbound_funds_hold,
                 -> {
                   Increase::PendingTransaction::Source::InboundFundsHold
                 },
                 nil?: true

        # @!attribute inbound_wire_transfer_reversal
        #   An Inbound Wire Transfer Reversal object. This field will be present in the JSON
        #   response if and only if `category` is equal to `inbound_wire_transfer_reversal`.
        #   An Inbound Wire Transfer Reversal is created when Increase has received a wire
        #   and the User requests that it be reversed.
        #
        #   @return [Increase::Models::PendingTransaction::Source::InboundWireTransferReversal, nil]
        required :inbound_wire_transfer_reversal,
                 -> { Increase::PendingTransaction::Source::InboundWireTransferReversal },
                 nil?: true

        # @!attribute other
        #   If the category of this Transaction source is equal to `other`, this field will
        #   contain an empty object, otherwise it will contain null.
        #
        #   @return [Increase::Models::PendingTransaction::Source::Other, nil]
        required :other, -> { Increase::PendingTransaction::Source::Other }, nil?: true

        # @!attribute real_time_payments_transfer_instruction
        #   A Real-Time Payments Transfer Instruction object. This field will be present in
        #   the JSON response if and only if `category` is equal to
        #   `real_time_payments_transfer_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::RealTimePaymentsTransferInstruction, nil]
        required :real_time_payments_transfer_instruction,
                 -> { Increase::PendingTransaction::Source::RealTimePaymentsTransferInstruction },
                 nil?: true

        # @!attribute swift_transfer_instruction
        #   A Swift Transfer Instruction object. This field will be present in the JSON
        #   response if and only if `category` is equal to `swift_transfer_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::SwiftTransferInstruction, nil]
        required :swift_transfer_instruction,
                 -> { Increase::PendingTransaction::Source::SwiftTransferInstruction },
                 nil?: true

        # @!attribute user_initiated_hold
        #   An User Initiated Hold object. This field will be present in the JSON response
        #   if and only if `category` is equal to `user_initiated_hold`. Created when a user
        #   initiates a hold on funds in their account.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        required :user_initiated_hold,
                 Increase::Internal::Type::HashOf[Increase::Internal::Type::Unknown],
                 nil?: true

        # @!attribute wire_transfer_instruction
        #   A Wire Transfer Instruction object. This field will be present in the JSON
        #   response if and only if `category` is equal to `wire_transfer_instruction`.
        #
        #   @return [Increase::Models::PendingTransaction::Source::WireTransferInstruction, nil]
        required :wire_transfer_instruction,
                 -> { Increase::PendingTransaction::Source::WireTransferInstruction },
                 nil?: true

        # @!method initialize(account_transfer_instruction:, ach_transfer_instruction:, card_authorization:, card_push_transfer_instruction:, category:, check_deposit_instruction:, check_transfer_instruction:, fednow_transfer_instruction:, inbound_funds_hold:, inbound_wire_transfer_reversal:, other:, real_time_payments_transfer_instruction:, swift_transfer_instruction:, user_initiated_hold:, wire_transfer_instruction:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::PendingTransaction::Source} for more details.
        #
        #   This is an object giving more details on the network-level event that caused the
        #   Pending Transaction. For example, for a card transaction this lists the
        #   merchant's industry and location.
        #
        #   @param account_transfer_instruction [Increase::Models::PendingTransaction::Source::AccountTransferInstruction, nil] An Account Transfer Instruction object. This field will be present in the JSON r
        #
        #   @param ach_transfer_instruction [Increase::Models::PendingTransaction::Source::ACHTransferInstruction, nil] An ACH Transfer Instruction object. This field will be present in the JSON respo
        #
        #   @param card_authorization [Increase::Models::PendingTransaction::Source::CardAuthorization, nil] A Card Authorization object. This field will be present in the JSON response if
        #
        #   @param card_push_transfer_instruction [Increase::Models::PendingTransaction::Source::CardPushTransferInstruction, nil] A Card Push Transfer Instruction object. This field will be present in the JSON
        #
        #   @param category [Symbol, Increase::Models::PendingTransaction::Source::Category] The type of the resource. We may add additional possible values for this enum ov
        #
        #   @param check_deposit_instruction [Increase::Models::PendingTransaction::Source::CheckDepositInstruction, nil] A Check Deposit Instruction object. This field will be present in the JSON respo
        #
        #   @param check_transfer_instruction [Increase::Models::PendingTransaction::Source::CheckTransferInstruction, nil] A Check Transfer Instruction object. This field will be present in the JSON resp
        #
        #   @param fednow_transfer_instruction [Increase::Models::PendingTransaction::Source::FednowTransferInstruction, nil] A FedNow Transfer Instruction object. This field will be present in the JSON res
        #
        #   @param inbound_funds_hold [Increase::Models::PendingTransaction::Source::InboundFundsHold, nil] An Inbound Funds Hold object. This field will be present in the JSON response if
        #
        #   @param inbound_wire_transfer_reversal [Increase::Models::PendingTransaction::Source::InboundWireTransferReversal, nil] An Inbound Wire Transfer Reversal object. This field will be present in the JSON
        #
        #   @param other [Increase::Models::PendingTransaction::Source::Other, nil] If the category of this Transaction source is equal to `other`, this field will
        #
        #   @param real_time_payments_transfer_instruction [Increase::Models::PendingTransaction::Source::RealTimePaymentsTransferInstruction, nil] A Real-Time Payments Transfer Instruction object. This field will be present in
        #
        #   @param swift_transfer_instruction [Increase::Models::PendingTransaction::Source::SwiftTransferInstruction, nil] A Swift Transfer Instruction object. This field will be present in the JSON resp
        #
        #   @param user_initiated_hold [Hash{Symbol=>Object}, nil] An User Initiated Hold object. This field will be present in the JSON response i
        #
        #   @param wire_transfer_instruction [Increase::Models::PendingTransaction::Source::WireTransferInstruction, nil] A Wire Transfer Instruction object. This field will be present in the JSON respo

        # @see Increase::Models::PendingTransaction::Source#account_transfer_instruction
        class AccountTransferInstruction < Increase::Internal::Type::BaseModel
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
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::AccountTransferInstruction::Currency]
          required :currency,
                   enum: -> { Increase::PendingTransaction::Source::AccountTransferInstruction::Currency }

          # @!attribute transfer_id
          #   The identifier of the Account Transfer that led to this Pending Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, currency:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::PendingTransaction::Source::AccountTransferInstruction} for
          #   more details.
          #
          #   An Account Transfer Instruction object. This field will be present in the JSON
          #   response if and only if `category` is equal to `account_transfer_instruction`.
          #
          #   @param amount [Integer] The pending amount in the minor unit of the transaction's currency. For dollars,
          #
          #   @param currency [Symbol, Increase::Models::PendingTransaction::Source::AccountTransferInstruction::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #
          #   @param transfer_id [String] The identifier of the Account Transfer that led to this Pending Transaction.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          #
          # @see Increase::Models::PendingTransaction::Source::AccountTransferInstruction#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::PendingTransaction::Source#ach_transfer_instruction
        class ACHTransferInstruction < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The pending amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute transfer_id
          #   The identifier of the ACH Transfer that led to this Pending Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, transfer_id:)
          #   An ACH Transfer Instruction object. This field will be present in the JSON
          #   response if and only if `category` is equal to `ach_transfer_instruction`.
          #
          #   @param amount [Integer] The pending amount in USD cents.
          #
          #   @param transfer_id [String] The identifier of the ACH Transfer that led to this Pending Transaction.
        end

        # @see Increase::Models::PendingTransaction::Source#card_authorization
        class CardAuthorization < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Authorization identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute actioner
          #   Whether this authorization was approved by Increase, the card network through
          #   stand-in processing, or the user through a real-time decision.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Actioner]
          required :actioner, enum: -> { Increase::PendingTransaction::Source::CardAuthorization::Actioner }

          # @!attribute additional_amounts
          #   Additional amounts associated with the card authorization, such as ATM
          #   surcharges fees. These are usually a subset of the `amount` field and are used
          #   to provide more detailed information about the transaction.
          #
          #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts]
          required :additional_amounts,
                   -> { Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts }

          # @!attribute amount
          #   The pending amount in the minor unit of the transaction's currency. For dollars,
          #   for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's currency.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Currency]
          required :currency, enum: -> { Increase::PendingTransaction::Source::CardAuthorization::Currency }

          # @!attribute digital_wallet_token_id
          #   If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          #   purchase), the identifier of the token that was used.
          #
          #   @return [String, nil]
          required :digital_wallet_token_id, String, nil?: true

          # @!attribute direction
          #   The direction describes the direction the funds will move, either from the
          #   cardholder to the merchant or from the merchant to the cardholder.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Direction]
          required :direction, enum: -> { Increase::PendingTransaction::Source::CardAuthorization::Direction }

          # @!attribute expires_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) when this authorization
          #   will expire and the pending transaction will be released.
          #
          #   @return [Time]
          required :expires_at, Time

          # @!attribute merchant_acceptor_id
          #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
          #   is transacting with.
          #
          #   @return [String]
          required :merchant_acceptor_id, String

          # @!attribute merchant_category_code
          #   The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          #   card is transacting with.
          #
          #   @return [String]
          required :merchant_category_code, String

          # @!attribute merchant_city
          #   The city the merchant resides in.
          #
          #   @return [String, nil]
          required :merchant_city, String, nil?: true

          # @!attribute merchant_country
          #   The country the merchant resides in.
          #
          #   @return [String]
          required :merchant_country, String

          # @!attribute merchant_descriptor
          #   The merchant descriptor of the merchant the card is transacting with.
          #
          #   @return [String]
          required :merchant_descriptor, String

          # @!attribute merchant_postal_code
          #   The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          #   ZIP code, where the first 5 and last 4 are separated by a dash.
          #
          #   @return [String, nil]
          required :merchant_postal_code, String, nil?: true

          # @!attribute merchant_state
          #   The state the merchant resides in.
          #
          #   @return [String, nil]
          required :merchant_state, String, nil?: true

          # @!attribute network_details
          #   Fields specific to the `network`.
          #
          #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails]
          required :network_details, -> { Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails }

          # @!attribute network_identifiers
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers]
          required :network_identifiers,
                   -> { Increase::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers }

          # @!attribute network_risk_score
          #   The risk score generated by the card network. For Visa this is the Visa Advanced
          #   Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          #   score is from 0 to 999, where 999 is the riskiest.
          #
          #   @return [Integer, nil]
          required :network_risk_score, Integer, nil?: true

          # @!attribute pending_transaction_id
          #   The identifier of the Pending Transaction associated with this Transaction.
          #
          #   @return [String, nil]
          required :pending_transaction_id, String, nil?: true

          # @!attribute physical_card_id
          #   If the authorization was made in-person with a physical card, the Physical Card
          #   that was used.
          #
          #   @return [String, nil]
          required :physical_card_id, String, nil?: true

          # @!attribute presentment_amount
          #   The pending amount in the minor unit of the transaction's presentment currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute processing_category
          #   The processing category describes the intent behind the authorization, such as
          #   whether it was used for bill payments or an automatic fuel dispenser.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::ProcessingCategory]
          required :processing_category,
                   enum: -> { Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory }

          # @!attribute real_time_decision_id
          #   The identifier of the Real-Time Decision sent to approve or decline this
          #   transaction.
          #
          #   @return [String, nil]
          required :real_time_decision_id, String, nil?: true

          # @!attribute terminal_id
          #   The terminal identifier (commonly abbreviated as TID) of the terminal the card
          #   is transacting with.
          #
          #   @return [String, nil]
          required :terminal_id, String, nil?: true

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_authorization`.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Type]
          required :type, enum: -> { Increase::PendingTransaction::Source::CardAuthorization::Type }

          # @!attribute verification
          #   Fields related to verification of cardholder-provided values.
          #
          #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::Verification]
          required :verification, -> { Increase::PendingTransaction::Source::CardAuthorization::Verification }

          # @!method initialize(id:, actioner:, additional_amounts:, amount:, card_payment_id:, currency:, digital_wallet_token_id:, direction:, expires_at:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_descriptor:, merchant_postal_code:, merchant_state:, network_details:, network_identifiers:, network_risk_score:, pending_transaction_id:, physical_card_id:, presentment_amount:, presentment_currency:, processing_category:, real_time_decision_id:, terminal_id:, type:, verification:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::PendingTransaction::Source::CardAuthorization} for more
          #   details.
          #
          #   A Card Authorization object. This field will be present in the JSON response if
          #   and only if `category` is equal to `card_authorization`. Card Authorizations are
          #   temporary holds placed on a customers funds with the intent to later clear a
          #   transaction.
          #
          #   @param id [String] The Card Authorization identifier.
          #
          #   @param actioner [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Actioner] Whether this authorization was approved by Increase, the card network through st
          #
          #   @param additional_amounts [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts] Additional amounts associated with the card authorization, such as ATM surcharge
          #
          #   @param amount [Integer] The pending amount in the minor unit of the transaction's currency. For dollars,
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param currency [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param digital_wallet_token_id [String, nil] If the authorization was made via a Digital Wallet Token (such as an Apple Pay p
          #
          #   @param direction [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Direction] The direction describes the direction the funds will move, either from the cardh
          #
          #   @param expires_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) when this authorization w
          #
          #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
          #
          #   @param merchant_category_code [String] The Merchant Category Code (commonly abbreviated as MCC) of the merchant the car
          #
          #   @param merchant_city [String, nil] The city the merchant resides in.
          #
          #   @param merchant_country [String] The country the merchant resides in.
          #
          #   @param merchant_descriptor [String] The merchant descriptor of the merchant the card is transacting with.
          #
          #   @param merchant_postal_code [String, nil] The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          #
          #   @param merchant_state [String, nil] The state the merchant resides in.
          #
          #   @param network_details [Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails] Fields specific to the `network`.
          #
          #   @param network_identifiers [Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
          #
          #   @param network_risk_score [Integer, nil] The risk score generated by the card network. For Visa this is the Visa Advanced
          #
          #   @param pending_transaction_id [String, nil] The identifier of the Pending Transaction associated with this Transaction.
          #
          #   @param physical_card_id [String, nil] If the authorization was made in-person with a physical card, the Physical Card
          #
          #   @param presentment_amount [Integer] The pending amount in the minor unit of the transaction's presentment currency.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param processing_category [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::ProcessingCategory] The processing category describes the intent behind the authorization, such as w
          #
          #   @param real_time_decision_id [String, nil] The identifier of the Real-Time Decision sent to approve or decline this transac
          #
          #   @param terminal_id [String, nil] The terminal identifier (commonly abbreviated as TID) of the terminal the card i
          #
          #   @param type [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Type] A constant representing the object's type. For this resource it will always be `
          #
          #   @param verification [Increase::Models::PendingTransaction::Source::CardAuthorization::Verification] Fields related to verification of cardholder-provided values.

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          #
          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#actioner
          module Actioner
            extend Increase::Internal::Type::Enum

            # This object was actioned by the user through a real-time decision.
            USER = :user

            # This object was actioned by Increase without user intervention.
            INCREASE = :increase

            # This object was actioned by the network, through stand-in processing.
            NETWORK = :network

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#additional_amounts
          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            # @!attribute clinic
            #   The part of this transaction amount that was for clinic-related services.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic, nil]
            required :clinic,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic
                     },
                     nil?: true

            # @!attribute dental
            #   The part of this transaction amount that was for dental-related services.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental, nil]
            required :dental,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental
                     },
                     nil?: true

            # @!attribute original
            #   The original pre-authorized amount.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Original, nil]
            required :original,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Original
                     },
                     nil?: true

            # @!attribute prescription
            #   The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription, nil]
            required :prescription,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription
                     },
                     nil?: true

            # @!attribute surcharge
            #   The surcharge amount charged for this transaction by the merchant.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge, nil]
            required :surcharge,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge
                     },
                     nil?: true

            # @!attribute total_cumulative
            #   The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative, nil]
            required :total_cumulative,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative
                     },
                     nil?: true

            # @!attribute total_healthcare
            #   The total amount of healthcare-related additional amounts.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare, nil]
            required :total_healthcare,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare
                     },
                     nil?: true

            # @!attribute transit
            #   The part of this transaction amount that was for transit-related services.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit, nil]
            required :transit,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit
                     },
                     nil?: true

            # @!attribute unknown
            #   An unknown additional amount.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown, nil]
            required :unknown,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown
                     },
                     nil?: true

            # @!attribute vision
            #   The part of this transaction amount that was for vision-related services.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision, nil]
            required :vision,
                     -> {
                       Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision
                     },
                     nil?: true

            # @!method initialize(clinic:, dental:, original:, prescription:, surcharge:, total_cumulative:, total_healthcare:, transit:, unknown:, vision:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts}
            #   for more details.
            #
            #   Additional amounts associated with the card authorization, such as ATM
            #   surcharges fees. These are usually a subset of the `amount` field and are used
            #   to provide more detailed information about the transaction.
            #
            #   @param clinic [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic, nil] The part of this transaction amount that was for clinic-related services.
            #
            #   @param dental [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental, nil] The part of this transaction amount that was for dental-related services.
            #
            #   @param original [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Original, nil] The original pre-authorized amount.
            #
            #   @param prescription [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription, nil] The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @param surcharge [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge, nil] The surcharge amount charged for this transaction by the merchant.
            #
            #   @param total_cumulative [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative, nil] The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @param total_healthcare [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare, nil] The total amount of healthcare-related additional amounts.
            #
            #   @param transit [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit, nil] The part of this transaction amount that was for transit-related services.
            #
            #   @param unknown [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown, nil] An unknown additional amount.
            #
            #   @param vision [Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision, nil] The part of this transaction amount that was for vision-related services.

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#clinic
            class Clinic < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic}
              #   for more details.
              #
              #   The part of this transaction amount that was for clinic-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#dental
            class Dental < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental}
              #   for more details.
              #
              #   The part of this transaction amount that was for dental-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#original
            class Original < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Original}
              #   for more details.
              #
              #   The original pre-authorized amount.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#prescription
            class Prescription < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription}
              #   for more details.
              #
              #   The part of this transaction amount that was for healthcare prescriptions.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#surcharge
            class Surcharge < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge}
              #   for more details.
              #
              #   The surcharge amount charged for this transaction by the merchant.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#total_cumulative
            class TotalCumulative < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative}
              #   for more details.
              #
              #   The total amount of a series of incremental authorizations, optionally provided.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#total_healthcare
            class TotalHealthcare < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare}
              #   for more details.
              #
              #   The total amount of healthcare-related additional amounts.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#transit
            class Transit < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit}
              #   for more details.
              #
              #   The part of this transaction amount that was for transit-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#unknown
            class Unknown < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown}
              #   for more details.
              #
              #   An unknown additional amount.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts#vision
            class Vision < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field. The amount is positive if it
              #   is added to the amount (such as an ATM surcharge fee) and negative if it is
              #   subtracted from the amount (such as a discount).
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision}
              #   for more details.
              #
              #   The part of this transaction amount that was for vision-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          #
          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          #
          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#direction
          module Direction
            extend Increase::Internal::Type::Enum

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT = :settlement

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND = :refund

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#network_details
          class NetworkDetails < Increase::Internal::Type::BaseModel
            # @!attribute category
            #   The payment network used to process this card authorization.
            #
            #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category]
            required :category,
                     enum: -> { Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category }

            # @!attribute pulse
            #   Fields specific to the `pulse` network.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Pulse, nil]
            required :pulse,
                     -> { Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Pulse },
                     nil?: true

            # @!attribute visa
            #   Fields specific to the `visa` network.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa, nil]
            required :visa,
                     -> { Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa },
                     nil?: true

            # @!method initialize(category:, pulse:, visa:)
            #   Fields specific to the `network`.
            #
            #   @param category [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category] The payment network used to process this card authorization.
            #
            #   @param pulse [Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Pulse, nil] Fields specific to the `pulse` network.
            #
            #   @param visa [Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa, nil] Fields specific to the `visa` network.

            # The payment network used to process this card authorization.
            #
            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails#category
            module Category
              extend Increase::Internal::Type::Enum

              # Visa
              VISA = :visa

              # Pulse
              PULSE = :pulse

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails#pulse
            class Pulse < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Fields specific to the `pulse` network.
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails#visa
            class Visa < Increase::Internal::Type::BaseModel
              # @!attribute electronic_commerce_indicator
              #   For electronic commerce transactions, this identifies the level of security used
              #   in obtaining the customer's payment credential. For mail or telephone order
              #   transactions, identifies the type of mail or telephone order.
              #
              #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator, nil]
              required :electronic_commerce_indicator,
                       enum: -> {
                         Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator
                       },
                       nil?: true

              # @!attribute point_of_service_entry_mode
              #   The method used to enter the cardholder's primary account number and card
              #   expiration date.
              #
              #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode, nil]
              required :point_of_service_entry_mode,
                       enum: -> {
                         Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode
                       },
                       nil?: true

              # @!attribute stand_in_processing_reason
              #   Only present when `actioner: network`. Describes why a card authorization was
              #   approved or declined by Visa through stand-in processing.
              #
              #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason, nil]
              required :stand_in_processing_reason,
                       enum: -> {
                         Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason
                       },
                       nil?: true

              # @!method initialize(electronic_commerce_indicator:, point_of_service_entry_mode:, stand_in_processing_reason:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa}
              #   for more details.
              #
              #   Fields specific to the `visa` network.
              #
              #   @param electronic_commerce_indicator [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator, nil] For electronic commerce transactions, this identifies the level of security used
              #
              #   @param point_of_service_entry_mode [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode, nil] The method used to enter the cardholder's primary account number and card expira
              #
              #   @param stand_in_processing_reason [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason, nil] Only present when `actioner: network`. Describes why a card authorization was ap

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              #
              # @see Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa#electronic_commerce_indicator
              module ElectronicCommerceIndicator
                extend Increase::Internal::Type::Enum

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER = :mail_phone_order

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING = :recurring

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT = :installment

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER = :unknown_mail_phone_order

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE = :secure_electronic_commerce

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  :non_authenticated_security_transaction_at_3ds_capable_merchant

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION = :non_authenticated_security_transaction

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION = :non_secure_transaction

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              #
              # @see Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa#point_of_service_entry_mode
              module PointOfServiceEntryMode
                extend Increase::Internal::Type::Enum

                # Unknown
                UNKNOWN = :unknown

                # Manual key entry
                MANUAL = :manual

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV = :magnetic_stripe_no_cvv

                # Optical code
                OPTICAL_CODE = :optical_code

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD = :integrated_circuit_card

                # Contactless read of chip card
                CONTACTLESS = :contactless

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE = :credential_on_file

                # Magnetic stripe read
                MAGNETIC_STRIPE = :magnetic_stripe

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE = :contactless_magnetic_stripe

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV = :integrated_circuit_card_no_cvv

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              #
              # @see Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa#stand_in_processing_reason
              module StandInProcessingReason
                extend Increase::Internal::Type::Enum

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR = :issuer_error

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD = :invalid_physical_card

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  :invalid_cardholder_authentication_verification_value

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR = :internal_visa_error

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  :merchant_transaction_advisory_service_authentication_required

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK = :payment_fraud_disruption_acquirer_block

                # An unspecific reason for stand-in processing.
                OTHER = :other

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end

          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            # @!attribute authorization_identification_response
            #   The randomly generated 6-character Authorization Identification Response code
            #   sent back to the acquirer in an approved response.
            #
            #   @return [String, nil]
            required :authorization_identification_response, String, nil?: true

            # @!attribute retrieval_reference_number
            #   A life-cycle identifier used across e.g., an authorization and a reversal.
            #   Expected to be unique per acquirer within a window of time. For some card
            #   networks the retrieval reference number includes the trace counter.
            #
            #   @return [String, nil]
            required :retrieval_reference_number, String, nil?: true

            # @!attribute trace_number
            #   A counter used to verify an individual authorization. Expected to be unique per
            #   acquirer within a window of time.
            #
            #   @return [String, nil]
            required :trace_number, String, nil?: true

            # @!attribute transaction_id
            #   A globally unique transaction identifier provided by the card network, used
            #   across multiple life-cycle requests.
            #
            #   @return [String, nil]
            required :transaction_id, String, nil?: true

            # @!method initialize(authorization_identification_response:, retrieval_reference_number:, trace_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers}
            #   for more details.
            #
            #   Network-specific identifiers for a specific request or transaction.
            #
            #   @param authorization_identification_response [String, nil] The randomly generated 6-character Authorization Identification Response code se
            #
            #   @param retrieval_reference_number [String, nil] A life-cycle identifier used across e.g., an authorization and a reversal. Expec
            #
            #   @param trace_number [String, nil] A counter used to verify an individual authorization. Expected to be unique per
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # The processing category describes the intent behind the authorization, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          #
          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#processing_category
          module ProcessingCategory
            extend Increase::Internal::Type::Enum

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING = :account_funding

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER = :automatic_fuel_dispenser

            # A transaction used to pay a bill.
            BILL_PAYMENT = :bill_payment

            # Original credit transactions are used to send money to a cardholder.
            ORIGINAL_CREDIT = :original_credit

            # A regular purchase.
            PURCHASE = :purchase

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH = :quasi_cash

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND = :refund

            # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
            CASH_DISBURSEMENT = :cash_disbursement

            # A balance inquiry transaction is used to check the balance of an account associated with a card.
            BALANCE_INQUIRY = :balance_inquiry

            # The processing category is unknown.
            UNKNOWN = :unknown

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization`.
          #
          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_AUTHORIZATION = :card_authorization

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::PendingTransaction::Source::CardAuthorization#verification
          class Verification < Increase::Internal::Type::BaseModel
            # @!attribute card_verification_code
            #   Fields related to verification of the Card Verification Code, a 3-digit code on
            #   the back of the card.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode]
            required :card_verification_code,
                     -> { Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode }

            # @!attribute cardholder_address
            #   Cardholder address provided in the authorization request and the address on file
            #   we verified it against.
            #
            #   @return [Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress]
            required :cardholder_address,
                     -> { Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress }

            # @!method initialize(card_verification_code:, cardholder_address:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::PendingTransaction::Source::CardAuthorization::Verification}
            #   for more details.
            #
            #   Fields related to verification of cardholder-provided values.
            #
            #   @param card_verification_code [Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode] Fields related to verification of the Card Verification Code, a 3-digit code on
            #
            #   @param cardholder_address [Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress] Cardholder address provided in the authorization request and the address on file

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::Verification#card_verification_code
            class CardVerificationCode < Increase::Internal::Type::BaseModel
              # @!attribute result
              #   The result of verifying the Card Verification Code.
              #
              #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result]
              required :result,
                       enum: -> { Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result }

              # @!method initialize(result:)
              #   Fields related to verification of the Card Verification Code, a 3-digit code on
              #   the back of the card.
              #
              #   @param result [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result] The result of verifying the Card Verification Code.

              # The result of verifying the Card Verification Code.
              #
              # @see Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode#result
              module Result
                extend Increase::Internal::Type::Enum

                # No card verification code was provided in the authorization request.
                NOT_CHECKED = :not_checked

                # The card verification code matched the one on file.
                MATCH = :match

                # The card verification code did not match the one on file.
                NO_MATCH = :no_match

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::PendingTransaction::Source::CardAuthorization::Verification#cardholder_address
            class CardholderAddress < Increase::Internal::Type::BaseModel
              # @!attribute actual_line1
              #   Line 1 of the address on file for the cardholder.
              #
              #   @return [String, nil]
              required :actual_line1, String, nil?: true

              # @!attribute actual_postal_code
              #   The postal code of the address on file for the cardholder.
              #
              #   @return [String, nil]
              required :actual_postal_code, String, nil?: true

              # @!attribute provided_line1
              #   The cardholder address line 1 provided for verification in the authorization
              #   request.
              #
              #   @return [String, nil]
              required :provided_line1, String, nil?: true

              # @!attribute provided_postal_code
              #   The postal code provided for verification in the authorization request.
              #
              #   @return [String, nil]
              required :provided_postal_code, String, nil?: true

              # @!attribute result
              #   The address verification result returned to the card network.
              #
              #   @return [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result]
              required :result,
                       enum: -> { Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result }

              # @!method initialize(actual_line1:, actual_postal_code:, provided_line1:, provided_postal_code:, result:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress}
              #   for more details.
              #
              #   Cardholder address provided in the authorization request and the address on file
              #   we verified it against.
              #
              #   @param actual_line1 [String, nil] Line 1 of the address on file for the cardholder.
              #
              #   @param actual_postal_code [String, nil] The postal code of the address on file for the cardholder.
              #
              #   @param provided_line1 [String, nil] The cardholder address line 1 provided for verification in the authorization req
              #
              #   @param provided_postal_code [String, nil] The postal code provided for verification in the authorization request.
              #
              #   @param result [Symbol, Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result] The address verification result returned to the card network.

              # The address verification result returned to the card network.
              #
              # @see Increase::Models::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress#result
              module Result
                extend Increase::Internal::Type::Enum

                # No address information was provided in the authorization request.
                NOT_CHECKED = :not_checked

                # Postal code matches, but the street address does not match or was not provided.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH = :postal_code_match_address_no_match

                # Postal code does not match, but the street address matches or was not provided.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH = :postal_code_no_match_address_match

                # Postal code and street address match.
                MATCH = :match

                # Postal code and street address do not match.
                NO_MATCH = :no_match

                # Postal code matches, but the street address was not verified. (deprecated)
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED = :postal_code_match_address_not_checked

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end
        end

        # @see Increase::Models::PendingTransaction::Source#card_push_transfer_instruction
        class CardPushTransferInstruction < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The transfer amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute transfer_id
          #   The identifier of the Card Push Transfer that led to this Pending Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, transfer_id:)
          #   A Card Push Transfer Instruction object. This field will be present in the JSON
          #   response if and only if `category` is equal to `card_push_transfer_instruction`.
          #
          #   @param amount [Integer] The transfer amount in USD cents.
          #
          #   @param transfer_id [String] The identifier of the Card Push Transfer that led to this Pending Transaction.
        end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        #
        # @see Increase::Models::PendingTransaction::Source#category
        module Category
          extend Increase::Internal::Type::Enum

          # Account Transfer Instruction: details will be under the `account_transfer_instruction` object.
          ACCOUNT_TRANSFER_INSTRUCTION = :account_transfer_instruction

          # ACH Transfer Instruction: details will be under the `ach_transfer_instruction` object.
          ACH_TRANSFER_INSTRUCTION = :ach_transfer_instruction

          # Card Authorization: details will be under the `card_authorization` object.
          CARD_AUTHORIZATION = :card_authorization

          # Check Deposit Instruction: details will be under the `check_deposit_instruction` object.
          CHECK_DEPOSIT_INSTRUCTION = :check_deposit_instruction

          # Check Transfer Instruction: details will be under the `check_transfer_instruction` object.
          CHECK_TRANSFER_INSTRUCTION = :check_transfer_instruction

          # FedNow Transfer Instruction: details will be under the `fednow_transfer_instruction` object.
          FEDNOW_TRANSFER_INSTRUCTION = :fednow_transfer_instruction

          # Inbound Funds Hold: details will be under the `inbound_funds_hold` object.
          INBOUND_FUNDS_HOLD = :inbound_funds_hold

          # User Initiated Hold: details will be under the `user_initiated_hold` object.
          USER_INITIATED_HOLD = :user_initiated_hold

          # Real-Time Payments Transfer Instruction: details will be under the `real_time_payments_transfer_instruction` object.
          REAL_TIME_PAYMENTS_TRANSFER_INSTRUCTION = :real_time_payments_transfer_instruction

          # Wire Transfer Instruction: details will be under the `wire_transfer_instruction` object.
          WIRE_TRANSFER_INSTRUCTION = :wire_transfer_instruction

          # Inbound Wire Transfer Reversal: details will be under the `inbound_wire_transfer_reversal` object.
          INBOUND_WIRE_TRANSFER_REVERSAL = :inbound_wire_transfer_reversal

          # Swift Transfer Instruction: details will be under the `swift_transfer_instruction` object.
          SWIFT_TRANSFER_INSTRUCTION = :swift_transfer_instruction

          # Card Push Transfer Instruction: details will be under the `card_push_transfer_instruction` object.
          CARD_PUSH_TRANSFER_INSTRUCTION = :card_push_transfer_instruction

          # The Pending Transaction was made for an undocumented or deprecated reason.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::PendingTransaction::Source#check_deposit_instruction
        class CheckDepositInstruction < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The pending amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute back_image_file_id
          #   The identifier of the File containing the image of the back of the check that
          #   was deposited.
          #
          #   @return [String, nil]
          required :back_image_file_id, String, nil?: true

          # @!attribute check_deposit_id
          #   The identifier of the Check Deposit.
          #
          #   @return [String, nil]
          required :check_deposit_id, String, nil?: true

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's currency.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::CheckDepositInstruction::Currency]
          required :currency, enum: -> { Increase::PendingTransaction::Source::CheckDepositInstruction::Currency }

          # @!attribute front_image_file_id
          #   The identifier of the File containing the image of the front of the check that
          #   was deposited.
          #
          #   @return [String]
          required :front_image_file_id, String

          # @!method initialize(amount:, back_image_file_id:, check_deposit_id:, currency:, front_image_file_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::PendingTransaction::Source::CheckDepositInstruction} for more
          #   details.
          #
          #   A Check Deposit Instruction object. This field will be present in the JSON
          #   response if and only if `category` is equal to `check_deposit_instruction`.
          #
          #   @param amount [Integer] The pending amount in USD cents.
          #
          #   @param back_image_file_id [String, nil] The identifier of the File containing the image of the back of the check that wa
          #
          #   @param check_deposit_id [String, nil] The identifier of the Check Deposit.
          #
          #   @param currency [Symbol, Increase::Models::PendingTransaction::Source::CheckDepositInstruction::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param front_image_file_id [String] The identifier of the File containing the image of the front of the check that w

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          #
          # @see Increase::Models::PendingTransaction::Source::CheckDepositInstruction#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::PendingTransaction::Source#check_transfer_instruction
        class CheckTransferInstruction < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The transfer amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          #   currency.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::CheckTransferInstruction::Currency]
          required :currency, enum: -> { Increase::PendingTransaction::Source::CheckTransferInstruction::Currency }

          # @!attribute transfer_id
          #   The identifier of the Check Transfer that led to this Pending Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, currency:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::PendingTransaction::Source::CheckTransferInstruction} for
          #   more details.
          #
          #   A Check Transfer Instruction object. This field will be present in the JSON
          #   response if and only if `category` is equal to `check_transfer_instruction`.
          #
          #   @param amount [Integer] The transfer amount in USD cents.
          #
          #   @param currency [Symbol, Increase::Models::PendingTransaction::Source::CheckTransferInstruction::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's curr
          #
          #   @param transfer_id [String] The identifier of the Check Transfer that led to this Pending Transaction.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          # currency.
          #
          # @see Increase::Models::PendingTransaction::Source::CheckTransferInstruction#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::PendingTransaction::Source#fednow_transfer_instruction
        class FednowTransferInstruction < Increase::Internal::Type::BaseModel
          # @!attribute transfer_id
          #   The identifier of the FedNow Transfer that led to this Pending Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(transfer_id:)
          #   A FedNow Transfer Instruction object. This field will be present in the JSON
          #   response if and only if `category` is equal to `fednow_transfer_instruction`.
          #
          #   @param transfer_id [String] The identifier of the FedNow Transfer that led to this Pending Transaction.
        end

        # @see Increase::Models::PendingTransaction::Source#inbound_funds_hold
        class InboundFundsHold < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The held amount in the minor unit of the account's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute automatically_releases_at
          #   When the hold will be released automatically. Certain conditions may cause it to
          #   be released before this time.
          #
          #   @return [Time]
          required :automatically_releases_at, Time

          # @!attribute created_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
          #   was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
          #   currency.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::InboundFundsHold::Currency]
          required :currency, enum: -> { Increase::PendingTransaction::Source::InboundFundsHold::Currency }

          # @!attribute held_transaction_id
          #   The ID of the Transaction for which funds were held.
          #
          #   @return [String, nil]
          required :held_transaction_id, String, nil?: true

          # @!attribute pending_transaction_id
          #   The ID of the Pending Transaction representing the held funds.
          #
          #   @return [String, nil]
          required :pending_transaction_id, String, nil?: true

          # @!attribute released_at
          #   When the hold was released (if it has been released).
          #
          #   @return [Time, nil]
          required :released_at, Time, nil?: true

          # @!attribute status
          #   The status of the hold.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::InboundFundsHold::Status]
          required :status, enum: -> { Increase::PendingTransaction::Source::InboundFundsHold::Status }

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `inbound_funds_hold`.
          #
          #   @return [Symbol, Increase::Models::PendingTransaction::Source::InboundFundsHold::Type]
          required :type, enum: -> { Increase::PendingTransaction::Source::InboundFundsHold::Type }

          # @!method initialize(amount:, automatically_releases_at:, created_at:, currency:, held_transaction_id:, pending_transaction_id:, released_at:, status:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::PendingTransaction::Source::InboundFundsHold} for more
          #   details.
          #
          #   An Inbound Funds Hold object. This field will be present in the JSON response if
          #   and only if `category` is equal to `inbound_funds_hold`. We hold funds for
          #   certain transaction types to account for return windows where funds might still
          #   be clawed back by the sending institution.
          #
          #   @param amount [Integer] The held amount in the minor unit of the account's currency. For dollars, for ex
          #
          #   @param automatically_releases_at [Time] When the hold will be released automatically. Certain conditions may cause it to
          #
          #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold wa
          #
          #   @param currency [Symbol, Increase::Models::PendingTransaction::Source::InboundFundsHold::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's curre
          #
          #   @param held_transaction_id [String, nil] The ID of the Transaction for which funds were held.
          #
          #   @param pending_transaction_id [String, nil] The ID of the Pending Transaction representing the held funds.
          #
          #   @param released_at [Time, nil] When the hold was released (if it has been released).
          #
          #   @param status [Symbol, Increase::Models::PendingTransaction::Source::InboundFundsHold::Status] The status of the hold.
          #
          #   @param type [Symbol, Increase::Models::PendingTransaction::Source::InboundFundsHold::Type] A constant representing the object's type. For this resource it will always be `

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
          # currency.
          #
          # @see Increase::Models::PendingTransaction::Source::InboundFundsHold#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The status of the hold.
          #
          # @see Increase::Models::PendingTransaction::Source::InboundFundsHold#status
          module Status
            extend Increase::Internal::Type::Enum

            # Funds are still being held.
            HELD = :held

            # Funds have been released.
            COMPLETE = :complete

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # A constant representing the object's type. For this resource it will always be
          # `inbound_funds_hold`.
          #
          # @see Increase::Models::PendingTransaction::Source::InboundFundsHold#type
          module Type
            extend Increase::Internal::Type::Enum

            INBOUND_FUNDS_HOLD = :inbound_funds_hold

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::PendingTransaction::Source#inbound_wire_transfer_reversal
        class InboundWireTransferReversal < Increase::Internal::Type::BaseModel
          # @!attribute inbound_wire_transfer_id
          #   The ID of the Inbound Wire Transfer that is being reversed.
          #
          #   @return [String]
          required :inbound_wire_transfer_id, String

          # @!method initialize(inbound_wire_transfer_id:)
          #   An Inbound Wire Transfer Reversal object. This field will be present in the JSON
          #   response if and only if `category` is equal to `inbound_wire_transfer_reversal`.
          #   An Inbound Wire Transfer Reversal is created when Increase has received a wire
          #   and the User requests that it be reversed.
          #
          #   @param inbound_wire_transfer_id [String] The ID of the Inbound Wire Transfer that is being reversed.
        end

        # @see Increase::Models::PendingTransaction::Source#other
        class Other < Increase::Internal::Type::BaseModel
          # @!method initialize
          #   If the category of this Transaction source is equal to `other`, this field will
          #   contain an empty object, otherwise it will contain null.
        end

        # @see Increase::Models::PendingTransaction::Source#real_time_payments_transfer_instruction
        class RealTimePaymentsTransferInstruction < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The transfer amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute transfer_id
          #   The identifier of the Real-Time Payments Transfer that led to this Pending
          #   Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::PendingTransaction::Source::RealTimePaymentsTransferInstruction}
          #   for more details.
          #
          #   A Real-Time Payments Transfer Instruction object. This field will be present in
          #   the JSON response if and only if `category` is equal to
          #   `real_time_payments_transfer_instruction`.
          #
          #   @param amount [Integer] The transfer amount in USD cents.
          #
          #   @param transfer_id [String] The identifier of the Real-Time Payments Transfer that led to this Pending Trans
        end

        # @see Increase::Models::PendingTransaction::Source#swift_transfer_instruction
        class SwiftTransferInstruction < Increase::Internal::Type::BaseModel
          # @!attribute transfer_id
          #   The identifier of the Swift Transfer that led to this Pending Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(transfer_id:)
          #   A Swift Transfer Instruction object. This field will be present in the JSON
          #   response if and only if `category` is equal to `swift_transfer_instruction`.
          #
          #   @param transfer_id [String] The identifier of the Swift Transfer that led to this Pending Transaction.
        end

        # @see Increase::Models::PendingTransaction::Source#wire_transfer_instruction
        class WireTransferInstruction < Increase::Internal::Type::BaseModel
          # @!attribute account_number
          #   The account number for the destination account.
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
          #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
          #   destination account.
          #
          #   @return [String]
          required :routing_number, String

          # @!attribute transfer_id
          #   The identifier of the Wire Transfer that led to this Pending Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(account_number:, amount:, message_to_recipient:, routing_number:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::PendingTransaction::Source::WireTransferInstruction} for more
          #   details.
          #
          #   A Wire Transfer Instruction object. This field will be present in the JSON
          #   response if and only if `category` is equal to `wire_transfer_instruction`.
          #
          #   @param account_number [String] The account number for the destination account.
          #
          #   @param amount [Integer] The transfer amount in USD cents.
          #
          #   @param message_to_recipient [String] The message that will show on the recipient's bank statement.
          #
          #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the des
          #
          #   @param transfer_id [String] The identifier of the Wire Transfer that led to this Pending Transaction.
        end
      end

      # Whether the Pending Transaction has been confirmed and has an associated
      # Transaction.
      #
      # @see Increase::Models::PendingTransaction#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Pending Transaction is still awaiting confirmation.
        PENDING = :pending

        # The Pending Transaction is confirmed. An associated Transaction exists for this object. The Pending Transaction will no longer count against your balance and can generally be hidden from UIs, etc.
        COMPLETE = :complete

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `pending_transaction`.
      #
      # @see Increase::Models::PendingTransaction#type
      module Type
        extend Increase::Internal::Type::Enum

        PENDING_TRANSACTION = :pending_transaction

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
