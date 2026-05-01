# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class Entities
        # Set the status for an
        # [Entity's validation](/documentation/api/entities#entity-object.validation). In
        # production, Know Your Customer validations
        # [run automatically](/documentation/entity-validation#entity-validation). While
        # developing, it can be helpful to override the behavior in Sandbox.
        #
        # @overload validation(entity_id, issues:, status:, request_options: {})
        #
        # @param entity_id [String] The identifier of the Entity whose validation status to update.
        #
        # @param issues [Array<Increase::Models::Simulations::EntityValidationParams::Issue>] The validation issues to attach. Only allowed when `status` is `invalid`.
        #
        # @param status [Symbol, Increase::Models::Simulations::EntityValidationParams::Status] The validation status to set on the Entity.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Entity]
        #
        # @see Increase::Models::Simulations::EntityValidationParams
        def validation(entity_id, params)
          parsed, options = Increase::Simulations::EntityValidationParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/entities/%1$s/validation", entity_id],
            body: parsed,
            model: Increase::Entity,
            options: options
          )
        end

        # @api private
        #
        # @param client [Increase::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
