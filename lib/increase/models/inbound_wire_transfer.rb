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

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the inbound wire transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

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

      # @!attribute reversal
      #   Information about the reversal of the inbound wire transfer if it has been
      #   reversed.
      #
      #   @return [Increase::Models::InboundWireTransfer::Reversal, nil]
      required :reversal, -> { Increase::Models::InboundWireTransfer::Reversal }, nil?: true

      # @!attribute sender_reference
      #   The sending bank's reference number for the wire transfer.
      #
      #   @return [String, nil]
      required :sender_reference, String, nil?: true

      # @!attribute status
      #   The status of the transfer.
      #
      #   @return [Symbol, Increase::Models::InboundWireTransfer::Status]
      required :status, enum: -> { Increase::Models::InboundWireTransfer::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_wire_transfer`.
      #
      #   @return [Symbol, Increase::Models::InboundWireTransfer::Type]
      required :type, enum: -> { Increase::Models::InboundWireTransfer::Type }

      # @!method initialize(id:, account_id:, account_number_id:, amount:, beneficiary_address_line1:, beneficiary_address_line2:, beneficiary_address_line3:, beneficiary_name:, beneficiary_reference:, created_at:, description:, input_message_accountability_data:, originator_address_line1:, originator_address_line2:, originator_address_line3:, originator_name:, originator_routing_number:, originator_to_beneficiary_information:, originator_to_beneficiary_information_line1:, originator_to_beneficiary_information_line2:, originator_to_beneficiary_information_line3:, originator_to_beneficiary_information_line4:, reversal:, sender_reference:, status:, type:)
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
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #   ...
      #
      #   @param description [String] An Increase-constructed description of the transfer.
      #
      #   @param input_message_accountability_data [String, nil] A unique identifier available to the originating and receiving banks, commonly a
      #   ...
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
      #   ...
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
      #   @param reversal [Increase::Models::InboundWireTransfer::Reversal, nil] Information about the reversal of the inbound wire transfer if it has been rever
      #   ...
      #
      #   @param sender_reference [String, nil] The sending bank's reference number for the wire transfer.
      #
      #   @param status [Symbol, Increase::Models::InboundWireTransfer::Status] The status of the transfer.
      #
      #   @param type [Symbol, Increase::Models::InboundWireTransfer::Type] A constant representing the object's type. For this resource it will always be `
      #   ...

      # @see Increase::Models::InboundWireTransfer#reversal
      class Reversal < Increase::Internal::Type::BaseModel
        # @!attribute reason
        #   The reason for the reversal.
        #
        #   @return [Symbol, Increase::Models::InboundWireTransfer::Reversal::Reason]
        required :reason, enum: -> { Increase::Models::InboundWireTransfer::Reversal::Reason }

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
        #   ...

        # The reason for the reversal.
        #
        # @see Increase::Models::InboundWireTransfer::Reversal#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The inbound wire transfer was a duplicate.
          DUPLICATE = :duplicate

          # The recipient of the wire transfer requested the funds be returned to the sender.
          CREDITOR_REQUEST = :creditor_request

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
