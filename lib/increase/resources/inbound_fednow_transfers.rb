# frozen_string_literal: true

module Increase
  module Resources
    class InboundFednowTransfers
      # Retrieve an Inbound FedNow Transfer
      #
      # @overload retrieve(inbound_fednow_transfer_id, request_options: {})
      #
      # @param inbound_fednow_transfer_id [String] The identifier of the Inbound FedNow Transfer to get details for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundFednowTransfer]
      #
      # @see Increase::Models::InboundFednowTransferRetrieveParams
      def retrieve(inbound_fednow_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["inbound_fednow_transfers/%1$s", inbound_fednow_transfer_id],
          model: Increase::InboundFednowTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::InboundFednowTransferListParams} for more details.
      #
      # List Inbound FedNow Transfers
      #
      # @overload list(account_id: nil, account_number_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param account_id [String] Filter Inbound FedNow Transfers to those belonging to the specified Account.
      #
      # @param account_number_id [String] Filter Inbound FedNow Transfers to ones belonging to the specified Account Numbe
      #
      # @param created_at [Increase::Models::InboundFednowTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::InboundFednowTransfer>]
      #
      # @see Increase::Models::InboundFednowTransferListParams
      def list(params = {})
        parsed, options = Increase::InboundFednowTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "inbound_fednow_transfers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::InboundFednowTransfer,
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
