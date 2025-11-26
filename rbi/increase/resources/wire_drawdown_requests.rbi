# typed: strong

module Increase
  module Resources
    class WireDrawdownRequests
      # Create a Wire Drawdown Request
      sig do
        params(
          account_number_id: String,
          amount: Integer,
          creditor_address:
            Increase::WireDrawdownRequestCreateParams::CreditorAddress::OrHash,
          creditor_name: String,
          debtor_address:
            Increase::WireDrawdownRequestCreateParams::DebtorAddress::OrHash,
          debtor_name: String,
          unstructured_remittance_information: String,
          debtor_account_number: String,
          debtor_external_account_id: String,
          debtor_routing_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::WireDrawdownRequest)
      end
      def create(
        # The Account Number to which the debtor should send funds.
        account_number_id:,
        # The amount requested from the debtor, in USD cents.
        amount:,
        # The creditor's address.
        creditor_address:,
        # The creditor's name.
        creditor_name:,
        # The debtor's address.
        debtor_address:,
        # The debtor's name.
        debtor_name:,
        # Remittance information the debtor will see as part of the request.
        unstructured_remittance_information:,
        # The debtor's account number.
        debtor_account_number: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `debtor_account_number` and `debtor_routing_number` must be absent.
        debtor_external_account_id: nil,
        # The debtor's routing number.
        debtor_routing_number: nil,
        request_options: {}
      )
      end

      # Retrieve a Wire Drawdown Request
      sig do
        params(
          wire_drawdown_request_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::WireDrawdownRequest)
      end
      def retrieve(
        # The identifier of the Wire Drawdown Request to retrieve.
        wire_drawdown_request_id,
        request_options: {}
      )
      end

      # List Wire Drawdown Requests
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::WireDrawdownRequestListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::WireDrawdownRequestListResponse)
      end
      def list(
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
