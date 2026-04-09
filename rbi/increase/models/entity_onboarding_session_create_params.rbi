# typed: strong

module Increase
  module Models
    class EntityOnboardingSessionCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::EntityOnboardingSessionCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Program the Entity will be onboarded to.
      sig { returns(String) }
      attr_accessor :program_id

      # The URL to redirect the customer to after they complete the onboarding form. The
      # redirect will include `entity_onboarding_session_id` and `entity_id` query
      # parameters.
      sig { returns(String) }
      attr_accessor :redirect_url

      # The identifier of an existing Entity to associate with the onboarding session.
      # If provided, the onboarding form will display any outstanding tasks required to
      # complete the Entity's onboarding.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      sig do
        params(
          program_id: String,
          redirect_url: String,
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            program_id: String,
            redirect_url: String,
            entity_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
