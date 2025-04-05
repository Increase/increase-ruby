# typed: strong

module Increase
  module Models
    class OAuthTokenCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The credential you request in exchange for the code. In Production, this is
      # always `authorization_code`. In Sandbox, you can pass either enum value.
      sig { returns(Increase::Models::OAuthTokenCreateParams::GrantType::OrSymbol) }
      attr_accessor :grant_type

      # The public identifier for your application.
      sig { returns(T.nilable(String)) }
      attr_reader :client_id

      sig { params(client_id: String).void }
      attr_writer :client_id

      # The secret that confirms you own the application. This is redundent given that
      # the request is made with your API key but it's a required component of OAuth
      # 2.0.
      sig { returns(T.nilable(String)) }
      attr_reader :client_secret

      sig { params(client_secret: String).void }
      attr_writer :client_secret

      # The authorization code generated by the user and given to you as a query
      # parameter.
      sig { returns(T.nilable(String)) }
      attr_reader :code

      sig { params(code: String).void }
      attr_writer :code

      # The production token you want to exchange for a sandbox token. This is only
      # available in Sandbox. Set `grant_type` to `production_token` to use this
      # parameter.
      sig { returns(T.nilable(String)) }
      attr_reader :production_token

      sig { params(production_token: String).void }
      attr_writer :production_token

      sig do
        params(
          grant_type: Increase::Models::OAuthTokenCreateParams::GrantType::OrSymbol,
          client_id: String,
          client_secret: String,
          code: String,
          production_token: String,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        grant_type:,
        client_id: nil,
        client_secret: nil,
        code: nil,
        production_token: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              grant_type: Increase::Models::OAuthTokenCreateParams::GrantType::OrSymbol,
              client_id: String,
              client_secret: String,
              code: String,
              production_token: String,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash; end

      # The credential you request in exchange for the code. In Production, this is
      # always `authorization_code`. In Sandbox, you can pass either enum value.
      module GrantType
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::OAuthTokenCreateParams::GrantType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::OAuthTokenCreateParams::GrantType::TaggedSymbol) }

        # An OAuth authorization code.
        AUTHORIZATION_CODE =
          T.let(:authorization_code, Increase::Models::OAuthTokenCreateParams::GrantType::TaggedSymbol)

        # An OAuth production token.
        PRODUCTION_TOKEN =
          T.let(:production_token, Increase::Models::OAuthTokenCreateParams::GrantType::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::OAuthTokenCreateParams::GrantType::TaggedSymbol]) }
        def self.values; end
      end
    end
  end
end
