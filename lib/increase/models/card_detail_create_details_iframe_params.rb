# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDetails#create_details_iframe
    class CardDetailCreateDetailsIframeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute physical_card_id
      #   The identifier of the Physical Card to retrieve details for.
      #
      #   @return [String, nil]
      optional :physical_card_id, String

      # @!method initialize(physical_card_id: nil, request_options: {})
      #   @param physical_card_id [String] The identifier of the Physical Card to retrieve details for.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
