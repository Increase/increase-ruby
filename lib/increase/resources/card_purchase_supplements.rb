# frozen_string_literal: true

module Increase
  module Resources
    class CardPurchaseSupplements
      # Retrieve a Card Purchase Supplement
      #
      # @overload retrieve(card_purchase_supplement_id, request_options: {})
      #
      # @param card_purchase_supplement_id [String] The identifier of the Card Purchase Supplement.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardPurchaseSupplement]
      #
      # @see Increase::Models::CardPurchaseSupplementRetrieveParams
      def retrieve(card_purchase_supplement_id, params = {})
        @client.request(
          method: :get,
          path: ["card_purchase_supplements/%1$s", card_purchase_supplement_id],
          model: Increase::CardPurchaseSupplement,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardPurchaseSupplementListParams} for more details.
      #
      # List Card Purchase Supplements
      #
      # @overload list(card_payment_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param card_payment_id [String] Filter Card Purchase Supplements to ones belonging to the specified Card Payment
      #
      # @param created_at [Increase::Models::CardPurchaseSupplementListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::CardPurchaseSupplement>]
      #
      # @see Increase::Models::CardPurchaseSupplementListParams
      def list(params = {})
        parsed, options = Increase::CardPurchaseSupplementListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "card_purchase_supplements",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::CardPurchaseSupplement,
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
