# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::FednowTransfers#cancel
    class FednowTransferCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute fednow_transfer_id
      #   The identifier of the pending FedNow Transfer to cancel.
      #
      #   @return [String]
      required :fednow_transfer_id, String

      # @!method initialize(fednow_transfer_id:, request_options: {})
      #   @param fednow_transfer_id [String] The identifier of the pending FedNow Transfer to cancel.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
