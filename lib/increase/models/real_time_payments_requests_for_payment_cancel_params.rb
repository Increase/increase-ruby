# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimePaymentsRequestsForPayment#cancel
    class RealTimePaymentsRequestsForPaymentCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute real_time_payments_request_for_payment_id
      #   The identifier of the Real-Time Payments Request for Payment to cancel.
      #
      #   @return [String]
      required :real_time_payments_request_for_payment_id, String

      # @!attribute additional_information
      #   Additional information about the cancellation to pass on to the recipient bank.
      #
      #   @return [String, nil]
      optional :additional_information, String

      # @!attribute reason
      #   The reason the request for payment is being canceled. Defaults to
      #   `requested_by_customer`.
      #
      #   @return [Symbol, Increase::Models::RealTimePaymentsRequestsForPaymentCancelParams::Reason, nil]
      optional :reason, enum: -> { Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason }

      # @!method initialize(real_time_payments_request_for_payment_id:, additional_information: nil, reason: nil, request_options: {})
      #   @param real_time_payments_request_for_payment_id [String]
      #     The identifier of the Real-Time Payments Request for Payment to cancel.
      #
      #   @param additional_information [String]
      #     Additional information about the cancellation to pass on to the recipient bank.
      #
      #   @param reason [Symbol, Increase::Models::RealTimePaymentsRequestsForPaymentCancelParams::Reason]
      #     The reason the request for payment is being canceled. Defaults to
      #     `requested_by_customer`.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The reason the request for payment is being canceled. Defaults to
      # `requested_by_customer`.
      module Reason
        extend Increase::Internal::Type::Enum

        # The creditor no longer wants to be paid. Corresponds to the Real-Time Payments reason code `CUST`.
        REQUESTED_BY_CUSTOMER = :requested_by_customer

        # The requested payment has already been made through another channel. Corresponds to the Real-Time Payments reason code `UPAY`.
        PAID_BY_OTHER_MEANS = :paid_by_other_means

        # The request for payment duplicated another request for payment. Corresponds to the Real-Time Payments reason code `DUPL`.
        DUPLICATE = :duplicate

        # The request for payment was sent for the wrong amount. Corresponds to the Real-Time Payments reason code `AM09`.
        WRONG_AMOUNT = :wrong_amount

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
