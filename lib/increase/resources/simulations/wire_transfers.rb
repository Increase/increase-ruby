# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class WireTransfers
        # Simulates the reversal of a [Wire Transfer](#wire-transfers) by the Federal
        # Reserve due to error conditions. This will also create a
        # [Transaction](#transaction) to account for the returned funds. This Wire
        # Transfer must first have a `status` of `complete`.
        #
        # @overload reverse(wire_transfer_id, request_options: {})
        #
        # @param wire_transfer_id [String] The identifier of the Wire Transfer you wish to reverse.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::WireTransfer]
        #
        # @see Increase::Models::Simulations::WireTransferReverseParams
        def reverse(wire_transfer_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/wire_transfers/%1$s/reverse", wire_transfer_id],
            model: Increase::WireTransfer,
            options: params[:request_options]
          )
        end

        # Simulates the submission of a [Wire Transfer](#wire-transfers) to the Federal
        # Reserve. This transfer must first have a `status` of `pending_approval` or
        # `pending_creating`.
        #
        # @overload submit(wire_transfer_id, request_options: {})
        #
        # @param wire_transfer_id [String] The identifier of the Wire Transfer you wish to submit.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::WireTransfer]
        #
        # @see Increase::Models::Simulations::WireTransferSubmitParams
        def submit(wire_transfer_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/wire_transfers/%1$s/submit", wire_transfer_id],
            model: Increase::WireTransfer,
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
