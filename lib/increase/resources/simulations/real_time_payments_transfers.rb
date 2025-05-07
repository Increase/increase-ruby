# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class RealTimePaymentsTransfers
        # Simulates submission of a
        # [Real-Time Payments Transfer](#real-time-payments-transfers) and handling the
        # response from the destination financial institution. This transfer must first
        # have a `status` of `pending_submission`.
        #
        # @overload complete(real_time_payments_transfer_id, rejection: nil, request_options: {})
        #
        # @param real_time_payments_transfer_id [String] The identifier of the Real-Time Payments Transfer you wish to complete.
        #
        # @param rejection [Increase::Simulations::RealTimePaymentsTransferCompleteParams::Rejection] If set, the simulation will reject the transfer.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::RealTimePaymentsTransfer]
        #
        # @see Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams
        def complete(real_time_payments_transfer_id, params = {})
          parsed, options = Increase::Simulations::RealTimePaymentsTransferCompleteParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/real_time_payments_transfers/%1$s/complete", real_time_payments_transfer_id],
            body: parsed,
            model: Increase::RealTimePaymentsTransfer,
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
end
