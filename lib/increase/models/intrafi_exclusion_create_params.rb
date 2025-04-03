# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiExclusions#create
    class IntrafiExclusionCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute bank_name
      #   The name of the financial institution to be excluded.
      #
      #   @return [String]
      required :bank_name, String

      # @!attribute entity_id
      #   The identifier of the Entity whose deposits will be excluded.
      #
      #   @return [String]
      required :entity_id, String

      # @!parse
      #   # @param bank_name [String]
      #   # @param entity_id [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(bank_name:, entity_id:, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
