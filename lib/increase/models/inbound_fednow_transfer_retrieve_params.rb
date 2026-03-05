# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundFednowTransfers#retrieve
    class InboundFednowTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_fednow_transfer_id
      #   The identifier of the Inbound FedNow Transfer to get details for.
      #
      #   @return [String]
      required :inbound_fednow_transfer_id, String

      # @!method initialize(inbound_fednow_transfer_id:, request_options: {})
      #   @param inbound_fednow_transfer_id [String] The identifier of the Inbound FedNow Transfer to get details for.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
