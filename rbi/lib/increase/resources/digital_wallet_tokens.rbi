# typed: strong

module Increase
  module Resources
    class DigitalWalletTokens
      # Retrieve a Digital Wallet Token
      sig do
        params(
          digital_wallet_token_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::DigitalWalletToken)
      end
      def retrieve(
        # The identifier of the Digital Wallet Token.
        digital_wallet_token_id,
        request_options: {}
      )
      end

      # List Digital Wallet Tokens
      sig do
        params(
          card_id: String,
          created_at: T.any(Increase::Models::DigitalWalletTokenListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::DigitalWalletToken])
      end
      def list(
        # Filter Digital Wallet Tokens to ones belonging to the specified Card.
        card_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
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
