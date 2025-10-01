# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardDisputes
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::CardDisputeActionParams} for more details.
        #
        # After a [Card Dispute](#card-disputes) is created in production, the dispute
        # will initially be in a `pending_user_submission_reviewing` state. Since no
        # review or further action happens in sandbox, this endpoint simulates moving a
        # Card Dispute through its various states.
        #
        # @overload action(card_dispute_id, network:, visa: nil, request_options: {})
        #
        # @param card_dispute_id [String] The dispute you would like to action.
        #
        # @param network [Symbol, Increase::Models::Simulations::CardDisputeActionParams::Network] The network of the Card Dispute. Details specific to the network are required un
        #
        # @param visa [Increase::Models::Simulations::CardDisputeActionParams::Visa] The Visa-specific parameters for the taking action on the dispute. Required if a
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CardDispute]
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
