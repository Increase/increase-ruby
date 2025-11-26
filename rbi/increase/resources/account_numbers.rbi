# typed: strong

module Increase
  module Resources
    class AccountNumbers
      # Create an Account Number
      sig do
        params(
          account_id: String,
          name: String,
          inbound_ach: Increase::AccountNumberCreateParams::InboundACH::OrHash,
          inbound_checks:
            Increase::AccountNumberCreateParams::InboundChecks::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::AccountNumber)
      end
      def create(
        # The Account the Account Number should belong to.
        account_id:,
        # The name you choose for the Account Number.
        name:,
        # Options related to how this Account Number should handle inbound ACH transfers.
        inbound_ach: nil,
        # Options related to how this Account Number should handle inbound check
        # withdrawals.
        inbound_checks: nil,
        request_options: {}
      )
      end

      # Retrieve an Account Number
      sig do
        params(
          account_number_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::AccountNumber)
      end
      def retrieve(
        # The identifier of the Account Number to retrieve.
        account_number_id,
        request_options: {}
      )
      end

      # Update an Account Number
      sig do
        params(
          account_number_id: String,
          inbound_ach: Increase::AccountNumberUpdateParams::InboundACH::OrHash,
          inbound_checks:
            Increase::AccountNumberUpdateParams::InboundChecks::OrHash,
          name: String,
          status: Increase::AccountNumberUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::AccountNumber)
      end
      def update(
        # The identifier of the Account Number.
        account_number_id,
        # Options related to how this Account Number handles inbound ACH transfers.
        inbound_ach: nil,
        # Options related to how this Account Number should handle inbound check
        # withdrawals.
        inbound_checks: nil,
        # The name you choose for the Account Number.
        name: nil,
        # This indicates if transfers can be made to the Account Number.
        status: nil,
        request_options: {}
      )
      end

      # List Account Numbers
      sig do
        params(
          account_id: String,
          ach_debit_status:
            Increase::AccountNumberListParams::ACHDebitStatus::OrHash,
          created_at: Increase::AccountNumberListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::AccountNumberListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::AccountNumber])
      end
      def list(
        # Filter Account Numbers to those belonging to the specified Account.
        account_id: nil,
        ach_debit_status: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
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

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
