# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDetails#update
    class CardDetailUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute pin
      #   The 4-digit PIN for the card, for use with ATMs.
      #
      #   @return [String]
      required :pin, String

      # @!method initialize(pin:, request_options: {})
      #   @param pin [String] The 4-digit PIN for the card, for use with ATMs.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
