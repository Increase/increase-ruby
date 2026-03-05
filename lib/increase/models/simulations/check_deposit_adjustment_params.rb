# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CheckDeposits#adjustment
      class CheckDepositAdjustmentParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute check_deposit_id
        #   The identifier of the Check Deposit you wish to adjust.
        #
        #   @return [String]
        required :check_deposit_id, String

        # @!attribute amount
        #   The adjustment amount in the minor unit of the Check Deposit's currency (e.g.,
        #   cents). A negative amount means that the funds are being clawed back by the
        #   other bank and is a debit to your account. Defaults to the negative of the Check
        #   Deposit amount.
        #
        #   @return [Integer, nil]
        optional :amount, Integer

        # @!attribute reason
        #   The reason for the adjustment. Defaults to `non_conforming_item`, which is often
        #   used for a low quality image that the recipient wasn't able to handle.
        #
        #   @return [Symbol, Increase::Models::Simulations::CheckDepositAdjustmentParams::Reason, nil]
        optional :reason, enum: -> { Increase::Simulations::CheckDepositAdjustmentParams::Reason }

        # @!method initialize(check_deposit_id:, amount: nil, reason: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CheckDepositAdjustmentParams} for more details.
        #
        #   @param check_deposit_id [String] The identifier of the Check Deposit you wish to adjust.
        #
        #   @param amount [Integer] The adjustment amount in the minor unit of the Check Deposit's currency (e.g., c
        #
        #   @param reason [Symbol, Increase::Models::Simulations::CheckDepositAdjustmentParams::Reason] The reason for the adjustment. Defaults to `non_conforming_item`, which is often
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The reason for the adjustment. Defaults to `non_conforming_item`, which is often
        # used for a low quality image that the recipient wasn't able to handle.
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
