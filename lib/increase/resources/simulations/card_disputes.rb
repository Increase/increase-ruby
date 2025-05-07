# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardDisputes
        # After a [Card Dispute](#card-disputes) is created in production, the dispute
        # will be reviewed. Since no review happens in sandbox, this endpoint simulates
        # moving a Card Dispute into a rejected or accepted state. A Card Dispute can only
        # be actioned one time and must have a status of `pending_reviewing`.
        #
        # @overload action(card_dispute_id, status:, explanation: nil, request_options: {})
        #
        # @param card_dispute_id [String] The dispute you would like to action.
        #
        # @param status [Symbol, Increase::Simulations::CardDisputeActionParams::Status] The status to move the dispute to.
        #
        # @param explanation [String] Why the dispute was rejected. Not required for accepting disputes.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::CardDispute]
        #
        # @see Increase::Models::Simulations::CardDisputeActionParams
        def action(card_dispute_id, params)
          parsed, options = Increase::Simulations::CardDisputeActionParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/card_disputes/%1$s/action", card_dispute_id],
            body: parsed,
            model: Increase::CardDispute,
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
