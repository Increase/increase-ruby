# typed: strong

module Increase
  module Resources
    class OAuthApplications
      # Retrieve an OAuth Application
      sig do
        params(
          oauth_application_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::OAuthApplication)
      end
      def retrieve(
        # The identifier of the OAuth Application.
        oauth_application_id,
        request_options: {}
      )
      end

      # List OAuth Applications
      sig do
        params(
          created_at: Increase::OAuthApplicationListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          status: Increase::OAuthApplicationListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::OAuthApplicationListResponse)
      end
      def list(
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
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
