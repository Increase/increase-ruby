# frozen_string_literal: true

module Increase
  module Resources
    class InboundMailItems
      # Retrieve an Inbound Mail Item
      #
      # @overload retrieve(inbound_mail_item_id, request_options: {})
      #
      # @param inbound_mail_item_id [String] The identifier of the Inbound Mail Item to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::InboundMailItem]
      #
      # @see Increase::Models::InboundMailItemRetrieveParams
      def retrieve(inbound_mail_item_id, params = {})
        @client.request(
          method: :get,
          path: ["inbound_mail_items/%1$s", inbound_mail_item_id],
          model: Increase::InboundMailItem,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::InboundMailItemListParams} for more details.
      #
      # List Inbound Mail Items
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, lockbox_id: nil, request_options: {})
      #
      # @param created_at [Increase::InboundMailItemListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param lockbox_id [String] Filter Inbound Mail Items to ones sent to the provided Lockbox.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::InboundMailItem>]
      #
      # @see Increase::Models::InboundMailItemListParams
      def list(params = {})
        parsed, options = Increase::InboundMailItemListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "inbound_mail_items",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::InboundMailItem,
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
