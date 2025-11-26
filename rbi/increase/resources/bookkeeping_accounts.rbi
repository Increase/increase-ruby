# typed: strong

module Increase
  module Resources
    class BookkeepingAccounts
      # Create a Bookkeeping Account
      sig do
        params(
          name: String,
          account_id: String,
          compliance_category:
            Increase::BookkeepingAccountCreateParams::ComplianceCategory::OrSymbol,
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::BookkeepingAccount)
      end
      def create(
        # The name you choose for the account.
        name:,
        # The account, if `compliance_category` is `commingled_cash`.
        account_id: nil,
        # The account compliance category.
        compliance_category: nil,
        # The entity, if `compliance_category` is `customer_balance`.
        entity_id: nil,
        request_options: {}
      )
      end

      # Update a Bookkeeping Account
      sig do
        params(
          bookkeeping_account_id: String,
          name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::BookkeepingAccount)
      end
      def update(
        # The bookkeeping account you would like to update.
        bookkeeping_account_id,
        # The name you choose for the account.
        name:,
        request_options: {}
      )
      end

      # List Bookkeeping Accounts
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::BookkeepingAccount])
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
        request_options: {}
      )
      end

      # Retrieve a Bookkeeping Account Balance
      sig do
        params(
          bookkeeping_account_id: String,
          at_time: Time,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::BookkeepingBalanceLookup)
      end
      def balance(
        # The identifier of the Bookkeeping Account to retrieve.
        bookkeeping_account_id,
        # The moment to query the balance at. If not set, returns the current balances.
        at_time: nil,
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
