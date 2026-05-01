# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class Entities
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::EntityUpdateValidationParams} for more details.
        #
        # Simulate updates to an
        # [Entity's validation](/documentation/api/entities#entity-object.validation). In
        # production, Know Your Customer validations
        # [run automatically](/documentation/entity-validation#entity-validation) for
        # eligible programs. While developing, use this API to simulate issues with
        # information submissions.
        #
        # @overload update_validation(entity_id, issues:, request_options: {})
        #
        # @param entity_id [String] The identifier of the Entity whose validation status to update.
        #
        # @param issues [Array<Increase::Models::Simulations::EntityUpdateValidationParams::Issue>] The validation issues to attach. If no issues are provided, the validation statu
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Entity]
        #
        # @see Increase::Models::Simulations::EntityUpdateValidationParams
        def update_validation(entity_id, params)
          parsed, options = Increase::Simulations::EntityUpdateValidationParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/entities/%1$s/update_validation", entity_id],
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
