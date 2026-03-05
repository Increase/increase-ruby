# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CheckDeposits
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::CheckDepositAdjustmentParams} for more details.
        #
        # Simulates the creation of a
        # [Check Deposit Adjustment](#check-deposit-adjustments) on a
        # [Check Deposit](#check-deposits). This Check Deposit must first have a `status`
        # of `submitted`.
        #
        # @overload adjustment(check_deposit_id, amount: nil, reason: nil, request_options: {})
        #
        # @param check_deposit_id [String] The identifier of the Check Deposit you wish to adjust.
        #
        # @param amount [Integer] The adjustment amount in the minor unit of the Check Deposit's currency (e.g., c
        #
        # @param reason [Symbol, Increase::Models::Simulations::CheckDepositAdjustmentParams::Reason] The reason for the adjustment. Defaults to `non_conforming_item`, which is often
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CheckDeposit]
        #
        # @see Increase::Models::Simulations::CheckDepositAdjustmentParams
        def adjustment(check_deposit_id, params = {})
          parsed, options = Increase::Simulations::CheckDepositAdjustmentParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/check_deposits/%1$s/adjustment", check_deposit_id],
            body: parsed,
            model: Increase::CheckDeposit,
            options: options
          )
        end

        # Simulates the rejection of a [Check Deposit](#check-deposits) by Increase due to
        # factors like poor image quality. This Check Deposit must first have a `status`
        # of `pending`.
        #
        # @overload reject(check_deposit_id, request_options: {})
        #
        # @param check_deposit_id [String] The identifier of the Check Deposit you wish to reject.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CheckDeposit]
        #
        # @see Increase::Models::Simulations::CheckDepositRejectParams
        def reject(check_deposit_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/check_deposits/%1$s/reject", check_deposit_id],
            model: Increase::CheckDeposit,
            options: params[:request_options]
          )
        end

        # Simulates the return of a [Check Deposit](#check-deposits). This Check Deposit
        # must first have a `status` of `submitted`.
        #
        # @overload return_(check_deposit_id, request_options: {})
        #
        # @param check_deposit_id [String] The identifier of the Check Deposit you wish to return.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CheckDeposit]
        #
        # @see Increase::Models::Simulations::CheckDepositReturnParams
        def return_(check_deposit_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/check_deposits/%1$s/return", check_deposit_id],
            model: Increase::CheckDeposit,
            options: params[:request_options]
          )
        end

        # Simulates the submission of a [Check Deposit](#check-deposits) to the Federal
        # Reserve. This Check Deposit must first have a `status` of `pending`.
        #
        # @overload submit(check_deposit_id, scan: nil, request_options: {})
        #
        # @param check_deposit_id [String] The identifier of the Check Deposit you wish to submit.
        #
        # @param scan [Increase::Models::Simulations::CheckDepositSubmitParams::Scan] If set, the simulation will use these values for the check's scanned MICR data.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CheckDeposit]
        #
        # @see Increase::Models::Simulations::CheckDepositSubmitParams
        def submit(check_deposit_id, params = {})
          parsed, options = Increase::Simulations::CheckDepositSubmitParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/check_deposits/%1$s/submit", check_deposit_id],
            body: parsed,
            model: Increase::CheckDeposit,
            options: options
          )
        end

        # @api private
        #
        # @param client [Increase::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
