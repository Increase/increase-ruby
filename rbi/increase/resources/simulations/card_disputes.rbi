# typed: strong

module Increase
  module Resources
    class Simulations
      class CardDisputes
        # After a [Card Dispute](#card-disputes) is created in production, the dispute
        # will be reviewed. Since no review happens in sandbox, this endpoint simulates
        # moving a Card Dispute into a rejected or accepted state. A Card Dispute can only
        # be actioned one time and must have a status of `pending_reviewing`.
        sig do
          params(
            card_dispute_id: String,
            status:
              Increase::Simulations::CardDisputeActionParams::Status::OrSymbol,
            explanation: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardDispute)
        end
        def action(
          # The dispute you would like to action.
          card_dispute_id,
          # The status to move the dispute to.
          status:,
          # Why the dispute was rejected. Not required for accepting disputes.
          explanation: nil,
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
