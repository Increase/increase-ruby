# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckTransfers#cancel
    class CheckTransferCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute check_transfer_id
      #   The identifier of the pending Check Transfer to cancel.
      #
      #   @return [String]
      required :check_transfer_id, String

      # @!method initialize(check_transfer_id:, request_options: {})
      #   @param check_transfer_id [String] The identifier of the pending Check Transfer to cancel.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
