# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::WireDrawdownRequests#refuse
      class WireDrawdownRequestRefuseParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute wire_drawdown_request_id
        #   The identifier of the Wire Drawdown Request you wish to refuse.
        #
        #   @return [String]
        required :wire_drawdown_request_id, String

        # @!attribute refusal_reason_additional_information
        #   Additional information about the refusal that the simulated refusal will have.
        #
        #   @return [String, nil]
        optional :refusal_reason_additional_information, String

        # @!attribute refusal_reason_code
        #   The reason code that the simulated refusal will have.
        #
        #   Defaults to `other`.
        #
        #   @return [Symbol, Increase::Models::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode, nil]
        optional :refusal_reason_code,
                 enum: -> { Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode }

        # @!method initialize(wire_drawdown_request_id:, refusal_reason_additional_information: nil, refusal_reason_code: nil, request_options: {})
        #   @param wire_drawdown_request_id [String] The identifier of the Wire Drawdown Request you wish to refuse.
        #
        #   @param refusal_reason_additional_information [String]
        #     Additional information about the refusal that the simulated refusal will have.
        #
        #   @param refusal_reason_code [Symbol, Increase::Models::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode]
        #     The reason code that the simulated refusal will have.
        #
        #     Defaults to `other`.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The reason code that the simulated refusal will have.
        #
        # Defaults to `other`.
        module RefusalReasonCode
          extend Increase::Internal::Type::Enum

          # The debtor's account number is invalid or missing. Corresponds to the Fedwire reason code `AC02`.
          INVALID_DEBTOR_ACCOUNT_NUMBER = :invalid_debtor_account_number

          # The debtor account does not allow drawdown requests. Corresponds to the Fedwire reason code `AG01`.
          TRANSACTION_FORBIDDEN = :transaction_forbidden

          # The debtor account cannot be debited for a generic reason. Corresponds to the Fedwire reason code `AG07`.
          UNSUCCESSFUL_DIRECT_DEBIT = :unsuccessful_direct_debit

          # The debtor's identification is inconsistent with the debtor account number. Corresponds to the Fedwire reason code `BE01`.
          INCONSISTENT_WITH_END_CUSTOMER = :inconsistent_with_end_customer

          # The reason is provided as narrative information in the additional information field. Corresponds to the Fedwire reason code `NARR`.
          NARRATIVE = :narrative

          # Some other error or issue has occurred.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
