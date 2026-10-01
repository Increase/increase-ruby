# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class FednowTransfers
        # Simulates submission of a [FedNow Transfer](#fednow-transfers) and handling the
        # response from the destination financial institution. This transfer must first
        # have a `status` of `pending_submitting`.
        #
        # @overload complete(fednow_transfer_id, rejection: nil, request_options: {})
        #
        # @param fednow_transfer_id [String] The identifier of the FedNow Transfer you wish to complete.
        #
        # @param rejection [Increase::Models::Simulations::FednowTransferCompleteParams::Rejection]
        #   If set, the simulation will reject the transfer.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::FednowTransfer]
        #
        # @see Increase::Models::Simulations::FednowTransferCompleteParams
        def complete(fednow_transfer_id, params = {})
          parsed, options = Increase::Simulations::FednowTransferCompleteParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/fednow_transfers/%1$s/complete", fednow_transfer_id],
            body: parsed,
            model: Increase::FednowTransfer,
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
