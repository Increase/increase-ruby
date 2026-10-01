# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimePaymentsRequestsForPayment#retrieve
    class RealTimePaymentsRequestsForPaymentRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute real_time_payments_request_for_payment_id
      #   The identifier of the Real-Time Payments Request for Payment.
      #
      #   @return [String]
      required :real_time_payments_request_for_payment_id, String

      # @!method initialize(real_time_payments_request_for_payment_id:, request_options: {})
      #   @param real_time_payments_request_for_payment_id [String]
      #     The identifier of the Real-Time Payments Request for Payment.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
