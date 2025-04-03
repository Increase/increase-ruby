# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireTransfers#create
    class WireTransferCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute beneficiary_name
      #   The beneficiary's name.
      #
      #   @return [String]
      required :beneficiary_name, String

      # @!attribute message_to_recipient
      #   The message that will show on the recipient's bank statement.
      #
      #   @return [String]
      required :message_to_recipient, String

      # @!attribute [r] account_number
      #   The account number for the destination account.
      #
      #   @return [String, nil]
      optional :account_number, String

      # @!parse
      #   # @return [String]
      #   attr_writer :account_number

      # @!attribute [r] beneficiary_address_line1
      #   The beneficiary's address line 1.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line1, String

      # @!parse
      #   # @return [String]
      #   attr_writer :beneficiary_address_line1

      # @!attribute [r] beneficiary_address_line2
      #   The beneficiary's address line 2.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line2, String

      # @!parse
      #   # @return [String]
      #   attr_writer :beneficiary_address_line2

      # @!attribute [r] beneficiary_address_line3
      #   The beneficiary's address line 3.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line3, String

      # @!parse
      #   # @return [String]
      #   attr_writer :beneficiary_address_line3

      # @!attribute [r] external_account_id
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #     provided, `account_number` and `routing_number` must be absent.
      #
      #   @return [String, nil]
      optional :external_account_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :external_account_id

      # @!attribute [r] originator_address_line1
      #   The originator's address line 1. This is only necessary if you're transferring
      #     from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line1, String

      # @!parse
      #   # @return [String]
      #   attr_writer :originator_address_line1

      # @!attribute [r] originator_address_line2
      #   The originator's address line 2. This is only necessary if you're transferring
      #     from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line2, String

      # @!parse
      #   # @return [String]
      #   attr_writer :originator_address_line2

      # @!attribute [r] originator_address_line3
      #   The originator's address line 3. This is only necessary if you're transferring
      #     from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line3, String

      # @!parse
      #   # @return [String]
      #   attr_writer :originator_address_line3

      # @!attribute [r] originator_name
      #   The originator's name. This is only necessary if you're transferring from a
      #     commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :originator_name

      # @!attribute [r] require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :require_approval

      # @!attribute [r] routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #     destination account.
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!parse
      #   # @return [String]
      #   attr_writer :routing_number

      # @!attribute [r] source_account_number_id
      #   The ID of an Account Number that will be passed to the wire's recipient
      #
      #   @return [String, nil]
      optional :source_account_number_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :source_account_number_id

      # @!parse
      #   # @param account_id [String]
      #   # @param amount [Integer]
      #   # @param beneficiary_name [String]
      #   # @param message_to_recipient [String]
      #   # @param account_number [String]
      #   # @param beneficiary_address_line1 [String]
      #   # @param beneficiary_address_line2 [String]
      #   # @param beneficiary_address_line3 [String]
      #   # @param external_account_id [String]
      #   # @param originator_address_line1 [String]
      #   # @param originator_address_line2 [String]
      #   # @param originator_address_line3 [String]
      #   # @param originator_name [String]
      #   # @param require_approval [Boolean]
      #   # @param routing_number [String]
      #   # @param source_account_number_id [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_id:,
      #     amount:,
      #     beneficiary_name:,
      #     message_to_recipient:,
      #     account_number: nil,
      #     beneficiary_address_line1: nil,
      #     beneficiary_address_line2: nil,
      #     beneficiary_address_line3: nil,
      #     external_account_id: nil,
      #     originator_address_line1: nil,
      #     originator_address_line2: nil,
      #     originator_address_line3: nil,
      #     originator_name: nil,
      #     require_approval: nil,
      #     routing_number: nil,
      #     source_account_number_id: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
