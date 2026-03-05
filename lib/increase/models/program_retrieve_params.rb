# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Programs#retrieve
    class ProgramRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute program_id
      #   The identifier of the Program to retrieve.
      #
      #   @return [String]
      required :program_id, String

      # @!method initialize(program_id:, request_options: {})
      #   @param program_id [String] The identifier of the Program to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
