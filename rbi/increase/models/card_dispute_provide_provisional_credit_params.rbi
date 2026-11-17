# typed: strong

module Increase
  module Models
    class CardDisputeProvideProvisionalCreditParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardDisputeProvideProvisionalCreditParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Card Dispute to provide a provisional credit for.
      sig { returns(String) }
      attr_accessor :card_dispute_id

      sig do
        params(
          card_dispute_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Card Dispute to provide a provisional credit for.
        card_dispute_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { card_dispute_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
