# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundRealTimePaymentsTransfers
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InboundRealTimePaymentsTransferCreateParams} for
        # more details.
        #
        # Simulates an
        # [Inbound Real-Time Payments Transfer](#inbound-real-time-payments-transfers) to
        # your account. Real-Time Payments are a beta feature.
        #
        # @overload create(account_number_id:, amount:, debtor_account_number: nil, debtor_name: nil, debtor_routing_number: nil, remittance_information: nil, request_for_payment_id: nil, request_options: {})
        #
        # @param account_number_id [String] The identifier of the Account Number the inbound Real-Time Payments Transfer is
        #
        # @param amount [Integer] The transfer amount in USD cents. Must be positive.
        #
        # @param debtor_account_number [String] The account number of the account that sent the transfer.
        #
        # @param debtor_name [String] The name provided by the sender of the transfer.
        #
        # @param debtor_routing_number [String] The routing number of the account that sent the transfer.
        #
        # @param remittance_information [String] Additional information included with the transfer.
        #
        # @param request_for_payment_id [String] The identifier of a pending Request for Payment that this transfer will fulfill.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::InboundRealTimePaymentsTransfer]
        #
        # @see Increase::Models::Simulations::InboundRealTimePaymentsTransferCreateParams
        def create(params)
          parsed, options = Increase::Simulations::InboundRealTimePaymentsTransferCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/inbound_real_time_payments_transfers",
            body: parsed,
            model: Increase::InboundRealTimePaymentsTransfer,
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
