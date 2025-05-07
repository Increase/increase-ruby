# typed: strong

module Increase
  module Resources
    class Simulations
      class DigitalWalletTokenRequests
        # Simulates a user attempting add a [Card](#cards) to a digital wallet such as
        # Apple Pay.
        sig do
          params(
            card_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(
            Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse
          )
        end
        def create(
          # The identifier of the Card to be authorized.
          card_id:,
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
