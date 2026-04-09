# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::EntityOnboardingSessions#create
    class EntityOnboardingSessionCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute program_id
      #   The identifier of the Program the Entity will be onboarded to.
      #
      #   @return [String]
      required :program_id, String

      # @!attribute redirect_url
      #   The URL to redirect the customer to after they complete the onboarding form. The
      #   redirect will include `entity_onboarding_session_id` and `entity_id` query
      #   parameters.
      #
      #   @return [String]
      required :redirect_url, String

      # @!attribute entity_id
      #   The identifier of an existing Entity to associate with the onboarding session.
      #   If provided, the onboarding form will display any outstanding tasks required to
      #   complete the Entity's onboarding.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!method initialize(program_id:, redirect_url:, entity_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityOnboardingSessionCreateParams} for more details.
      #
      #   @param program_id [String] The identifier of the Program the Entity will be onboarded to.
      #
      #   @param redirect_url [String] The URL to redirect the customer to after they complete the onboarding form. The
      #
      #   @param entity_id [String] The identifier of an existing Entity to associate with the onboarding session. I
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
