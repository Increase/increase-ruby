# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InterestPayments#create
      class InterestPaymentCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute account_id
        #   The identifier of the Account the Interest Payment should be paid to is for.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute amount
        #   The interest amount in cents. Must be positive.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute accrued_on_account_id
        #   The identifier of the Account the Interest accrued on. Defaults to `account_id`.
        #
        #   @return [String, nil]
        optional :accrued_on_account_id, String

        # @!attribute period_end
        #   The end of the interest period. If not provided, defaults to the current time.
        #
        #   @return [Time, nil]
        optional :period_end, Time

        # @!attribute period_start
        #   The start of the interest period. If not provided, defaults to the current time.
        #
        #   @return [Time, nil]
        optional :period_start, Time

        # @!method initialize(account_id:, amount:, accrued_on_account_id: nil, period_end: nil, period_start: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::InterestPaymentCreateParams} for more details.
        #
        #   @param account_id [String] The identifier of the Account the Interest Payment should be paid to is for.
        #
        #   @param amount [Integer] The interest amount in cents. Must be positive.
        #
        #   @param accrued_on_account_id [String] The identifier of the Account the Interest accrued on. Defaults to `account_id`.
        #
        #   @param period_end [Time] The end of the interest period. If not provided, defaults to the current time.
        #
        #   @param period_start [Time] The start of the interest period. If not provided, defaults to the current time.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
