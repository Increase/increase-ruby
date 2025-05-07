# typed: strong

module Increase
  module Resources
    class Accounts
      # Create an Account
      sig do
        params(
          name: String,
          entity_id: String,
          informational_entity_id: String,
          program_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Account)
      end
      def create(
        # The name you choose for the Account.
        name:,
        # The identifier for the Entity that will own the Account.
        entity_id: nil,
        # The identifier of an Entity that, while not owning the Account, is associated
        # with its activity. Its relationship to your group must be `informational`.
        informational_entity_id: nil,
        # The identifier for the Program that this Account falls under. Required if you
        # operate more than one Program.
        program_id: nil,
        request_options: {}
      )
      end

      # Retrieve an Account
      sig do
        params(
          account_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Account)
      end
      def retrieve(
        # The identifier of the Account to retrieve.
        account_id,
        request_options: {}
      )
      end

      # Update an Account
      sig do
        params(
          account_id: String,
          name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Account)
      end
      def update(
        # The identifier of the Account to update.
        account_id,
        # The new name of the Account.
        name: nil,
        request_options: {}
      )
      end

      # List Accounts
      sig do
        params(
          created_at: Increase::AccountListParams::CreatedAt::OrHash,
          cursor: String,
          entity_id: String,
          idempotency_key: String,
          informational_entity_id: String,
          limit: Integer,
          program_id: String,
          status: Increase::AccountListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::Account])
      end
      def list(
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter Accounts for those belonging to the specified Entity.
        entity_id: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Filter Accounts for those belonging to the specified Entity as informational.
        informational_entity_id: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        # Filter Accounts for those in a specific Program.
        program_id: nil,
        status: nil,
        request_options: {}
      )
      end

      # Retrieve the current and available balances for an account in minor units of the
      # account's currency. Learn more about [account balances](/documentation/balance).
      sig do
        params(
          account_id: String,
          at_time: Time,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::BalanceLookup)
      end
      def balance(
        # The identifier of the Account to retrieve.
        account_id,
        # The moment to query the balance at. If not set, returns the current balances.
        at_time: nil,
        request_options: {}
      )
      end

      # Close an Account
      sig do
        params(
          account_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Account)
      end
      def close(
        # The identifier of the Account to close. The account must have a zero balance.
        account_id,
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
