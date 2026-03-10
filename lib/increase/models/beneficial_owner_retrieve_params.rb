# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BeneficialOwners#retrieve
    class BeneficialOwnerRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_beneficial_owner_id
      #   The identifier of the Beneficial Owner to retrieve.
      #
      #   @return [String]
      required :entity_beneficial_owner_id, String

      # @!method initialize(entity_beneficial_owner_id:, request_options: {})
      #   @param entity_beneficial_owner_id [String] The identifier of the Beneficial Owner to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
