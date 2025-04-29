# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireTransfers#reverse
    class InboundWireTransferReverseParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute reason
      #   Reason for the reversal.
      #
      #   @return [Symbol, Increase::Models::InboundWireTransferReverseParams::Reason]
      required :reason, enum: -> { Increase::Models::InboundWireTransferReverseParams::Reason }

      # @!method initialize(reason:, request_options: {})
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

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
