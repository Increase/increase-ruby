# typed: strong

module Increase
  module Resources
    class Simulations
      class CardFuelConfirmations
        # Simulates the fuel confirmation of an authorization by a card acquirer. This
        #   happens asynchronously right after a fuel pump transaction is completed. A fuel
        #   confirmation can only happen once per authorization.
        sig do
          params(
            amount: Integer,
            card_payment_id: String,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::CardPayment)
        end
        def create(
          # The amount of the fuel_confirmation in minor units in the card authorization's
          #   currency.
          amount:,
          # The identifier of the Card Payment to create a fuel_confirmation on.
          card_payment_id:,
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
