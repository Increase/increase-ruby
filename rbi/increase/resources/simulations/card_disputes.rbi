# typed: strong

module Increase
  module Resources
    class Simulations
      class CardDisputes
        # After a [Card Dispute](#card-disputes) is created in production, the dispute
        # will initially be in a `pending_user_submission_reviewing` state. Since no
        # review or further action happens in sandbox, this endpoint simulates moving a
        # Card Dispute through its various states.
        sig do
          params(
            card_dispute_id: String,
            network:
              Increase::Simulations::CardDisputeActionParams::Network::OrSymbol,
            visa: Increase::Simulations::CardDisputeActionParams::Visa::OrHash,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardDispute)
        end
        def action(
          # The dispute you would like to action.
          card_dispute_id,
          # The network of the Card Dispute. Details specific to the network are required
          # under the sub-object with the same identifier as the network.
          network:,
          # The Visa-specific parameters for the taking action on the dispute. Required if
          # and only if `network` is `visa`.
          visa: nil,
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
