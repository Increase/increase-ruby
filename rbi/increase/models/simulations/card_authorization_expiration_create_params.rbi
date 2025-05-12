# typed: strong

module Increase
  module Models
    module Simulations
      class CardAuthorizationExpirationCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardAuthorizationExpirationCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Card Payment to expire.
        sig { returns(String) }
        attr_accessor :card_payment_id

        sig do
          params(
            card_payment_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Card Payment to expire.
          card_payment_id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
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
