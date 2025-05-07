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
        # @overload create(amount:, beneficiary_account_number:, beneficiary_routing_number:, currency:, message_to_recipient:, originator_account_number:, originator_routing_number:, recipient_account_number_id:, beneficiary_address_line1: nil, beneficiary_address_line2: nil, beneficiary_address_line3: nil, beneficiary_name: nil, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, originator_to_beneficiary_information_line1: nil, originator_to_beneficiary_information_line2: nil, originator_to_beneficiary_information_line3: nil, originator_to_beneficiary_information_line4: nil, request_options: {})
        #
        # @param amount [Integer] The amount being requested in cents.
        #
        # @param beneficiary_account_number [String] The drawdown request's beneficiary's account number.
        #
        # @param beneficiary_routing_number [String] The drawdown request's beneficiary's routing number.
        #
        # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        #
        # @param message_to_recipient [String] A message from the drawdown request's originator.
        #
        # @param originator_account_number [String] The drawdown request's originator's account number.
        #
        # @param originator_routing_number [String] The drawdown request's originator's routing number.
        #
        # @param recipient_account_number_id [String] The Account Number to which the recipient of this request is being requested to
        #
        # @param beneficiary_address_line1 [String] Line 1 of the drawdown request's beneficiary's address.
        #
        # @param beneficiary_address_line2 [String] Line 2 of the drawdown request's beneficiary's address.
        #
        # @param beneficiary_address_line3 [String] Line 3 of the drawdown request's beneficiary's address.
        #
        # @param beneficiary_name [String] The drawdown request's beneficiary's name.
        #
        # @param originator_address_line1 [String] Line 1 of the drawdown request's originator's address.
        #
        # @param originator_address_line2 [String] Line 2 of the drawdown request's originator's address.
        #
        # @param originator_address_line3 [String] Line 3 of the drawdown request's originator's address.
        #
        # @param originator_name [String] The drawdown request's originator's name.
        #
        # @param originator_to_beneficiary_information_line1 [String] Line 1 of the information conveyed from the originator of the message to the ben
        #
        # @param originator_to_beneficiary_information_line2 [String] Line 2 of the information conveyed from the originator of the message to the ben
        #
        # @param originator_to_beneficiary_information_line3 [String] Line 3 of the information conveyed from the originator of the message to the ben
        #
        # @param originator_to_beneficiary_information_line4 [String] Line 4 of the information conveyed from the originator of the message to the ben
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::InboundWireDrawdownRequest]
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
