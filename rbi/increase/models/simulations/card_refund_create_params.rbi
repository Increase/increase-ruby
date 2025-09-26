# typed: strong

module Increase
  module Models
    module Simulations
      class CardRefundCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardRefundCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Pending Transaction for the refund authorization. If this
        # is provided, `transaction` must not be provided as a refund with a refund
        # authorized can not be linked to a regular transaction.
        sig { returns(T.nilable(String)) }
        attr_reader :pending_transaction_id

        sig { params(pending_transaction_id: String).void }
        attr_writer :pending_transaction_id

        # The identifier for the Transaction to refund. The Transaction's source must have
        # a category of card_settlement.
        sig { returns(T.nilable(String)) }
        attr_reader :transaction_id

        sig { params(transaction_id: String).void }
        attr_writer :transaction_id

        sig do
          params(
            pending_transaction_id: String,
            transaction_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Pending Transaction for the refund authorization. If this
          # is provided, `transaction` must not be provided as a refund with a refund
          # authorized can not be linked to a regular transaction.
          pending_transaction_id: nil,
          # The identifier for the Transaction to refund. The Transaction's source must have
          # a category of card_settlement.
          transaction_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              pending_transaction_id: String,
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
