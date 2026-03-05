# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireDrawdownRequests#retrieve
    class WireDrawdownRequestRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute wire_drawdown_request_id
      #   The identifier of the Wire Drawdown Request to retrieve.
      #
      #   @return [String]
      required :wire_drawdown_request_id, String

      # @!method initialize(wire_drawdown_request_id:, request_options: {})
      #   @param wire_drawdown_request_id [String] The identifier of the Wire Drawdown Request to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
