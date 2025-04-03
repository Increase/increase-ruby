# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#update_industry_code
    class EntityUpdateIndustryCodeParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute industry_code
      #   The North American Industry Classification System (NAICS) code for the
      #     corporation's primary line of business. This is a number, like `5132` for
      #     `Software Publishers`. A full list of classification codes is available
      #     [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
      #
      #   @return [String]
      required :industry_code, String

      # @!parse
      #   # @param industry_code [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(industry_code:, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
