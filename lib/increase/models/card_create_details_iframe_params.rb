# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#create_details_iframe
    class CardCreateDetailsIframeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute physical_card_id
      #   The identifier of the Physical Card to create an iframe for. This will inform
      #   the appearance of the card rendered in the iframe.
      #
      #   @return [String, nil]
      optional :physical_card_id, String

      # @!method initialize(physical_card_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardCreateDetailsIframeParams} for more details.
      #
      #   @param physical_card_id [String] The identifier of the Physical Card to create an iframe for. This will inform th
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
