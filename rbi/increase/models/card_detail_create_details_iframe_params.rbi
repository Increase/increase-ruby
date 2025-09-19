# typed: strong

module Increase
  module Models
    class CardDetailCreateDetailsIframeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardDetailCreateDetailsIframeParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Physical Card to retrieve details for.
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
        # The identifier of the Physical Card to retrieve details for.
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
