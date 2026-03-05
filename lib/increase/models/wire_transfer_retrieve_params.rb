# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireTransfers#retrieve
    class WireTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute wire_transfer_id
      #   The identifier of the Wire Transfer.
      #
      #   @return [String]
      required :wire_transfer_id, String

      # @!method initialize(wire_transfer_id:, request_options: {})
      #   @param wire_transfer_id [String] The identifier of the Wire Transfer.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
