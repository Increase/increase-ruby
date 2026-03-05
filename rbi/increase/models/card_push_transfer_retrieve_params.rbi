# typed: strong

module Increase
  module Models
    class CardPushTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardPushTransferRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Card Push Transfer.
      sig { returns(String) }
      attr_accessor :card_push_transfer_id

      sig do
        params(
          card_push_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Card Push Transfer.
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
