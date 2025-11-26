# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundFednowTransfers#list
    class InboundFednowTransferListResponse < Increase::Internal::Type::BaseModel
      # @!attribute data
      #   The contents of the list.
      #
      #   @return [Array<Increase::Models::InboundFednowTransfer>]
      required :data, -> { Increase::Internal::Type::ArrayOf[Increase::InboundFednowTransfer] }

      # @!attribute next_cursor
      #   A pointer to a place in the list.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, next_cursor:)
      #   A list of Inbound FedNow Transfer objects.
      #
      #   @param data [Array<Increase::Models::InboundFednowTransfer>] The contents of the list.
      #
      #   @param next_cursor [String, nil] A pointer to a place in the list.
    end
  end
end
