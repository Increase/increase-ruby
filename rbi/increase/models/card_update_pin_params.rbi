# typed: strong

module Increase
  module Models
    class CardUpdatePinParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardUpdatePinParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Card to update the PIN for.
      sig { returns(String) }
      attr_accessor :card_id

      # The 4-digit PIN for the card, for use with ATMs.
      sig { returns(String) }
      attr_accessor :pin

      sig do
        params(
          card_id: String,
          pin: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Card to update the PIN for.
        card_id:,
        # The 4-digit PIN for the card, for use with ATMs.
        pin:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            card_id: String,
            pin: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
