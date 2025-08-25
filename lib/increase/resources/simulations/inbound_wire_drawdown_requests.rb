# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundWireDrawdownRequests
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InboundWireDrawdownRequestCreateParams} for more
        # details.
        #
        # Simulates receiving an
        # [Inbound Wire Drawdown Request](#inbound-wire-drawdown-requests).
        #
        # @overload create(amount:, creditor_account_number:, creditor_routing_number:, currency:, recipient_account_number_id:, creditor_address_line1: nil, creditor_address_line2: nil, creditor_address_line3: nil, creditor_name: nil, debtor_account_number: nil, debtor_address_line1: nil, debtor_address_line2: nil, debtor_address_line3: nil, debtor_name: nil, debtor_routing_number: nil, end_to_end_identification: nil, instruction_identification: nil, unique_end_to_end_transaction_reference: nil, unstructured_remittance_information: nil, request_options: {})
        #
        # @param amount [Integer] The amount being requested in cents.
        #
        # @param creditor_account_number [String] The creditor's account number.
        #
        # @param creditor_routing_number [String] The creditor's routing number.
        #
        # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        #
        # @param recipient_account_number_id [String] The Account Number to which the recipient of this request is being requested to
        #
        # @param creditor_address_line1 [String] A free-form address field set by the sender representing the first line of the c
        #
        # @param creditor_address_line2 [String] A free-form address field set by the sender representing the second line of the
        #
        # @param creditor_address_line3 [String] A free-form address field set by the sender representing the third line of the c
        #
        # @param creditor_name [String] A free-form name field set by the sender representing the creditor's name.
        #
        # @param debtor_account_number [String] The debtor's account number.
        #
        # @param debtor_address_line1 [String] A free-form address field set by the sender representing the first line of the d
        #
        # @param debtor_address_line2 [String] A free-form address field set by the sender representing the second line of the
        #
        # @param debtor_address_line3 [String] A free-form address field set by the sender.
        #
        # @param debtor_name [String] A free-form name field set by the sender representing the debtor's name.
        #
        # @param debtor_routing_number [String] The debtor's routing number.
        #
        # @param end_to_end_identification [String] A free-form reference string set by the sender, to help identify the transfer.
        #
        # @param instruction_identification [String] The sending bank's identifier for the wire transfer.
        #
        # @param unique_end_to_end_transaction_reference [String] The Unique End-to-end Transaction Reference ([UETR](https://www.swift.com/paymen
        #
        # @param unstructured_remittance_information [String] A free-form message set by the sender.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::InboundWireDrawdownRequest]
        #
        # @see Increase::Models::Simulations::InboundWireDrawdownRequestCreateParams
        def create(params)
          parsed, options = Increase::Simulations::InboundWireDrawdownRequestCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/inbound_wire_drawdown_requests",
            body: parsed,
            model: Increase::InboundWireDrawdownRequest,
            options: options
          )
        end

        # @api private
        #
        # @param client [Increase::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
