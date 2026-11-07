# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckbookChecks#retrieve
    class CheckbookCheck < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Checkbook Check's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute check_number
      #   The check number printed on the check.
      #
      #   @return [Integer]
      required :check_number, Integer

      # @!attribute checkbook_id
      #   The identifier of the Checkbook the check belongs to.
      #
      #   @return [String]
      required :checkbook_id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Checkbook Check was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute status
      #   The status of the Checkbook Check.
      #
      #   @return [Symbol, Increase::Models::CheckbookCheck::Status]
      required :status, enum: -> { Increase::CheckbookCheck::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `checkbook_check`.
      #
      #   @return [Symbol, Increase::Models::CheckbookCheck::Type]
      required :type, enum: -> { Increase::CheckbookCheck::Type }

      # @!method initialize(id:, check_number:, checkbook_id:, created_at:, status:, type:)
      #   A Checkbook Check is a single check within a Checkbook.
      #
      #   @param id [String] The Checkbook Check's identifier.
      #
      #   @param check_number [Integer] The check number printed on the check.
      #
      #   @param checkbook_id [String] The identifier of the Checkbook the check belongs to.
      #
      #   @param created_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the Checkbook Check was created.
      #
      #   @param status [Symbol, Increase::Models::CheckbookCheck::Status] The status of the Checkbook Check.
      #
      #   @param type [Symbol, Increase::Models::CheckbookCheck::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `checkbook_check`.

      # The status of the Checkbook Check.
      #
      # @see Increase::Models::CheckbookCheck#status
      module Status
        extend Increase::Internal::Type::Enum

        # The check has not yet been deposited.
        PENDING_DEPOSIT = :pending_deposit

        # The check has been deposited.
        DEPOSITED = :deposited

        # The check has been stopped and can no longer be deposited.
        STOPPED = :stopped

        # The check requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `checkbook_check`.
      #
      # @see Increase::Models::CheckbookCheck#type
      module Type
        extend Increase::Internal::Type::Enum

        CHECKBOOK_CHECK = :checkbook_check

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
