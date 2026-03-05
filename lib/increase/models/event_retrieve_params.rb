# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Events#retrieve
    class EventRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute event_id
      #   The identifier of the Event.
      #
      #   @return [String]
      required :event_id, String

      # @!method initialize(event_id:, request_options: {})
      #   @param event_id [String] The identifier of the Event.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
