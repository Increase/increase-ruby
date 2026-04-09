# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::EntityOnboardingSessions#create
    class EntityOnboardingSession < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Entity Onboarding Session's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Entity Onboarding Session was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute entity_id
      #   The identifier of the Entity associated with this session, if one has been
      #   created or was provided when creating the session.
      #
      #   @return [String, nil]
      required :entity_id, String, nil?: true

      # @!attribute expires_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Entity Onboarding Session will expire.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute program_id
      #   The identifier of the Program the Entity will be onboarded to.
      #
      #   @return [String]
      required :program_id, String

      # @!attribute redirect_url
      #   The URL to redirect to after the onboarding session is complete. Increase will
      #   include the query parameters `entity_onboarding_session_id` and `entity_id` when
      #   redirecting.
      #
      #   @return [String]
      required :redirect_url, String

      # @!attribute session_url
      #   The URL containing the onboarding form. You should share this link with your
      #   customer. Only present when the session is active.
      #
      #   @return [String, nil]
      required :session_url, String, nil?: true

      # @!attribute status
      #   The status of the onboarding session.
      #
      #   @return [Symbol, Increase::Models::EntityOnboardingSession::Status]
      required :status, enum: -> { Increase::EntityOnboardingSession::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `entity_onboarding_session`.
      #
      #   @return [Symbol, Increase::Models::EntityOnboardingSession::Type]
      required :type, enum: -> { Increase::EntityOnboardingSession::Type }

      # @!method initialize(id:, created_at:, entity_id:, expires_at:, idempotency_key:, program_id:, redirect_url:, session_url:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityOnboardingSession} for more details.
      #
      #   Entity Onboarding Sessions let your customers onboard themselves by completing
      #   Increase-hosted forms. Create a session and redirect your customer to the
      #   returned URL. When they're done, they'll be redirected back to your site. This
      #   API is used for [hosted onboarding](/documentation/hosted-onboarding).
      #
      #   @param id [String] The Entity Onboarding Session's identifier.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param entity_id [String, nil] The identifier of the Entity associated with this session, if one has been creat
      #
      #   @param expires_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param program_id [String] The identifier of the Program the Entity will be onboarded to.
      #
      #   @param redirect_url [String] The URL to redirect to after the onboarding session is complete. Increase will i
      #
      #   @param session_url [String, nil] The URL containing the onboarding form. You should share this link with your cus
      #
      #   @param status [Symbol, Increase::Models::EntityOnboardingSession::Status] The status of the onboarding session.
      #
      #   @param type [Symbol, Increase::Models::EntityOnboardingSession::Type] A constant representing the object's type. For this resource it will always be `

      # The status of the onboarding session.
      #
      # @see Increase::Models::EntityOnboardingSession#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Entity Onboarding Session is active.
        ACTIVE = :active

        # The Entity Onboarding Session has expired.
        EXPIRED = :expired

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `entity_onboarding_session`.
      #
      # @see Increase::Models::EntityOnboardingSession#type
      module Type
        extend Increase::Internal::Type::Enum

        ENTITY_ONBOARDING_SESSION = :entity_onboarding_session

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
