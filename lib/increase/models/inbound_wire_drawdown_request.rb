# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireDrawdownRequests#retrieve
    class InboundWireDrawdownRequest < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Wire drawdown request identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute amount
      #   The amount being requested in cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the inbound wire drawdown request was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute creditor_account_number
      #   The creditor's account number.
      #
      #   @return [String]
      required :creditor_account_number, String

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

      # @!attribute creditor_routing_number
      #   The creditor's routing number.
      #
      #   @return [String]
      required :creditor_routing_number, String

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #   requested. Will always be "USD".
      #
      #   @return [String]
      required :currency, String

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

      # @!attribute end_to_end_identification
      #   A free-form reference string set by the sender, to help identify the drawdown
      #   request.
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

      # @!attribute instruction_identification
      #   The sending bank's identifier for the drawdown request.
      #
      #   @return [String, nil]
      required :instruction_identification, String, nil?: true

      # @!attribute recipient_account_number_id
      #   The Account Number from which the recipient of this request is being requested
      #   to send funds.
      #
      #   @return [String]
      required :recipient_account_number_id, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_wire_drawdown_request`.
      #
      #   @return [Symbol, Increase::Models::InboundWireDrawdownRequest::Type]
      required :type, enum: -> { Increase::InboundWireDrawdownRequest::Type }

      # @!attribute unique_end_to_end_transaction_reference
      #   The Unique End-to-end Transaction Reference
      #   ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
      #   of the drawdown request.
      #
      #   @return [String, nil]
      required :unique_end_to_end_transaction_reference, String, nil?: true

      # @!attribute unstructured_remittance_information
      #   A free-form message set by the sender.
      #
      #   @return [String, nil]
      required :unstructured_remittance_information, String, nil?: true

      # @!method initialize(id:, amount:, created_at:, creditor_account_number:, creditor_address_line1:, creditor_address_line2:, creditor_address_line3:, creditor_name:, creditor_routing_number:, currency:, debtor_address_line1:, debtor_address_line2:, debtor_address_line3:, debtor_name:, end_to_end_identification:, input_message_accountability_data:, instruction_identification:, recipient_account_number_id:, type:, unique_end_to_end_transaction_reference:, unstructured_remittance_information:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundWireDrawdownRequest} for more details.
      #
      #   Inbound wire drawdown requests are requests from someone else to send them a
      #   wire. For more information, see our
      #   [Wire Drawdown Requests documentation](/documentation/wire-drawdown-requests).
      #
      #   @param id [String] The Wire drawdown request identifier.
      #
      #   @param amount [Integer] The amount being requested in cents.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param creditor_account_number [String] The creditor's account number.
      #
      #   @param creditor_address_line1 [String, nil] A free-form address field set by the sender.
      #
      #   @param creditor_address_line2 [String, nil] A free-form address field set by the sender.
      #
      #   @param creditor_address_line3 [String, nil] A free-form address field set by the sender.
      #
      #   @param creditor_name [String, nil] A name set by the sender.
      #
      #   @param creditor_routing_number [String] The creditor's routing number.
      #
      #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #
      #   @param debtor_address_line1 [String, nil] A free-form address field set by the sender.
      #
      #   @param debtor_address_line2 [String, nil] A free-form address field set by the sender.
      #
      #   @param debtor_address_line3 [String, nil] A free-form address field set by the sender.
      #
      #   @param debtor_name [String, nil] A name set by the sender.
      #
      #   @param end_to_end_identification [String, nil] A free-form reference string set by the sender, to help identify the drawdown re
      #
      #   @param input_message_accountability_data [String, nil] A unique identifier available to the originating and receiving banks, commonly a
      #
      #   @param instruction_identification [String, nil] The sending bank's identifier for the drawdown request.
      #
      #   @param recipient_account_number_id [String] The Account Number from which the recipient of this request is being requested t
      #
      #   @param type [Symbol, Increase::Models::InboundWireDrawdownRequest::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param unique_end_to_end_transaction_reference [String, nil] The Unique End-to-end Transaction Reference ([UETR](https://www.swift.com/paymen
      #
      #   @param unstructured_remittance_information [String, nil] A free-form message set by the sender.

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_drawdown_request`.
      #
      # @see Increase::Models::InboundWireDrawdownRequest#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_WIRE_DRAWDOWN_REQUEST = :inbound_wire_drawdown_request

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
