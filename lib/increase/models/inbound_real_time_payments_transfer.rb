# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundRealTimePaymentsTransfers#retrieve
    class InboundRealTimePaymentsTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The inbound Real-Time Payments transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account to which the transfer was sent.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number_id
      #   The identifier of the Account Number to which this transfer was sent.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute amount
      #   The amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute confirmation
      #   If your transfer is confirmed, this will contain details of the confirmation.
      #
      #   @return [Increase::Models::InboundRealTimePaymentsTransfer::Confirmation, nil]
      required :confirmation, -> { Increase::Models::InboundRealTimePaymentsTransfer::Confirmation }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute creditor_name
      #   The name the sender of the transfer specified as the recipient of the transfer.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
      #     currency. This will always be "USD" for a Real-Time Payments transfer.
      #
      #   @return [Symbol, Increase::Models::InboundRealTimePaymentsTransfer::Currency]
      required :currency, enum: -> { Increase::Models::InboundRealTimePaymentsTransfer::Currency }

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

      # @!attribute decline
      #   If your transfer is declined, this will contain details of the decline.
      #
      #   @return [Increase::Models::InboundRealTimePaymentsTransfer::Decline, nil]
      required :decline, -> { Increase::Models::InboundRealTimePaymentsTransfer::Decline }, nil?: true

      # @!attribute remittance_information
      #   Additional information included with the transfer.
      #
      #   @return [String, nil]
      required :remittance_information, String, nil?: true

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::InboundRealTimePaymentsTransfer::Status]
      required :status, enum: -> { Increase::Models::InboundRealTimePaymentsTransfer::Status }

      # @!attribute transaction_identification
      #   The Real-Time Payments network identification of the transfer.
      #
      #   @return [String]
      required :transaction_identification, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `inbound_real_time_payments_transfer`.
      #
      #   @return [Symbol, Increase::Models::InboundRealTimePaymentsTransfer::Type]
      required :type, enum: -> { Increase::Models::InboundRealTimePaymentsTransfer::Type }

      # @!parse
      #   # An Inbound Real-Time Payments Transfer is a Real-Time Payments transfer
      #   #   initiated outside of Increase to your account.
      #   #
      #   # @param id [String]
      #   # @param account_id [String]
      #   # @param account_number_id [String]
      #   # @param amount [Integer]
      #   # @param confirmation [Increase::Models::InboundRealTimePaymentsTransfer::Confirmation, nil]
      #   # @param created_at [Time]
      #   # @param creditor_name [String]
      #   # @param currency [Symbol, Increase::Models::InboundRealTimePaymentsTransfer::Currency]
      #   # @param debtor_account_number [String]
      #   # @param debtor_name [String]
      #   # @param debtor_routing_number [String]
      #   # @param decline [Increase::Models::InboundRealTimePaymentsTransfer::Decline, nil]
      #   # @param remittance_information [String, nil]
      #   # @param status [Symbol, Increase::Models::InboundRealTimePaymentsTransfer::Status]
      #   # @param transaction_identification [String]
      #   # @param type [Symbol, Increase::Models::InboundRealTimePaymentsTransfer::Type]
      #   #
      #   def initialize(
      #     id:,
      #     account_id:,
      #     account_number_id:,
      #     amount:,
      #     confirmation:,
      #     created_at:,
      #     creditor_name:,
      #     currency:,
      #     debtor_account_number:,
      #     debtor_name:,
      #     debtor_routing_number:,
      #     decline:,
      #     remittance_information:,
      #     status:,
      #     transaction_identification:,
      #     type:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # @see Increase::Models::InboundRealTimePaymentsTransfer#confirmation
      class Confirmation < Increase::Internal::Type::BaseModel
        # @!attribute confirmed_at
        #   The time at which the transfer was confirmed.
        #
        #   @return [Time]
        required :confirmed_at, Time

        # @!attribute transaction_id
        #   The id of the transaction for the confirmed transfer.
        #
        #   @return [String]
        required :transaction_id, String

        # @!parse
        #   # If your transfer is confirmed, this will contain details of the confirmation.
        #   #
        #   # @param confirmed_at [Time]
        #   # @param transaction_id [String]
        #   #
        #   def initialize(confirmed_at:, transaction_id:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
      #   currency. This will always be "USD" for a Real-Time Payments transfer.
      #
      # @see Increase::Models::InboundRealTimePaymentsTransfer#currency
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

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # @see Increase::Models::InboundRealTimePaymentsTransfer#decline
      class Decline < Increase::Internal::Type::BaseModel
        # @!attribute declined_at
        #   The time at which the transfer was declined.
        #
        #   @return [Time]
        required :declined_at, Time

        # @!attribute declined_transaction_id
        #   The id of the transaction for the declined transfer.
        #
        #   @return [String]
        required :declined_transaction_id, String

        # @!attribute reason
        #   The reason for the transfer decline.
        #
        #   @return [Symbol, Increase::Models::InboundRealTimePaymentsTransfer::Decline::Reason]
        required :reason, enum: -> { Increase::Models::InboundRealTimePaymentsTransfer::Decline::Reason }

        # @!parse
        #   # If your transfer is declined, this will contain details of the decline.
        #   #
        #   # @param declined_at [Time]
        #   # @param declined_transaction_id [String]
        #   # @param reason [Symbol, Increase::Models::InboundRealTimePaymentsTransfer::Decline::Reason]
        #   #
        #   def initialize(declined_at:, declined_transaction_id:, reason:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # The reason for the transfer decline.
        #
        # @see Increase::Models::InboundRealTimePaymentsTransfer::Decline#reason
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::InboundRealTimePaymentsTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is pending confirmation.
        PENDING_CONFIRMING = :pending_confirming

        # The transfer was not responded to in time.
        TIMED_OUT = :timed_out

        # The transfer has been received successfully and is confirmed.
        CONFIRMED = :confirmed

        # The transfer has been declined.
        DECLINED = :declined

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `inbound_real_time_payments_transfer`.
      #
      # @see Increase::Models::InboundRealTimePaymentsTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_REAL_TIME_PAYMENTS_TRANSFER = :inbound_real_time_payments_transfer

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
