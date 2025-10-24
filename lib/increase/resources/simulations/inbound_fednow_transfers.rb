# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundFednowTransfers
        # Simulates an [Inbound FedNow Transfer](#inbound-fednow-transfers) to your
        # account.
        #
        # @overload create(account_number_id:, amount:, debtor_account_number: nil, debtor_name: nil, debtor_routing_number: nil, unstructured_remittance_information: nil, request_options: {})
        #
        # @param account_number_id [String] The identifier of the Account Number the inbound FedNow Transfer is for.
        #
        # @param amount [Integer] The transfer amount in USD cents. Must be positive.
        #
        # @param debtor_account_number [String] The account number of the account that sent the transfer.
        #
        # @param debtor_name [String] The name provided by the sender of the transfer.
        #
        # @param debtor_routing_number [String] The routing number of the account that sent the transfer.
        #
        # @param unstructured_remittance_information [String] Additional information included with the transfer.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::InboundFednowTransfer]
        #
        # @see Increase::Models::Simulations::InboundFednowTransferCreateParams
        def create(params)
          parsed, options = Increase::Simulations::InboundFednowTransferCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/inbound_fednow_transfers",
            body: parsed,
            model: Increase::InboundFednowTransfer,
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
