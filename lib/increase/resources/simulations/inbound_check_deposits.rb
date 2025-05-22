# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundCheckDeposits
        # Simulates an Inbound Check Deposit against your account. This imitates someone
        # depositing a check at their bank that was issued from your account. It may or
        # may not be associated with a Check Transfer. Increase will evaluate the Check
        # Deposit as we would in production and either create a Transaction or a Declined
        # Transaction as a result. You can inspect the resulting Inbound Check Deposit
        # object to see the result.
        #
        # @overload create(account_number_id:, amount:, check_number:, request_options: {})
        #
        # @param account_number_id [String] The identifier of the Account Number the Inbound Check Deposit will be against.
        #
        # @param amount [Integer] The check amount in cents.
        #
        # @param check_number [String] The check number on the check to be deposited.
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
