# typed: strong

module Increase
  module Models
    class CardPushTransferCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardPushTransferCancelParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the pending Card Push Transfer to cancel.
      sig { returns(String) }
      attr_accessor :card_push_transfer_id

      sig do
        params(
          card_push_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the pending Card Push Transfer to cancel.
        card_push_transfer_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            card_push_transfer_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
