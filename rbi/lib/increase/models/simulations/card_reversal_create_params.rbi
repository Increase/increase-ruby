# typed: strong

module Increase
  module Models
    module Simulations
      class CardReversalCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # The identifier of the Card Payment to create a reversal on.
        sig { returns(String) }
        attr_accessor :card_payment_id

        # The amount of the reversal in minor units in the card authorization's currency.
        #   This defaults to the authorization amount.
        sig { returns(T.nilable(Integer)) }
        attr_reader :amount

        sig { params(amount: Integer).void }
        attr_writer :amount

        sig do
          params(
            card_payment_id: String,
            amount: Integer,
            request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(card_payment_id:, amount: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              card_payment_id: String,
              amount: Integer,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
