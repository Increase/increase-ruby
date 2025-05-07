# typed: strong

module Increase
  module Resources
    class Simulations
      class CardReversals
        # Simulates the reversal of an authorization by a card acquirer. An authorization
        # can be partially reversed multiple times, up until the total authorized amount.
        # Marks the pending transaction as complete if the authorization is fully
        # reversed.
        sig do
          params(
            card_payment_id: String,
            amount: Integer,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardPayment)
        end
        def create(
          # The identifier of the Card Payment to create a reversal on.
          card_payment_id:,
          # The amount of the reversal in minor units in the card authorization's currency.
          # This defaults to the authorization amount.
          amount: nil,
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
