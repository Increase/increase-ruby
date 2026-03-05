# typed: strong

module Increase
  module Models
    class CardDisputeWithdrawParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardDisputeWithdrawParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Card Dispute to withdraw.
      sig { returns(String) }
      attr_accessor :card_dispute_id

      # The explanation for withdrawing the Card Dispute.
      sig { returns(T.nilable(String)) }
      attr_reader :explanation

      sig { params(explanation: String).void }
      attr_writer :explanation

      sig do
        params(
          card_dispute_id: String,
          explanation: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Card Dispute to withdraw.
        card_dispute_id:,
        # The explanation for withdrawing the Card Dispute.
        explanation: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            card_dispute_id: String,
            explanation: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
