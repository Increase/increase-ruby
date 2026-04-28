# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class AccountRevenuePayments
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::AccountRevenuePaymentCreateParams} for more
        # details.
        #
        # Simulates an account revenue payment to your account. In production, this
        # happens automatically on the first of each month.
        #
        # @overload create(account_id:, amount:, accrued_on_account_id: nil, period_end: nil, period_start: nil, request_options: {})
        #
        # @param account_id [String] The identifier of the Account the Account Revenue Payment should be paid to.
        #
        # @param amount [Integer] The account revenue amount in cents. Must be positive.
        #
        # @param accrued_on_account_id [String] The identifier of the Account the account revenue accrued on. Defaults to `accou
        #
        # @param period_end [Time] The end of the account revenue period. If not provided, defaults to the current
        #
        # @param period_start [Time] The start of the account revenue period. If not provided, defaults to the curren
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Transaction]
        #
        # @see Increase::Models::Simulations::AccountRevenuePaymentCreateParams
        def create(params)
          parsed, options = Increase::Simulations::AccountRevenuePaymentCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/account_revenue_payments",
            body: parsed,
            model: Increase::Transaction,
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
