# typed: strong

module Increase
  module Resources
    class Simulations
      class InterestPayments
        # Simulates an interest payment to your account. In production, this happens
        #   automatically on the first of each month.
        sig do
          params(
            account_id: String,
            amount: Integer,
            accrued_on_account_id: String,
            period_end: Time,
            period_start: Time,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::Transaction)
        end
        def create(
          # The identifier of the Account the Interest Payment should be paid to is for.
          account_id:,
          # The interest amount in cents. Must be positive.
          amount:,
          # The identifier of the Account the Interest accrued on. Defaults to `account_id`.
          accrued_on_account_id: nil,
          # The end of the interest period. If not provided, defaults to the current time.
          period_end: nil,
          # The start of the interest period. If not provided, defaults to the current time.
          period_start: nil,
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
