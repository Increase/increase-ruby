# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardValidations#retrieve
    class CardValidationRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_validation_id
      #   The identifier of the Card Validation.
      #
      #   @return [String]
      required :card_validation_id, String

      # @!method initialize(card_validation_id:, request_options: {})
      #   @param card_validation_id [String] The identifier of the Card Validation.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
