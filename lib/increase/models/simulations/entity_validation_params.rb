# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::Entities#validation
      class EntityValidationParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute entity_id
        #   The identifier of the Entity to set the validation on.
        #
        #   @return [String]
        required :entity_id, String

        # @!attribute issues
        #   The issues to attach to the new managed compliance validation.
        #
        #   @return [Array<Increase::Models::Simulations::EntityValidationParams::Issue>]
        required :issues,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Simulations::EntityValidationParams::Issue] }

        # @!attribute status
        #   The status to set on the new managed compliance validation.
        #
        #   @return [Symbol, Increase::Models::Simulations::EntityValidationParams::Status]
        required :status, enum: -> { Increase::Simulations::EntityValidationParams::Status }

        # @!method initialize(entity_id:, issues:, status:, request_options: {})
        #   @param entity_id [String] The identifier of the Entity to set the validation on.
        #
        #   @param issues [Array<Increase::Models::Simulations::EntityValidationParams::Issue>] The issues to attach to the new managed compliance validation.
        #
        #   @param status [Symbol, Increase::Models::Simulations::EntityValidationParams::Status] The status to set on the new managed compliance validation.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        class Issue < Increase::Internal::Type::BaseModel
          # @!attribute category
          #   The category of the issue.
          #
          #   @return [Symbol, Increase::Models::Simulations::EntityValidationParams::Issue::Category]
          required :category, enum: -> { Increase::Simulations::EntityValidationParams::Issue::Category }

          # @!method initialize(category:)
          #   @param category [Symbol, Increase::Models::Simulations::EntityValidationParams::Issue::Category] The category of the issue.

          # The category of the issue.
          #
          # @see Increase::Models::Simulations::EntityValidationParams::Issue#category
          module Category
            extend Increase::Internal::Type::Enum

            # The entity's tax identifier could not be validated. Update the tax ID with the [update an entity API](/documentation/api/entities#update-an-entity.corporation.legal_identifier).
            ENTITY_TAX_IDENTIFIER = :entity_tax_identifier

            # The entity's address could not be validated. Update the address with the [update an entity API](/documentation/api/entities#update-an-entity.corporation.address).
            ENTITY_ADDRESS = :entity_address

            # A beneficial owner's identity could not be verified. Update the identification with the [update a beneficial owner API](/documentation/api/beneficial-owners#update-a-beneficial-owner).
            BENEFICIAL_OWNER_IDENTITY = :beneficial_owner_identity

            # A beneficial owner's address could not be validated. Update the address with the [update a beneficial owner API](/documentation/api/beneficial-owners#update-a-beneficial-owner).
            BENEFICIAL_OWNER_ADDRESS = :beneficial_owner_address

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The status to set on the new managed compliance validation.
        module Status
          extend Increase::Internal::Type::Enum

          # The submitted data is valid.
          VALID = :valid

          # Additional information is required to validate the data.
          INVALID = :invalid

          # The submitted data is being validated.
          PENDING = :pending

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
