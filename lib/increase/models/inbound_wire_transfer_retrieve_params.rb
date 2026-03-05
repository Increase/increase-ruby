# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireTransfers#retrieve
    class InboundWireTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_wire_transfer_id
      #   The identifier of the Inbound Wire Transfer to get details for.
      #
      #   @return [String]
      required :inbound_wire_transfer_id, String

      # @!method initialize(inbound_wire_transfer_id:, request_options: {})
      #   @param inbound_wire_transfer_id [String] The identifier of the Inbound Wire Transfer to get details for.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
