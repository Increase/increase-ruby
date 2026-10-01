# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundRealTimePaymentsRequestsForPayment#retrieve
    class InboundRealTimePaymentsRequestsForPaymentRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_real_time_payments_request_for_payment_id
      #   The identifier of the Inbound Real-Time Payments Request for Payment to get
      #   details for.
      #
      #   @return [String]
      required :inbound_real_time_payments_request_for_payment_id, String

      # @!method initialize(inbound_real_time_payments_request_for_payment_id:, request_options: {})
      #   @param inbound_real_time_payments_request_for_payment_id [String]
      #     The identifier of the Inbound Real-Time Payments Request for Payment to get
      #     details for.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
