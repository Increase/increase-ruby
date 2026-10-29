# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class WireDrawdownRequests
        # Simulates a Wire Drawdown Request being refused by the debtor.
        #
        # @overload refuse(wire_drawdown_request_id, refusal_reason_additional_information: nil, refusal_reason_code: nil, request_options: {})
        #
        # @param wire_drawdown_request_id [String] The identifier of the Wire Drawdown Request you wish to refuse.
        #
        # @param refusal_reason_additional_information [String]
        #   Additional information about the refusal that the simulated refusal will have.
        #
        # @param refusal_reason_code [Symbol, Increase::Models::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode]
        #   The reason code that the simulated refusal will have.
        #
        #   Defaults to `other`.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::WireDrawdownRequest]
        #
        # @see Increase::Models::Simulations::WireDrawdownRequestRefuseParams
        def refuse(wire_drawdown_request_id, params = {})
          parsed, options = Increase::Simulations::WireDrawdownRequestRefuseParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/wire_drawdown_requests/%1$s/refuse", wire_drawdown_request_id],
            body: parsed,
            model: Increase::WireDrawdownRequest,
            options: options
          )
        end

        # Simulates a Wire Drawdown Request being submitted to Fedwire.
        #
        # @overload submit(wire_drawdown_request_id, request_options: {})
        #
        # @param wire_drawdown_request_id [String] The identifier of the Wire Drawdown Request you wish to submit.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::WireDrawdownRequest]
        #
        # @see Increase::Models::Simulations::WireDrawdownRequestSubmitParams
        def submit(wire_drawdown_request_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/wire_drawdown_requests/%1$s/submit", wire_drawdown_request_id],
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
