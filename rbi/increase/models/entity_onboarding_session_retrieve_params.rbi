# typed: strong

module Increase
  module Models
    class EntityOnboardingSessionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::EntityOnboardingSessionRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Entity Onboarding Session.
      sig { returns(String) }
      attr_accessor :entity_onboarding_session_id

      sig do
        params(
          entity_onboarding_session_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Entity Onboarding Session.
        entity_onboarding_session_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            entity_onboarding_session_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
