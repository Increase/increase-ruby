# frozen_string_literal: true

module Increase
  module Resources
    class Files
      # To upload a file to Increase, you'll need to send a request of Content-Type
      # `multipart/form-data`. The request should contain the file you would like to
      # upload, as well as the parameters for creating a file.
      #
      # @overload create(file:, purpose:, description: nil, request_options: {})
      #
      # @param file [Pathname, StringIO]
      # @param purpose [Symbol, Increase::Models::FileCreateParams::Purpose]
      # @param description [String]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::File]
      #
      # @see Increase::Models::FileCreateParams
      def create(params)
        parsed, options = Increase::Models::FileCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "files",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: Increase::Models::File,
          options: options
        )
      end

      # Retrieve a File
      #
      # @overload retrieve(file_id, request_options: {})
      #
      # @param file_id [String]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::File]
      #
      # @see Increase::Models::FileRetrieveParams
      def retrieve(file_id, params = {})
        @client.request(
          method: :get,
          path: ["files/%1$s", file_id],
          model: Increase::Models::File,
          options: params[:request_options]
        )
      end

      # List Files
      #
      # @overload list(created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, purpose: nil, request_options: {})
      #
      # @param created_at [Increase::Models::FileListParams::CreatedAt]
      # @param cursor [String]
      # @param idempotency_key [String]
      # @param limit [Integer]
      # @param purpose [Increase::Models::FileListParams::Purpose]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::File>]
      #
      # @see Increase::Models::FileListParams
      def list(params = {})
        parsed, options = Increase::Models::FileListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "files",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Models::File,
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
