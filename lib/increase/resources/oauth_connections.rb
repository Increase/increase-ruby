# frozen_string_literal: true

module Increase
  module Resources
    class OAuthConnections
      # Retrieve an OAuth Connection
      #
      # @overload retrieve(oauth_connection_id, request_options: {})
      #
      # @param oauth_connection_id [String] The identifier of the OAuth Connection.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::OAuthConnection]
      #
      # @see Increase::Models::OAuthConnectionRetrieveParams
      def retrieve(oauth_connection_id, params = {})
        @client.request(
          method: :get,
          path: ["oauth_connections/%1$s", oauth_connection_id],
          model: Increase::OAuthConnection,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::OAuthConnectionListParams} for more details.
      #
      # List OAuth Connections
      #
      # @overload list(cursor: nil, limit: nil, oauth_application_id: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param oauth_application_id [String] Filter results to only include OAuth Connections for a specific OAuth Applicatio
      #
      # @param status [Increase::OAuthConnectionListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::OAuthConnection>]
      #
      # @see Increase::Models::OAuthConnectionListParams
      def list(params = {})
        parsed, options = Increase::OAuthConnectionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "oauth_connections",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::OAuthConnection,
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
