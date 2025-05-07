# typed: strong

module Increase
  module Resources
    class OAuthConnections
      # Retrieve an OAuth Connection
      sig do
        params(
          oauth_connection_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::OAuthConnection)
      end
      def retrieve(
        # The identifier of the OAuth Connection.
        oauth_connection_id,
        request_options: {}
      )
      end

      # List OAuth Connections
      sig do
        params(
          cursor: String,
          limit: Integer,
          oauth_application_id: String,
          status: Increase::OAuthConnectionListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::OAuthConnection])
      end
      def list(
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        # Filter results to only include OAuth Connections for a specific OAuth
        # Application.
        oauth_application_id: nil,
        status: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
