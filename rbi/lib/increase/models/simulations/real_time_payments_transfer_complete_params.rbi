# typed: strong

module Increase
  module Models
    module Simulations
      class RealTimePaymentsTransferCompleteParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # If set, the simulation will reject the transfer.
        sig { returns(T.nilable(Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection)) }
        attr_reader :rejection

        sig do
          params(
            rejection: T.any(
              Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection,
              Increase::Internal::AnyHash
            )
          )
            .void
        end
        attr_writer :rejection

        sig do
          params(
            rejection: T.any(
              Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection,
              Increase::Internal::AnyHash
            ),
            request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(rejection: nil, request_options: {})
        end

        sig do
          override
            .returns(
              {
                rejection: Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection,
                request_options: Increase::RequestOptions
              }
            )
        end
        def to_hash
        end

        class Rejection < Increase::Internal::Type::BaseModel
          # The reason code that the simulated rejection will have.
          sig do
            returns(
              Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::OrSymbol
            )
          end
          attr_accessor :reject_reason_code

          # If set, the simulation will reject the transfer.
          sig do
            params(
              reject_reason_code: Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(reject_reason_code:)
          end

          sig do
            override
              .returns(
                {
                  reject_reason_code: Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::OrSymbol
                }
              )
          end
          def to_hash
          end

          # The reason code that the simulated rejection will have.
          module RejectReasonCode
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode)
              end
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
                )
              end

            # The destination account is closed. Corresponds to the Real-Time Payments reason code `AC04`.
            ACCOUNT_CLOSED =
              T.let(
                :account_closed,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination account is currently blocked from receiving transactions. Corresponds to the Real-Time Payments reason code `AC06`.
            ACCOUNT_BLOCKED =
              T.let(
                :account_blocked,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination account is ineligible to receive Real-Time Payments transfers. Corresponds to the Real-Time Payments reason code `AC14`.
            INVALID_CREDITOR_ACCOUNT_TYPE =
              T.let(
                :invalid_creditor_account_type,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination account does not exist. Corresponds to the Real-Time Payments reason code `AC03`.
            INVALID_CREDITOR_ACCOUNT_NUMBER =
              T.let(
                :invalid_creditor_account_number,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination routing number is invalid. Corresponds to the Real-Time Payments reason code `RC04`.
            INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER =
              T.let(
                :invalid_creditor_financial_institution_identifier,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination account holder is deceased. Corresponds to the Real-Time Payments reason code `MD07`.
            END_CUSTOMER_DECEASED =
              T.let(
                :end_customer_deceased,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The reason is provided as narrative information in the additional information field.
            NARRATIVE =
              T.let(
                :narrative,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # Real-Time Payments transfers are not allowed to the destination account. Corresponds to the Real-Time Payments reason code `AG01`.
            TRANSACTION_FORBIDDEN =
              T.let(
                :transaction_forbidden,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code `AG03`.
            TRANSACTION_TYPE_NOT_SUPPORTED =
              T.let(
                :transaction_type_not_supported,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The amount of the transfer is different than expected by the recipient. Corresponds to the Real-Time Payments reason code `AM09`.
            UNEXPECTED_AMOUNT =
              T.let(
                :unexpected_amount,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The amount is higher than the recipient is authorized to send or receive. Corresponds to the Real-Time Payments reason code `AM14`.
            AMOUNT_EXCEEDS_BANK_LIMITS =
              T.let(
                :amount_exceeds_bank_limits,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The creditor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE04`.
            INVALID_CREDITOR_ADDRESS =
              T.let(
                :invalid_creditor_address,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The specified creditor is unknown. Corresponds to the Real-Time Payments reason code `BE06`.
            UNKNOWN_END_CUSTOMER =
              T.let(
                :unknown_end_customer,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The debtor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE07`.
            INVALID_DEBTOR_ADDRESS =
              T.let(
                :invalid_debtor_address,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # There was a timeout processing the transfer. Corresponds to the Real-Time Payments reason code `DS24`.
            TIMEOUT =
              T.let(
                :timeout,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code `NOAT`.
            UNSUPPORTED_MESSAGE_FOR_RECIPIENT =
              T.let(
                :unsupported_message_for_recipient,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination financial institution is currently not connected to Real-Time Payments. Corresponds to the Real-Time Payments reason code `9912`.
            RECIPIENT_CONNECTION_NOT_AVAILABLE =
              T.let(
                :recipient_connection_not_available,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # Real-Time Payments is currently unavailable. Corresponds to the Real-Time Payments reason code `9948`.
            REAL_TIME_PAYMENTS_SUSPENDED =
              T.let(
                :real_time_payments_suspended,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination financial institution is currently signed off of Real-Time Payments. Corresponds to the Real-Time Payments reason code `9910`.
            INSTRUCTED_AGENT_SIGNED_OFF =
              T.let(
                :instructed_agent_signed_off,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The transfer was rejected due to an internal Increase issue. We have been notified.
            PROCESSING_ERROR =
              T.let(
                :processing_error,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # Some other error or issue has occurred.
            OTHER =
              T.let(
                :other,
                Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            sig do
              override
                .returns(
                  T::Array[
                  Increase::Models::Simulations::RealTimePaymentsTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
                  ]
                )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
