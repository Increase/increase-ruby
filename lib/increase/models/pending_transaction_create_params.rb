# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PendingTransactions#create
    class PendingTransactionCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Account to place the hold on.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The amount to hold in the minor unit of the account's currency. For dollars, for
      #   example, this is cents. This should be a negative amount - to hold $1.00 from
      #   the account, you would pass -100.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute description
      #   The description you choose to give the hold.
      #
      #   @return [String, nil]
      optional :description, String

      # @!method initialize(account_id:, amount:, description: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PendingTransactionCreateParams} for more details.
      #
      #   @param account_id [String] The Account to place the hold on.
      #
      #   @param amount [Integer] The amount to hold in the minor unit of the account's currency. For dollars, for
      #
      #   @param description [String] The description you choose to give the hold.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
