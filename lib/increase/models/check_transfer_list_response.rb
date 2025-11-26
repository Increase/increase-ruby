# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckTransfers#list
    class CheckTransferListResponse < Increase::Internal::Type::BaseModel
      # @!attribute data
      #   The contents of the list.
      #
      #   @return [Array<Increase::Models::CheckTransfer>]
      required :data, -> { Increase::Internal::Type::ArrayOf[Increase::CheckTransfer] }

      # @!attribute next_cursor
      #   A pointer to a place in the list.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, next_cursor:)
      #   A list of Check Transfer objects.
      #
      #   @param data [Array<Increase::Models::CheckTransfer>] The contents of the list.
      #
      #   @param next_cursor [String, nil] A pointer to a place in the list.
    end
  end
end
