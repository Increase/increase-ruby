# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class EntityOnboardingSessions
        # Simulates the submission of an
        # [Entity Onboarding Session](#entity-onboarding-sessions). This session must have
        # a `status` of `active`. After submission, the session will transition to
        # `expired` and a new Entity will be created.
        #
        # @overload submit(entity_onboarding_session_id, request_options: {})
        #
        # @param entity_onboarding_session_id [String] The identifier of the Entity Onboarding Session you wish to submit.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::EntityOnboardingSession]
        #
        # @see Increase::Models::Simulations::EntityOnboardingSessionSubmitParams
        def submit(entity_onboarding_session_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/entity_onboarding_sessions/%1$s/submit", entity_onboarding_session_id],
            model: Increase::EntityOnboardingSession,
            options: params[:request_options]
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
