# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::EntityOnboardingSessions#expire
    class EntityOnboardingSessionExpireParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_onboarding_session_id
      #   The identifier of the Entity Onboarding Session to expire.
      #
      #   @return [String]
      required :entity_onboarding_session_id, String

      # @!method initialize(entity_onboarding_session_id:, request_options: {})
      #   @param entity_onboarding_session_id [String] The identifier of the Entity Onboarding Session to expire.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
