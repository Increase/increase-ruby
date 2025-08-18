# frozen_string_literal: true

module Increase
  module Resources
    class WireDrawdownRequests
      # Some parameter documentations has been truncated, see
      # {Increase::Models::WireDrawdownRequestCreateParams} for more details.
      #
      # Create a Wire Drawdown Request
      #
      # @overload create(account_number_id:, amount:, creditor_address:, creditor_name:, debtor_address:, debtor_name:, unstructured_remittance_information:, debtor_account_number: nil, debtor_external_account_id: nil, debtor_routing_number: nil, request_options: {})
      #
      # @param account_number_id [String] The Account Number to which the debtor should send funds.
      #
      # @param amount [Integer] The amount requested from the debtor, in USD cents.
      #
      # @param creditor_address [Increase::Models::WireDrawdownRequestCreateParams::CreditorAddress] The creditor's address.
      #
      # @param creditor_name [String] The creditor's name.
      #
      # @param debtor_address [Increase::Models::WireDrawdownRequestCreateParams::DebtorAddress] The debtor's address.
      #
      # @param debtor_name [String] The debtor's name.
      #
      # @param unstructured_remittance_information [String] Remittance information the debtor will see as part of the request.
      #
      # @param debtor_account_number [String] The debtor's account number.
      #
      # @param debtor_external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      # @param debtor_routing_number [String] The debtor's routing number.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::WireDrawdownRequest]
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
      # @return [Increase::Models::WireDrawdownRequest]
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
      # @param status [Increase::Models::WireDrawdownRequestListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::WireDrawdownRequest>]
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
