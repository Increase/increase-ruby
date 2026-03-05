# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundCheckDeposits
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InboundCheckDepositCreateParams} for more
        # details.
        #
        # Simulates an Inbound Check Deposit against your account. This imitates someone
        # depositing a check at their bank that was issued from your account. It may or
        # may not be associated with a Check Transfer. Increase will evaluate the Inbound
        # Check Deposit as we would in production and either create a Transaction or a
        # Declined Transaction as a result. You can inspect the resulting Inbound Check
        # Deposit object to see the result.
        #
        # @overload create(account_number_id:, amount:, check_number:, payee_name_analysis: nil, request_options: {})
        #
        # @param account_number_id [String] The identifier of the Account Number the Inbound Check Deposit will be against.
        #
        # @param amount [Integer] The check amount in cents.
        #
        # @param check_number [String] The check number on the check to be deposited.
        #
        # @param payee_name_analysis [Symbol, Increase::Models::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis] Simulate the outcome of [payee name checking](https://increase.com/documentation
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::InboundCheckDeposit]
        #
        # @see Increase::Models::Simulations::InboundCheckDepositCreateParams
        def create(params)
          parsed, options = Increase::Simulations::InboundCheckDepositCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/inbound_check_deposits",
            body: parsed,
            model: Increase::InboundCheckDeposit,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InboundCheckDepositAdjustmentParams} for more
        # details.
        #
        # Simulates an adjustment on an Inbound Check Deposit. The Inbound Check Deposit
        # must have a `status` of `accepted`.
        #
        # @overload adjustment(inbound_check_deposit_id, amount: nil, reason: nil, request_options: {})
        #
        # @param inbound_check_deposit_id [String] The identifier of the Inbound Check Deposit to adjust.
        #
        # @param amount [Integer] The adjustment amount in cents. Defaults to the amount of the Inbound Check Depo
        #
        # @param reason [Symbol, Increase::Models::Simulations::InboundCheckDepositAdjustmentParams::Reason] The reason for the adjustment. Defaults to `wrong_payee_credit`.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::InboundCheckDeposit]
        #
        # @see Increase::Models::Simulations::InboundCheckDepositAdjustmentParams
        def adjustment(inbound_check_deposit_id, params = {})
          parsed, options = Increase::Simulations::InboundCheckDepositAdjustmentParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/inbound_check_deposits/%1$s/adjustment", inbound_check_deposit_id],
            body: parsed,
            model: Increase::InboundCheckDeposit,
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
