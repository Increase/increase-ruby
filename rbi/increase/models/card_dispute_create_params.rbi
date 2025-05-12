# typed: strong

module Increase
  module Models
    class CardDisputeCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardDisputeCreateParams, Increase::Internal::AnyHash)
        end

      # The Transaction you wish to dispute. This Transaction must have a `source_type`
      # of `card_settlement`.
      sig { returns(String) }
      attr_accessor :disputed_transaction_id

      # Why you are disputing this Transaction.
      sig { returns(String) }
      attr_accessor :explanation

      # The monetary amount of the part of the transaction that is being disputed. This
      # is optional and will default to the full amount of the transaction if not
      # provided. If provided, the amount must be less than or equal to the amount of
      # the transaction.
      sig { returns(T.nilable(Integer)) }
      attr_reader :amount

      sig { params(amount: Integer).void }
      attr_writer :amount

      sig do
        params(
          disputed_transaction_id: String,
          explanation: String,
          amount: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Transaction you wish to dispute. This Transaction must have a `source_type`
        # of `card_settlement`.
        disputed_transaction_id:,
        # Why you are disputing this Transaction.
        explanation:,
        # The monetary amount of the part of the transaction that is being disputed. This
        # is optional and will default to the full amount of the transaction if not
        # provided. If provided, the amount must be less than or equal to the amount of
        # the transaction.
        amount: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            disputed_transaction_id: String,
            explanation: String,
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
