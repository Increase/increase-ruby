# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundWireDrawdownRequests#create
      class InboundWireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute amount
        #   The amount being requested in cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute beneficiary_account_number
        #   The drawdown request's beneficiary's account number.
        #
        #   @return [String]
        required :beneficiary_account_number, String

        # @!attribute beneficiary_routing_number
        #   The drawdown request's beneficiary's routing number.
        #
        #   @return [String]
        required :beneficiary_routing_number, String

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        #   requested. Will always be "USD".
        #
        #   @return [String]
        required :currency, String

        # @!attribute message_to_recipient
        #   A message from the drawdown request's originator.
        #
        #   @return [String]
        required :message_to_recipient, String

        # @!attribute originator_account_number
        #   The drawdown request's originator's account number.
        #
        #   @return [String]
        required :originator_account_number, String

        # @!attribute originator_routing_number
        #   The drawdown request's originator's routing number.
        #
        #   @return [String]
        required :originator_routing_number, String

        # @!attribute recipient_account_number_id
        #   The Account Number to which the recipient of this request is being requested to
        #   send funds from.
        #
        #   @return [String]
        required :recipient_account_number_id, String

        # @!attribute beneficiary_address_line1
        #   Line 1 of the drawdown request's beneficiary's address.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line1, String

        # @!attribute beneficiary_address_line2
        #   Line 2 of the drawdown request's beneficiary's address.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line2, String

        # @!attribute beneficiary_address_line3
        #   Line 3 of the drawdown request's beneficiary's address.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line3, String

        # @!attribute beneficiary_name
        #   The drawdown request's beneficiary's name.
        #
        #   @return [String, nil]
        optional :beneficiary_name, String

        # @!attribute originator_address_line1
        #   Line 1 of the drawdown request's originator's address.
        #
        #   @return [String, nil]
        optional :originator_address_line1, String

        # @!attribute originator_address_line2
        #   Line 2 of the drawdown request's originator's address.
        #
        #   @return [String, nil]
        optional :originator_address_line2, String

        # @!attribute originator_address_line3
        #   Line 3 of the drawdown request's originator's address.
        #
        #   @return [String, nil]
        optional :originator_address_line3, String

        # @!attribute originator_name
        #   The drawdown request's originator's name.
        #
        #   @return [String, nil]
        optional :originator_name, String

        # @!attribute originator_to_beneficiary_information_line1
        #   Line 1 of the information conveyed from the originator of the message to the
        #   beneficiary.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line1, String

        # @!attribute originator_to_beneficiary_information_line2
        #   Line 2 of the information conveyed from the originator of the message to the
        #   beneficiary.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line2, String

        # @!attribute originator_to_beneficiary_information_line3
        #   Line 3 of the information conveyed from the originator of the message to the
        #   beneficiary.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line3, String

        # @!attribute originator_to_beneficiary_information_line4
        #   Line 4 of the information conveyed from the originator of the message to the
        #   beneficiary.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line4, String

        # @!method initialize(amount:, beneficiary_account_number:, beneficiary_routing_number:, currency:, message_to_recipient:, originator_account_number:, originator_routing_number:, recipient_account_number_id:, beneficiary_address_line1: nil, beneficiary_address_line2: nil, beneficiary_address_line3: nil, beneficiary_name: nil, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, originator_to_beneficiary_information_line1: nil, originator_to_beneficiary_information_line2: nil, originator_to_beneficiary_information_line3: nil, originator_to_beneficiary_information_line4: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::InboundWireDrawdownRequestCreateParams} for more
        #   details.
        #
        #   @param amount [Integer] The amount being requested in cents.
        #
        #   @param beneficiary_account_number [String] The drawdown request's beneficiary's account number.
        #
        #   @param beneficiary_routing_number [String] The drawdown request's beneficiary's routing number.
        #
        #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        #
        #   @param message_to_recipient [String] A message from the drawdown request's originator.
        #
        #   @param originator_account_number [String] The drawdown request's originator's account number.
        #
        #   @param originator_routing_number [String] The drawdown request's originator's routing number.
        #
        #   @param recipient_account_number_id [String] The Account Number to which the recipient of this request is being requested to
        #
        #   @param beneficiary_address_line1 [String] Line 1 of the drawdown request's beneficiary's address.
        #
        #   @param beneficiary_address_line2 [String] Line 2 of the drawdown request's beneficiary's address.
        #
        #   @param beneficiary_address_line3 [String] Line 3 of the drawdown request's beneficiary's address.
        #
        #   @param beneficiary_name [String] The drawdown request's beneficiary's name.
        #
        #   @param originator_address_line1 [String] Line 1 of the drawdown request's originator's address.
        #
        #   @param originator_address_line2 [String] Line 2 of the drawdown request's originator's address.
        #
        #   @param originator_address_line3 [String] Line 3 of the drawdown request's originator's address.
        #
        #   @param originator_name [String] The drawdown request's originator's name.
        #
        #   @param originator_to_beneficiary_information_line1 [String] Line 1 of the information conveyed from the originator of the message to the ben
        #
        #   @param originator_to_beneficiary_information_line2 [String] Line 2 of the information conveyed from the originator of the message to the ben
        #
        #   @param originator_to_beneficiary_information_line3 [String] Line 3 of the information conveyed from the originator of the message to the ben
        #
        #   @param originator_to_beneficiary_information_line4 [String] Line 4 of the information conveyed from the originator of the message to the ben
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
