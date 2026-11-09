# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckbookChecks#retrieve
    class CheckbookCheckRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute checkbook_check_id
      #   The identifier of the Checkbook Check.
      #
      #   @return [String]
      required :checkbook_check_id, String

      # @!method initialize(checkbook_check_id:, request_options: {})
      #   @param checkbook_check_id [String] The identifier of the Checkbook Check.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
