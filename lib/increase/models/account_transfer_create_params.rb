# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountTransfers#create
    class AccountTransferCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in the minor unit of the account currency. For dollars, for
      #     example, this is cents.
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

      # @!attribute [r] require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :require_approval

      # @!parse
      #   # @param account_id [String]
      #   # @param amount [Integer]
      #   # @param description [String]
      #   # @param destination_account_id [String]
      #   # @param require_approval [Boolean]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_id:,
      #     amount:,
      #     description:,
      #     destination_account_id:,
      #     require_approval: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
