# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundFundsHolds
        # This endpoint simulates immediately releasing an Inbound Funds Hold, which might
        # be created as a result of e.g., an ACH debit.
        sig do
          params(
            inbound_funds_hold_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(
            Increase::Models::Simulations::InboundFundsHoldReleaseResponse
          )
        end
        def release(
          # The inbound funds hold to release.
          inbound_funds_hold_id,
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
