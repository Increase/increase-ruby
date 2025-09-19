# typed: strong

module Increase
  module Models
    class CardDetailUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardDetailUpdateParams, Increase::Internal::AnyHash)
        end

      # The 4-digit PIN for the card, for use with ATMs.
      sig { returns(String) }
      attr_accessor :pin

      sig do
        params(
          pin: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The 4-digit PIN for the card, for use with ATMs.
        pin:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { pin: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
