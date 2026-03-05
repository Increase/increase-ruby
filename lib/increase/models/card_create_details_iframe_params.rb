# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#create_details_iframe
    class CardCreateDetailsIframeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_id
      #   The identifier of the Card to create an iframe for.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute physical_card_id
      #   The identifier of the Physical Card to create an iframe for. This will inform
      #   the appearance of the card rendered in the iframe.
      #
      #   @return [String, nil]
      optional :physical_card_id, String

      # @!method initialize(card_id:, physical_card_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardCreateDetailsIframeParams} for more details.
      #
      #   @param card_id [String] The identifier of the Card to create an iframe for.
      #
      #   @param physical_card_id [String] The identifier of the Physical Card to create an iframe for. This will inform th
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
