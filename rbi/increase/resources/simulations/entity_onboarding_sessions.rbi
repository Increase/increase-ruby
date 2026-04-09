# typed: strong

module Increase
  module Resources
    class Simulations
      class EntityOnboardingSessions
        # Simulates the submission of an
        # [Entity Onboarding Session](#entity-onboarding-sessions). This session must have
        # a `status` of `active`. After submission, the session will transition to
        # `expired` and a new Entity will be created.
        sig do
          params(
            entity_onboarding_session_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::EntityOnboardingSession)
        end
        def submit(
          # The identifier of the Entity Onboarding Session you wish to submit.
          entity_onboarding_session_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Increase::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
