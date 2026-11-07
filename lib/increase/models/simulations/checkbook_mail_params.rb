# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::Checkbooks#mail
      class CheckbookMailParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute checkbook_id
        #   The identifier of the Checkbook you wish to mail.
        #
        #   @return [String]
        required :checkbook_id, String

        # @!method initialize(checkbook_id:, request_options: {})
        #   @param checkbook_id [String] The identifier of the Checkbook you wish to mail.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
