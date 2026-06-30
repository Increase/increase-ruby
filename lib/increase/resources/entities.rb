# frozen_string_literal: true

module Increase
  module Resources
    class Entities
      # Create an Entity
      #
      # @overload create(structure:, corporation: nil, description: nil, government_authority: nil, joint: nil, natural_person: nil, risk_rating: nil, supplemental_documents: nil, terms_agreements: nil, third_party_verification: nil, trust: nil, request_options: {})
      #
      # @param structure [Symbol, Increase::Models::EntityCreateParams::Structure] The type of Entity to create.
      #
      # @param corporation [Increase::Models::EntityCreateParams::Corporation]
      #   Details of the corporation entity to create. Required if `structure` is equal to
      #   `corporation`.
      #
      # @param description [String] The description you choose to give the entity.
      #
      # @param government_authority [Increase::Models::EntityCreateParams::GovernmentAuthority]
      #   Details of the Government Authority entity to create. Required if `structure` is
      #   equal to `government_authority`.
      #
      # @param joint [Increase::Models::EntityCreateParams::Joint]
      #   Details of the joint entity to create. Required if `structure` is equal to
      #   `joint`.
      #
      # @param natural_person [Increase::Models::EntityCreateParams::NaturalPerson]
      #   Details of the natural person entity to create. Required if `structure` is equal
      #   to `natural_person`. Natural people entities should be submitted with
      #   `social_security_number` or `individual_taxpayer_identification_number`
      #   identification methods.
      #
      # @param risk_rating [Increase::Models::EntityCreateParams::RiskRating]
      #   An assessment of the entity's potential risk of involvement in financial crimes,
      #   such as money laundering.
      #
      # @param supplemental_documents [Array<Increase::Models::EntityCreateParams::SupplementalDocument>]
      #   Additional documentation associated with the entity.
      #
      # @param terms_agreements [Array<Increase::Models::EntityCreateParams::TermsAgreement>]
      #   The terms that the Entity agreed to. Not all programs are required to submit
      #   this data.
      #
      # @param third_party_verification [Increase::Models::EntityCreateParams::ThirdPartyVerification]
      #   If you are using a third-party service for identity verification, you can use
      #   this field to associate this Entity with the identifier that represents them in
      #   that service.
      #
      # @param trust [Increase::Models::EntityCreateParams::Trust]
      #   Details of the trust entity to create. Required if `structure` is equal to
      #   `trust`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityCreateParams
      def create(params)
        parsed, options = Increase::EntityCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "entities",
          body: parsed,
          model: Increase::Entity,
          options: options
        )
      end

      # Retrieve an Entity
      #
      # @overload retrieve(entity_id, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityRetrieveParams
      def retrieve(entity_id, params = {})
        @client.request(
          method: :get,
          path: ["entities/%1$s", entity_id],
          model: Increase::Entity,
          options: params[:request_options]
        )
      end

      # Update an Entity
      #
      # @overload update(entity_id, corporation: nil, details_confirmed_at: nil, government_authority: nil, natural_person: nil, risk_rating: nil, terms_agreements: nil, third_party_verification: nil, trust: nil, request_options: {})
      #
      # @param entity_id [String] The entity identifier.
      #
      # @param corporation [Increase::Models::EntityUpdateParams::Corporation]
      #   Details of the corporation entity to update. If you specify this parameter and
      #   the entity is not a corporation, the request will fail.
      #
      # @param details_confirmed_at [Time]
      #   When your user last confirmed the Entity's details. Depending on your program,
      #   you may be required to affirmatively confirm details with your users on an
      #   annual basis.
      #
      # @param government_authority [Increase::Models::EntityUpdateParams::GovernmentAuthority]
      #   Details of the government authority entity to update. If you specify this
      #   parameter and the entity is not a government authority, the request will fail.
      #
      # @param natural_person [Increase::Models::EntityUpdateParams::NaturalPerson]
      #   Details of the natural person entity to update. If you specify this parameter
      #   and the entity is not a natural person, the request will fail.
      #
      # @param risk_rating [Increase::Models::EntityUpdateParams::RiskRating]
      #   An assessment of the entity’s potential risk of involvement in financial crimes,
      #   such as money laundering.
      #
      # @param terms_agreements [Array<Increase::Models::EntityUpdateParams::TermsAgreement>]
      #   New terms that the Entity agreed to. Not all programs are required to submit
      #   this data. This will not archive previously submitted terms.
      #
      # @param third_party_verification [Increase::Models::EntityUpdateParams::ThirdPartyVerification]
      #   If you are using a third-party service for identity verification, you can use
      #   this field to associate this Entity with the identifier that represents them in
      #   that service.
      #
      # @param trust [Increase::Models::EntityUpdateParams::Trust]
      #   Details of the trust entity to update. If you specify this parameter and the
      #   entity is not a trust, the request will fail.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityUpdateParams
      def update(entity_id, params = {})
        parsed, options = Increase::EntityUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["entities/%1$s", entity_id],
          body: parsed,
          model: Increase::Entity,
          options: options
        )
      end

      # List Entities
      #
      # @overload list(created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, validation_status: nil, request_options: {})
      #
      # @param created_at [Increase::Models::EntityListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String]
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      # @param status [Increase::Models::EntityListParams::Status]
      #
      # @param validation_status [Increase::Models::EntityListParams::ValidationStatus]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::Entity>]
      #
      # @see Increase::Models::EntityListParams
      def list(params = {})
        parsed, options = Increase::EntityListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "entities",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::Entity,
          options: options
        )
      end

      # Archive an Entity
      #
      # @overload archive(entity_id, request_options: {})
      #
      # @param entity_id [String]
      #   The identifier of the Entity to archive. Any accounts associated with an entity
      #   must be closed before the entity can be archived.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityArchiveParams
      def archive(entity_id, params = {})
        @client.request(
          method: :post,
          path: ["entities/%1$s/archive", entity_id],
          model: Increase::Entity,
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
