# frozen_string_literal: true

module Increase
  module Resources
    class InboundRealTimePaymentsTransfers
      # Retrieve an Inbound Real-Time Payments Transfer
      #
      # @overload retrieve(inbound_real_time_payments_transfer_id, request_options: {})
      #
      # @param inbound_real_time_payments_transfer_id [String] The identifier of the Inbound Real-Time Payments Transfer to get details for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundRealTimePaymentsTransfer]
      #
      # @see Increase::Models::InboundRealTimePaymentsTransferRetrieveParams
      def retrieve(inbound_real_time_payments_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["inbound_real_time_payments_transfers/%1$s", inbound_real_time_payments_transfer_id],
          model: Increase::InboundRealTimePaymentsTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::InboundRealTimePaymentsTransferListParams} for more details.
      #
      # List Inbound Real-Time Payments Transfers
      #
      # @overload list(account_id: nil, account_number_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param account_id [String] Filter Inbound Real-Time Payments Transfers to those belonging to the specified
      #
      # @param account_number_id [String] Filter Inbound Real-Time Payments Transfers to ones belonging to the specified A
      #
      # @param created_at [Increase::Models::InboundRealTimePaymentsTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::InboundRealTimePaymentsTransfer>]
      #
      # @see Increase::Models::InboundRealTimePaymentsTransferListParams
      def list(params = {})
        parsed, options = Increase::InboundRealTimePaymentsTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "inbound_real_time_payments_transfers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::InboundRealTimePaymentsTransfer,
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
