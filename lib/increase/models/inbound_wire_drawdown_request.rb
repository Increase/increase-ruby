# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireDrawdownRequests#retrieve
    class InboundWireDrawdownRequest < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Wire drawdown request identifier.
      #
      #   @return [String]
      required :id, String

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

      # @!attribute beneficiary_address_line1
      #   Line 1 of the drawdown request's beneficiary's address.
      #
      #   @return [String, nil]
      required :beneficiary_address_line1, String, nil?: true

      # @!attribute beneficiary_address_line2
      #   Line 2 of the drawdown request's beneficiary's address.
      #
      #   @return [String, nil]
      required :beneficiary_address_line2, String, nil?: true

      # @!attribute beneficiary_address_line3
      #   Line 3 of the drawdown request's beneficiary's address.
      #
      #   @return [String, nil]
      required :beneficiary_address_line3, String, nil?: true

      # @!attribute beneficiary_name
      #   The drawdown request's beneficiary's name.
      #
      #   @return [String, nil]
      required :beneficiary_name, String, nil?: true

      # @!attribute beneficiary_routing_number
      #   The drawdown request's beneficiary's routing number.
      #
      #   @return [String]
      required :beneficiary_routing_number, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the inbound wire drawdown requested was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #   requested. Will always be "USD".
      #
      #   @return [String]
      required :currency, String

      # @!attribute message_to_recipient
      #   A message from the drawdown request's originator.
      #
      #   @return [String, nil]
      required :message_to_recipient, String, nil?: true

      # @!attribute originator_account_number
      #   The drawdown request's originator's account number.
      #
      #   @return [String, nil]
      required :originator_account_number, String, nil?: true

      # @!attribute originator_address_line1
      #   Line 1 of the drawdown request's originator's address.
      #
      #   @return [String, nil]
      required :originator_address_line1, String, nil?: true

      # @!attribute originator_address_line2
      #   Line 2 of the drawdown request's originator's address.
      #
      #   @return [String, nil]
      required :originator_address_line2, String, nil?: true

      # @!attribute originator_address_line3
      #   Line 3 of the drawdown request's originator's address.
      #
      #   @return [String, nil]
      required :originator_address_line3, String, nil?: true

      # @!attribute originator_name
      #   The drawdown request's originator's name.
      #
      #   @return [String, nil]
      required :originator_name, String, nil?: true

      # @!attribute originator_routing_number
      #   The drawdown request's originator's routing number.
      #
      #   @return [String]
      required :originator_routing_number, String

      # @!attribute originator_to_beneficiary_information_line1
      #   Line 1 of the information conveyed from the originator of the message to the
      #   beneficiary.
      #
      #   @return [String, nil]
      required :originator_to_beneficiary_information_line1, String, nil?: true

      # @!attribute originator_to_beneficiary_information_line2
      #   Line 2 of the information conveyed from the originator of the message to the
      #   beneficiary.
      #
      #   @return [String, nil]
      required :originator_to_beneficiary_information_line2, String, nil?: true

      # @!attribute originator_to_beneficiary_information_line3
      #   Line 3 of the information conveyed from the originator of the message to the
      #   beneficiary.
      #
      #   @return [String, nil]
      required :originator_to_beneficiary_information_line3, String, nil?: true

      # @!attribute originator_to_beneficiary_information_line4
      #   Line 4 of the information conveyed from the originator of the message to the
      #   beneficiary.
      #
      #   @return [String, nil]
      required :originator_to_beneficiary_information_line4, String, nil?: true

      # @!attribute recipient_account_number_id
      #   The Account Number from which the recipient of this request is being requested
      #   to send funds.
      #
      #   @return [String]
      required :recipient_account_number_id, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_wire_drawdown_request`.
      #
      #   @return [Symbol, Increase::Models::InboundWireDrawdownRequest::Type]
      required :type, enum: -> { Increase::InboundWireDrawdownRequest::Type }

      # @!method initialize(id:, amount:, beneficiary_account_number:, beneficiary_address_line1:, beneficiary_address_line2:, beneficiary_address_line3:, beneficiary_name:, beneficiary_routing_number:, created_at:, currency:, message_to_recipient:, originator_account_number:, originator_address_line1:, originator_address_line2:, originator_address_line3:, originator_name:, originator_routing_number:, originator_to_beneficiary_information_line1:, originator_to_beneficiary_information_line2:, originator_to_beneficiary_information_line3:, originator_to_beneficiary_information_line4:, recipient_account_number_id:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundWireDrawdownRequest} for more details.
      #
      #   Inbound wire drawdown requests are requests from someone else to send them a
      #   wire. This feature is in beta; reach out to
      #   [support@increase.com](mailto:support@increase.com) to learn more.
      #
      #   @param id [String] The Wire drawdown request identifier.
      #
      #   @param amount [Integer] The amount being requested in cents.
      #
      #   @param beneficiary_account_number [String] The drawdown request's beneficiary's account number.
      #
      #   @param beneficiary_address_line1 [String, nil] Line 1 of the drawdown request's beneficiary's address.
      #
      #   @param beneficiary_address_line2 [String, nil] Line 2 of the drawdown request's beneficiary's address.
      #
      #   @param beneficiary_address_line3 [String, nil] Line 3 of the drawdown request's beneficiary's address.
      #
      #   @param beneficiary_name [String, nil] The drawdown request's beneficiary's name.
      #
      #   @param beneficiary_routing_number [String] The drawdown request's beneficiary's routing number.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #
      #   @param message_to_recipient [String, nil] A message from the drawdown request's originator.
      #
      #   @param originator_account_number [String, nil] The drawdown request's originator's account number.
      #
      #   @param originator_address_line1 [String, nil] Line 1 of the drawdown request's originator's address.
      #
      #   @param originator_address_line2 [String, nil] Line 2 of the drawdown request's originator's address.
      #
      #   @param originator_address_line3 [String, nil] Line 3 of the drawdown request's originator's address.
      #
      #   @param originator_name [String, nil] The drawdown request's originator's name.
      #
      #   @param originator_routing_number [String] The drawdown request's originator's routing number.
      #
      #   @param originator_to_beneficiary_information_line1 [String, nil] Line 1 of the information conveyed from the originator of the message to the ben
      #
      #   @param originator_to_beneficiary_information_line2 [String, nil] Line 2 of the information conveyed from the originator of the message to the ben
      #
      #   @param originator_to_beneficiary_information_line3 [String, nil] Line 3 of the information conveyed from the originator of the message to the ben
      #
      #   @param originator_to_beneficiary_information_line4 [String, nil] Line 4 of the information conveyed from the originator of the message to the ben
      #
      #   @param recipient_account_number_id [String] The Account Number from which the recipient of this request is being requested t
      #
      #   @param type [Symbol, Increase::Models::InboundWireDrawdownRequest::Type] A constant representing the object's type. For this resource it will always be `

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_drawdown_request`.
      #
      # @see Increase::Models::InboundWireDrawdownRequest#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_WIRE_DRAWDOWN_REQUEST = :inbound_wire_drawdown_request

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
