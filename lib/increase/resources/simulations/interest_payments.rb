# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InterestPayments
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InterestPaymentCreateParams} for more details.
        #
        # Simulates an interest payment to your account. In production, this happens
        # automatically on the first of each month.
        #
        # @overload create(account_id:, amount:, accrued_on_account_id: nil, period_end: nil, period_start: nil, request_options: {})
        #
        # @param account_id [String] The identifier of the Account the Interest Payment should be paid to is for.
        #
        # @param amount [Integer] The interest amount in cents. Must be positive.
        #
        # @param accrued_on_account_id [String] The identifier of the Account the Interest accrued on. Defaults to `account_id`.
        #
        # @param period_end [Time] The end of the interest period. If not provided, defaults to the current time.
        #
        # @param period_start [Time] The start of the interest period. If not provided, defaults to the current time.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Transaction]
        #
        # @see Increase::Models::Simulations::InterestPaymentCreateParams
        def create(params)
          parsed, options = Increase::Simulations::InterestPaymentCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/interest_payments",
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
