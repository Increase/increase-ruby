# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimePaymentsTransfers#retrieve
    class RealTimePaymentsTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute real_time_payments_transfer_id
      #   The identifier of the Real-Time Payments Transfer.
      #
      #   @return [String]
      required :real_time_payments_transfer_id, String

      # @!method initialize(real_time_payments_transfer_id:, request_options: {})
      #   @param real_time_payments_transfer_id [String] The identifier of the Real-Time Payments Transfer.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
