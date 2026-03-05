# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardPurchaseSupplements#retrieve
    class CardPurchaseSupplementRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_purchase_supplement_id
      #   The identifier of the Card Purchase Supplement.
      #
      #   @return [String]
      required :card_purchase_supplement_id, String

      # @!method initialize(card_purchase_supplement_id:, request_options: {})
      #   @param card_purchase_supplement_id [String] The identifier of the Card Purchase Supplement.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
