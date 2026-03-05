# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#update_pin
    class CardUpdatePinParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_id
      #   The identifier of the Card to update the PIN for.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute pin
      #   The 4-digit PIN for the card, for use with ATMs.
      #
      #   @return [String]
      required :pin, String

      # @!method initialize(card_id:, pin:, request_options: {})
      #   @param card_id [String] The identifier of the Card to update the PIN for.
      #
      #   @param pin [String] The 4-digit PIN for the card, for use with ATMs.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
