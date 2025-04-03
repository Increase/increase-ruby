# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundWireDrawdownRequests#create
      class InboundWireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
        # @!parse
        #   extend Increase::Internal::Type::RequestParameters::Converter
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
        #     requested. Will always be "USD".
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
        #     send funds from.
        #
        #   @return [String]
        required :recipient_account_number_id, String

        # @!attribute [r] beneficiary_address_line1
        #   Line 1 of the drawdown request's beneficiary's address.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line1, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_address_line1

        # @!attribute [r] beneficiary_address_line2
        #   Line 2 of the drawdown request's beneficiary's address.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_address_line2

        # @!attribute [r] beneficiary_address_line3
        #   Line 3 of the drawdown request's beneficiary's address.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line3, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_address_line3

        # @!attribute [r] beneficiary_name
        #   The drawdown request's beneficiary's name.
        #
        #   @return [String, nil]
        optional :beneficiary_name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_name

        # @!attribute [r] originator_address_line1
        #   Line 1 of the drawdown request's originator's address.
        #
        #   @return [String, nil]
        optional :originator_address_line1, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_address_line1

        # @!attribute [r] originator_address_line2
        #   Line 2 of the drawdown request's originator's address.
        #
        #   @return [String, nil]
        optional :originator_address_line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_address_line2

        # @!attribute [r] originator_address_line3
        #   Line 3 of the drawdown request's originator's address.
        #
        #   @return [String, nil]
        optional :originator_address_line3, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_address_line3

        # @!attribute [r] originator_name
        #   The drawdown request's originator's name.
        #
        #   @return [String, nil]
        optional :originator_name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_name

        # @!attribute [r] originator_to_beneficiary_information_line1
        #   Line 1 of the information conveyed from the originator of the message to the
        #     beneficiary.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line1, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_to_beneficiary_information_line1

        # @!attribute [r] originator_to_beneficiary_information_line2
        #   Line 2 of the information conveyed from the originator of the message to the
        #     beneficiary.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_to_beneficiary_information_line2

        # @!attribute [r] originator_to_beneficiary_information_line3
        #   Line 3 of the information conveyed from the originator of the message to the
        #     beneficiary.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line3, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_to_beneficiary_information_line3

        # @!attribute [r] originator_to_beneficiary_information_line4
        #   Line 4 of the information conveyed from the originator of the message to the
        #     beneficiary.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line4, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_to_beneficiary_information_line4

        # @!parse
        #   # @param amount [Integer]
        #   # @param beneficiary_account_number [String]
        #   # @param beneficiary_routing_number [String]
        #   # @param currency [String]
        #   # @param message_to_recipient [String]
        #   # @param originator_account_number [String]
        #   # @param originator_routing_number [String]
        #   # @param recipient_account_number_id [String]
        #   # @param beneficiary_address_line1 [String]
        #   # @param beneficiary_address_line2 [String]
        #   # @param beneficiary_address_line3 [String]
        #   # @param beneficiary_name [String]
        #   # @param originator_address_line1 [String]
        #   # @param originator_address_line2 [String]
        #   # @param originator_address_line3 [String]
        #   # @param originator_name [String]
        #   # @param originator_to_beneficiary_information_line1 [String]
        #   # @param originator_to_beneficiary_information_line2 [String]
        #   # @param originator_to_beneficiary_information_line3 [String]
        #   # @param originator_to_beneficiary_information_line4 [String]
        #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(
        #     amount:,
        #     beneficiary_account_number:,
        #     beneficiary_routing_number:,
        #     currency:,
        #     message_to_recipient:,
        #     originator_account_number:,
        #     originator_routing_number:,
        #     recipient_account_number_id:,
        #     beneficiary_address_line1: nil,
        #     beneficiary_address_line2: nil,
        #     beneficiary_address_line3: nil,
        #     beneficiary_name: nil,
        #     originator_address_line1: nil,
        #     originator_address_line2: nil,
        #     originator_address_line3: nil,
        #     originator_name: nil,
        #     originator_to_beneficiary_information_line1: nil,
        #     originator_to_beneficiary_information_line2: nil,
        #     originator_to_beneficiary_information_line3: nil,
        #     originator_to_beneficiary_information_line4: nil,
        #     request_options: {},
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
