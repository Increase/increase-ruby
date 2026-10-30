# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundRealTimePaymentsTransfers#return_
    class InboundRealTimePaymentsTransferReturnParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_real_time_payments_transfer_id
      #   The identifier of the Inbound Real-Time Payments Transfer to return to its
      #   sender.
      #
      #   @return [String]
      required :inbound_real_time_payments_transfer_id, String

      # @!attribute amount
      #   The amount to return, in USD cents. Defaults to the full amount of the Inbound
      #   Real-Time Payments Transfer, and can't be higher than it.
      #
      #   @return [Integer, nil]
      optional :amount, Integer

      # @!method initialize(inbound_real_time_payments_transfer_id:, amount: nil, request_options: {})
      #   @param inbound_real_time_payments_transfer_id [String]
      #     The identifier of the Inbound Real-Time Payments Transfer to return to its
      #     sender.
      #
      #   @param amount [Integer]
      #     The amount to return, in USD cents. Defaults to the full amount of the Inbound
      #     Real-Time Payments Transfer, and can't be higher than it.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
