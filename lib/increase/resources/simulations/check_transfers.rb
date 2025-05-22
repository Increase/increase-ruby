# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CheckTransfers
        # Simulates the mailing of a [Check Transfer](#check-transfers), which happens
        # periodically throughout the day in production but can be sped up in sandbox.
        # This transfer must first have a `status` of `pending_approval` or
        # `pending_submission`.
        #
        # @overload mail(check_transfer_id, request_options: {})
        #
        # @param check_transfer_id [String] The identifier of the Check Transfer you wish to mail.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CheckTransfer]
        #
        # @see Increase::Models::Simulations::CheckTransferMailParams
        def mail(check_transfer_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/check_transfers/%1$s/mail", check_transfer_id],
            model: Increase::CheckTransfer,
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
