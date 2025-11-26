# frozen_string_literal: true

module Increase
  module Resources
    class ACHTransfers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::ACHTransferCreateParams} for more details.
      #
      # Create an ACH Transfer
      #
      # @overload create(account_id:, amount:, statement_descriptor:, account_number: nil, addenda: nil, company_descriptive_date: nil, company_discretionary_data: nil, company_entry_description: nil, company_name: nil, destination_account_holder: nil, external_account_id: nil, funding: nil, individual_id: nil, individual_name: nil, preferred_effective_date: nil, require_approval: nil, routing_number: nil, standard_entry_class_code: nil, transaction_timing: nil, request_options: {})
      #
      # @param account_id [String] The Increase identifier for the account that will send the transfer.
      #
      # @param amount [Integer] The transfer amount in USD cents. A positive amount originates a credit transfer
      #
      # @param statement_descriptor [String] A description you choose to give the transfer. This will be saved with the trans
      #
      # @param account_number [String] The account number for the destination account.
      #
      # @param addenda [Increase::Models::ACHTransferCreateParams::Addenda] Additional information that will be sent to the recipient. This is included in t
      #
      # @param company_descriptive_date [String] The description of the date of the transfer, usually in the format `YYMMDD`. Thi
      #
      # @param company_discretionary_data [String] The data you choose to associate with the transfer. This is included in the tran
      #
      # @param company_entry_description [String] A description of the transfer. This is included in the transfer data sent to the
      #
      # @param company_name [String] The name by which the recipient knows you. This is included in the transfer data
      #
      # @param destination_account_holder [Symbol, Increase::Models::ACHTransferCreateParams::DestinationAccountHolder] The type of entity that owns the account to which the ACH Transfer is being sent
      #
      # @param external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      # @param funding [Symbol, Increase::Models::ACHTransferCreateParams::Funding] The type of the account to which the transfer will be sent.
      #
      # @param individual_id [String] Your identifier for the transfer recipient.
      #
      # @param individual_name [String] The name of the transfer recipient. This value is informational and not verified
      #
      # @param preferred_effective_date [Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate] Configuration for how the effective date of the transfer will be set. This deter
      #
      # @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      # @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the des
      #
      # @param standard_entry_class_code [Symbol, Increase::Models::ACHTransferCreateParams::StandardEntryClassCode] The Standard Entry Class (SEC) code to use for the transfer.
      #
      # @param transaction_timing [Symbol, Increase::Models::ACHTransferCreateParams::TransactionTiming] The timing of the transaction.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ACHTransfer]
      #
      # @see Increase::Models::ACHTransferCreateParams
      def create(params)
        parsed, options = Increase::ACHTransferCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "ach_transfers",
          body: parsed,
          model: Increase::ACHTransfer,
          options: options
        )
      end

      # Retrieve an ACH Transfer
      #
      # @overload retrieve(ach_transfer_id, request_options: {})
      #
      # @param ach_transfer_id [String] The identifier of the ACH Transfer.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ACHTransfer]
      #
      # @see Increase::Models::ACHTransferRetrieveParams
      def retrieve(ach_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["ach_transfers/%1$s", ach_transfer_id],
          model: Increase::ACHTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::ACHTransferListParams} for more details.
      #
      # List ACH Transfers
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, external_account_id: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter ACH Transfers to those that originated from the specified Account.
      #
      # @param created_at [Increase::Models::ACHTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param external_account_id [String] Filter ACH Transfers to those made to the specified External Account.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::ACHTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ACHTransferListResponse]
      #
      # @see Increase::Models::ACHTransferListParams
      def list(params = {})
        parsed, options = Increase::ACHTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "ach_transfers",
          query: parsed,
          model: Increase::Models::ACHTransferListResponse,
          options: options
        )
      end

      # Approves an ACH Transfer in a pending_approval state.
      #
      # @overload approve(ach_transfer_id, request_options: {})
      #
      # @param ach_transfer_id [String] The identifier of the ACH Transfer to approve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ACHTransfer]
      #
      # @see Increase::Models::ACHTransferApproveParams
      def approve(ach_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["ach_transfers/%1$s/approve", ach_transfer_id],
          model: Increase::ACHTransfer,
          options: params[:request_options]
        )
      end

      # Cancels an ACH Transfer in a pending_approval state.
      #
      # @overload cancel(ach_transfer_id, request_options: {})
      #
      # @param ach_transfer_id [String] The identifier of the pending ACH Transfer to cancel.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ACHTransfer]
      #
      # @see Increase::Models::ACHTransferCancelParams
      def cancel(ach_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["ach_transfers/%1$s/cancel", ach_transfer_id],
          model: Increase::ACHTransfer,
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
