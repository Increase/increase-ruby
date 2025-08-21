# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundWireTransfers
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InboundWireTransferCreateParams} for more
        # details.
        #
        # Simulates an [Inbound Wire Transfer](#inbound-wire-transfers) to your account.
        #
        # @overload create(account_number_id:, amount:, creditor_address_line1: nil, creditor_address_line2: nil, creditor_address_line3: nil, creditor_name: nil, debtor_address_line1: nil, debtor_address_line2: nil, debtor_address_line3: nil, debtor_name: nil, end_to_end_identification: nil, instructing_agent_routing_number: nil, instruction_identification: nil, unique_end_to_end_transaction_reference: nil, unstructured_remittance_information: nil, wire_drawdown_request_id: nil, request_options: {})
        #
        # @param account_number_id [String] The identifier of the Account Number the inbound Wire Transfer is for.
        #
        # @param amount [Integer] The transfer amount in cents. Must be positive.
        #
        # @param creditor_address_line1 [String] The sending bank will set creditor_address_line1 in production. You can simulate
        #
        # @param creditor_address_line2 [String] The sending bank will set creditor_address_line2 in production. You can simulate
        #
        # @param creditor_address_line3 [String] The sending bank will set creditor_address_line3 in production. You can simulate
        #
        # @param creditor_name [String] The sending bank will set creditor_name in production. You can simulate any valu
        #
        # @param debtor_address_line1 [String] The sending bank will set debtor_address_line1 in production. You can simulate a
        #
        # @param debtor_address_line2 [String] The sending bank will set debtor_address_line2 in production. You can simulate a
        #
        # @param debtor_address_line3 [String] The sending bank will set debtor_address_line3 in production. You can simulate a
        #
        # @param debtor_name [String] The sending bank will set debtor_name in production. You can simulate any value
        #
        # @param end_to_end_identification [String] The sending bank will set end_to_end_identification in production. You can simul
        #
        # @param instructing_agent_routing_number [String] The sending bank will set instructing_agent_routing_number in production. You ca
        #
        # @param instruction_identification [String] The sending bank will set instruction_identification in production. You can simu
        #
        # @param unique_end_to_end_transaction_reference [String] The sending bank will set unique_end_to_end_transaction_reference in production.
        #
        # @param unstructured_remittance_information [String] The sending bank will set unstructured_remittance_information in production. You
        #
        # @param wire_drawdown_request_id [String] The identifier of a Wire Drawdown Request the inbound Wire Transfer is fulfillin
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::InboundWireTransfer]
        #
        # @see Increase::Models::Simulations::InboundWireTransferCreateParams
        def create(params)
          parsed, options = Increase::Simulations::InboundWireTransferCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/inbound_wire_transfers",
            body: parsed,
            model: Increase::InboundWireTransfer,
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
