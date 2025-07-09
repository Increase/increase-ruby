# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class WireDrawdownRequests
        # Simulates a Wire Drawdown Request being refused by the debtor.
        #
        # @overload refuse(wire_drawdown_request_id, request_options: {})
        #
        # @param wire_drawdown_request_id [String] The identifier of the Wire Drawdown Request you wish to refuse.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::WireDrawdownRequest]
        #
        # @see Increase::Models::Simulations::WireDrawdownRequestRefuseParams
        def refuse(wire_drawdown_request_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/wire_drawdown_requests/%1$s/refuse", wire_drawdown_request_id],
            model: Increase::WireDrawdownRequest,
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
end
