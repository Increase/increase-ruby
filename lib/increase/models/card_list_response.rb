# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#list
    class CardListResponse < Increase::Internal::Type::BaseModel
      # @!attribute data
      #   The contents of the list.
      #
      #   @return [Array<Increase::Models::Card>]
      required :data, -> { Increase::Internal::Type::ArrayOf[Increase::Card] }

      # @!attribute next_cursor
      #   A pointer to a place in the list.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, next_cursor:)
      #   A list of Card objects.
      #
      #   @param data [Array<Increase::Models::Card>] The contents of the list.
      #
      #   @param next_cursor [String, nil] A pointer to a place in the list.
    end
  end
end
