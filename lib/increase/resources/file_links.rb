# frozen_string_literal: true

module Increase
  module Resources
    class FileLinks
      # Create a File Link
      #
      # @overload create(file_id:, expires_at: nil, request_options: {})
      #
      # @param file_id [String] The File to create a File Link for.
      #
      # @param expires_at [Time]
      #   The time at which the File Link will expire. The default is 1 hour from the time
      #   of the request. The maximum is 1 day from the time of the request.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::FileLink]
      #
      # @see Increase::Models::FileLinkCreateParams
      def create(params)
        parsed, options = Increase::FileLinkCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "file_links",
          body: parsed,
          model: Increase::FileLink,
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
