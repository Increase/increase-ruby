# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiAccountEnrollments#list
    class IntrafiAccountEnrollmentListResponse < Increase::Internal::Type::BaseModel
      # @!attribute data
      #   The contents of the list.
      #
      #   @return [Array<Increase::Models::IntrafiAccountEnrollment>]
      required :data, -> { Increase::Internal::Type::ArrayOf[Increase::IntrafiAccountEnrollment] }

      # @!attribute next_cursor
      #   A pointer to a place in the list.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, next_cursor:)
      #   A list of IntraFi Account Enrollment objects.
      #
      #   @param data [Array<Increase::Models::IntrafiAccountEnrollment>] The contents of the list.
      #
      #   @param next_cursor [String, nil] A pointer to a place in the list.
    end
  end
end
