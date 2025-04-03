# typed: strong

module Increase
  module Models
    module Simulations
      class CardAuthorizationExpirationCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # The identifier of the Card Payment to expire.
        sig { returns(String) }
        attr_accessor :card_payment_id

        sig do
          params(
            card_payment_id: String,
            request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(card_payment_id:, request_options: {})
        end

        sig { override.returns({card_payment_id: String, request_options: Increase::RequestOptions}) }
        def to_hash
        end
      end
    end
  end
end
