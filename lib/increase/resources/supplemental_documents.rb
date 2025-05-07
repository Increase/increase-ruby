# frozen_string_literal: true

module Increase
  module Resources
    class SupplementalDocuments
      # Create a supplemental document for an Entity
      #
      # @overload create(entity_id:, file_id:, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity to associate with the supplemental document.
      #
      # @param file_id [String] The identifier of the File containing the document.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::EntitySupplementalDocument]
      #
      # @see Increase::Models::SupplementalDocumentCreateParams
      def create(params)
        parsed, options = Increase::SupplementalDocumentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "entity_supplemental_documents",
          body: parsed,
          model: Increase::EntitySupplementalDocument,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::SupplementalDocumentListParams} for more details.
      #
      # List Entity Supplemental Document Submissions
      #
      # @overload list(entity_id:, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param entity_id [String] The identifier of the Entity to list supplemental documents for.
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::EntitySupplementalDocument>]
      #
      # @see Increase::Models::SupplementalDocumentListParams
      def list(params)
        parsed, options = Increase::SupplementalDocumentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "entity_supplemental_documents",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::EntitySupplementalDocument,
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
