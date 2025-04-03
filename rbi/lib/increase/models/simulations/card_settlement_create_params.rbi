# typed: strong

module Increase
  module Models
    module Simulations
      class CardSettlementCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # The identifier of the Card to create a settlement on.
        sig { returns(String) }
        attr_accessor :card_id

        # The identifier of the Pending Transaction for the Card Authorization you wish to
        #   settle.
        sig { returns(String) }
        attr_accessor :pending_transaction_id

        # The amount to be settled. This defaults to the amount of the Pending Transaction
        #   being settled.
        sig { returns(T.nilable(Integer)) }
        attr_reader :amount

        sig { params(amount: Integer).void }
        attr_writer :amount

        sig do
          params(
            card_id: String,
            pending_transaction_id: String,
            amount: Integer,
            request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(card_id:, pending_transaction_id:, amount: nil, request_options: {})
        end

        sig do
          override
            .returns(
              {
                card_id: String,
                pending_transaction_id: String,
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
