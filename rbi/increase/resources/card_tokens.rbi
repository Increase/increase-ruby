# typed: strong

module Increase
  module Resources
    class CardTokens
      # Retrieve a Card Token
      sig do
        params(
          card_token_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardToken)
      end
      def retrieve(
        # The identifier of the Card Token.
        card_token_id,
        request_options: {}
      )
      end

      # List Card Tokens
      sig do
        params(
          created_at: Increase::CardTokenListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::CardTokenListResponse)
      end
      def list(
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        request_options: {}
      )
      end

      # The capabilities of a Card Token describe whether the card can be used for
      # specific operations, such as Card Push Transfers. The capabilities can change
      # over time based on the issuing bank's configuration of the card range.
      sig do
        params(
          card_token_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardTokenCapabilities)
      end
      def capabilities(
        # The identifier of the Card Token.
        card_token_id,
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
