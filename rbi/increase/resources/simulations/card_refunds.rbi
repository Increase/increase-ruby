# typed: strong

module Increase
  module Resources
    class Simulations
      class CardRefunds
        # Simulates refunding a card transaction. The full value of the original sandbox
        # transaction is refunded.
        sig do
          params(
            amount: Integer,
            pending_transaction_id: String,
            transaction_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::Transaction)
        end
        def create(
          # The refund amount in cents. Pulled off the `pending_transaction` or the
          # `transaction` if not provided.
          amount: nil,
          # The identifier of the Pending Transaction for the refund authorization. If this
          # is provided, `transaction` must not be provided as a refund with a refund
          # authorized can not be linked to a regular transaction.
          pending_transaction_id: nil,
          # The identifier for the Transaction to refund. The Transaction's source must have
          # a category of card_settlement.
          transaction_id: nil,
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
