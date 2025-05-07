# frozen_string_literal: true

module Increase
  module Resources
    class IntrafiExclusions
      # Create an IntraFi Exclusion
      #
      # @overload create(bank_name:, entity_id:, request_options: {})
      #
      # @param bank_name [String] The name of the financial institution to be excluded.
      #
      # @param entity_id [String] The identifier of the Entity whose deposits will be excluded.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::IntrafiExclusion]
      #
      # @see Increase::Models::IntrafiExclusionCreateParams
      def create(params)
        parsed, options = Increase::IntrafiExclusionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "intrafi_exclusions",
          body: parsed,
          model: Increase::IntrafiExclusion,
          options: options
        )
      end

      # Get an IntraFi Exclusion
      #
      # @overload retrieve(intrafi_exclusion_id, request_options: {})
      #
      # @param intrafi_exclusion_id [String] The identifier of the IntraFi Exclusion to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::IntrafiExclusion]
      #
      # @see Increase::Models::IntrafiExclusionRetrieveParams
      def retrieve(intrafi_exclusion_id, params = {})
        @client.request(
          method: :get,
          path: ["intrafi_exclusions/%1$s", intrafi_exclusion_id],
          model: Increase::IntrafiExclusion,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::IntrafiExclusionListParams} for more details.
      #
      # List IntraFi Exclusions
      #
      # @overload list(cursor: nil, entity_id: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param entity_id [String] Filter IntraFi Exclusions for those belonging to the specified Entity.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::IntrafiExclusion>]
      #
      # @see Increase::Models::IntrafiExclusionListParams
      def list(params = {})
        parsed, options = Increase::IntrafiExclusionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "intrafi_exclusions",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::IntrafiExclusion,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::IntrafiExclusionArchiveParams} for more details.
      #
      # Archive an IntraFi Exclusion
      #
      # @overload archive(intrafi_exclusion_id, request_options: {})
      #
      # @param intrafi_exclusion_id [String] The identifier of the IntraFi Exclusion request to archive. It may take 5 busine
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::IntrafiExclusion]
      #
      # @see Increase::Models::IntrafiExclusionArchiveParams
      def archive(intrafi_exclusion_id, params = {})
        @client.request(
          method: :post,
          path: ["intrafi_exclusions/%1$s/archive", intrafi_exclusion_id],
          model: Increase::IntrafiExclusion,
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
