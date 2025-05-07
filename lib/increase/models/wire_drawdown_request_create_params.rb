# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireDrawdownRequests#create
    class WireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   The Account Number to which the recipient should send funds.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute amount
      #   The amount requested from the recipient, in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute message_to_recipient
      #   A message the recipient will see as part of the request.
      #
      #   @return [String]
      required :message_to_recipient, String

      # @!attribute recipient_account_number
      #   The drawdown request's recipient's account number.
      #
      #   @return [String]
      required :recipient_account_number, String

      # @!attribute recipient_name
      #   The drawdown request's recipient's name.
      #
      #   @return [String]
      required :recipient_name, String

      # @!attribute recipient_routing_number
      #   The drawdown request's recipient's routing number.
      #
      #   @return [String]
      required :recipient_routing_number, String

      # @!attribute originator_address_line1
      #   The drawdown request originator's address line 1. This is only necessary if
      #   you're requesting a payment to a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line1, String

      # @!attribute originator_address_line2
      #   The drawdown request originator's address line 2. This is only necessary if
      #   you're requesting a payment to a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line2, String

      # @!attribute originator_address_line3
      #   The drawdown request originator's address line 3. This is only necessary if
      #   you're requesting a payment to a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line3, String

      # @!attribute originator_name
      #   The drawdown request originator's name. This is only necessary if you're
      #   requesting a payment to a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_name, String

      # @!attribute recipient_address_line1
      #   Line 1 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      optional :recipient_address_line1, String

      # @!attribute recipient_address_line2
      #   Line 2 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      optional :recipient_address_line2, String

      # @!attribute recipient_address_line3
      #   Line 3 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      optional :recipient_address_line3, String

      # @!method initialize(account_number_id:, amount:, message_to_recipient:, recipient_account_number:, recipient_name:, recipient_routing_number:, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, recipient_address_line1: nil, recipient_address_line2: nil, recipient_address_line3: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::WireDrawdownRequestCreateParams} for more details.
      #
      #   @param account_number_id [String] The Account Number to which the recipient should send funds.
      #
      #   @param amount [Integer] The amount requested from the recipient, in USD cents.
      #
      #   @param message_to_recipient [String] A message the recipient will see as part of the request.
      #
      #   @param recipient_account_number [String] The drawdown request's recipient's account number.
      #
      #   @param recipient_name [String] The drawdown request's recipient's name.
      #
      #   @param recipient_routing_number [String] The drawdown request's recipient's routing number.
      #
      #   @param originator_address_line1 [String] The drawdown request originator's address line 1. This is only necessary if you'
      #
      #   @param originator_address_line2 [String] The drawdown request originator's address line 2. This is only necessary if you'
      #
      #   @param originator_address_line3 [String] The drawdown request originator's address line 3. This is only necessary if you'
      #
      #   @param originator_name [String] The drawdown request originator's name. This is only necessary if you're request
      #
      #   @param recipient_address_line1 [String] Line 1 of the drawdown request's recipient's address.
      #
      #   @param recipient_address_line2 [String] Line 2 of the drawdown request's recipient's address.
      #
      #   @param recipient_address_line3 [String] Line 3 of the drawdown request's recipient's address.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
