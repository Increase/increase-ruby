# typed: strong

module Increase
  module Resources
    class Simulations
      class CheckDeposits
        # Simulates the creation of a
        # [Check Deposit Adjustment](#check-deposit-adjustments) on a
        # [Check Deposit](#check-deposits). This Check Deposit must first have a `status`
        # of `submitted`.
        sig do
          params(
            check_deposit_id: String,
            amount: Integer,
            reason:
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CheckDeposit)
        end
        def adjustment(
          # The identifier of the Check Deposit you wish to adjust.
          check_deposit_id,
          # The adjustment amount in the minor unit of the Check Deposit's currency (e.g.,
          # cents). A negative amount means that the funds are being clawed back by the
          # other bank and is a debit to your account. Defaults to the negative of the Check
          # Deposit amount.
          amount: nil,
          # The reason for the adjustment. Defaults to `non_conforming_item`, which is often
          # used for a low quality image that the recipient wasn't able to handle.
          reason: nil,
          request_options: {}
        )
        end

        # Simulates the rejection of a [Check Deposit](#check-deposits) by Increase due to
        # factors like poor image quality. This Check Deposit must first have a `status`
        # of `pending`.
        sig do
          params(
            check_deposit_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CheckDeposit)
        end
        def reject(
          # The identifier of the Check Deposit you wish to reject.
          check_deposit_id,
          request_options: {}
        )
        end

        # Simulates the return of a [Check Deposit](#check-deposits). This Check Deposit
        # must first have a `status` of `submitted`.
        sig do
          params(
            check_deposit_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CheckDeposit)
        end
        def return_(
          # The identifier of the Check Deposit you wish to return.
          check_deposit_id,
          request_options: {}
        )
        end

        # Simulates the submission of a [Check Deposit](#check-deposits) to the Federal
        # Reserve. This Check Deposit must first have a `status` of `pending`.
        sig do
          params(
            check_deposit_id: String,
            scan: Increase::Simulations::CheckDepositSubmitParams::Scan::OrHash,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CheckDeposit)
        end
        def submit(
          # The identifier of the Check Deposit you wish to submit.
          check_deposit_id,
          # If set, the simulation will use these values for the check's scanned MICR data.
          scan: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Increase::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
