# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCards#retrieve
    class PhysicalCardRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute physical_card_id
      #   The identifier of the Physical Card.
      #
      #   @return [String]
      required :physical_card_id, String

      # @!method initialize(physical_card_id:, request_options: {})
      #   @param physical_card_id [String] The identifier of the Physical Card.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
