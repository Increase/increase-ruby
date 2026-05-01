# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class Entities
        # Simulates setting an [Entity](#entities)'s validation under the managed
        # compliance regime. Any existing managed compliance validation on the Entity will
        # be marked as no longer current.
        #
        # @overload validation(entity_id, issues:, status:, request_options: {})
        #
        # @param entity_id [String] The identifier of the Entity to set the validation on.
        #
        # @param issues [Array<Increase::Models::Simulations::EntityValidationParams::Issue>] The issues to attach to the new managed compliance validation.
        #
        # @param status [Symbol, Increase::Models::Simulations::EntityValidationParams::Status] The status to set on the new managed compliance validation.
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
