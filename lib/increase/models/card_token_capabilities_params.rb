# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardTokens#capabilities
    class CardTokenCapabilitiesParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_token_id
      #   The identifier of the Card Token.
      #
      #   @return [String]
      required :card_token_id, String

      # @!method initialize(card_token_id:, request_options: {})
      #   @param card_token_id [String] The identifier of the Card Token.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
