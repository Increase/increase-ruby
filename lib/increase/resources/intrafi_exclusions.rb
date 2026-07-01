# frozen_string_literal: true

module Increase
  module Resources
    class IntrafiExclusions
      # Create an IntraFi Exclusion
      #
      # @overload create(entity_id:, fdic_certificate_number:, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity whose deposits will be excluded.
      #
      # @param fdic_certificate_number [String]
      #   The FDIC certificate number of the financial institution to be excluded. An FDIC
      #   certificate number uniquely identifies a financial institution, and is different
      #   than a routing number. To find one, we recommend searching by Bank Name using
      #   the [FDIC's bankfind tool](https://banks.data.fdic.gov/bankfind-suite/bankfind).
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::IntrafiExclusion]
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
      # @return [Increase::Models::IntrafiExclusion]
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

      # List IntraFi Exclusions
      #
      # @overload list(cursor: nil, entity_id: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param entity_id [String] Filter IntraFi Exclusions for those belonging to the specified Entity.
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
      # @return [Increase::Internal::Page<Increase::Models::IntrafiExclusion>]
      #
      # @see Increase::Models::IntrafiExclusionListParams
      def list(params = {})
        parsed, options = Increase::IntrafiExclusionListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "intrafi_exclusions",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::IntrafiExclusion,
          options: options
        )
      end

      # Archive an IntraFi Exclusion
      #
      # @overload archive(intrafi_exclusion_id, request_options: {})
      #
      # @param intrafi_exclusion_id [String]
      #   The identifier of the IntraFi Exclusion request to archive. It may take 5
      #   business days for an exclusion removal to be processed. Removing an exclusion
      #   does not guarantee that funds will be swept to the previously-excluded bank.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::IntrafiExclusion]
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
