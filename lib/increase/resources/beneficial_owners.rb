# frozen_string_literal: true

module Increase
  module Resources
    class BeneficialOwners
      # Create a Beneficial Owner
      #
      # @overload create(entity_id:, individual:, prongs:, company_title: nil, request_options: {})
      #
      # @param entity_id [String]
      #   The identifier of the Entity to associate with the new Beneficial Owner. Only
      #   `corporation` entities have beneficial owners.
      #
      # @param individual [Increase::Models::BeneficialOwnerCreateParams::Individual]
      #   Personal details for the beneficial owner.
      #
      # @param prongs [Array<Symbol, Increase::Models::BeneficialOwnerCreateParams::Prong>]
      #   Why this person is considered a beneficial owner of the entity. At least one
      #   option is required, if a person is both a control person and owner, submit an
      #   array containing both.
      #
      # @param company_title [String] This person's role or title within the entity.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::EntityBeneficialOwner]
      #
      # @see Increase::Models::BeneficialOwnerCreateParams
      def create(params)
        parsed, options = Increase::BeneficialOwnerCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "entity_beneficial_owners",
          body: parsed,
          model: Increase::EntityBeneficialOwner,
          options: options
        )
      end

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

      # Update a Beneficial Owner
      #
      # @overload update(entity_beneficial_owner_id, address: nil, confirmed_no_us_tax_id: nil, identification: nil, name: nil, prongs: nil, request_options: {})
      #
      # @param entity_beneficial_owner_id [String] The identifier of the Beneficial Owner to update.
      #
      # @param address [Increase::Models::BeneficialOwnerUpdateParams::Address]
      #   The individual's physical address. Mail receiving locations like PO Boxes and
      #   PMB's are disallowed.
      #
      # @param confirmed_no_us_tax_id [Boolean]
      #   The identification method for an individual can only be a passport, driver's
      #   license, or other document if you've confirmed the individual does not have a US
      #   tax id (either a Social Security Number or Individual Taxpayer Identification
      #   Number).
      #
      # @param identification [Increase::Models::BeneficialOwnerUpdateParams::Identification]
      #   A means of verifying the person's identity.
      #
      # @param name [String] The individual's legal name.
      #
      # @param prongs [Array<Symbol, Increase::Models::BeneficialOwnerUpdateParams::Prong>]
      #   Why this person is considered a beneficial owner of the entity. At least one
      #   option is required, if a person is both a control person and owner, submit an
      #   array containing both. Providing this replaces the beneficial owner's current
      #   prongs.
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

      # List Beneficial Owners
      #
      # @overload list(entity_id:, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param entity_id [String]
      #   The identifier of the Entity to list beneficial owners for. Only `corporation`
      #   entities have beneficial owners.
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

      # Archive a Beneficial Owner
      #
      # @overload archive(entity_beneficial_owner_id, request_options: {})
      #
      # @param entity_beneficial_owner_id [String] The identifier of the Beneficial Owner to archive.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::EntityBeneficialOwner]
      #
      # @see Increase::Models::BeneficialOwnerArchiveParams
      def archive(entity_beneficial_owner_id, params = {})
        @client.request(
          method: :post,
          path: ["entity_beneficial_owners/%1$s/archive", entity_beneficial_owner_id],
          model: Increase::EntityBeneficialOwner,
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
