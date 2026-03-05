# typed: strong

module Increase
  module Models
    class OAuthApplicationRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::OAuthApplicationRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the OAuth Application.
      sig { returns(String) }
      attr_accessor :oauth_application_id

      sig do
        params(
          oauth_application_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the OAuth Application.
        oauth_application_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            oauth_application_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
