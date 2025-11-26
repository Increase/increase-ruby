# frozen_string_literal: true

module Increase
  module Resources
    class DigitalWalletTokens
      # Retrieve a Digital Wallet Token
      #
      # @overload retrieve(digital_wallet_token_id, request_options: {})
      #
      # @param digital_wallet_token_id [String] The identifier of the Digital Wallet Token.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DigitalWalletToken]
      #
      # @see Increase::Models::DigitalWalletTokenRetrieveParams
      def retrieve(digital_wallet_token_id, params = {})
        @client.request(
          method: :get,
          path: ["digital_wallet_tokens/%1$s", digital_wallet_token_id],
          model: Increase::DigitalWalletToken,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::DigitalWalletTokenListParams} for more details.
      #
      # List Digital Wallet Tokens
      #
      # @overload list(card_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param card_id [String] Filter Digital Wallet Tokens to ones belonging to the specified Card.
      #
      # @param created_at [Increase::Models::DigitalWalletTokenListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::DigitalWalletToken>]
      #
      # @see Increase::Models::DigitalWalletTokenListParams
      def list(params = {})
        parsed, options = Increase::DigitalWalletTokenListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "digital_wallet_tokens",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::DigitalWalletToken,
          options: options
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
