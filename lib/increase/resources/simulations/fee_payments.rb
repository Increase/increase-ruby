# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class FeePayments
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::FeePaymentCreateParams} for more details.
        #
        # A fee payment is how Increase charges you for technology fees incurred each
        # month. In production, these payments will be charged to your program's billing
        # account.
        #
        # @overload create(account_id:, amount:, request_options: {})
        #
        # @param account_id [String] The identifier of the Account to use as the billing account for the fee payment.
        #
        # @param amount [Integer] The fee amount in cents. Must be positive.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Transaction]
        #
        # @see Increase::Models::Simulations::FeePaymentCreateParams
        def create(params)
          parsed, options = Increase::Simulations::FeePaymentCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/fee_payments",
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
