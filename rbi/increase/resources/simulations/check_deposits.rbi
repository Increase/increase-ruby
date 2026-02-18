# typed: strong

module Increase
  module Resources
    class Simulations
      class CheckDeposits
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
