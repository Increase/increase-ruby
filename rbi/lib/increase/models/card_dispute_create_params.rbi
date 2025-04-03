# typed: strong

module Increase
  module Models
    class CardDisputeCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The Transaction you wish to dispute. This Transaction must have a `source_type`
      #   of `card_settlement`.
      sig { returns(String) }
      attr_accessor :disputed_transaction_id

      # Why you are disputing this Transaction.
      sig { returns(String) }
      attr_accessor :explanation

      # The monetary amount of the part of the transaction that is being disputed. This
      #   is optional and will default to the full amount of the transaction if not
      #   provided. If provided, the amount must be less than or equal to the amount of
      #   the transaction.
      sig { returns(T.nilable(Integer)) }
      attr_reader :amount

      sig { params(amount: Integer).void }
      attr_writer :amount

      sig do
        params(
          disputed_transaction_id: String,
          explanation: String,
          amount: Integer,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(disputed_transaction_id:, explanation:, amount: nil, request_options: {})
      end

      sig do
        override
          .returns(
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
