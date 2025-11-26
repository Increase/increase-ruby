# typed: strong

module Increase
  module Resources
    class ACHTransfers
      # Create an ACH Transfer
      sig do
        params(
          account_id: String,
          amount: Integer,
          statement_descriptor: String,
          account_number: String,
          addenda: Increase::ACHTransferCreateParams::Addenda::OrHash,
          company_descriptive_date: String,
          company_discretionary_data: String,
          company_entry_description: String,
          company_name: String,
          destination_account_holder:
            Increase::ACHTransferCreateParams::DestinationAccountHolder::OrSymbol,
          external_account_id: String,
          funding: Increase::ACHTransferCreateParams::Funding::OrSymbol,
          individual_id: String,
          individual_name: String,
          preferred_effective_date:
            Increase::ACHTransferCreateParams::PreferredEffectiveDate::OrHash,
          require_approval: T::Boolean,
          routing_number: String,
          standard_entry_class_code:
            Increase::ACHTransferCreateParams::StandardEntryClassCode::OrSymbol,
          transaction_timing:
            Increase::ACHTransferCreateParams::TransactionTiming::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::ACHTransfer)
      end
      def create(
        # The Increase identifier for the account that will send the transfer.
        account_id:,
        # The transfer amount in USD cents. A positive amount originates a credit transfer
        # pushing funds to the receiving account. A negative amount originates a debit
        # transfer pulling funds from the receiving account.
        amount:,
        # A description you choose to give the transfer. This will be saved with the
        # transfer details, displayed in the dashboard, and returned by the API. If
        # `individual_name` and `company_name` are not explicitly set by this API, the
        # `statement_descriptor` will be sent in those fields to the receiving bank to
        # help the customer recognize the transfer. You are highly encouraged to pass
        # `individual_name` and `company_name` instead of relying on this fallback.
        statement_descriptor:,
        # The account number for the destination account.
        account_number: nil,
        # Additional information that will be sent to the recipient. This is included in
        # the transfer data sent to the receiving bank.
        addenda: nil,
        # The description of the date of the transfer, usually in the format `YYMMDD`.
        # This is included in the transfer data sent to the receiving bank.
        company_descriptive_date: nil,
        # The data you choose to associate with the transfer. This is included in the
        # transfer data sent to the receiving bank.
        company_discretionary_data: nil,
        # A description of the transfer. This is included in the transfer data sent to the
        # receiving bank.
        company_entry_description: nil,
        # The name by which the recipient knows you. This is included in the transfer data
        # sent to the receiving bank.
        company_name: nil,
        # The type of entity that owns the account to which the ACH Transfer is being
        # sent.
        destination_account_holder: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number`, `routing_number`, and `funding` must be absent.
        external_account_id: nil,
        # The type of the account to which the transfer will be sent.
        funding: nil,
        # Your identifier for the transfer recipient.
        individual_id: nil,
        # The name of the transfer recipient. This value is informational and not verified
        # by the recipient's bank.
        individual_name: nil,
        # Configuration for how the effective date of the transfer will be set. This
        # determines same-day vs future-dated settlement timing. If not set, defaults to a
        # `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
        # must be set.
        preferred_effective_date: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
        # destination account.
        routing_number: nil,
        # The Standard Entry Class (SEC) code to use for the transfer.
        standard_entry_class_code: nil,
        # The timing of the transaction.
        transaction_timing: nil,
        request_options: {}
      )
      end

      # Retrieve an ACH Transfer
      sig do
        params(
          ach_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::ACHTransfer)
      end
      def retrieve(
        # The identifier of the ACH Transfer.
        ach_transfer_id,
        request_options: {}
      )
      end

      # List ACH Transfers
      sig do
        params(
          account_id: String,
          created_at: Increase::ACHTransferListParams::CreatedAt::OrHash,
          cursor: String,
          external_account_id: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::ACHTransferListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::ACHTransferListResponse)
      end
      def list(
        # Filter ACH Transfers to those that originated from the specified Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter ACH Transfers to those made to the specified External Account.
        external_account_id: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # Approves an ACH Transfer in a pending_approval state.
      sig do
        params(
          ach_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::ACHTransfer)
      end
      def approve(
        # The identifier of the ACH Transfer to approve.
        ach_transfer_id,
        request_options: {}
      )
      end

      # Cancels an ACH Transfer in a pending_approval state.
      sig do
        params(
          ach_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::ACHTransfer)
      end
      def cancel(
        # The identifier of the pending ACH Transfer to cancel.
        ach_transfer_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
