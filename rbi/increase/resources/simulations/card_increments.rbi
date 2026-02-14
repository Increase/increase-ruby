# typed: strong

module Increase
  module Resources
    class Simulations
      class CardIncrements
        # Simulates the increment of an authorization by a card acquirer. An authorization
        # can be incremented multiple times.
        sig do
          params(
            amount: Integer,
            card_payment_id: String,
            event_subscription_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardPayment)
        end
        def create(
          # The amount of the increment in minor units in the card authorization's currency.
          amount:,
          # The identifier of the Card Payment to create an increment on.
          card_payment_id:,
          # The identifier of the Event Subscription to use. If provided, will override the
          # default real time event subscription. Because you can only create one real time
          # decision event subscription, you can use this field to route events to any
          # specified event subscription for testing purposes.
          event_subscription_id: nil,
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
