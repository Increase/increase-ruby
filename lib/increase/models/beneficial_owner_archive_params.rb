# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BeneficialOwners#archive
    class BeneficialOwnerArchiveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_beneficial_owner_id
      #   The identifier of the Beneficial Owner to archive.
      #
      #   @return [String]
      required :entity_beneficial_owner_id, String

      # @!method initialize(entity_beneficial_owner_id:, request_options: {})
      #   @param entity_beneficial_owner_id [String] The identifier of the Beneficial Owner to archive.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
