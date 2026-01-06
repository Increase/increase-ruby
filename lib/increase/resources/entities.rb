# frozen_string_literal: true

module Increase
  module Resources
    class Entities
      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityCreateParams} for more details.
      #
      # Create an Entity
      #
      # @overload create(structure:, corporation: nil, description: nil, government_authority: nil, joint: nil, natural_person: nil, risk_rating: nil, supplemental_documents: nil, terms_agreements: nil, third_party_verification: nil, trust: nil, request_options: {})
      #
      # @param structure [Symbol, Increase::Models::EntityCreateParams::Structure] The type of Entity to create.
      #
      # @param corporation [Increase::Models::EntityCreateParams::Corporation] Details of the corporation entity to create. Required if `structure` is equal to
      #
      # @param description [String] The description you choose to give the entity.
      #
      # @param government_authority [Increase::Models::EntityCreateParams::GovernmentAuthority] Details of the Government Authority entity to create. Required if `structure` is
      #
      # @param joint [Increase::Models::EntityCreateParams::Joint] Details of the joint entity to create. Required if `structure` is equal to `join
      #
      # @param natural_person [Increase::Models::EntityCreateParams::NaturalPerson] Details of the natural person entity to create. Required if `structure` is equal
      #
      # @param risk_rating [Increase::Models::EntityCreateParams::RiskRating] An assessment of the entity’s potential risk of involvement in financial crimes,
      #
      # @param supplemental_documents [Array<Increase::Models::EntityCreateParams::SupplementalDocument>] Additional documentation associated with the entity.
      #
      # @param terms_agreements [Array<Increase::Models::EntityCreateParams::TermsAgreement>] The terms that the Entity agreed to. Not all programs are required to submit thi
      #
      # @param third_party_verification [Increase::Models::EntityCreateParams::ThirdPartyVerification] If you are using a third-party service for identity verification, you can use th
      #
      # @param trust [Increase::Models::EntityCreateParams::Trust] Details of the trust entity to create. Required if `structure` is equal to `trus
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

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityUpdateParams} for more details.
      #
      # Update an Entity
      #
      # @overload update(entity_id, corporation: nil, details_confirmed_at: nil, government_authority: nil, natural_person: nil, risk_rating: nil, third_party_verification: nil, trust: nil, request_options: {})
      #
      # @param entity_id [String] The entity identifier.
      #
      # @param corporation [Increase::Models::EntityUpdateParams::Corporation] Details of the corporation entity to update. If you specify this parameter and t
      #
      # @param details_confirmed_at [Time] When your user last confirmed the Entity's details. Depending on your program, y
      #
      # @param government_authority [Increase::Models::EntityUpdateParams::GovernmentAuthority] Details of the government authority entity to update. If you specify this parame
      #
      # @param natural_person [Increase::Models::EntityUpdateParams::NaturalPerson] Details of the natural person entity to update. If you specify this parameter an
      #
      # @param risk_rating [Increase::Models::EntityUpdateParams::RiskRating] An assessment of the entity’s potential risk of involvement in financial crimes,
      #
      # @param third_party_verification [Increase::Models::EntityUpdateParams::ThirdPartyVerification] If you are using a third-party service for identity verification, you can use th
      #
      # @param trust [Increase::Models::EntityUpdateParams::Trust] Details of the trust entity to update. If you specify this parameter and the ent
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

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityListParams} for more details.
      #
      # List Entities
      #
      # @overload list(created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param created_at [Increase::Models::EntityListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::EntityListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::Entity>]
      #
      # @see Increase::Models::EntityListParams
      def list(params = {})
        parsed, options = Increase::EntityListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "entities",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Entity,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityArchiveParams} for more details.
      #
      # Archive an Entity
      #
      # @overload archive(entity_id, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity to archive. Any accounts associated with an entity
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

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityArchiveBeneficialOwnerParams} for more details.
      #
      # Archive a beneficial owner for a corporate Entity
      #
      # @overload archive_beneficial_owner(entity_id, beneficial_owner_id:, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity associated with the Beneficial Owner that is being
      #
      # @param beneficial_owner_id [String] The identifying details of anyone controlling or owning 25% or more of the corpo
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityArchiveBeneficialOwnerParams
      def archive_beneficial_owner(entity_id, params)
        parsed, options = Increase::EntityArchiveBeneficialOwnerParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["entities/%1$s/archive_beneficial_owner", entity_id],
          body: parsed,
          model: Increase::Entity,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityConfirmParams} for more details.
      #
      # Depending on your program, you may be required to re-confirm an Entity's details
      # on a recurring basis. After making any required updates, call this endpoint to
      # record that your user confirmed their details.
      #
      # @overload confirm(entity_id, confirmed_at: nil, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity to confirm the details of.
      #
      # @param confirmed_at [Time] When your user confirmed the Entity's details. If not provided, the current time
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityConfirmParams
      def confirm(entity_id, params = {})
        parsed, options = Increase::EntityConfirmParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["entities/%1$s/confirm", entity_id],
          body: parsed,
          model: Increase::Entity,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityCreateBeneficialOwnerParams} for more details.
      #
      # Create a beneficial owner for a corporate Entity
      #
      # @overload create_beneficial_owner(entity_id, beneficial_owner:, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity to associate with the new Beneficial Owner.
      #
      # @param beneficial_owner [Increase::Models::EntityCreateBeneficialOwnerParams::BeneficialOwner] The identifying details of anyone controlling or owning 25% or more of the corpo
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityCreateBeneficialOwnerParams
      def create_beneficial_owner(entity_id, params)
        parsed, options = Increase::EntityCreateBeneficialOwnerParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["entities/%1$s/create_beneficial_owner", entity_id],
          body: parsed,
          model: Increase::Entity,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityUpdateAddressParams} for more details.
      #
      # Update a Natural Person or Corporation's address
      #
      # @overload update_address(entity_id, address:, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity whose address is being updated.
      #
      # @param address [Increase::Models::EntityUpdateAddressParams::Address] The entity's physical address. Mail receiving locations like PO Boxes and PMB's
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityUpdateAddressParams
      def update_address(entity_id, params)
        parsed, options = Increase::EntityUpdateAddressParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["entities/%1$s/update_address", entity_id],
          body: parsed,
          model: Increase::Entity,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityUpdateBeneficialOwnerAddressParams} for more details.
      #
      # Update the address for a beneficial owner belonging to a corporate Entity
      #
      # @overload update_beneficial_owner_address(entity_id, address:, beneficial_owner_id:, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity associated with the Beneficial Owner whose address
      #
      # @param address [Increase::Models::EntityUpdateBeneficialOwnerAddressParams::Address] The individual's physical address. Mail receiving locations like PO Boxes and PM
      #
      # @param beneficial_owner_id [String] The identifying details of anyone controlling or owning 25% or more of the corpo
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityUpdateBeneficialOwnerAddressParams
      def update_beneficial_owner_address(entity_id, params)
        parsed, options = Increase::EntityUpdateBeneficialOwnerAddressParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["entities/%1$s/update_beneficial_owner_address", entity_id],
          body: parsed,
          model: Increase::Entity,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EntityUpdateIndustryCodeParams} for more details.
      #
      # Update the industry code for a corporate Entity
      #
      # @overload update_industry_code(entity_id, industry_code:, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity to update. This endpoint only accepts `corporation`
      #
      # @param industry_code [String] The North American Industry Classification System (NAICS) code for the corporati
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Entity]
      #
      # @see Increase::Models::EntityUpdateIndustryCodeParams
      def update_industry_code(entity_id, params)
        parsed, options = Increase::EntityUpdateIndustryCodeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["entities/%1$s/update_industry_code", entity_id],
          body: parsed,
          model: Increase::Entity,
          options: options
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
