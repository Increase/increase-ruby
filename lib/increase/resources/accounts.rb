# frozen_string_literal: true

module Increase
  module Resources
    class Accounts
      # Some parameter documentations has been truncated, see
      # {Increase::Models::AccountCreateParams} for more details.
      #
      # Create an Account
      #
      # @overload create(name:, entity_id: nil, informational_entity_id: nil, program_id: nil, request_options: {})
      #
      # @param name [String] The name you choose for the Account.
      #
      # @param entity_id [String] The identifier for the Entity that will own the Account.
      #
      # @param informational_entity_id [String] The identifier of an Entity that, while not owning the Account, is associated wi
      #
      # @param program_id [String] The identifier for the Program that this Account falls under. Required if you op
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Account]
      #
      # @see Increase::Models::AccountCreateParams
      def create(params)
        parsed, options = Increase::AccountCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "accounts",
          body: parsed,
          model: Increase::Account,
          options: options
        )
      end

      # Retrieve an Account
      #
      # @overload retrieve(account_id, request_options: {})
      #
      # @param account_id [String] The identifier of the Account to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Account]
      #
      # @see Increase::Models::AccountRetrieveParams
      def retrieve(account_id, params = {})
        @client.request(
          method: :get,
          path: ["accounts/%1$s", account_id],
          model: Increase::Account,
          options: params[:request_options]
        )
      end

      # Update an Account
      #
      # @overload update(account_id, name: nil, request_options: {})
      #
      # @param account_id [String] The identifier of the Account to update.
      #
      # @param name [String] The new name of the Account.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Account]
      #
      # @see Increase::Models::AccountUpdateParams
      def update(account_id, params = {})
        parsed, options = Increase::AccountUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["accounts/%1$s", account_id],
          body: parsed,
          model: Increase::Account,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::AccountListParams} for more details.
      #
      # List Accounts
      #
      # @overload list(created_at: nil, cursor: nil, entity_id: nil, idempotency_key: nil, informational_entity_id: nil, limit: nil, program_id: nil, status: nil, request_options: {})
      #
      # @param created_at [Increase::Models::AccountListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param entity_id [String] Filter Accounts for those belonging to the specified Entity.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param informational_entity_id [String] Filter Accounts for those belonging to the specified Entity as informational.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param program_id [String] Filter Accounts for those in a specific Program.
      #
      # @param status [Increase::Models::AccountListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::Account>]
      #
      # @see Increase::Models::AccountListParams
      def list(params = {})
        parsed, options = Increase::AccountListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "accounts",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Account,
          options: options
        )
      end

      # Retrieve the current and available balances for an account in minor units of the
      # account's currency. Learn more about [account balances](/documentation/balance).
      #
      # @overload balance(account_id, at_time: nil, request_options: {})
      #
      # @param account_id [String] The identifier of the Account to retrieve.
      #
      # @param at_time [Time] The moment to query the balance at. If not set, returns the current balances.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BalanceLookup]
      #
      # @see Increase::Models::AccountBalanceParams
      def balance(account_id, params = {})
        parsed, options = Increase::AccountBalanceParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["accounts/%1$s/balance", account_id],
          query: parsed,
          model: Increase::BalanceLookup,
          options: options
        )
      end

      # Close an Account
      #
      # @overload close(account_id, request_options: {})
      #
      # @param account_id [String] The identifier of the Account to close. The account must have a zero balance.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Account]
      #
      # @see Increase::Models::AccountCloseParams
      def close(account_id, params = {})
        @client.request(
          method: :post,
          path: ["accounts/%1$s/close", account_id],
          model: Increase::Account,
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
