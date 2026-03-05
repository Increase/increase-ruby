# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireDrawdownRequests#retrieve
    class InboundWireDrawdownRequestRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_wire_drawdown_request_id
      #   The identifier of the Inbound Wire Drawdown Request to retrieve.
      #
      #   @return [String]
      required :inbound_wire_drawdown_request_id, String

      # @!method initialize(inbound_wire_drawdown_request_id:, request_options: {})
      #   @param inbound_wire_drawdown_request_id [String] The identifier of the Inbound Wire Drawdown Request to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
