# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::SupplementalDocuments#create
    class SupplementalDocumentCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_id
      #   The identifier of the Entity to associate with the supplemental document.
      #
      #   @return [String]
      required :entity_id, String

      # @!attribute file_id
      #   The identifier of the File containing the document.
      #
      #   @return [String]
      required :file_id, String

      # @!method initialize(entity_id:, file_id:, request_options: {})
      #   @param entity_id [String]
      #   @param file_id [String]
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
