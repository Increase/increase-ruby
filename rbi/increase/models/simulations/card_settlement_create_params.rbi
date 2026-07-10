# typed: strong

module Increase
  module Models
    module Simulations
      class CardSettlementCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardSettlementCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Card to create a settlement on.
        sig { returns(String) }
        attr_accessor :card_id

        # The amount to be settled. This defaults to the amount of the Pending Transaction
        # being settled, or a random amount if `pending_transaction_id` is not provided.
        sig { returns(T.nilable(Integer)) }
        attr_reader :amount

        sig { params(amount: Integer).void }
        attr_writer :amount

        # The identifier of the Pending Transaction for the Card Authorization you wish to
        # settle. If not provided, the settlement will be force posted without a Card
        # Authorization.
        sig { returns(T.nilable(String)) }
        attr_reader :pending_transaction_id

        sig { params(pending_transaction_id: String).void }
        attr_writer :pending_transaction_id

        sig do
          params(
            card_id: String,
            amount: Integer,
            pending_transaction_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Card to create a settlement on.
          card_id:,
          # The amount to be settled. This defaults to the amount of the Pending Transaction
          # being settled, or a random amount if `pending_transaction_id` is not provided.
          amount: nil,
          # The identifier of the Pending Transaction for the Card Authorization you wish to
          # settle. If not provided, the settlement will be force posted without a Card
          # Authorization.
          pending_transaction_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              card_id: String,
              amount: Integer,
              pending_transaction_id: String,
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
