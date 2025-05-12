# typed: strong

module Increase
  module Models
    class OAuthToken < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::OAuthToken, Increase::Internal::AnyHash)
        end

      # You may use this token in place of an API key to make OAuth requests on a user's
      # behalf.
      sig { returns(String) }
      attr_accessor :access_token

      # The type of OAuth token.
      sig { returns(Increase::OAuthToken::TokenType::TaggedSymbol) }
      attr_accessor :token_type

      # A constant representing the object's type. For this resource it will always be
      # `oauth_token`.
      sig { returns(Increase::OAuthToken::Type::TaggedSymbol) }
      attr_accessor :type

      # A token that is returned to your application when a user completes the OAuth
      # flow and may be used to authenticate requests. Learn more about OAuth
      # [here](/documentation/oauth).
      sig do
        params(
          access_token: String,
          token_type: Increase::OAuthToken::TokenType::OrSymbol,
          type: Increase::OAuthToken::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # You may use this token in place of an API key to make OAuth requests on a user's
        # behalf.
        access_token:,
        # The type of OAuth token.
        token_type:,
        # A constant representing the object's type. For this resource it will always be
        # `oauth_token`.
        type:
      )
      end

      sig do
        override.returns(
          {
            access_token: String,
            token_type: Increase::OAuthToken::TokenType::TaggedSymbol,
            type: Increase::OAuthToken::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The type of OAuth token.
      module TokenType
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::OAuthToken::TokenType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BEARER = T.let(:bearer, Increase::OAuthToken::TokenType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::OAuthToken::TokenType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `oauth_token`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::OAuthToken::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OAUTH_TOKEN =
          T.let(:oauth_token, Increase::OAuthToken::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::OAuthToken::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
