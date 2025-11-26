# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ACHTransfers#list
    class ACHTransferListResponse < Increase::Internal::Type::BaseModel
      # @!attribute data
      #   The contents of the list.
      #
      #   @return [Array<Increase::Models::ACHTransfer>]
      required :data, -> { Increase::Internal::Type::ArrayOf[Increase::ACHTransfer] }

      # @!attribute next_cursor
      #   A pointer to a place in the list.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, next_cursor:)
      #   A list of ACH Transfer objects.
      #
      #   @param data [Array<Increase::Models::ACHTransfer>] The contents of the list.
      #
      #   @param next_cursor [String, nil] A pointer to a place in the list.
    end
  end
end
