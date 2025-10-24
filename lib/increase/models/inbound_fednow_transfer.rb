# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundFednowTransfers#retrieve
    class InboundFednowTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The inbound FedNow transfer's identifier.
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
      #   @return [Increase::Models::InboundFednowTransfer::Confirmation, nil]
      required :confirmation, -> { Increase::InboundFednowTransfer::Confirmation }, nil?: true

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
      #   currency. This will always be "USD" for a FedNow transfer.
      #
      #   @return [Symbol, Increase::Models::InboundFednowTransfer::Currency]
      required :currency, enum: -> { Increase::InboundFednowTransfer::Currency }

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
      #   @return [Increase::Models::InboundFednowTransfer::Decline, nil]
      required :decline, -> { Increase::InboundFednowTransfer::Decline }, nil?: true

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::InboundFednowTransfer::Status]
      required :status, enum: -> { Increase::InboundFednowTransfer::Status }

      # @!attribute transaction_id
      #   The identifier of the Transaction object created when the transfer was
      #   confirmed.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_fednow_transfer`.
      #
      #   @return [Symbol, Increase::Models::InboundFednowTransfer::Type]
      required :type, enum: -> { Increase::InboundFednowTransfer::Type }

      # @!attribute unstructured_remittance_information
      #   Additional information included with the transfer.
      #
      #   @return [String, nil]
      required :unstructured_remittance_information, String, nil?: true

      # @!method initialize(id:, account_id:, account_number_id:, amount:, confirmation:, created_at:, creditor_name:, currency:, debtor_account_number:, debtor_name:, debtor_routing_number:, decline:, status:, transaction_id:, type:, unstructured_remittance_information:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundFednowTransfer} for more details.
      #
      #   An Inbound FedNow Transfer is a FedNow transfer initiated outside of Increase to
      #   your account.
      #
      #   @param id [String] The inbound FedNow transfer's identifier.
      #
      #   @param account_id [String] The Account to which the transfer was sent.
      #
      #   @param account_number_id [String] The identifier of the Account Number to which this transfer was sent.
      #
      #   @param amount [Integer] The amount in USD cents.
      #
      #   @param confirmation [Increase::Models::InboundFednowTransfer::Confirmation, nil] If your transfer is confirmed, this will contain details of the confirmation.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param creditor_name [String] The name the sender of the transfer specified as the recipient of the transfer.
      #
      #   @param currency [Symbol, Increase::Models::InboundFednowTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's cu
      #
      #   @param debtor_account_number [String] The account number of the account that sent the transfer.
      #
      #   @param debtor_name [String] The name provided by the sender of the transfer.
      #
      #   @param debtor_routing_number [String] The routing number of the account that sent the transfer.
      #
      #   @param decline [Increase::Models::InboundFednowTransfer::Decline, nil] If your transfer is declined, this will contain details of the decline.
      #
      #   @param status [Symbol, Increase::Models::InboundFednowTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param transaction_id [String, nil] The identifier of the Transaction object created when the transfer was confirmed
      #
      #   @param type [Symbol, Increase::Models::InboundFednowTransfer::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param unstructured_remittance_information [String, nil] Additional information included with the transfer.

      # @see Increase::Models::InboundFednowTransfer#confirmation
      class Confirmation < Increase::Internal::Type::BaseModel
        # @!attribute transfer_id
        #   The identifier of the FedNow Transfer that led to this Transaction.
        #
        #   @return [String]
        required :transfer_id, String

        # @!method initialize(transfer_id:)
        #   If your transfer is confirmed, this will contain details of the confirmation.
        #
        #   @param transfer_id [String] The identifier of the FedNow Transfer that led to this Transaction.
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
      # currency. This will always be "USD" for a FedNow transfer.
      #
      # @see Increase::Models::InboundFednowTransfer#currency
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

      # @see Increase::Models::InboundFednowTransfer#decline
      class Decline < Increase::Internal::Type::BaseModel
        # @!attribute reason
        #   Why the transfer was declined.
        #
        #   @return [Symbol, Increase::Models::InboundFednowTransfer::Decline::Reason]
        required :reason, enum: -> { Increase::InboundFednowTransfer::Decline::Reason }

        # @!attribute transfer_id
        #   The identifier of the FedNow Transfer that led to this declined transaction.
        #
        #   @return [String]
        required :transfer_id, String

        # @!method initialize(reason:, transfer_id:)
        #   If your transfer is declined, this will contain details of the decline.
        #
        #   @param reason [Symbol, Increase::Models::InboundFednowTransfer::Decline::Reason] Why the transfer was declined.
        #
        #   @param transfer_id [String] The identifier of the FedNow Transfer that led to this declined transaction.

        # Why the transfer was declined.
        #
        # @see Increase::Models::InboundFednowTransfer::Decline#reason
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

          # Your account is not enabled to receive FedNow transfers.
          FEDNOW_NOT_ENABLED = :fednow_not_enabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::InboundFednowTransfer#status
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

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_fednow_transfer`.
      #
      # @see Increase::Models::InboundFednowTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_FEDNOW_TRANSFER = :inbound_fednow_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
