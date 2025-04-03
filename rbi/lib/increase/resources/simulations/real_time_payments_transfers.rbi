# typed: strong

module Increase
  module Resources
    class Simulations
      class RealTimePaymentsTransfers
        # Simulates submission of a
        #   [Real-Time Payments Transfer](#real-time-payments-transfers) and handling the
        #   response from the destination financial institution. This transfer must first
        #   have a `status` of `pending_submission`.
        sig do
          params(
            real_time_payments_transfer_id: String,
            rejection: T.any(
              Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection,
              Increase::Internal::AnyHash
            ),
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::RealTimePaymentsTransfer)
        end
        def complete(
          # The identifier of the Real-Time Payments Transfer you wish to complete.
          real_time_payments_transfer_id,
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
