# typed: strong

module Increase
  module Resources
    class Simulations
      class FeePayments
        # A fee payment is how Increase charges you for technology fees incurred each
        # month. In production, these payments will be charged to your program's billing
        # account.
        sig do
          params(
            account_id: String,
            amount: Integer,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::Transaction)
        end
        def create(
          # The identifier of the Account to use as the billing account for the fee payment.
          account_id:,
          # The fee amount in cents. Must be positive.
          amount:,
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
