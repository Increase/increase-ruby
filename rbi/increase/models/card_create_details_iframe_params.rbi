# typed: strong

module Increase
  module Models
    class CardCreateDetailsIframeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardCreateDetailsIframeParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Physical Card to create an iframe for. This will inform
      # the appearance of the card rendered in the iframe.
      sig { returns(T.nilable(String)) }
      attr_reader :physical_card_id

      sig { params(physical_card_id: String).void }
      attr_writer :physical_card_id

      sig do
        params(
          physical_card_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Physical Card to create an iframe for. This will inform
        # the appearance of the card rendered in the iframe.
        physical_card_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            physical_card_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
