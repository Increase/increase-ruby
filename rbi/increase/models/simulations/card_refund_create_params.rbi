# typed: strong

module Increase
  module Models
    module Simulations
      class CardRefundCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The identifier for the Transaction to refund. The Transaction's source must have
        # a category of card_settlement.
        sig { returns(String) }
        attr_accessor :transaction_id

        sig do
          params(
            transaction_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier for the Transaction to refund. The Transaction's source must have
          # a category of card_settlement.
          transaction_id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              transaction_id: String,
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
