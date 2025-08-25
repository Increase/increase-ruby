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

        # @!attribute creditor_account_number
        #   The creditor's account number.
        #
        #   @return [String]
        required :creditor_account_number, String

        # @!attribute creditor_routing_number
        #   The creditor's routing number.
        #
        #   @return [String]
        required :creditor_routing_number, String

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        #   requested. Will always be "USD".
        #
        #   @return [String]
        required :currency, String

        # @!attribute recipient_account_number_id
        #   The Account Number to which the recipient of this request is being requested to
        #   send funds from.
        #
        #   @return [String]
        required :recipient_account_number_id, String

        # @!attribute creditor_address_line1
        #   A free-form address field set by the sender representing the first line of the
        #   creditor's address.
        #
        #   @return [String, nil]
        optional :creditor_address_line1, String

        # @!attribute creditor_address_line2
        #   A free-form address field set by the sender representing the second line of the
        #   creditor's address.
        #
        #   @return [String, nil]
        optional :creditor_address_line2, String

        # @!attribute creditor_address_line3
        #   A free-form address field set by the sender representing the third line of the
        #   creditor's address.
        #
        #   @return [String, nil]
        optional :creditor_address_line3, String

        # @!attribute creditor_name
        #   A free-form name field set by the sender representing the creditor's name.
        #
        #   @return [String, nil]
        optional :creditor_name, String

        # @!attribute debtor_account_number
        #   The debtor's account number.
        #
        #   @return [String, nil]
        optional :debtor_account_number, String

        # @!attribute debtor_address_line1
        #   A free-form address field set by the sender representing the first line of the
        #   debtor's address.
        #
        #   @return [String, nil]
        optional :debtor_address_line1, String

        # @!attribute debtor_address_line2
        #   A free-form address field set by the sender representing the second line of the
        #   debtor's address.
        #
        #   @return [String, nil]
        optional :debtor_address_line2, String

        # @!attribute debtor_address_line3
        #   A free-form address field set by the sender.
        #
        #   @return [String, nil]
        optional :debtor_address_line3, String

        # @!attribute debtor_name
        #   A free-form name field set by the sender representing the debtor's name.
        #
        #   @return [String, nil]
        optional :debtor_name, String

        # @!attribute debtor_routing_number
        #   The debtor's routing number.
        #
        #   @return [String, nil]
        optional :debtor_routing_number, String

        # @!attribute end_to_end_identification
        #   A free-form reference string set by the sender, to help identify the transfer.
        #
        #   @return [String, nil]
        optional :end_to_end_identification, String

        # @!attribute instruction_identification
        #   The sending bank's identifier for the wire transfer.
        #
        #   @return [String, nil]
        optional :instruction_identification, String

        # @!attribute unique_end_to_end_transaction_reference
        #   The Unique End-to-end Transaction Reference
        #   ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
        #   of the transfer.
        #
        #   @return [String, nil]
        optional :unique_end_to_end_transaction_reference, String

        # @!attribute unstructured_remittance_information
        #   A free-form message set by the sender.
        #
        #   @return [String, nil]
        optional :unstructured_remittance_information, String

        # @!method initialize(amount:, creditor_account_number:, creditor_routing_number:, currency:, recipient_account_number_id:, creditor_address_line1: nil, creditor_address_line2: nil, creditor_address_line3: nil, creditor_name: nil, debtor_account_number: nil, debtor_address_line1: nil, debtor_address_line2: nil, debtor_address_line3: nil, debtor_name: nil, debtor_routing_number: nil, end_to_end_identification: nil, instruction_identification: nil, unique_end_to_end_transaction_reference: nil, unstructured_remittance_information: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::InboundWireDrawdownRequestCreateParams} for more
        #   details.
        #
        #   @param amount [Integer] The amount being requested in cents.
        #
        #   @param creditor_account_number [String] The creditor's account number.
        #
        #   @param creditor_routing_number [String] The creditor's routing number.
        #
        #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        #
        #   @param recipient_account_number_id [String] The Account Number to which the recipient of this request is being requested to
        #
        #   @param creditor_address_line1 [String] A free-form address field set by the sender representing the first line of the c
        #
        #   @param creditor_address_line2 [String] A free-form address field set by the sender representing the second line of the
        #
        #   @param creditor_address_line3 [String] A free-form address field set by the sender representing the third line of the c
        #
        #   @param creditor_name [String] A free-form name field set by the sender representing the creditor's name.
        #
        #   @param debtor_account_number [String] The debtor's account number.
        #
        #   @param debtor_address_line1 [String] A free-form address field set by the sender representing the first line of the d
        #
        #   @param debtor_address_line2 [String] A free-form address field set by the sender representing the second line of the
        #
        #   @param debtor_address_line3 [String] A free-form address field set by the sender.
        #
        #   @param debtor_name [String] A free-form name field set by the sender representing the debtor's name.
        #
        #   @param debtor_routing_number [String] The debtor's routing number.
        #
        #   @param end_to_end_identification [String] A free-form reference string set by the sender, to help identify the transfer.
        #
        #   @param instruction_identification [String] The sending bank's identifier for the wire transfer.
        #
        #   @param unique_end_to_end_transaction_reference [String] The Unique End-to-end Transaction Reference ([UETR](https://www.swift.com/paymen
        #
        #   @param unstructured_remittance_information [String] A free-form message set by the sender.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
