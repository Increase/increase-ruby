# frozen_string_literal: true

module Increase
  module Resources
    class WireDrawdownRequests
      # Some parameter documentations has been truncated, see
      # {Increase::Models::WireDrawdownRequestCreateParams} for more details.
      #
      # Create a Wire Drawdown Request
      #
      # @overload create(account_number_id:, amount:, message_to_recipient:, recipient_account_number:, recipient_name:, recipient_routing_number:, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, recipient_address_line1: nil, recipient_address_line2: nil, recipient_address_line3: nil, request_options: {})
      #
      # @param account_number_id [String] The Account Number to which the recipient should send funds.
      #
      # @param amount [Integer] The amount requested from the recipient, in USD cents.
      #
      # @param message_to_recipient [String] A message the recipient will see as part of the request.
      #
      # @param recipient_account_number [String] The drawdown request's recipient's account number.
      #
      # @param recipient_name [String] The drawdown request's recipient's name.
      #
      # @param recipient_routing_number [String] The drawdown request's recipient's routing number.
      #
      # @param originator_address_line1 [String] The drawdown request originator's address line 1. This is only necessary if you'
      #
      # @param originator_address_line2 [String] The drawdown request originator's address line 2. This is only necessary if you'
      #
      # @param originator_address_line3 [String] The drawdown request originator's address line 3. This is only necessary if you'
      #
      # @param originator_name [String] The drawdown request originator's name. This is only necessary if you're request
      #
      # @param recipient_address_line1 [String] Line 1 of the drawdown request's recipient's address.
      #
      # @param recipient_address_line2 [String] Line 2 of the drawdown request's recipient's address.
      #
      # @param recipient_address_line3 [String] Line 3 of the drawdown request's recipient's address.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::WireDrawdownRequest]
      #
      # @see Increase::Models::WireDrawdownRequestCreateParams
      def create(params)
        parsed, options = Increase::WireDrawdownRequestCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "wire_drawdown_requests",
          body: parsed,
          model: Increase::WireDrawdownRequest,
          options: options
        )
      end

      # Retrieve a Wire Drawdown Request
      #
      # @overload retrieve(wire_drawdown_request_id, request_options: {})
      #
      # @param wire_drawdown_request_id [String] The identifier of the Wire Drawdown Request to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::WireDrawdownRequest]
      #
      # @see Increase::Models::WireDrawdownRequestRetrieveParams
      def retrieve(wire_drawdown_request_id, params = {})
        @client.request(
          method: :get,
          path: ["wire_drawdown_requests/%1$s", wire_drawdown_request_id],
          model: Increase::WireDrawdownRequest,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::WireDrawdownRequestListParams} for more details.
      #
      # List Wire Drawdown Requests
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::WireDrawdownRequestListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::WireDrawdownRequest>]
      #
      # @see Increase::Models::WireDrawdownRequestListParams
      def list(params = {})
        parsed, options = Increase::WireDrawdownRequestListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "wire_drawdown_requests",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::WireDrawdownRequest,
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
