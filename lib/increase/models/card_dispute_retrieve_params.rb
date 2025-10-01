# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#retrieve
    class CardDisputeRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
