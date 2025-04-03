# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#archive_beneficial_owner
    class EntityArchiveBeneficialOwnerParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute beneficial_owner_id
      #   The identifying details of anyone controlling or owning 25% or more of the
      #     corporation.
      #
      #   @return [String]
      required :beneficial_owner_id, String

      # @!parse
      #   # @param beneficial_owner_id [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(beneficial_owner_id:, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
