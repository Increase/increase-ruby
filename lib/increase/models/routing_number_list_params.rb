# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RoutingNumbers#list
    class RoutingNumberListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute routing_number
      #   Filter financial institutions by routing number.
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(routing_number:, cursor: nil, limit: nil, request_options: {})
      #   @param routing_number [String]
      #   @param cursor [String]
      #   @param limit [Integer]
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
