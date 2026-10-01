# frozen_string_literal: true

module Increase
  module Resources
    class DigitalWalletTokenRequests
      # Retrieve a Digital Wallet Token Request
      #
      # @overload retrieve(digital_wallet_token_request_id, request_options: {})
      #
      # @param digital_wallet_token_request_id [String] The identifier of the Digital Wallet Token Request.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DigitalWalletTokenRequest]
      #
      # @see Increase::Models::DigitalWalletTokenRequestRetrieveParams
      def retrieve(digital_wallet_token_request_id, params = {})
        @client.request(
          method: :get,
          path: ["digital_wallet_token_requests/%1$s", digital_wallet_token_request_id],
          model: Increase::DigitalWalletTokenRequest,
          options: params[:request_options]
        )
      end

      # List Digital Wallet Token Requests
      #
      # @overload list(card_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param card_id [String] Filter Digital Wallet Token Requests to ones for the specified Card.
      #
      # @param created_at [Increase::Models::DigitalWalletTokenRequestListParams::CreatedAt]
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
      # @return [Increase::Internal::Page<Increase::Models::DigitalWalletTokenRequest>]
      #
      # @see Increase::Models::DigitalWalletTokenRequestListParams
      def list(params = {})
        parsed, options = Increase::DigitalWalletTokenRequestListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "digital_wallet_token_requests",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::DigitalWalletTokenRequest,
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
