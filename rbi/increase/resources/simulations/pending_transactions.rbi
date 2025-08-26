# typed: strong

module Increase
  module Resources
    class Simulations
      class PendingTransactions
        # This endpoint simulates immediately releasing an Inbound Funds Hold, which might
        # be created as a result of, for example, an ACH debit.
        sig do
          params(
            pending_transaction_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::PendingTransaction)
        end
        def release_inbound_funds_hold(
          # The pending transaction to release. The pending transaction must have a
          # `inbound_funds_hold` source.
          pending_transaction_id,
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
