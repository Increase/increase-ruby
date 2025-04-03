# typed: strong

module Increase
  module Models
    module Simulations
      class CardFuelConfirmationCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # The amount of the fuel_confirmation in minor units in the card authorization's
        #   currency.
        sig { returns(Integer) }
        attr_accessor :amount

        # The identifier of the Card Payment to create a fuel_confirmation on.
        sig { returns(String) }
        attr_accessor :card_payment_id

        sig do
          params(
            amount: Integer,
            card_payment_id: String,
            request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(amount:, card_payment_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              amount: Integer,
              card_payment_id: String,
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
