# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#retrieve
    class EntityRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_id
      #   The identifier of the Entity to retrieve.
      #
      #   @return [String]
      required :entity_id, String

      # @!method initialize(entity_id:, request_options: {})
      #   @param entity_id [String] The identifier of the Entity to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
