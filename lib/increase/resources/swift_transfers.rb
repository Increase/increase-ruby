# frozen_string_literal: true

module Increase
  module Resources
    class SwiftTransfers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::SwiftTransferCreateParams} for more details.
      #
      # Create a Swift Transfer
      #
      # @overload create(account_id:, account_number:, bank_identification_code:, creditor_address:, creditor_name:, debtor_address:, debtor_name:, instructed_amount:, instructed_currency:, source_account_number_id:, unstructured_remittance_information:, require_approval: nil, routing_number: nil, request_options: {})
      #
      # @param account_id [String] The identifier for the account that will send the transfer.
      #
      # @param account_number [String] The creditor's account number.
      #
      # @param bank_identification_code [String] The bank identification code (BIC) of the creditor. If it ends with the three-ch
      #
      # @param creditor_address [Increase::Models::SwiftTransferCreateParams::CreditorAddress] The creditor's address.
      #
      # @param creditor_name [String] The creditor's name.
      #
      # @param debtor_address [Increase::Models::SwiftTransferCreateParams::DebtorAddress] The debtor's address.
      #
      # @param debtor_name [String] The debtor's name.
      #
      # @param instructed_amount [Integer] The amount, in minor units of `instructed_currency`, to send to the creditor.
      #
      # @param instructed_currency [Symbol, Increase::Models::SwiftTransferCreateParams::InstructedCurrency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the inst
      #
      # @param source_account_number_id [String] The Account Number to include in the transfer as the debtor's account number.
      #
      # @param unstructured_remittance_information [String] Unstructured remittance information to include in the transfer.
      #
      # @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      # @param routing_number [String] The creditor's bank account routing or transit number. Required in certain count
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::SwiftTransfer]
      #
      # @see Increase::Models::SwiftTransferCreateParams
      def create(params)
        parsed, options = Increase::SwiftTransferCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "swift_transfers",
          body: parsed,
          model: Increase::SwiftTransfer,
          options: options
        )
      end

      # Retrieve a Swift Transfer
      #
      # @overload retrieve(swift_transfer_id, request_options: {})
      #
      # @param swift_transfer_id [String] The identifier of the Swift Transfer.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::SwiftTransfer]
      #
      # @see Increase::Models::SwiftTransferRetrieveParams
      def retrieve(swift_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["swift_transfers/%1$s", swift_transfer_id],
          model: Increase::SwiftTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::SwiftTransferListParams} for more details.
      #
      # List Swift Transfers
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Swift Transfers to those that originated from the specified Account.
      #
      # @param created_at [Increase::Models::SwiftTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::SwiftTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::SwiftTransfer>]
      #
      # @see Increase::Models::SwiftTransferListParams
      def list(params = {})
        parsed, options = Increase::SwiftTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "swift_transfers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::SwiftTransfer,
          options: options
        )
      end

      # Approve a Swift Transfer
      #
      # @overload approve(swift_transfer_id, request_options: {})
      #
      # @param swift_transfer_id [String] The identifier of the Swift Transfer to approve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::SwiftTransfer]
      #
      # @see Increase::Models::SwiftTransferApproveParams
      def approve(swift_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["swift_transfers/%1$s/approve", swift_transfer_id],
          model: Increase::SwiftTransfer,
          options: params[:request_options]
        )
      end

      # Cancel a pending Swift Transfer
      #
      # @overload cancel(swift_transfer_id, request_options: {})
      #
      # @param swift_transfer_id [String] The identifier of the pending Swift Transfer to cancel.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::SwiftTransfer]
      #
      # @see Increase::Models::SwiftTransferCancelParams
      def cancel(swift_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["swift_transfers/%1$s/cancel", swift_transfer_id],
          model: Increase::SwiftTransfer,
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
