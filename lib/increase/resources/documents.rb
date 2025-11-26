# frozen_string_literal: true

module Increase
  module Resources
    class Documents
      # Some parameter documentations has been truncated, see
      # {Increase::Models::DocumentCreateParams} for more details.
      #
      # Create a Document
      #
      # @overload create(category:, account_verification_letter: nil, funding_instructions: nil, request_options: {})
      #
      # @param category [Symbol, Increase::Models::DocumentCreateParams::Category] The type of document to create.
      #
      # @param account_verification_letter [Increase::Models::DocumentCreateParams::AccountVerificationLetter] An account verification letter. Required if and only if `category` is `account_v
      #
      # @param funding_instructions [Increase::Models::DocumentCreateParams::FundingInstructions] Funding instructions. Required if and only if `category` is `funding_instruction
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Document]
      #
      # @see Increase::Models::DocumentCreateParams
      def create(params)
        parsed, options = Increase::DocumentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "documents",
          body: parsed,
          model: Increase::Document,
          options: options
        )
      end

      # Retrieve a Document
      #
      # @overload retrieve(document_id, request_options: {})
      #
      # @param document_id [String] The identifier of the Document to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Document]
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
      # @overload list(category: nil, created_at: nil, cursor: nil, entity_id: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param category [Increase::Models::DocumentListParams::Category]
      #
      # @param created_at [Increase::Models::DocumentListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param entity_id [String] Filter Documents to ones belonging to the specified Entity.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DocumentListResponse]
      #
      # @see Increase::Models::DocumentListParams
      def list(params = {})
        parsed, options = Increase::DocumentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "documents",
          query: parsed,
          model: Increase::Models::DocumentListResponse,
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
