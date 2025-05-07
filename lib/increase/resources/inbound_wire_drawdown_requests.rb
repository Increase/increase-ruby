# frozen_string_literal: true

module Increase
  module Resources
    class InboundWireDrawdownRequests
      # Retrieve an Inbound Wire Drawdown Request
      #
      # @overload retrieve(inbound_wire_drawdown_request_id, request_options: {})
      #
      # @param inbound_wire_drawdown_request_id [String] The identifier of the Inbound Wire Drawdown Request to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::InboundWireDrawdownRequest]
      #
      # @see Increase::Models::InboundWireDrawdownRequestRetrieveParams
      def retrieve(inbound_wire_drawdown_request_id, params = {})
        @client.request(
          method: :get,
          path: ["inbound_wire_drawdown_requests/%1$s", inbound_wire_drawdown_request_id],
          model: Increase::InboundWireDrawdownRequest,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::InboundWireDrawdownRequestListParams} for more details.
      #
      # List Inbound Wire Drawdown Requests
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::InboundWireDrawdownRequest>]
      #
      # @see Increase::Models::InboundWireDrawdownRequestListParams
      def list(params = {})
        parsed, options = Increase::InboundWireDrawdownRequestListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "inbound_wire_drawdown_requests",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::InboundWireDrawdownRequest,
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
