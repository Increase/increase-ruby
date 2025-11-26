# typed: strong

module Increase
  module Resources
    class ExternalAccounts
      # Create an External Account
      sig do
        params(
          account_number: String,
          description: String,
          routing_number: String,
          account_holder:
            Increase::ExternalAccountCreateParams::AccountHolder::OrSymbol,
          funding: Increase::ExternalAccountCreateParams::Funding::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::ExternalAccount)
      end
      def create(
        # The account number for the destination account.
        account_number:,
        # The name you choose for the Account.
        description:,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
        # destination account.
        routing_number:,
        # The type of entity that owns the External Account.
        account_holder: nil,
        # The type of the destination account. Defaults to `checking`.
        funding: nil,
        request_options: {}
      )
      end

      # Retrieve an External Account
      sig do
        params(
          external_account_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::ExternalAccount)
      end
      def retrieve(
        # The identifier of the External Account.
        external_account_id,
        request_options: {}
      )
      end

      # Update an External Account
      sig do
        params(
          external_account_id: String,
          account_holder:
            Increase::ExternalAccountUpdateParams::AccountHolder::OrSymbol,
          description: String,
          funding: Increase::ExternalAccountUpdateParams::Funding::OrSymbol,
          status: Increase::ExternalAccountUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::ExternalAccount)
      end
      def update(
        # The external account identifier.
        external_account_id,
        # The type of entity that owns the External Account.
        account_holder: nil,
        # The description you choose to give the external account.
        description: nil,
        # The funding type of the External Account.
        funding: nil,
        # The status of the External Account.
        status: nil,
        request_options: {}
      )
      end

      # List External Accounts
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          routing_number: String,
          status: Increase::ExternalAccountListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::ExternalAccountListResponse)
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
        # Filter External Accounts to those with the specified Routing Number.
        routing_number: nil,
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
