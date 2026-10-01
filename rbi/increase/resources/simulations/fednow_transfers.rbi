# typed: strong

module Increase
  module Resources
    class Simulations
      class FednowTransfers
        # Simulates submission of a [FedNow Transfer](#fednow-transfers) and handling the
        # response from the destination financial institution. This transfer must first
        # have a `status` of `pending_submitting`.
        sig do
          params(
            fednow_transfer_id: String,
            rejection:
              Increase::Simulations::FednowTransferCompleteParams::Rejection::OrHash,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::FednowTransfer)
        end
        def complete(
          # The identifier of the FedNow Transfer you wish to complete.
          fednow_transfer_id,
          # If set, the simulation will reject the transfer.
          rejection: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Increase::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
