# frozen_string_literal: true

module Increase
  module Resources
    class AccountTransfers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::AccountTransferCreateParams} for more details.
      #
      # Create an Account Transfer
      #
      # @overload create(account_id:, amount:, description:, destination_account_id:, require_approval: nil, request_options: {})
      #
      # @param account_id [String] The identifier for the originating Account that will send the transfer.
      #
      # @param amount [Integer] The transfer amount in the minor unit of the account currency. For dollars, for
      #
      # @param description [String] An internal-facing description for the transfer for display in the API and dashb
      #
      # @param destination_account_id [String] The identifier for the destination Account that will receive the transfer.
      #
      # @param require_approval [Boolean] Whether the transfer should require explicit approval via the dashboard or API.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountTransfer]
      #
      # @see Increase::Models::AccountTransferCreateParams
      def create(params)
        parsed, options = Increase::AccountTransferCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "account_transfers",
          body: parsed,
          model: Increase::AccountTransfer,
          options: options
        )
      end

      # Retrieve an Account Transfer
      #
      # @overload retrieve(account_transfer_id, request_options: {})
      #
      # @param account_transfer_id [String] The identifier of the Account Transfer.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountTransfer]
      #
      # @see Increase::Models::AccountTransferRetrieveParams
      def retrieve(account_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["account_transfers/%1$s", account_transfer_id],
          model: Increase::AccountTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::AccountTransferListParams} for more details.
      #
      # List Account Transfers
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param account_id [String] Filter Account Transfers to those that originated from the specified Account.
      #
      # @param created_at [Increase::Models::AccountTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountTransferListResponse]
      #
      # @see Increase::Models::AccountTransferListParams
      def list(params = {})
        parsed, options = Increase::AccountTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "account_transfers",
          query: parsed,
          model: Increase::Models::AccountTransferListResponse,
          options: options
        )
      end

      # Approves an Account Transfer in status `pending_approval`.
      #
      # @overload approve(account_transfer_id, request_options: {})
      #
      # @param account_transfer_id [String] The identifier of the Account Transfer to approve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountTransfer]
      #
      # @see Increase::Models::AccountTransferApproveParams
      def approve(account_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["account_transfers/%1$s/approve", account_transfer_id],
          model: Increase::AccountTransfer,
          options: params[:request_options]
        )
      end

      # Cancels an Account Transfer in status `pending_approval`.
      #
      # @overload cancel(account_transfer_id, request_options: {})
      #
      # @param account_transfer_id [String] The identifier of the pending Account Transfer to cancel.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountTransfer]
      #
      # @see Increase::Models::AccountTransferCancelParams
      def cancel(account_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["account_transfers/%1$s/cancel", account_transfer_id],
          model: Increase::AccountTransfer,
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
