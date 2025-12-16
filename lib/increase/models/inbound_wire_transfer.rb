# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireTransfers#retrieve
    class InboundWireTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The inbound wire transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account to which the transfer belongs.
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

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the inbound wire transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute creditor_address_line1
      #   A free-form address field set by the sender.
      #
      #   @return [String, nil]
      required :creditor_address_line1, String, nil?: true

      # @!attribute creditor_address_line2
      #   A free-form address field set by the sender.
      #
      #   @return [String, nil]
      required :creditor_address_line2, String, nil?: true

      # @!attribute creditor_address_line3
      #   A free-form address field set by the sender.
      #
      #   @return [String, nil]
      required :creditor_address_line3, String, nil?: true

      # @!attribute creditor_name
      #   A name set by the sender.
      #
      #   @return [String, nil]
      required :creditor_name, String, nil?: true

      # @!attribute debtor_address_line1
      #   A free-form address field set by the sender.
      #
      #   @return [String, nil]
      required :debtor_address_line1, String, nil?: true

      # @!attribute debtor_address_line2
      #   A free-form address field set by the sender.
      #
      #   @return [String, nil]
      required :debtor_address_line2, String, nil?: true

      # @!attribute debtor_address_line3
      #   A free-form address field set by the sender.
      #
      #   @return [String, nil]
      required :debtor_address_line3, String, nil?: true

      # @!attribute debtor_name
      #   A name set by the sender.
      #
      #   @return [String, nil]
      required :debtor_name, String, nil?: true

      # @!attribute description
      #   An Increase-constructed description of the transfer.
      #
      #   @return [String]
      required :description, String

      # @!attribute end_to_end_identification
      #   A free-form reference string set by the sender, to help identify the transfer.
      #
      #   @return [String, nil]
      required :end_to_end_identification, String, nil?: true

      # @!attribute input_message_accountability_data
      #   A unique identifier available to the originating and receiving banks, commonly
      #   abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
      #   service and is helpful when debugging wires with the originating bank.
      #
      #   @return [String, nil]
      required :input_message_accountability_data, String, nil?: true

      # @!attribute instructing_agent_routing_number
      #   The American Banking Association (ABA) routing number of the bank that sent the
      #   wire.
      #
      #   @return [String, nil]
      required :instructing_agent_routing_number, String, nil?: true

      # @!attribute instruction_identification
      #   The sending bank's identifier for the wire transfer.
      #
      #   @return [String, nil]
      required :instruction_identification, String, nil?: true

      # @!attribute reversal
      #   Information about the reversal of the inbound wire transfer if it has been
      #   reversed.
      #
      #   @return [Increase::Models::InboundWireTransfer::Reversal, nil]
      required :reversal, -> { Increase::InboundWireTransfer::Reversal }, nil?: true

      # @!attribute status
      #   The status of the transfer.
      #
      #   @return [Symbol, Increase::Models::InboundWireTransfer::Status]
      required :status, enum: -> { Increase::InboundWireTransfer::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_wire_transfer`.
      #
      #   @return [Symbol, Increase::Models::InboundWireTransfer::Type]
      required :type, enum: -> { Increase::InboundWireTransfer::Type }

      # @!attribute unique_end_to_end_transaction_reference
      #   The Unique End-to-end Transaction Reference
      #   ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
      #   of the transfer.
      #
      #   @return [String, nil]
      required :unique_end_to_end_transaction_reference, String, nil?: true

      # @!attribute unstructured_remittance_information
      #   A free-form message set by the sender.
      #
      #   @return [String, nil]
      required :unstructured_remittance_information, String, nil?: true

      # @!attribute wire_drawdown_request_id
      #   The wire drawdown request the inbound wire transfer is fulfilling.
      #
      #   @return [String, nil]
      required :wire_drawdown_request_id, String, nil?: true

      # @!method initialize(id:, account_id:, account_number_id:, amount:, created_at:, creditor_address_line1:, creditor_address_line2:, creditor_address_line3:, creditor_name:, debtor_address_line1:, debtor_address_line2:, debtor_address_line3:, debtor_name:, description:, end_to_end_identification:, input_message_accountability_data:, instructing_agent_routing_number:, instruction_identification:, reversal:, status:, type:, unique_end_to_end_transaction_reference:, unstructured_remittance_information:, wire_drawdown_request_id:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundWireTransfer} for more details.
      #
      #   An Inbound Wire Transfer is a wire transfer initiated outside of Increase to
      #   your account.
      #
      #   @param id [String] The inbound wire transfer's identifier.
      #
      #   @param account_id [String] The Account to which the transfer belongs.
      #
      #   @param account_number_id [String] The identifier of the Account Number to which this transfer was sent.
      #
      #   @param amount [Integer] The amount in USD cents.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param creditor_address_line1 [String, nil] A free-form address field set by the sender.
      #
      #   @param creditor_address_line2 [String, nil] A free-form address field set by the sender.
      #
      #   @param creditor_address_line3 [String, nil] A free-form address field set by the sender.
      #
      #   @param creditor_name [String, nil] A name set by the sender.
      #
      #   @param debtor_address_line1 [String, nil] A free-form address field set by the sender.
      #
      #   @param debtor_address_line2 [String, nil] A free-form address field set by the sender.
      #
      #   @param debtor_address_line3 [String, nil] A free-form address field set by the sender.
      #
      #   @param debtor_name [String, nil] A name set by the sender.
      #
      #   @param description [String] An Increase-constructed description of the transfer.
      #
      #   @param end_to_end_identification [String, nil] A free-form reference string set by the sender, to help identify the transfer.
      #
      #   @param input_message_accountability_data [String, nil] A unique identifier available to the originating and receiving banks, commonly a
      #
      #   @param instructing_agent_routing_number [String, nil] The American Banking Association (ABA) routing number of the bank that sent the
      #
      #   @param instruction_identification [String, nil] The sending bank's identifier for the wire transfer.
      #
      #   @param reversal [Increase::Models::InboundWireTransfer::Reversal, nil] Information about the reversal of the inbound wire transfer if it has been rever
      #
      #   @param status [Symbol, Increase::Models::InboundWireTransfer::Status] The status of the transfer.
      #
      #   @param type [Symbol, Increase::Models::InboundWireTransfer::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param unique_end_to_end_transaction_reference [String, nil] The Unique End-to-end Transaction Reference ([UETR](https://www.swift.com/paymen
      #
      #   @param unstructured_remittance_information [String, nil] A free-form message set by the sender.
      #
      #   @param wire_drawdown_request_id [String, nil] The wire drawdown request the inbound wire transfer is fulfilling.

      # @see Increase::Models::InboundWireTransfer#reversal
      class Reversal < Increase::Internal::Type::BaseModel
        # @!attribute reason
        #   The reason for the reversal.
        #
        #   @return [Symbol, Increase::Models::InboundWireTransfer::Reversal::Reason]
        required :reason, enum: -> { Increase::InboundWireTransfer::Reversal::Reason }

        # @!attribute reversed_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was reversed.
        #
        #   @return [Time]
        required :reversed_at, Time

        # @!method initialize(reason:, reversed_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::InboundWireTransfer::Reversal} for more details.
        #
        #   Information about the reversal of the inbound wire transfer if it has been
        #   reversed.
        #
        #   @param reason [Symbol, Increase::Models::InboundWireTransfer::Reversal::Reason] The reason for the reversal.
        #
        #   @param reversed_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th

        # The reason for the reversal.
        #
        # @see Increase::Models::InboundWireTransfer::Reversal#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The inbound wire transfer was a duplicate.
          DUPLICATE = :duplicate

          # The recipient of the wire transfer requested the funds be returned to the sender.
          CREDITOR_REQUEST = :creditor_request

          # The account cannot currently receive inbound wires.
          TRANSACTION_FORBIDDEN = :transaction_forbidden

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The status of the transfer.
      #
      # @see Increase::Models::InboundWireTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Inbound Wire Transfer is awaiting action, will transition automatically if no action is taken.
        PENDING = :pending

        # The Inbound Wire Transfer is accepted.
        ACCEPTED = :accepted

        # The Inbound Wire Transfer was declined.
        DECLINED = :declined

        # The Inbound Wire Transfer was reversed.
        REVERSED = :reversed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_transfer`.
      #
      # @see Increase::Models::InboundWireTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_WIRE_TRANSFER = :inbound_wire_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
