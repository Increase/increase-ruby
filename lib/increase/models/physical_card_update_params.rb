# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCards#update
    class PhysicalCardUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute status
      #   The status to update the Physical Card to.
      #
      #   @return [Symbol, Increase::PhysicalCardUpdateParams::Status]
      required :status, enum: -> { Increase::PhysicalCardUpdateParams::Status }

      # @!method initialize(status:, request_options: {})
      #   @param status [Symbol, Increase::PhysicalCardUpdateParams::Status] The status to update the Physical Card to.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The status to update the Physical Card to.
      module Status
        extend Increase::Internal::Type::Enum

        # The physical card is active.
        ACTIVE = :active

        # The physical card is temporarily disabled.
        DISABLED = :disabled

        # The physical card is permanently canceled.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
