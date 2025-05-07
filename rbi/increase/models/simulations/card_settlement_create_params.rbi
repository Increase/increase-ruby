# typed: strong

module Increase
  module Models
    module Simulations
      class CardSettlementCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The identifier of the Card to create a settlement on.
        sig { returns(String) }
        attr_accessor :card_id

        # The identifier of the Pending Transaction for the Card Authorization you wish to
        # settle.
        sig { returns(String) }
        attr_accessor :pending_transaction_id

        # The amount to be settled. This defaults to the amount of the Pending Transaction
        # being settled.
        sig { returns(T.nilable(Integer)) }
        attr_reader :amount

        sig { params(amount: Integer).void }
        attr_writer :amount

        sig do
          params(
            card_id: String,
            pending_transaction_id: String,
            amount: Integer,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Card to create a settlement on.
          card_id:,
          # The identifier of the Pending Transaction for the Card Authorization you wish to
          # settle.
          pending_transaction_id:,
          # The amount to be settled. This defaults to the amount of the Pending Transaction
          # being settled.
          amount: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
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
