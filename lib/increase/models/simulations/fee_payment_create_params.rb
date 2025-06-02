# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::FeePayments#create
      class FeePaymentCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute account_id
        #   The identifier of the Account to use as the billing account for the fee payment.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute amount
        #   The fee amount in cents. Must be positive.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!method initialize(account_id:, amount:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::FeePaymentCreateParams} for more details.
        #
        #   @param account_id [String] The identifier of the Account to use as the billing account for the fee payment.
        #
        #   @param amount [Integer] The fee amount in cents. Must be positive.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
