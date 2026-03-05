# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundCheckDeposits#adjustment
      class InboundCheckDepositAdjustmentParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute inbound_check_deposit_id
        #   The identifier of the Inbound Check Deposit to adjust.
        #
        #   @return [String]
        required :inbound_check_deposit_id, String

        # @!attribute amount
        #   The adjustment amount in cents. Defaults to the amount of the Inbound Check
        #   Deposit.
        #
        #   @return [Integer, nil]
        optional :amount, Integer

        # @!attribute reason
        #   The reason for the adjustment. Defaults to `wrong_payee_credit`.
        #
        #   @return [Symbol, Increase::Models::Simulations::InboundCheckDepositAdjustmentParams::Reason, nil]
        optional :reason, enum: -> { Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason }

        # @!method initialize(inbound_check_deposit_id:, amount: nil, reason: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::InboundCheckDepositAdjustmentParams} for more
        #   details.
        #
        #   @param inbound_check_deposit_id [String] The identifier of the Inbound Check Deposit to adjust.
        #
        #   @param amount [Integer] The adjustment amount in cents. Defaults to the amount of the Inbound Check Depo
        #
        #   @param reason [Symbol, Increase::Models::Simulations::InboundCheckDepositAdjustmentParams::Reason] The reason for the adjustment. Defaults to `wrong_payee_credit`.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The reason for the adjustment. Defaults to `wrong_payee_credit`.
        module Reason
          extend Increase::Internal::Type::Enum

          # The return was initiated too late and the receiving institution has responded with a Late Return Claim.
          LATE_RETURN = :late_return

          # The check was deposited to the wrong payee and the depositing institution has reimbursed the funds with a Wrong Payee Credit.
          WRONG_PAYEE_CREDIT = :wrong_payee_credit

          # The check was deposited with a different amount than what was written on the check.
          ADJUSTED_AMOUNT = :adjusted_amount

          # The recipient was not able to process the check. This usually happens for e.g., low quality images.
          NON_CONFORMING_ITEM = :non_conforming_item

          # The check has already been deposited elsewhere and so this is a duplicate.
          PAID = :paid

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
