# frozen_string_literal: true

module Increase
  module Resources
    class ACHTransfers
      # Create an ACH Transfer
      #
      # @overload create(account_id:, amount:, statement_descriptor:, account_number: nil, addenda: nil, company_descriptive_date: nil, company_discretionary_data: nil, company_entry_description: nil, company_name: nil, destination_account_holder: nil, external_account_id: nil, funding: nil, individual_id: nil, individual_name: nil, preferred_effective_date: nil, require_approval: nil, routing_number: nil, standard_entry_class_code: nil, transaction_timing: nil, request_options: {})
      #
      # @param account_id [String] The Increase identifier for the account that will send the transfer.
      #
      # @param amount [Integer]
      #   The transfer amount in USD cents. A positive amount originates a credit transfer
      #   pushing funds to the receiving account. A negative amount originates a debit
      #   transfer pulling funds from the receiving account.
      #
      # @param statement_descriptor [String]
      #   A description you choose to give the transfer. This will be saved with the
      #   transfer details, displayed in the dashboard, and returned by the API. If
      #   `individual_name` and `company_name` are not explicitly set by this API, the
      #   `statement_descriptor` will be sent in those fields to the receiving bank to
      #   help the customer recognize the transfer. You are highly encouraged to pass
      #   `individual_name` and `company_name` instead of relying on this fallback.
      #
      # @param account_number [String]
      #   The receiver's account number. For credit transfers (positive `amount`) this is
      #   the account that funds will be sent to. For debit transfers (negative `amount`)
      #   this is the account that funds will be pulled from.
      #
      # @param addenda [Increase::Models::ACHTransferCreateParams::Addenda]
      #   Additional information passed through to the receiving bank with the transfer.
      #   Most ACH transfers do not need this. Only set this if your recipient has asked
      #   for addendum data, typically unstructured remittance information. Corporate
      #   Trade Exchange (CTX) flows can carry structured X12 remittance advice instead.
      #
      # @param company_descriptive_date [String]
      #   A description of the transfer date (typically `YYMMDD`), sent in the company
      #   batch header. This value is informational and does not affect funds movement,
      #   settlement timing, or returns. Only set this if your recipient has asked for it.
      #
      # @param company_discretionary_data [String]
      #   Custom data sent in the company batch header. This value is informational and
      #   does not affect funds movement, settlement timing, or returns. Most ACH
      #   transfers do not need this. Only set this if your recipient has asked for it.
      #
      # @param company_entry_description [String]
      #   A short description sent in the company batch header. Most receivers do not
      #   surface this. Only set this if your recipient has asked for a specific value or
      #   if Nacha mandates one for your Standard Entry Class (SEC) code and use case. For
      #   example, Prearranged Payment and Deposit (PPD) payroll credits must use
      #   `PAYROLL`, and reversals must use `REVERSAL`.
      #
      # @param company_name [String]
      #   The name by which the recipient knows you, sent in the company batch header. We
      #   recommend setting this on every transfer; if you do not, we fall back to the ACH
      #   company name configured on your account.
      #
      # @param destination_account_holder [Symbol, Increase::Models::ACHTransferCreateParams::DestinationAccountHolder]
      #   The type of entity that owns the receiver's account.
      #
      # @param external_account_id [String]
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #   provided, `account_number`, `routing_number`, and `funding` must be absent.
      #
      # @param funding [Symbol, Increase::Models::ACHTransferCreateParams::Funding]
      #   The type of the receiver's bank account.
      #
      # @param individual_id [String]
      #   Your internal identifier for the transfer recipient. This value is informational
      #   and not verified by the recipient's bank. Most callers can leave this unset.
      #
      # @param individual_name [String]
      #   The name of the transfer recipient. This value is informational and not verified
      #   by the recipient's bank.
      #
      # @param preferred_effective_date [Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate]
      #   Configuration for how the effective date of the transfer will be set. This
      #   determines same-day vs future-dated settlement timing. If not set, defaults to a
      #   `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
      #   must be set.
      #
      # @param require_approval [Boolean]
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      # @param routing_number [String]
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN) of the
      #   receiver's bank.
      #
      # @param standard_entry_class_code [Symbol, Increase::Models::ACHTransferCreateParams::StandardEntryClassCode]
      #   The
      #   [Standard Entry Class (SEC) code](/documentation/ach-standard-entry-class-codes)
      #   to use for the transfer. If not provided, the default is
      #   `corporate_credit_or_debit`.
      #
      # @param transaction_timing [Symbol, Increase::Models::ACHTransferCreateParams::TransactionTiming]
      #   The timing of the transaction.
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
      # @param status [Increase::Models::ACHTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::ACHTransfer>]
      #
      # @see Increase::Models::ACHTransferListParams
      def list(params = {})
        parsed, options = Increase::ACHTransferListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "ach_transfers",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::ACHTransfer,
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
