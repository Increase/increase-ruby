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
        # @overload create(account_number_id:, amount:, beneficiary_address_line1: nil, beneficiary_address_line2: nil, beneficiary_address_line3: nil, beneficiary_name: nil, beneficiary_reference: nil, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, originator_routing_number: nil, originator_to_beneficiary_information_line1: nil, originator_to_beneficiary_information_line2: nil, originator_to_beneficiary_information_line3: nil, originator_to_beneficiary_information_line4: nil, sender_reference: nil, request_options: {})
        #
        # @param account_number_id [String] The identifier of the Account Number the inbound Wire Transfer is for.
        #
        # @param amount [Integer] The transfer amount in cents. Must be positive.
        #
        # @param beneficiary_address_line1 [String] The sending bank will set beneficiary_address_line1 in production. You can simul
        #
        # @param beneficiary_address_line2 [String] The sending bank will set beneficiary_address_line2 in production. You can simul
        #
        # @param beneficiary_address_line3 [String] The sending bank will set beneficiary_address_line3 in production. You can simul
        #
        # @param beneficiary_name [String] The sending bank will set beneficiary_name in production. You can simulate any v
        #
        # @param beneficiary_reference [String] The sending bank will set beneficiary_reference in production. You can simulate
        #
        # @param originator_address_line1 [String] The sending bank will set originator_address_line1 in production. You can simula
        #
        # @param originator_address_line2 [String] The sending bank will set originator_address_line2 in production. You can simula
        #
        # @param originator_address_line3 [String] The sending bank will set originator_address_line3 in production. You can simula
        #
        # @param originator_name [String] The sending bank will set originator_name in production. You can simulate any va
        #
        # @param originator_routing_number [String] The sending bank will set originator_routing_number in production. You can simul
        #
        # @param originator_to_beneficiary_information_line1 [String] The sending bank will set originator_to_beneficiary_information_line1 in product
        #
        # @param originator_to_beneficiary_information_line2 [String] The sending bank will set originator_to_beneficiary_information_line2 in product
        #
        # @param originator_to_beneficiary_information_line3 [String] The sending bank will set originator_to_beneficiary_information_line3 in product
        #
        # @param originator_to_beneficiary_information_line4 [String] The sending bank will set originator_to_beneficiary_information_line4 in product
        #
        # @param sender_reference [String] The sending bank will set sender_reference in production. You can simulate any v
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::InboundWireTransfer]
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
