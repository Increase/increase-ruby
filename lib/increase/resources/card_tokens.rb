# frozen_string_literal: true

module Increase
  module Resources
    class CardTokens
      # Retrieve a Card Token
      #
      # @overload retrieve(card_token_id, request_options: {})
      #
      # @param card_token_id [String] The identifier of the Card Token.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardToken]
      #
      # @see Increase::Models::CardTokenRetrieveParams
      def retrieve(card_token_id, params = {})
        @client.request(
          method: :get,
          path: ["card_tokens/%1$s", card_token_id],
          model: Increase::CardToken,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardTokenListParams} for more details.
      #
      # List Card Tokens
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param created_at [Increase::Models::CardTokenListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardTokenListResponse]
      #
      # @see Increase::Models::CardTokenListParams
      def list(params = {})
        parsed, options = Increase::CardTokenListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "card_tokens",
          query: parsed,
          model: Increase::Models::CardTokenListResponse,
          options: options
        )
      end

      # The capabilities of a Card Token describe whether the card can be used for
      # specific operations, such as Card Push Transfers. The capabilities can change
      # over time based on the issuing bank's configuration of the card range.
      #
      # @overload capabilities(card_token_id, request_options: {})
      #
      # @param card_token_id [String] The identifier of the Card Token.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardTokenCapabilities]
      #
      # @see Increase::Models::CardTokenCapabilitiesParams
      def capabilities(card_token_id, params = {})
        @client.request(
          method: :get,
          path: ["card_tokens/%1$s/capabilities", card_token_id],
          model: Increase::CardTokenCapabilities,
          options: params[:request_options]
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
