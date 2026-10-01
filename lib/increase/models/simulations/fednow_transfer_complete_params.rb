# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::FednowTransfers#complete
      class FednowTransferCompleteParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute fednow_transfer_id
        #   The identifier of the FedNow Transfer you wish to complete.
        #
        #   @return [String]
        required :fednow_transfer_id, String

        # @!attribute rejection
        #   If set, the simulation will reject the transfer.
        #
        #   @return [Increase::Models::Simulations::FednowTransferCompleteParams::Rejection, nil]
        optional :rejection, -> { Increase::Simulations::FednowTransferCompleteParams::Rejection }

        # @!method initialize(fednow_transfer_id:, rejection: nil, request_options: {})
        #   @param fednow_transfer_id [String] The identifier of the FedNow Transfer you wish to complete.
        #
        #   @param rejection [Increase::Models::Simulations::FednowTransferCompleteParams::Rejection]
        #     If set, the simulation will reject the transfer.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        class Rejection < Increase::Internal::Type::BaseModel
          # @!attribute reject_reason_code
          #   The reason code that the simulated rejection will have.
          #
          #   @return [Symbol, Increase::Models::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode]
          required :reject_reason_code,
                   enum: -> { Increase::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode }

          # @!method initialize(reject_reason_code:)
          #   If set, the simulation will reject the transfer.
          #
          #   @param reject_reason_code [Symbol, Increase::Models::Simulations::FednowTransferCompleteParams::Rejection::RejectReasonCode]
          #     The reason code that the simulated rejection will have.

          # The reason code that the simulated rejection will have.
          #
          # @see Increase::Models::Simulations::FednowTransferCompleteParams::Rejection#reject_reason_code
          module RejectReasonCode
            extend Increase::Internal::Type::Enum

            # The destination account is closed. Corresponds to the FedNow reason code `AC04`.
            ACCOUNT_CLOSED = :account_closed

            # The destination account is currently blocked from receiving transactions. Corresponds to the FedNow reason code `AC06`.
            ACCOUNT_BLOCKED = :account_blocked

            # The destination account is ineligible to receive FedNow transfers. Corresponds to the FedNow reason code `AC14`.
            INVALID_CREDITOR_ACCOUNT_TYPE = :invalid_creditor_account_type

            # The destination account does not exist. Corresponds to the FedNow reason code `AC03`.
            INVALID_CREDITOR_ACCOUNT_NUMBER = :invalid_creditor_account_number

            # The destination routing number is invalid. Corresponds to the FedNow reason code `RC04`.
            INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER = :invalid_creditor_financial_institution_identifier

            # The destination account holder is deceased. Corresponds to the FedNow reason code `MD07`.
            END_CUSTOMER_DECEASED = :end_customer_deceased

            # The reason is provided as narrative information in the additional information field. Corresponds to the FedNow reason code `NARR`.
            NARRATIVE = :narrative

            # FedNow transfers are not allowed to the destination account. Corresponds to the FedNow reason code `AG01`.
            TRANSACTION_FORBIDDEN = :transaction_forbidden

            # FedNow transfers are not enabled for the destination account. Corresponds to the FedNow reason code `AG03`.
            TRANSACTION_TYPE_NOT_SUPPORTED = :transaction_type_not_supported

            # The amount is higher than the recipient is authorized to send or receive. Corresponds to the FedNow reason code `E990`.
            AMOUNT_EXCEEDS_BANK_LIMITS = :amount_exceeds_bank_limits

            # The creditor's address is required, but missing or invalid. Corresponds to the FedNow reason code `BE04`.
            INVALID_CREDITOR_ADDRESS = :invalid_creditor_address

            # The debtor's address is required, but missing or invalid. Corresponds to the FedNow reason code `BE07`.
            INVALID_DEBTOR_ADDRESS = :invalid_debtor_address

            # There was a timeout processing the transfer. Corresponds to the FedNow reason code `E997`.
            TIMEOUT = :timeout

            # The transfer was rejected due to an internal Increase issue. We have been notified.
            PROCESSING_ERROR = :processing_error

            # Some other error or issue has occurred.
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
