# frozen_string_literal: true

module Increase
  module Resources
    class FednowTransfers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::FednowTransferCreateParams} for more details.
      #
      # Create a FedNow Transfer
      #
      # @overload create(account_id:, amount:, creditor_name:, debtor_name:, source_account_number_id:, unstructured_remittance_information:, account_number: nil, creditor_address: nil, debtor_address: nil, external_account_id: nil, require_approval: nil, routing_number: nil, request_options: {})
      #
      # @param account_id [String] The identifier for the account that will send the transfer.
      #
      # @param amount [Integer] The amount, in minor units, to send to the creditor.
      #
      # @param creditor_name [String] The creditor's name.
      #
      # @param debtor_name [String] The debtor's name.
      #
      # @param source_account_number_id [String] The Account Number to include in the transfer as the debtor's account number.
      #
      # @param unstructured_remittance_information [String] Unstructured remittance information to include in the transfer.
      #
      # @param account_number [String] The creditor's account number.
      #
      # @param creditor_address [Increase::Models::FednowTransferCreateParams::CreditorAddress] The creditor's address.
      #
      # @param debtor_address [Increase::Models::FednowTransferCreateParams::DebtorAddress] The debtor's address.
      #
      # @param external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      # @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      # @param routing_number [String] The creditor's bank account routing number.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::FednowTransfer]
      #
      # @see Increase::Models::FednowTransferCreateParams
      def create(params)
        parsed, options = Increase::FednowTransferCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "fednow_transfers",
          body: parsed,
          model: Increase::FednowTransfer,
          options: options
        )
      end

      # Retrieve a FedNow Transfer
      #
      # @overload retrieve(fednow_transfer_id, request_options: {})
      #
      # @param fednow_transfer_id [String] The identifier of the FedNow Transfer.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::FednowTransfer]
      #
      # @see Increase::Models::FednowTransferRetrieveParams
      def retrieve(fednow_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["fednow_transfers/%1$s", fednow_transfer_id],
          model: Increase::FednowTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::FednowTransferListParams} for more details.
      #
      # List FedNow Transfers
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, external_account_id: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter FedNow Transfers to those that originated from the specified Account.
      #
      # @param created_at [Increase::Models::FednowTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param external_account_id [String] Filter FedNow Transfers to those made to the specified External Account.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::FednowTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::FednowTransfer>]
      #
      # @see Increase::Models::FednowTransferListParams
      def list(params = {})
        parsed, options = Increase::FednowTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "fednow_transfers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::FednowTransfer,
          options: options
        )
      end

      # Approve a FedNow Transfer
      #
      # @overload approve(fednow_transfer_id, request_options: {})
      #
      # @param fednow_transfer_id [String] The identifier of the FedNow Transfer to approve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::FednowTransfer]
      #
      # @see Increase::Models::FednowTransferApproveParams
      def approve(fednow_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["fednow_transfers/%1$s/approve", fednow_transfer_id],
          model: Increase::FednowTransfer,
          options: params[:request_options]
        )
      end

      # Cancel a pending FedNow Transfer
      #
      # @overload cancel(fednow_transfer_id, request_options: {})
      #
      # @param fednow_transfer_id [String] The identifier of the pending FedNow Transfer to cancel.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::FednowTransfer]
      #
      # @see Increase::Models::FednowTransferCancelParams
      def cancel(fednow_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["fednow_transfers/%1$s/cancel", fednow_transfer_id],
          model: Increase::FednowTransfer,
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
