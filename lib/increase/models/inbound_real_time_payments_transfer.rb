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
      #   @return [Increase::InboundRealTimePaymentsTransfer::Confirmation, nil]
      required :confirmation, -> { Increase::InboundRealTimePaymentsTransfer::Confirmation }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
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
      #   currency. This will always be "USD" for a Real-Time Payments transfer.
      #
      #   @return [Symbol, Increase::InboundRealTimePaymentsTransfer::Currency]
      required :currency, enum: -> { Increase::InboundRealTimePaymentsTransfer::Currency }

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
      #   @return [Increase::InboundRealTimePaymentsTransfer::Decline, nil]
      required :decline, -> { Increase::InboundRealTimePaymentsTransfer::Decline }, nil?: true

      # @!attribute remittance_information
      #   Additional information included with the transfer.
      #
      #   @return [String, nil]
      required :remittance_information, String, nil?: true

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::InboundRealTimePaymentsTransfer::Status]
      required :status, enum: -> { Increase::InboundRealTimePaymentsTransfer::Status }

      # @!attribute transaction_identification
      #   The Real-Time Payments network identification of the transfer.
      #
      #   @return [String]
      required :transaction_identification, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_real_time_payments_transfer`.
      #
      #   @return [Symbol, Increase::InboundRealTimePaymentsTransfer::Type]
      required :type, enum: -> { Increase::InboundRealTimePaymentsTransfer::Type }

      # @!method initialize(id:, account_id:, account_number_id:, amount:, confirmation:, created_at:, creditor_name:, currency:, debtor_account_number:, debtor_name:, debtor_routing_number:, decline:, remittance_information:, status:, transaction_identification:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::InboundRealTimePaymentsTransfer} for more details.
      #
      #   An Inbound Real-Time Payments Transfer is a Real-Time Payments transfer
      #   initiated outside of Increase to your account.
      #
      #   @param id [String] The inbound Real-Time Payments transfer's identifier.
      #
      #   @param account_id [String] The Account to which the transfer was sent.
      #
      #   @param account_number_id [String] The identifier of the Account Number to which this transfer was sent.
      #
      #   @param amount [Integer] The amount in USD cents.
      #
      #   @param confirmation [Increase::InboundRealTimePaymentsTransfer::Confirmation, nil] If your transfer is confirmed, this will contain details of the confirmation.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param creditor_name [String] The name the sender of the transfer specified as the recipient of the transfer.
      #
      #   @param currency [Symbol, Increase::InboundRealTimePaymentsTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's cu
      #
      #   @param debtor_account_number [String] The account number of the account that sent the transfer.
      #
      #   @param debtor_name [String] The name provided by the sender of the transfer.
      #
      #   @param debtor_routing_number [String] The routing number of the account that sent the transfer.
      #
      #   @param decline [Increase::InboundRealTimePaymentsTransfer::Decline, nil] If your transfer is declined, this will contain details of the decline.
      #
      #   @param remittance_information [String, nil] Additional information included with the transfer.
      #
      #   @param status [Symbol, Increase::InboundRealTimePaymentsTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param transaction_identification [String] The Real-Time Payments network identification of the transfer.
      #
      #   @param type [Symbol, Increase::InboundRealTimePaymentsTransfer::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::InboundRealTimePaymentsTransfer#confirmation
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

        # @!method initialize(confirmed_at:, transaction_id:)
        #   If your transfer is confirmed, this will contain details of the confirmation.
        #
        #   @param confirmed_at [Time] The time at which the transfer was confirmed.
        #
        #   @param transaction_id [String] The id of the transaction for the confirmed transfer.
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
      # currency. This will always be "USD" for a Real-Time Payments transfer.
      #
      # @see Increase::InboundRealTimePaymentsTransfer#currency
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

      # @see Increase::InboundRealTimePaymentsTransfer#decline
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
        #   @return [Symbol, Increase::InboundRealTimePaymentsTransfer::Decline::Reason]
        required :reason, enum: -> { Increase::InboundRealTimePaymentsTransfer::Decline::Reason }

        # @!method initialize(declined_at:, declined_transaction_id:, reason:)
        #   If your transfer is declined, this will contain details of the decline.
        #
        #   @param declined_at [Time] The time at which the transfer was declined.
        #
        #   @param declined_transaction_id [String] The id of the transaction for the declined transfer.
        #
        #   @param reason [Symbol, Increase::InboundRealTimePaymentsTransfer::Decline::Reason] The reason for the transfer decline.

        # The reason for the transfer decline.
        #
        # @see Increase::InboundRealTimePaymentsTransfer::Decline#reason
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

      # The lifecycle status of the transfer.
      #
      # @see Increase::InboundRealTimePaymentsTransfer#status
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

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_real_time_payments_transfer`.
      #
      # @see Increase::InboundRealTimePaymentsTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_REAL_TIME_PAYMENTS_TRANSFER = :inbound_real_time_payments_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
