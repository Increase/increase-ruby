# frozen_string_literal: true

module Increase
  module Resources
    class InboundWireTransfers
      # Retrieve an Inbound Wire Transfer
      #
      # @overload retrieve(inbound_wire_transfer_id, request_options: {})
      #
      # @param inbound_wire_transfer_id [String] The identifier of the Inbound Wire Transfer to get details for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::InboundWireTransfer]
      #
      # @see Increase::Models::InboundWireTransferRetrieveParams
      def retrieve(inbound_wire_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["inbound_wire_transfers/%1$s", inbound_wire_transfer_id],
          model: Increase::InboundWireTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::InboundWireTransferListParams} for more details.
      #
      # List Inbound Wire Transfers
      #
      # @overload list(account_id: nil, account_number_id: nil, created_at: nil, cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Inbound Wire Transfers to ones belonging to the specified Account.
      #
      # @param account_number_id [String] Filter Inbound Wire Transfers to ones belonging to the specified Account Number.
      #
      # @param created_at [Increase::InboundWireTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::InboundWireTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::InboundWireTransfer>]
      #
      # @see Increase::Models::InboundWireTransferListParams
      def list(params = {})
        parsed, options = Increase::InboundWireTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "inbound_wire_transfers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::InboundWireTransfer,
          options: options
        )
      end

      # Reverse an Inbound Wire Transfer
      #
      # @overload reverse(inbound_wire_transfer_id, reason:, request_options: {})
      #
      # @param inbound_wire_transfer_id [String] The identifier of the Inbound Wire Transfer to reverse.
      #
      # @param reason [Symbol, Increase::InboundWireTransferReverseParams::Reason] Reason for the reversal.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::InboundWireTransfer]
      #
      # @see Increase::Models::InboundWireTransferReverseParams
      def reverse(inbound_wire_transfer_id, params)
        parsed, options = Increase::InboundWireTransferReverseParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["inbound_wire_transfers/%1$s/reverse", inbound_wire_transfer_id],
          body: parsed,
          model: Increase::InboundWireTransfer,
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
