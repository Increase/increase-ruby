# typed: strong

module Increase
  module Models
    class CardTokenRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardTokenRetrieveParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Card Token.
      sig { returns(String) }
      attr_accessor :card_token_id

      sig do
        params(
          card_token_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Card Token.
        card_token_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { card_token_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
