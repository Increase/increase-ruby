# frozen_string_literal: true

module Increase
  module Resources
    class RealTimePaymentsTransfers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::RealTimePaymentsTransferCreateParams} for more details.
      #
      # Create a Real-Time Payments Transfer
      #
      # @overload create(amount:, creditor_name:, remittance_information:, source_account_number_id:, debtor_name: nil, destination_account_number: nil, destination_routing_number: nil, external_account_id: nil, require_approval: nil, ultimate_creditor_name: nil, ultimate_debtor_name: nil, request_options: {})
      #
      # @param amount [Integer] The transfer amount in USD cents. For Real-Time Payments transfers, must be posi
      #
      # @param creditor_name [String] The name of the transfer's recipient.
      #
      # @param remittance_information [String] Unstructured information that will show on the recipient's bank statement.
      #
      # @param source_account_number_id [String] The identifier of the Account Number from which to send the transfer.
      #
      # @param debtor_name [String] The name of the transfer's sender. If not provided, defaults to the name of the
      #
      # @param destination_account_number [String] The destination account number.
      #
      # @param destination_routing_number [String] The destination American Bankers' Association (ABA) Routing Transit Number (RTN)
      #
      # @param external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      # @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      # @param ultimate_creditor_name [String] The name of the ultimate recipient of the transfer. Set this if the creditor is
      #
      # @param ultimate_debtor_name [String] The name of the ultimate sender of the transfer. Set this if the funds are being
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimePaymentsTransfer]
      #
      # @see Increase::Models::RealTimePaymentsTransferCreateParams
      def create(params)
        parsed, options = Increase::RealTimePaymentsTransferCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "real_time_payments_transfers",
          body: parsed,
          model: Increase::RealTimePaymentsTransfer,
          options: options
        )
      end

      # Retrieve a Real-Time Payments Transfer
      #
      # @overload retrieve(real_time_payments_transfer_id, request_options: {})
      #
      # @param real_time_payments_transfer_id [String] The identifier of the Real-Time Payments Transfer.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimePaymentsTransfer]
      #
      # @see Increase::Models::RealTimePaymentsTransferRetrieveParams
      def retrieve(real_time_payments_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["real_time_payments_transfers/%1$s", real_time_payments_transfer_id],
          model: Increase::RealTimePaymentsTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::RealTimePaymentsTransferListParams} for more details.
      #
      # List Real-Time Payments Transfers
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, external_account_id: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Real-Time Payments Transfers to those belonging to the specified Account.
      #
      # @param created_at [Increase::Models::RealTimePaymentsTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param external_account_id [String] Filter Real-Time Payments Transfers to those made to the specified External Acco
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::RealTimePaymentsTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::RealTimePaymentsTransfer>]
      #
      # @see Increase::Models::RealTimePaymentsTransferListParams
      def list(params = {})
        parsed, options = Increase::RealTimePaymentsTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "real_time_payments_transfers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::RealTimePaymentsTransfer,
          options: options
        )
      end

      # Approves a Real-Time Payments Transfer in a pending_approval state.
      #
      # @overload approve(real_time_payments_transfer_id, request_options: {})
      #
      # @param real_time_payments_transfer_id [String] The identifier of the Real-Time Payments Transfer to approve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimePaymentsTransfer]
      #
      # @see Increase::Models::RealTimePaymentsTransferApproveParams
      def approve(real_time_payments_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["real_time_payments_transfers/%1$s/approve", real_time_payments_transfer_id],
          model: Increase::RealTimePaymentsTransfer,
          options: params[:request_options]
        )
      end

      # Cancels a Real-Time Payments Transfer in a pending_approval state.
      #
      # @overload cancel(real_time_payments_transfer_id, request_options: {})
      #
      # @param real_time_payments_transfer_id [String] The identifier of the pending Real-Time Payments Transfer to cancel.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimePaymentsTransfer]
      #
      # @see Increase::Models::RealTimePaymentsTransferCancelParams
      def cancel(real_time_payments_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["real_time_payments_transfers/%1$s/cancel", real_time_payments_transfer_id],
          model: Increase::RealTimePaymentsTransfer,
          options: params[:request_options]
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
