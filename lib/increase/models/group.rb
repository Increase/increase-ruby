# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Groups#retrieve
    class Group < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Group identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute ach_debit_status
      #   If the Group is allowed to create ACH debits.
      #
      #   @return [Symbol, Increase::Models::Group::ACHDebitStatus]
      required :ach_debit_status, enum: -> { Increase::Group::ACHDebitStatus }

      # @!attribute activation_status
      #   If the Group is activated or not.
      #
      #   @return [Symbol, Increase::Models::Group::ActivationStatus]
      required :activation_status, enum: -> { Increase::Group::ActivationStatus }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Group
      #   was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `group`.
      #
      #   @return [Symbol, Increase::Models::Group::Type]
      required :type, enum: -> { Increase::Group::Type }

      # @!method initialize(id:, ach_debit_status:, activation_status:, created_at:, type:)
      #   Some parameter documentations has been truncated, see {Increase::Models::Group}
      #   for more details.
      #
      #   Groups represent organizations using Increase. You can retrieve information
      #   about your own organization via the API. More commonly, OAuth platforms can
      #   retrieve information about the organizations that have granted them access.
      #   Learn more about OAuth [here](https://increase.com/documentation/oauth).
      #
      #   @param id [String] The Group identifier.
      #
      #   @param ach_debit_status [Symbol, Increase::Models::Group::ACHDebitStatus] If the Group is allowed to create ACH debits.
      #
      #   @param activation_status [Symbol, Increase::Models::Group::ActivationStatus] If the Group is activated or not.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Group w
      #
      #   @param type [Symbol, Increase::Models::Group::Type] A constant representing the object's type. For this resource it will always be `

      # If the Group is allowed to create ACH debits.
      #
      # @see Increase::Models::Group#ach_debit_status
      module ACHDebitStatus
        extend Increase::Internal::Type::Enum

        # The Group cannot make ACH debits.
        DISABLED = :disabled

        # The Group can make ACH debits.
        ENABLED = :enabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # If the Group is activated or not.
      #
      # @see Increase::Models::Group#activation_status
      module ActivationStatus
        extend Increase::Internal::Type::Enum

        # The Group is not activated.
        UNACTIVATED = :unactivated

        # The Group is activated.
        ACTIVATED = :activated

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `group`.
      #
      # @see Increase::Models::Group#type
      module Type
        extend Increase::Internal::Type::Enum

        GROUP = :group

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
