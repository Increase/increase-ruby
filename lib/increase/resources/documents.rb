# frozen_string_literal: true

module Increase
  module Resources
    class Documents
      # Retrieve a Document
      #
      # @overload retrieve(document_id, request_options: {})
      #
      # @param document_id [String] The identifier of the Document to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Document]
      #
      # @see Increase::Models::DocumentRetrieveParams
      def retrieve(document_id, params = {})
        @client.request(
          method: :get,
          path: ["documents/%1$s", document_id],
          model: Increase::Document,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::DocumentListParams} for more details.
      #
      # List Documents
      #
      # @overload list(category: nil, created_at: nil, cursor: nil, entity_id: nil, limit: nil, request_options: {})
      #
      # @param category [Increase::DocumentListParams::Category]
      #
      # @param created_at [Increase::DocumentListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param entity_id [String] Filter Documents to ones belonging to the specified Entity.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Document>]
      #
      # @see Increase::Models::DocumentListParams
      def list(params = {})
        parsed, options = Increase::DocumentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "documents",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Document,
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
