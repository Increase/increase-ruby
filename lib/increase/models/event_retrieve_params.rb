# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Events#retrieve
    class EventRetrieveParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!parse
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
