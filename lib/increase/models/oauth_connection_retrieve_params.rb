# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::OAuthConnections#retrieve
    class OAuthConnectionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute oauth_connection_id
      #   The identifier of the OAuth Connection.
      #
      #   @return [String]
      required :oauth_connection_id, String

      # @!method initialize(oauth_connection_id:, request_options: {})
      #   @param oauth_connection_id [String] The identifier of the OAuth Connection.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
