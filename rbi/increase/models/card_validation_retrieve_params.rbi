# typed: strong

module Increase
  module Models
    class CardValidationRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardValidationRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Card Validation.
      sig { returns(String) }
      attr_accessor :card_validation_id

      sig do
        params(
          card_validation_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Card Validation.
        card_validation_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            card_validation_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
