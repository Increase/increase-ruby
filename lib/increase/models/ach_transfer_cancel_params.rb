# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ACHTransfers#cancel
    class ACHTransferCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute ach_transfer_id
      #   The identifier of the pending ACH Transfer to cancel.
      #
      #   @return [String]
      required :ach_transfer_id, String

      # @!method initialize(ach_transfer_id:, request_options: {})
      #   @param ach_transfer_id [String] The identifier of the pending ACH Transfer to cancel.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
