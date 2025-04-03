# typed: strong

module Increase
  module Resources
    class Simulations
      class CardAuthorizationExpirations
        # Simulates expiring a Card Authorization immediately.
        sig do
          params(
            card_payment_id: String,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::CardPayment)
        end
        def create(
          # The identifier of the Card Payment to expire.
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
