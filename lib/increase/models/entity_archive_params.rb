# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#archive
    class EntityArchiveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_id
      #   The identifier of the Entity to archive. Any accounts associated with an entity
      #   must be closed before the entity can be archived.
      #
      #   @return [String]
      required :entity_id, String

      # @!method initialize(entity_id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityArchiveParams} for more details.
      #
      #   @param entity_id [String] The identifier of the Entity to archive. Any accounts associated with an entity
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
