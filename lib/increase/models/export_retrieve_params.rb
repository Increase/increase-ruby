# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Exports#retrieve
    class ExportRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute export_id
      #   The identifier of the Export to retrieve.
      #
      #   @return [String]
      required :export_id, String

      # @!method initialize(export_id:, request_options: {})
      #   @param export_id [String] The identifier of the Export to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
