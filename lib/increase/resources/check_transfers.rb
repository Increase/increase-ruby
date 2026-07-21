# frozen_string_literal: true

module Increase
  module Resources
    class CheckTransfers
      # Create a Check Transfer
      #
      # @overload create(account_id:, amount:, fulfillment_method:, source_account_number_id:, balance_check: nil, check_number: nil, physical_check: nil, require_approval: nil, third_party: nil, valid_until_date: nil, request_options: {})
      #
      # @param account_id [String] The identifier for the account that will send the transfer.
      #
      # @param amount [Integer] The transfer amount in USD cents.
      #
      # @param fulfillment_method [Symbol, Increase::Models::CheckTransferCreateParams::FulfillmentMethod]
      #   Whether Increase will print and mail the check or if you will do it yourself.
      #
      # @param source_account_number_id [String]
      #   The identifier of the Account Number from which to send the transfer and print
      #   on the check.
      #
      # @param balance_check [Symbol, Increase::Models::CheckTransferCreateParams::BalanceCheck]
      #   How the account's available balance should be checked. If omitted, the default
      #   behavior is `balance_check: full`.
      #
      # @param check_number [String]
      #   The check number Increase should use for the check. This should not contain
      #   leading zeroes and must be unique across the `source_account_number`. If this is
      #   omitted, Increase will generate a check number for you.
      #
      # @param physical_check [Increase::Models::CheckTransferCreateParams::PhysicalCheck]
      #   Details relating to the physical check that Increase will print and mail. This
      #   is required if `fulfillment_method` is equal to `physical_check`. It must not be
      #   included if any other `fulfillment_method` is provided.
      #
      # @param require_approval [Boolean]
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      # @param third_party [Increase::Models::CheckTransferCreateParams::ThirdParty]
      #   Details relating to the custom fulfillment you will perform. This is required if
      #   `fulfillment_method` is equal to `third_party`. It must not be included if any
      #   other `fulfillment_method` is provided.
      #
      # @param valid_until_date [Date]
      #   If provided, the check will be valid on or before this date. After this date,
      #   the check transfer will be automatically stopped and deposits will not be
      #   accepted. For checks printed by Increase, this date is included on the check as
      #   its expiry.
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
      # @param idempotency_key [String]
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
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
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "check_transfers",
          query: query,
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

      # Cancel a Check Transfer with the `pending_approval` status. See
      # [Transfer Approvals](/documentation/transfer-approvals) for more information.
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

      # Request a stop payment on a Check Transfer. This can be done any time before the
      # check is deposited. A stopped check cannot be deposited and the funds held by
      # the transfer's Pending Transaction are released back to the account's available
      # balance.
      #
      # @overload stop_payment(check_transfer_id, reason: nil, request_options: {})
      #
      # @param check_transfer_id [String] The identifier of the Check Transfer.
      #
      # @param reason [Symbol, Increase::Models::CheckTransferStopPaymentParams::Reason]
      #   The reason why this transfer should be stopped.
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
