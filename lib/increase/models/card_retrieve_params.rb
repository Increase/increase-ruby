# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#retrieve
    class CardRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_id
      #   The identifier of the Card.
      #
      #   @return [String]
      required :card_id, String

      # @!method initialize(card_id:, request_options: {})
      #   @param card_id [String] The identifier of the Card.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
