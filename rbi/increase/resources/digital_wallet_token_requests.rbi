# typed: strong

module Increase
  module Resources
    class DigitalWalletTokenRequests
      # Retrieve a Digital Wallet Token Request
      sig do
        params(
          digital_wallet_token_request_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::DigitalWalletTokenRequest)
      end
      def retrieve(
        # The identifier of the Digital Wallet Token Request.
        digital_wallet_token_request_id,
        request_options: {}
      )
      end

      # List Digital Wallet Token Requests
      sig do
        params(
          card_id: String,
          created_at:
            Increase::DigitalWalletTokenRequestListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::DigitalWalletTokenRequest])
      end
      def list(
        # Filter Digital Wallet Token Requests to ones for the specified Card.
        card_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        #
        # Defaults to `100`.
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
