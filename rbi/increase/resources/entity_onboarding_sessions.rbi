# typed: strong

module Increase
  module Resources
    class EntityOnboardingSessions
      # Create an Entity Onboarding Session
      sig do
        params(
          program_id: String,
          redirect_url: String,
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntityOnboardingSession)
      end
      def create(
        # The identifier of the Program the Entity will be onboarded to.
        program_id:,
        # The URL to redirect the customer to after they complete the onboarding form. The
        # redirect will include `entity_onboarding_session_id` and `entity_id` query
        # parameters.
        redirect_url:,
        # The identifier of an existing Entity to associate with the onboarding session.
        # If provided, the onboarding form will display any outstanding tasks required to
        # complete the Entity's onboarding.
        entity_id: nil,
        request_options: {}
      )
      end

      # Retrieve an Entity Onboarding Session
      sig do
        params(
          entity_onboarding_session_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntityOnboardingSession)
      end
      def retrieve(
        # The identifier of the Entity Onboarding Session.
        entity_onboarding_session_id,
        request_options: {}
      )
      end

      # List Entity Onboarding Session
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::EntityOnboardingSessionListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::EntityOnboardingSession])
      end
      def list(
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # Expire an Entity Onboarding Session
      sig do
        params(
          entity_onboarding_session_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntityOnboardingSession)
      end
      def expire(
        # The identifier of the Entity Onboarding Session to expire.
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
