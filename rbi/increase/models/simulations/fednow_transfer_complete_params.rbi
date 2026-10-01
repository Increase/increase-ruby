# typed: strong

module Increase
  module Models
    module Simulations
      class FednowTransferCompleteParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::FednowTransferCompleteParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the FedNow Transfer you wish to complete.
        sig { returns(String) }
        attr_accessor :fednow_transfer_id

        # If set, the simulation will reject the transfer.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::FednowTransferCompleteParams::Rejection
            )
          )
        end
        attr_reader :rejection

        sig do
          params(
            rejection:
              Increase::Simulations::FednowTransferCompleteParams::Rejection::OrHash
          ).void
        end
        attr_writer :rejection

        sig do
          params(
            fednow_transfer_id: String,
            rejection:
              Increase::Simulations::FednowTransferCompleteParams::Rejection::OrHash,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the FedNow Transfer you wish to complete.
          fednow_transfer_id:,
          # If set, the simulation will reject the transfer.
          rejection: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              fednow_transfer_id: String,
              rejection:
                Increase::Simulations::FednowTransferCompleteParams::Rejection,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Rejection < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::FednowTransferCompleteParams::Rejection,
                Increase::Internal::AnyHash
              )
            end

          # The reason code that the simulated rejection will have.
          sig do
            returns(
              Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::OrSymbol
            )
          end
          attr_accessor :reject_reason_code

          # If set, the simulation will reject the transfer.
          sig do
            params(
              reject_reason_code:
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The reason code that the simulated rejection will have.
            reject_reason_code:
          )
          end

          sig do
            override.returns(
              {
                reject_reason_code:
                  Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::OrSymbol
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
                T.all(
                  Symbol,
                  Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The destination account is closed. Corresponds to the FedNow reason code `AC04`.
            ACCOUNT_CLOSED =
              T.let(
                :account_closed,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination account is currently blocked from receiving transactions. Corresponds to the FedNow reason code `AC06`.
            ACCOUNT_BLOCKED =
              T.let(
                :account_blocked,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination account is ineligible to receive FedNow transfers. Corresponds to the FedNow reason code `AC14`.
            INVALID_CREDITOR_ACCOUNT_TYPE =
              T.let(
                :invalid_creditor_account_type,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination account does not exist. Corresponds to the FedNow reason code `AC03`.
            INVALID_CREDITOR_ACCOUNT_NUMBER =
              T.let(
                :invalid_creditor_account_number,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination routing number is invalid. Corresponds to the FedNow reason code `RC04`.
            INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER =
              T.let(
                :invalid_creditor_financial_institution_identifier,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The destination account holder is deceased. Corresponds to the FedNow reason code `MD07`.
            END_CUSTOMER_DECEASED =
              T.let(
                :end_customer_deceased,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The reason is provided as narrative information in the additional information field. Corresponds to the FedNow reason code `NARR`.
            NARRATIVE =
              T.let(
                :narrative,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # FedNow transfers are not allowed to the destination account. Corresponds to the FedNow reason code `AG01`.
            TRANSACTION_FORBIDDEN =
              T.let(
                :transaction_forbidden,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # FedNow transfers are not enabled for the destination account. Corresponds to the FedNow reason code `AG03`.
            TRANSACTION_TYPE_NOT_SUPPORTED =
              T.let(
                :transaction_type_not_supported,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The amount is higher than the recipient is authorized to send or receive. Corresponds to the FedNow reason code `E990`.
            AMOUNT_EXCEEDS_BANK_LIMITS =
              T.let(
                :amount_exceeds_bank_limits,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The creditor's address is required, but missing or invalid. Corresponds to the FedNow reason code `BE04`.
            INVALID_CREDITOR_ADDRESS =
              T.let(
                :invalid_creditor_address,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The debtor's address is required, but missing or invalid. Corresponds to the FedNow reason code `BE07`.
            INVALID_DEBTOR_ADDRESS =
              T.let(
                :invalid_debtor_address,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # There was a timeout processing the transfer. Corresponds to the FedNow reason code `E997`.
            TIMEOUT =
              T.let(
                :timeout,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # The transfer was rejected due to an internal Increase issue. We have been notified.
            PROCESSING_ERROR =
              T.let(
                :processing_error,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            # Some other error or issue has occurred.
            OTHER =
              T.let(
                :other,
                Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode::TaggedSymbol
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
