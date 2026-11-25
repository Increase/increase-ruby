# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireTransfers#reverse
    class InboundWireTransferReverseParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_wire_transfer_id
      #   The identifier of the Inbound Wire Transfer to reverse.
      #
      #   @return [String]
      required :inbound_wire_transfer_id, String

      # @!attribute reason
      #   Reason for the reversal.
      #
      #   @return [Symbol, Increase::Models::InboundWireTransferReverseParams::Reason]
      required :reason, enum: -> { Increase::InboundWireTransferReverseParams::Reason }

      # @!attribute amount
      #   The amount to return, in USD cents. Defaults to the full amount of the Inbound
      #   Wire Transfer. A transfer can only be reversed once, so any amount you don't
      #   return now stays with the recipient.
      #
      #   @return [Integer, nil]
      optional :amount, Integer

      # @!method initialize(inbound_wire_transfer_id:, reason:, amount: nil, request_options: {})
      #   @param inbound_wire_transfer_id [String] The identifier of the Inbound Wire Transfer to reverse.
      #
      #   @param reason [Symbol, Increase::Models::InboundWireTransferReverseParams::Reason]
      #     Reason for the reversal.
      #
      #   @param amount [Integer]
      #     The amount to return, in USD cents. Defaults to the full amount of the Inbound
      #     Wire Transfer. A transfer can only be reversed once, so any amount you don't
      #     return now stays with the recipient.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # Reason for the reversal.
      module Reason
        extend Increase::Internal::Type::Enum

        # The inbound wire transfer was a duplicate.
        DUPLICATE = :duplicate

        # The recipient of the wire transfer requested the funds be returned to the sender.
        CREDITOR_REQUEST = :creditor_request

        # The account cannot currently receive inbound wires.
        TRANSACTION_FORBIDDEN = :transaction_forbidden

        # The inbound wire transfer was fraudulent.
        FRAUD = :fraud

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
