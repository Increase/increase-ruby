# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::OAuthTokens#create
    class OAuthToken < Increase::Internal::Type::BaseModel
      # @!attribute access_token
      #   You may use this token in place of an API key to make OAuth requests on a user's
      #   behalf.
      #
      #   @return [String]
      required :access_token, String

      # @!attribute token_type
      #   The type of OAuth token.
      #
      #   @return [Symbol, Increase::OAuthToken::TokenType]
      required :token_type, enum: -> { Increase::OAuthToken::TokenType }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `oauth_token`.
      #
      #   @return [Symbol, Increase::OAuthToken::Type]
      required :type, enum: -> { Increase::OAuthToken::Type }

      # @!method initialize(access_token:, token_type:, type:)
      #   Some parameter documentations has been truncated, see {Increase::OAuthToken} for
      #   more details.
      #
      #   A token that is returned to your application when a user completes the OAuth
      #   flow and may be used to authenticate requests. Learn more about OAuth
      #   [here](/documentation/oauth).
      #
      #   @param access_token [String] You may use this token in place of an API key to make OAuth requests on a user's
      #
      #   @param token_type [Symbol, Increase::OAuthToken::TokenType] The type of OAuth token.
      #
      #   @param type [Symbol, Increase::OAuthToken::Type] A constant representing the object's type. For this resource it will always be `

      # The type of OAuth token.
      #
      # @see Increase::OAuthToken#token_type
      module TokenType
        extend Increase::Internal::Type::Enum

        BEARER = :bearer

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `oauth_token`.
      #
      # @see Increase::OAuthToken#type
      module Type
        extend Increase::Internal::Type::Enum

        OAUTH_TOKEN = :oauth_token

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
