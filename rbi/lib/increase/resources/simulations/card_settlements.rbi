# typed: strong

module Increase
  module Resources
    class Simulations
      class CardSettlements
        # Simulates the settlement of an authorization by a card acquirer. After a card
        #   authorization is created, the merchant will eventually send a settlement. This
        #   simulates that event, which may occur many days after the purchase in
        #   production. The amount settled can be different from the amount originally
        #   authorized, for example, when adding a tip to a restaurant bill.
        sig do
          params(
            card_id: String,
            pending_transaction_id: String,
            amount: Integer,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::Transaction)
        end
        def create(
          # The identifier of the Card to create a settlement on.
          card_id:,
          # The identifier of the Pending Transaction for the Card Authorization you wish to
          #   settle.
          pending_transaction_id:,
          # The amount to be settled. This defaults to the amount of the Pending Transaction
          #   being settled.
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
