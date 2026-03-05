# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiExclusions#retrieve
    class IntrafiExclusionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute intrafi_exclusion_id
      #   The identifier of the IntraFi Exclusion to retrieve.
      #
      #   @return [String]
      required :intrafi_exclusion_id, String

      # @!method initialize(intrafi_exclusion_id:, request_options: {})
      #   @param intrafi_exclusion_id [String] The identifier of the IntraFi Exclusion to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
