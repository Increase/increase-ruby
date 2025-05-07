# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountTransfers#create
    class AccountTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in the minor unit of the account currency. For dollars, for
      #   example, this is cents.
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
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!method initialize(account_id:, amount:, description:, destination_account_id:, require_approval: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::AccountTransferCreateParams} for more details.
      #
      #   @param account_id [String] The identifier for the account that will send the transfer.
      #
      #   @param amount [Integer] The transfer amount in the minor unit of the account currency. For dollars, for
      #
      #   @param description [String] The description you choose to give the transfer.
      #
      #   @param destination_account_id [String] The identifier for the account that will receive the transfer.
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
