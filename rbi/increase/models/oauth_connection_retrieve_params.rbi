# typed: strong

module Increase
  module Models
    class OAuthConnectionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::OAuthConnectionRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the OAuth Connection.
      sig { returns(String) }
      attr_accessor :oauth_connection_id

      sig do
        params(
          oauth_connection_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the OAuth Connection.
        oauth_connection_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            oauth_connection_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
