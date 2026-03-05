# typed: strong

module Increase
  module Models
    class DigitalWalletTokenRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::DigitalWalletTokenRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Digital Wallet Token.
      sig { returns(String) }
      attr_accessor :digital_wallet_token_id

      sig do
        params(
          digital_wallet_token_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Digital Wallet Token.
        digital_wallet_token_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            digital_wallet_token_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
