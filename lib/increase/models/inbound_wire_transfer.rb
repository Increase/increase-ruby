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
      #     the inbound wire transfer was created.
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
      #     abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
      #     service and is helpful when debugging wires with the originating bank.
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
      #     the transfer.
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
      #     `inbound_wire_transfer`.
      #
      #   @return [Symbol, Increase::Models::InboundWireTransfer::Type]
      required :type, enum: -> { Increase::Models::InboundWireTransfer::Type }

      # @!parse
      #   # An Inbound Wire Transfer is a wire transfer initiated outside of Increase to
      #   #   your account.
      #   #
      #   # @param id [String]
      #   # @param account_id [String]
      #   # @param account_number_id [String]
      #   # @param amount [Integer]
      #   # @param beneficiary_address_line1 [String, nil]
      #   # @param beneficiary_address_line2 [String, nil]
      #   # @param beneficiary_address_line3 [String, nil]
      #   # @param beneficiary_name [String, nil]
      #   # @param beneficiary_reference [String, nil]
      #   # @param created_at [Time]
      #   # @param description [String]
      #   # @param input_message_accountability_data [String, nil]
      #   # @param originator_address_line1 [String, nil]
      #   # @param originator_address_line2 [String, nil]
      #   # @param originator_address_line3 [String, nil]
      #   # @param originator_name [String, nil]
      #   # @param originator_routing_number [String, nil]
      #   # @param originator_to_beneficiary_information [String, nil]
      #   # @param originator_to_beneficiary_information_line1 [String, nil]
      #   # @param originator_to_beneficiary_information_line2 [String, nil]
      #   # @param originator_to_beneficiary_information_line3 [String, nil]
      #   # @param originator_to_beneficiary_information_line4 [String, nil]
      #   # @param sender_reference [String, nil]
      #   # @param status [Symbol, Increase::Models::InboundWireTransfer::Status]
      #   # @param type [Symbol, Increase::Models::InboundWireTransfer::Type]
      #   #
      #   def initialize(
      #     id:,
      #     account_id:,
      #     account_number_id:,
      #     amount:,
      #     beneficiary_address_line1:,
      #     beneficiary_address_line2:,
      #     beneficiary_address_line3:,
      #     beneficiary_name:,
      #     beneficiary_reference:,
      #     created_at:,
      #     description:,
      #     input_message_accountability_data:,
      #     originator_address_line1:,
      #     originator_address_line2:,
      #     originator_address_line3:,
      #     originator_name:,
      #     originator_routing_number:,
      #     originator_to_beneficiary_information:,
      #     originator_to_beneficiary_information_line1:,
      #     originator_to_beneficiary_information_line2:,
      #     originator_to_beneficiary_information_line3:,
      #     originator_to_beneficiary_information_line4:,
      #     sender_reference:,
      #     status:,
      #     type:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `inbound_wire_transfer`.
      #
      # @see Increase::Models::InboundWireTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_WIRE_TRANSFER = :inbound_wire_transfer

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
