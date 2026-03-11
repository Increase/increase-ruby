# frozen_string_literal: true

module Increase
  module Resources
    class BeneficialOwners
      # Retrieve a Beneficial Owner
      #
      # @overload retrieve(entity_beneficial_owner_id, request_options: {})
      #
      # @param entity_beneficial_owner_id [String] The identifier of the Beneficial Owner to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::EntityBeneficialOwner]
      #
      # @see Increase::Models::BeneficialOwnerRetrieveParams
      def retrieve(entity_beneficial_owner_id, params = {})
        @client.request(
          method: :get,
          path: ["entity_beneficial_owners/%1$s", entity_beneficial_owner_id],
          model: Increase::EntityBeneficialOwner,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::BeneficialOwnerUpdateParams} for more details.
      #
      # Update a Beneficial Owner
      #
      # @overload update(entity_beneficial_owner_id, address: nil, confirmed_no_us_tax_id: nil, identification: nil, request_options: {})
      #
      # @param entity_beneficial_owner_id [String] The identifier of the Beneficial Owner to update.
      #
      # @param address [Increase::Models::BeneficialOwnerUpdateParams::Address] The individual's physical address. Mail receiving locations like PO Boxes and PM
      #
      # @param confirmed_no_us_tax_id [Boolean] The identification method for an individual can only be a passport, driver's lic
      #
      # @param identification [Increase::Models::BeneficialOwnerUpdateParams::Identification] A means of verifying the person's identity.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::EntityBeneficialOwner]
      #
      # @see Increase::Models::BeneficialOwnerUpdateParams
      def update(entity_beneficial_owner_id, params = {})
        parsed, options = Increase::BeneficialOwnerUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["entity_beneficial_owners/%1$s", entity_beneficial_owner_id],
          body: parsed,
          model: Increase::EntityBeneficialOwner,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::BeneficialOwnerListParams} for more details.
      #
      # List Beneficial Owners
      #
      # @overload list(entity_id:, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity to list beneficial owners for. Only `corporation` e
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::EntityBeneficialOwner>]
      #
      # @see Increase::Models::BeneficialOwnerListParams
      def list(params)
        parsed, options = Increase::BeneficialOwnerListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "entity_beneficial_owners",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::EntityBeneficialOwner,
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
