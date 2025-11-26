# frozen_string_literal: true

module Increase
  module Resources
    class Files
      # Some parameter documentations has been truncated, see
      # {Increase::Models::FileCreateParams} for more details.
      #
      # To upload a file to Increase, you'll need to send a request of Content-Type
      # `multipart/form-data`. The request should contain the file you would like to
      # upload, as well as the parameters for creating a file.
      #
      # @overload create(file:, purpose:, description: nil, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, String, Increase::FilePart] The file contents. This should follow the specifications of [RFC 7578](https://d
      #
      # @param purpose [Symbol, Increase::Models::FileCreateParams::Purpose] What the File will be used for in Increase's systems.
      #
      # @param description [String] The description you choose to give the File.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::File]
      #
      # @see Increase::Models::FileCreateParams
      def create(params)
        parsed, options = Increase::FileCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "files",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: Increase::File,
          options: options
        )
      end

      # Retrieve a File
      #
      # @overload retrieve(file_id, request_options: {})
      #
      # @param file_id [String] The identifier of the File.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::File]
      #
      # @see Increase::Models::FileRetrieveParams
      def retrieve(file_id, params = {})
        @client.request(
          method: :get,
          path: ["files/%1$s", file_id],
          model: Increase::File,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::FileListParams} for more details.
      #
      # List Files
      #
      # @overload list(created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, purpose: nil, request_options: {})
      #
      # @param created_at [Increase::Models::FileListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param purpose [Increase::Models::FileListParams::Purpose]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::FileListResponse]
      #
      # @see Increase::Models::FileListParams
      def list(params = {})
        parsed, options = Increase::FileListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "files",
          query: parsed,
          model: Increase::Models::FileListResponse,
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
