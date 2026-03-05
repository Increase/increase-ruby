# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#archive_beneficial_owner
    class EntityArchiveBeneficialOwnerParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_id
      #   The identifier of the Entity associated with the Beneficial Owner that is being
      #   archived.
      #
      #   @return [String]
      required :entity_id, String

      # @!attribute beneficial_owner_id
      #   The identifying details of anyone controlling or owning 25% or more of the
      #   corporation.
      #
      #   @return [String]
      required :beneficial_owner_id, String

      # @!method initialize(entity_id:, beneficial_owner_id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityArchiveBeneficialOwnerParams} for more details.
      #
      #   @param entity_id [String] The identifier of the Entity associated with the Beneficial Owner that is being
      #
      #   @param beneficial_owner_id [String] The identifying details of anyone controlling or owning 25% or more of the corpo
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
