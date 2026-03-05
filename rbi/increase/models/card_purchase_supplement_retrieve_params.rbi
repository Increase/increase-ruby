# typed: strong

module Increase
  module Models
    class CardPurchaseSupplementRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardPurchaseSupplementRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Card Purchase Supplement.
      sig { returns(String) }
      attr_accessor :card_purchase_supplement_id

      sig do
        params(
          card_purchase_supplement_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Card Purchase Supplement.
        card_purchase_supplement_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            card_purchase_supplement_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
