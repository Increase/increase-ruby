# frozen_string_literal: true

module Increase
  module Models
    class AccountTransferCreateParams < Increase::BaseModel
      # @!attribute account_id
      #   The identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in the minor unit of the account currency. For dollars, for example, this is cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute description
      #   The description you choose to give the transfer.
      #
      #   @return [String]
      required :description, String

      # @!attribute destination_account_id
      #   The identifier for the account that will receive the transfer.
      #
      #   @return [String]
      required :destination_account_id, String

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean]
      optional :require_approval, Increase::BooleanModel

      # @!parse
      #   # @param account_id [String] The identifier for the account that will send the transfer.
      #   #
      #   # @param amount [Integer] The transfer amount in the minor unit of the account currency. For dollars, for
      #   #   example, this is cents.
      #   #
      #   # @param description [String] The description you choose to give the transfer.
      #   #
      #   # @param destination_account_id [String] The identifier for the account that will receive the transfer.
      #   #
      #   # @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #   #
      #   def initialize(account_id:, amount:, description:, destination_account_id:, require_approval: nil, **) = super

      # def initialize: (Hash | Increase::BaseModel) -> void
    end
  end
end
