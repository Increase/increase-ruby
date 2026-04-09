# typed: strong

module Increase
  module Models
    class EntityOnboardingSession < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::EntityOnboardingSession, Increase::Internal::AnyHash)
        end

      # The Entity Onboarding Session's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Entity Onboarding Session was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The identifier of the Entity associated with this session, if one has been
      # created or was provided when creating the session.
      sig { returns(T.nilable(String)) }
      attr_accessor :entity_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Entity Onboarding Session will expire.
      sig { returns(Time) }
      attr_accessor :expires_at

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The identifier of the Program the Entity will be onboarded to.
      sig { returns(String) }
      attr_accessor :program_id

      # The URL to redirect to after the onboarding session is complete. Increase will
      # include the query parameters `entity_onboarding_session_id` and `entity_id` when
      # redirecting.
      sig { returns(String) }
      attr_accessor :redirect_url

      # The URL containing the onboarding form. You should share this link with your
      # customer. Only present when the session is active.
      sig { returns(T.nilable(String)) }
      attr_accessor :session_url

      # The status of the onboarding session.
      sig { returns(Increase::EntityOnboardingSession::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `entity_onboarding_session`.
      sig { returns(Increase::EntityOnboardingSession::Type::TaggedSymbol) }
      attr_accessor :type

      # Entity Onboarding Sessions let your customers onboard themselves by completing
      # Increase-hosted forms. Create a session and redirect your customer to the
      # returned URL. When they're done, they'll be redirected back to your site. This
      # API is used for [hosted onboarding](/documentation/hosted-onboarding).
      sig do
        params(
          id: String,
          created_at: Time,
          entity_id: T.nilable(String),
          expires_at: Time,
          idempotency_key: T.nilable(String),
          program_id: String,
          redirect_url: String,
          session_url: T.nilable(String),
          status: Increase::EntityOnboardingSession::Status::OrSymbol,
          type: Increase::EntityOnboardingSession::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Entity Onboarding Session's identifier.
        id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Entity Onboarding Session was created.
        created_at:,
        # The identifier of the Entity associated with this session, if one has been
        # created or was provided when creating the session.
        entity_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Entity Onboarding Session will expire.
        expires_at:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The identifier of the Program the Entity will be onboarded to.
        program_id:,
        # The URL to redirect to after the onboarding session is complete. Increase will
        # include the query parameters `entity_onboarding_session_id` and `entity_id` when
        # redirecting.
        redirect_url:,
        # The URL containing the onboarding form. You should share this link with your
        # customer. Only present when the session is active.
        session_url:,
        # The status of the onboarding session.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `entity_onboarding_session`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            entity_id: T.nilable(String),
            expires_at: Time,
            idempotency_key: T.nilable(String),
            program_id: String,
            redirect_url: String,
            session_url: T.nilable(String),
            status: Increase::EntityOnboardingSession::Status::TaggedSymbol,
            type: Increase::EntityOnboardingSession::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The status of the onboarding session.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::EntityOnboardingSession::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Entity Onboarding Session is active.
        ACTIVE =
          T.let(
            :active,
            Increase::EntityOnboardingSession::Status::TaggedSymbol
          )

        # The Entity Onboarding Session has expired.
        EXPIRED =
          T.let(
            :expired,
            Increase::EntityOnboardingSession::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::EntityOnboardingSession::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `entity_onboarding_session`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::EntityOnboardingSession::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENTITY_ONBOARDING_SESSION =
          T.let(
            :entity_onboarding_session,
            Increase::EntityOnboardingSession::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::EntityOnboardingSession::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
