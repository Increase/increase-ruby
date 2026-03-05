# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Files#retrieve
    class FileRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute file_id
      #   The identifier of the File.
      #
      #   @return [String]
      required :file_id, String

      # @!method initialize(file_id:, request_options: {})
      #   @param file_id [String] The identifier of the File.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
