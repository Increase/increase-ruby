# frozen_string_literal: true

module Increase
  module Resources
    class SupplementalDocuments
      # Create a supplemental document for an Entity
      #
      # @param params [Increase::Models::SupplementalDocumentCreateParams, Hash{Symbol=>Object}] Attributes to send in this request.
      #
      #   @option params [String] :entity_id The identifier of the Entity to associate with the supplemental document.
      #
      #   @option params [String] :file_id The identifier of the File containing the document.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::EntitySupplementalDocument]
      #
      def create(params = {}, opts = {})
        parsed = Increase::Models::SupplementalDocumentCreateParams.dump(params)
        req = {
          method: :post,
          path: "entity_supplemental_documents",
          body: parsed,
          model: Increase::Models::EntitySupplementalDocument
        }
        @client.request(req, opts)
      end

      # List Entity Supplemental Document Submissions
      #
      # @param params [Increase::Models::SupplementalDocumentListParams, Hash{Symbol=>Object}] Attributes to send in this request.
      #
      #   @option params [String] :entity_id The identifier of the Entity to list supplemental documents for.
      #
      #   @option params [String] :cursor Return the page of entries after this one.
      #
      #   @option params [String] :idempotency_key Filter records to the one with the specified `idempotency_key` you chose for
      #     that object. This value is unique across Increase and is used to ensure that a
      #     request is only processed once. Learn more about
      #     [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #     objects.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Page<Increase::Models::EntitySupplementalDocument>]
      #
      def list(params = {}, opts = {})
        parsed = Increase::Models::SupplementalDocumentListParams.dump(params)
        req = {
          method: :get,
          path: "entity_supplemental_documents",
          query: parsed,
          page: Increase::Page,
          model: Increase::Models::EntitySupplementalDocument
        }
        @client.request(req, opts)
      end

      # @param client [Increase::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
