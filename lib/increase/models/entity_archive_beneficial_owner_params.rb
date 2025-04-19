# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#archive_beneficial_owner
    class EntityArchiveBeneficialOwnerParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute beneficial_owner_id
      #   The identifying details of anyone controlling or owning 25% or more of the
      #   corporation.
      #
      #   @return [String]
      required :beneficial_owner_id, String

      # @!method initialize(beneficial_owner_id:, request_options: {})
      #   @param beneficial_owner_id [String]
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
