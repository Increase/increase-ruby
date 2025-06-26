# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireTransfers#create
    class WireTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
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

      # @!attribute account_number
      #   The account number for the destination account.
      #
      #   @return [String, nil]
      optional :account_number, String

      # @!attribute beneficiary_address_line1
      #   The beneficiary's address line 1.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line1, String

      # @!attribute beneficiary_address_line2
      #   The beneficiary's address line 2.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line2, String

      # @!attribute beneficiary_address_line3
      #   The beneficiary's address line 3.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line3, String

      # @!attribute external_account_id
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #   provided, `account_number` and `routing_number` must be absent.
      #
      #   @return [String, nil]
      optional :external_account_id, String

      # @!attribute inbound_wire_drawdown_request_id
      #   The ID of an Inbound Wire Drawdown Request in response to which this transfer is
      #   being sent.
      #
      #   @return [String, nil]
      optional :inbound_wire_drawdown_request_id, String

      # @!attribute originator_address_line1
      #   The originator's address line 1. This is only necessary if you're transferring
      #   from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line1, String

      # @!attribute originator_address_line2
      #   The originator's address line 2. This is only necessary if you're transferring
      #   from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line2, String

      # @!attribute originator_address_line3
      #   The originator's address line 3. This is only necessary if you're transferring
      #   from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line3, String

      # @!attribute originator_name
      #   The originator's name. This is only necessary if you're transferring from a
      #   commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_name, String

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!attribute routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #   destination account.
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!attribute source_account_number_id
      #   The ID of an Account Number that will be passed to the wire's recipient
      #
      #   @return [String, nil]
      optional :source_account_number_id, String

      # @!method initialize(account_id:, amount:, beneficiary_name:, message_to_recipient:, account_number: nil, beneficiary_address_line1: nil, beneficiary_address_line2: nil, beneficiary_address_line3: nil, external_account_id: nil, inbound_wire_drawdown_request_id: nil, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, require_approval: nil, routing_number: nil, source_account_number_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::WireTransferCreateParams} for more details.
      #
      #   @param account_id [String] The identifier for the account that will send the transfer.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param beneficiary_name [String] The beneficiary's name.
      #
      #   @param message_to_recipient [String] The message that will show on the recipient's bank statement.
      #
      #   @param account_number [String] The account number for the destination account.
      #
      #   @param beneficiary_address_line1 [String] The beneficiary's address line 1.
      #
      #   @param beneficiary_address_line2 [String] The beneficiary's address line 2.
      #
      #   @param beneficiary_address_line3 [String] The beneficiary's address line 3.
      #
      #   @param external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      #   @param inbound_wire_drawdown_request_id [String] The ID of an Inbound Wire Drawdown Request in response to which this transfer is
      #
      #   @param originator_address_line1 [String] The originator's address line 1. This is only necessary if you're transferring f
      #
      #   @param originator_address_line2 [String] The originator's address line 2. This is only necessary if you're transferring f
      #
      #   @param originator_address_line3 [String] The originator's address line 3. This is only necessary if you're transferring f
      #
      #   @param originator_name [String] The originator's name. This is only necessary if you're transferring from a comm
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the des
      #
      #   @param source_account_number_id [String] The ID of an Account Number that will be passed to the wire's recipient
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
