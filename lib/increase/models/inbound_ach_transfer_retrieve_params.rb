# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundACHTransfers#retrieve
    class InboundACHTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_ach_transfer_id
      #   The identifier of the Inbound ACH Transfer to get details for.
      #
      #   @return [String]
      required :inbound_ach_transfer_id, String

      # @!method initialize(inbound_ach_transfer_id:, request_options: {})
      #   @param inbound_ach_transfer_id [String] The identifier of the Inbound ACH Transfer to get details for.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
