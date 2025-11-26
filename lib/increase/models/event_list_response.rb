# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Events#list
    class EventListResponse < Increase::Internal::Type::BaseModel
      # @!attribute data
      #   The contents of the list.
      #
      #   @return [Array<Increase::Models::Event>]
      required :data, -> { Increase::Internal::Type::ArrayOf[Increase::Event] }

      # @!attribute next_cursor
      #   A pointer to a place in the list.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, next_cursor:)
      #   A list of Event objects.
      #
      #   @param data [Array<Increase::Models::Event>] The contents of the list.
      #
      #   @param next_cursor [String, nil] A pointer to a place in the list.
    end
  end
end
