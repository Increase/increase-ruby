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

      # @!method initialize(inbound_wire_transfer_id:, reason:, request_options: {})
      #   @param inbound_wire_transfer_id [String] The identifier of the Inbound Wire Transfer to reverse.
      #
      #   @param reason [Symbol, Increase::Models::InboundWireTransferReverseParams::Reason] Reason for the reversal.
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

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
