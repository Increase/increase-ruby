# frozen_string_literal: true

module Increase
  module Resources
    class CheckTransfers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::CheckTransferCreateParams} for more details.
      #
      # Create a Check Transfer
      #
      # @overload create(account_id:, amount:, fulfillment_method:, source_account_number_id:, balance_check: nil, check_number: nil, physical_check: nil, require_approval: nil, third_party: nil, request_options: {})
      #
      # @param account_id [String] The identifier for the account that will send the transfer.
      #
      # @param amount [Integer] The transfer amount in USD cents.
      #
      # @param fulfillment_method [Symbol, Increase::Models::CheckTransferCreateParams::FulfillmentMethod] Whether Increase will print and mail the check or if you will do it yourself.
      #
      # @param source_account_number_id [String] The identifier of the Account Number from which to send the transfer and print o
      #
      # @param balance_check [Symbol, Increase::Models::CheckTransferCreateParams::BalanceCheck] How the account's available balance should be checked. If omitted, the default b
      #
      # @param check_number [String] The check number Increase should use for the check. This should not contain lead
      #
      # @param physical_check [Increase::Models::CheckTransferCreateParams::PhysicalCheck] Details relating to the physical check that Increase will print and mail. This i
      #
      # @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      # @param third_party [Increase::Models::CheckTransferCreateParams::ThirdParty] Details relating to the custom fulfillment you will perform. This is required if
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckTransfer]
      #
      # @see Increase::Models::CheckTransferCreateParams
      def create(params)
        parsed, options = Increase::CheckTransferCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "check_transfers",
          body: parsed,
          model: Increase::CheckTransfer,
          options: options
        )
      end

      # Retrieve a Check Transfer
      #
      # @overload retrieve(check_transfer_id, request_options: {})
      #
      # @param check_transfer_id [String] The identifier of the Check Transfer.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckTransfer]
      #
      # @see Increase::Models::CheckTransferRetrieveParams
      def retrieve(check_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["check_transfers/%1$s", check_transfer_id],
          model: Increase::CheckTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CheckTransferListParams} for more details.
      #
      # List Check Transfers
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Check Transfers to those that originated from the specified Account.
      #
      # @param created_at [Increase::Models::CheckTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::CheckTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::CheckTransfer>]
      #
      # @see Increase::Models::CheckTransferListParams
      def list(params = {})
        parsed, options = Increase::CheckTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "check_transfers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::CheckTransfer,
          options: options
        )
      end

      # Approve a Check Transfer
      #
      # @overload approve(check_transfer_id, request_options: {})
      #
      # @param check_transfer_id [String] The identifier of the Check Transfer to approve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckTransfer]
      #
      # @see Increase::Models::CheckTransferApproveParams
      def approve(check_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["check_transfers/%1$s/approve", check_transfer_id],
          model: Increase::CheckTransfer,
          options: params[:request_options]
        )
      end

      # Cancel a pending Check Transfer
      #
      # @overload cancel(check_transfer_id, request_options: {})
      #
      # @param check_transfer_id [String] The identifier of the pending Check Transfer to cancel.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckTransfer]
      #
      # @see Increase::Models::CheckTransferCancelParams
      def cancel(check_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["check_transfers/%1$s/cancel", check_transfer_id],
          model: Increase::CheckTransfer,
          options: params[:request_options]
        )
      end

      # Stop payment on a Check Transfer
      #
      # @overload stop_payment(check_transfer_id, reason: nil, request_options: {})
      #
      # @param check_transfer_id [String] The identifier of the Check Transfer.
      #
      # @param reason [Symbol, Increase::Models::CheckTransferStopPaymentParams::Reason] The reason why this transfer should be stopped.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckTransfer]
      #
      # @see Increase::Models::CheckTransferStopPaymentParams
      def stop_payment(check_transfer_id, params = {})
        parsed, options = Increase::CheckTransferStopPaymentParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["check_transfers/%1$s/stop_payment", check_transfer_id],
          body: parsed,
          model: Increase::CheckTransfer,
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
