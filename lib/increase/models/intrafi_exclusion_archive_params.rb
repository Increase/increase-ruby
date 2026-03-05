# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiExclusions#archive
    class IntrafiExclusionArchiveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute intrafi_exclusion_id
      #   The identifier of the IntraFi Exclusion request to archive. It may take 5
      #   business days for an exclusion removal to be processed. Removing an exclusion
      #   does not guarantee that funds will be swept to the previously-excluded bank.
      #
      #   @return [String]
      required :intrafi_exclusion_id, String

      # @!method initialize(intrafi_exclusion_id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::IntrafiExclusionArchiveParams} for more details.
      #
      #   @param intrafi_exclusion_id [String] The identifier of the IntraFi Exclusion request to archive. It may take 5 busine
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
