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
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::DigitalWalletToken>]
      #
      # @see Increase::Models::DigitalWalletTokenListParams
      def list(params = {})
        parsed, options = Increase::DigitalWalletTokenListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "digital_wallet_tokens",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::DigitalWalletToken,
          options: options
        )
      end

      # Submit a Digital Wallet Token status transition to the card network. The Digital
      # Wallet Token will move to `pending_transitioning` until the card network
      # confirms the transition, and a `digital_wallet_token.updated` webhook will be
      # sent once the transition has been confirmed.
      #
      # @overload transition(digital_wallet_token_id, status:, request_options: {})
      #
      # @param digital_wallet_token_id [String] The identifier of the Digital Wallet Token.
      #
      # @param status [Symbol, Increase::Models::DigitalWalletTokenTransitionParams::Status]
      #   The status to transition the Digital Wallet Token to.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DigitalWalletToken]
      #
      # @see Increase::Models::DigitalWalletTokenTransitionParams
      def transition(digital_wallet_token_id, params)
        parsed, options = Increase::DigitalWalletTokenTransitionParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["digital_wallet_tokens/%1$s/transition", digital_wallet_token_id],
          body: parsed,
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
