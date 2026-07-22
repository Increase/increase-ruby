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
      # @return [Increase::Models::InboundMailItem]
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

      # List Inbound Mail Items
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, lockbox_address_id: nil, lockbox_recipient_id: nil, request_options: {})
      #
      # @param created_at [Increase::Models::InboundMailItemListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param lockbox_address_id [String] Filter Inbound Mail Items to ones sent to the provided Lockbox Address.
      #
      # @param lockbox_recipient_id [String]
      #   Filter Inbound Mail Items to ones sent to the provided Lockbox Recipient.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::InboundMailItem>]
      #
      # @see Increase::Models::InboundMailItemListParams
      def list(params = {})
        parsed, options = Increase::InboundMailItemListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "inbound_mail_items",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::InboundMailItem,
          options: options
        )
      end

      # Deposits or ignores each check contained in a pending Inbound Mail Item.
      # Depositing a check creates a [Check Deposit](#check-deposits) into the Account
      # you specify.
      #
      # @overload action(inbound_mail_item_id, checks:, request_options: {})
      #
      # @param inbound_mail_item_id [String] The identifier of the Inbound Mail Item to action.
      #
      # @param checks [Array<Increase::Models::InboundMailItemActionParams::Check>]
      #   The actions to perform on the Inbound Mail Item.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundMailItem]
      #
      # @see Increase::Models::InboundMailItemActionParams
      def action(inbound_mail_item_id, params)
        parsed, options = Increase::InboundMailItemActionParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["inbound_mail_items/%1$s/action", inbound_mail_item_id],
          body: parsed,
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
