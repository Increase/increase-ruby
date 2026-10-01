# typed: strong

module Increase
  module Models
    class RealTimePaymentsRequestsForPaymentCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::RealTimePaymentsRequestsForPaymentCancelParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Real-Time Payments Request for Payment to cancel.
      sig { returns(String) }
      attr_accessor :real_time_payments_request_for_payment_id

      # Additional information about the cancellation to pass on to the recipient bank.
      sig { returns(T.nilable(String)) }
      attr_reader :additional_information

      sig { params(additional_information: String).void }
      attr_writer :additional_information

      # The reason the request for payment is being canceled. Defaults to
      # `requested_by_customer`.
      sig do
        returns(
          T.nilable(
            Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::OrSymbol
          )
        )
      end
      attr_reader :reason

      sig do
        params(
          reason:
            Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::OrSymbol
        ).void
      end
      attr_writer :reason

      sig do
        params(
          real_time_payments_request_for_payment_id: String,
          additional_information: String,
          reason:
            Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Real-Time Payments Request for Payment to cancel.
        real_time_payments_request_for_payment_id:,
        # Additional information about the cancellation to pass on to the recipient bank.
        additional_information: nil,
        # The reason the request for payment is being canceled. Defaults to
        # `requested_by_customer`.
        reason: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            real_time_payments_request_for_payment_id: String,
            additional_information: String,
            reason:
              Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The reason the request for payment is being canceled. Defaults to
      # `requested_by_customer`.
      module Reason
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The creditor no longer wants to be paid. Corresponds to the Real-Time Payments reason code `CUST`.
        REQUESTED_BY_CUSTOMER =
          T.let(
            :requested_by_customer,
            Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::TaggedSymbol
          )

        # The requested payment has already been made through another channel. Corresponds to the Real-Time Payments reason code `UPAY`.
        PAID_BY_OTHER_MEANS =
          T.let(
            :paid_by_other_means,
            Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::TaggedSymbol
          )

        # The request for payment duplicated another request for payment. Corresponds to the Real-Time Payments reason code `DUPL`.
        DUPLICATE =
          T.let(
            :duplicate,
            Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::TaggedSymbol
          )

        # The request for payment was sent for the wrong amount. Corresponds to the Real-Time Payments reason code `AM09`.
        WRONG_AMOUNT =
          T.let(
            :wrong_amount,
            Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::RealTimePaymentsRequestsForPaymentCancelParams::Reason::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
