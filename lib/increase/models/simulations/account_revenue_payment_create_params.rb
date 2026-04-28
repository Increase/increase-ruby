# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::AccountRevenuePayments#create
      class AccountRevenuePaymentCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute account_id
        #   The identifier of the Account the Account Revenue Payment should be paid to.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute amount
        #   The account revenue amount in cents. Must be positive.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute accrued_on_account_id
        #   The identifier of the Account the account revenue accrued on. Defaults to
        #   `account_id`.
        #
        #   @return [String, nil]
        optional :accrued_on_account_id, String

        # @!attribute period_end
        #   The end of the account revenue period. If not provided, defaults to the current
        #   time.
        #
        #   @return [Time, nil]
        optional :period_end, Time

        # @!attribute period_start
        #   The start of the account revenue period. If not provided, defaults to the
        #   current time.
        #
        #   @return [Time, nil]
        optional :period_start, Time

        # @!method initialize(account_id:, amount:, accrued_on_account_id: nil, period_end: nil, period_start: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::AccountRevenuePaymentCreateParams} for more
        #   details.
        #
        #   @param account_id [String] The identifier of the Account the Account Revenue Payment should be paid to.
        #
        #   @param amount [Integer] The account revenue amount in cents. Must be positive.
        #
        #   @param accrued_on_account_id [String] The identifier of the Account the account revenue accrued on. Defaults to `accou
        #
        #   @param period_end [Time] The end of the account revenue period. If not provided, defaults to the current
        #
        #   @param period_start [Time] The start of the account revenue period. If not provided, defaults to the curren
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
