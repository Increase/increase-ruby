# frozen_string_literal: true

module Increase
  module Resources
    class EntityOnboardingSessions
      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityOnboardingSessionCreateParams} for more details.
      #
      # Create an Entity Onboarding Session
      #
      # @overload create(program_id:, redirect_url:, entity_id: nil, request_options: {})
      #
      # @param program_id [String] The identifier of the Program the Entity will be onboarded to.
      #
      # @param redirect_url [String] The URL to redirect the customer to after they complete the onboarding form. The
      #
      # @param entity_id [String] The identifier of an existing Entity to associate with the onboarding session. I
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::EntityOnboardingSession]
      #
      # @see Increase::Models::EntityOnboardingSessionCreateParams
      def create(params)
        parsed, options = Increase::EntityOnboardingSessionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "entity_onboarding_sessions",
          body: parsed,
          model: Increase::EntityOnboardingSession,
          options: options
        )
      end

      # Retrieve an Entity Onboarding Session
      #
      # @overload retrieve(entity_onboarding_session_id, request_options: {})
      #
      # @param entity_onboarding_session_id [String] The identifier of the Entity Onboarding Session.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::EntityOnboardingSession]
      #
      # @see Increase::Models::EntityOnboardingSessionRetrieveParams
      def retrieve(entity_onboarding_session_id, params = {})
        @client.request(
          method: :get,
          path: ["entity_onboarding_sessions/%1$s", entity_onboarding_session_id],
          model: Increase::EntityOnboardingSession,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityOnboardingSessionListParams} for more details.
      #
      # List Entity Onboarding Session
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::EntityOnboardingSessionListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::EntityOnboardingSession>]
      #
      # @see Increase::Models::EntityOnboardingSessionListParams
      def list(params = {})
        parsed, options = Increase::EntityOnboardingSessionListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "entity_onboarding_sessions",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::EntityOnboardingSession,
          options: options
        )
      end

      # Expire an Entity Onboarding Session
      #
      # @overload expire(entity_onboarding_session_id, request_options: {})
      #
      # @param entity_onboarding_session_id [String] The identifier of the Entity Onboarding Session to expire.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::EntityOnboardingSession]
      #
      # @see Increase::Models::EntityOnboardingSessionExpireParams
      def expire(entity_onboarding_session_id, params = {})
        @client.request(
          method: :post,
          path: ["entity_onboarding_sessions/%1$s/expire", entity_onboarding_session_id],
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
