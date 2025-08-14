# typed: strong

module Increase
  module Resources
    class Simulations
      class CardTokens
        # Simulates tokenizing a card in the sandbox environment.
        sig do
          params(
            capabilities:
              T::Array[
                Increase::Simulations::CardTokenCreateParams::Capability::OrHash
              ],
            expiration: Date,
            last4: String,
            prefix: String,
            primary_account_number_length: Integer,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardToken)
        end
        def create(
          # The capabilities of the outbound card token.
          capabilities: nil,
          # The expiration date of the card.
          expiration: nil,
          # The last 4 digits of the card number.
          last4: nil,
          # The prefix of the card number, usually the first 8 digits.
          prefix: nil,
          # The total length of the card number, including prefix and last4.
          primary_account_number_length: nil,
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
