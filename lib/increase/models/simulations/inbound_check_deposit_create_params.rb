# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundCheckDeposits#create
      class InboundCheckDepositCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute account_number_id
        #   The identifier of the Account Number the Inbound Check Deposit will be against.
        #
        #   @return [String]
        required :account_number_id, String

        # @!attribute amount
        #   The check amount in cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute check_number
        #   The check number on the check to be deposited.
        #
        #   @return [String]
        required :check_number, String

        # @!attribute payee_name_analysis
        #   Simulate the outcome of
        #   [payee name checking](https://increase.com/documentation/positive-pay#payee-name-mismatches).
        #   Defaults to `not_evaluated`.
        #
        #   @return [Symbol, Increase::Models::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis, nil]
        optional :payee_name_analysis,
                 enum: -> { Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis }

        # @!method initialize(account_number_id:, amount:, check_number:, payee_name_analysis: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::InboundCheckDepositCreateParams} for more
        #   details.
        #
        #   @param account_number_id [String] The identifier of the Account Number the Inbound Check Deposit will be against.
        #
        #   @param amount [Integer] The check amount in cents.
        #
        #   @param check_number [String] The check number on the check to be deposited.
        #
        #   @param payee_name_analysis [Symbol, Increase::Models::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis] Simulate the outcome of [payee name checking](https://increase.com/documentation
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # Simulate the outcome of
        # [payee name checking](https://increase.com/documentation/positive-pay#payee-name-mismatches).
        # Defaults to `not_evaluated`.
        module PayeeNameAnalysis
          extend Increase::Internal::Type::Enum

          # The details on the check match the recipient name of the check transfer.
          NAME_MATCHES = :name_matches

          # The details on the check do not match the recipient name of the check transfer.
          DOES_NOT_MATCH = :does_not_match

          # The payee name analysis was not evaluated.
          NOT_EVALUATED = :not_evaluated

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
