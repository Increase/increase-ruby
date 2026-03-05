# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::SwiftTransfers#retrieve
    class SwiftTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute swift_transfer_id
      #   The identifier of the Swift Transfer.
      #
      #   @return [String]
      required :swift_transfer_id, String

      # @!method initialize(swift_transfer_id:, request_options: {})
      #   @param swift_transfer_id [String] The identifier of the Swift Transfer.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
