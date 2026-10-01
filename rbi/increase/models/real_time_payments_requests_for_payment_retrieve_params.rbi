# typed: strong

module Increase
  module Models
    class RealTimePaymentsRequestsForPaymentRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::RealTimePaymentsRequestsForPaymentRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Real-Time Payments Request for Payment.
      sig { returns(String) }
      attr_accessor :real_time_payments_request_for_payment_id

      sig do
        params(
          real_time_payments_request_for_payment_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Real-Time Payments Request for Payment.
        real_time_payments_request_for_payment_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            real_time_payments_request_for_payment_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
