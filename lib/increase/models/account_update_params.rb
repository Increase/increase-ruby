# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#update
    class AccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier of the Account to update.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute loan
      #   The loan details for the account.
      #
      #   @return [Increase::Models::AccountUpdateParams::Loan, nil]
      optional :loan, -> { Increase::AccountUpdateParams::Loan }

      # @!attribute name
      #   The new name of the Account.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(account_id:, loan: nil, name: nil, request_options: {})
      #   @param account_id [String] The identifier of the Account to update.
      #
      #   @param loan [Increase::Models::AccountUpdateParams::Loan] The loan details for the account.
      #
      #   @param name [String] The new name of the Account.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Loan < Increase::Internal::Type::BaseModel
        # @!attribute credit_limit
        #   The maximum amount of money that can be drawn from the Account.
        #
        #   @return [Integer]
        required :credit_limit, Integer

        # @!method initialize(credit_limit:)
        #   The loan details for the account.
        #
        #   @param credit_limit [Integer] The maximum amount of money that can be drawn from the Account.
      end
    end
  end
end
