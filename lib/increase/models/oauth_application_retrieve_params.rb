# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::OAuthApplications#retrieve
    class OAuthApplicationRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute oauth_application_id
      #   The identifier of the OAuth Application.
      #
      #   @return [String]
      required :oauth_application_id, String

      # @!method initialize(oauth_application_id:, request_options: {})
      #   @param oauth_application_id [String] The identifier of the OAuth Application.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
