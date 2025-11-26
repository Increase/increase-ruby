# frozen_string_literal: true

module Increase
  module Resources
    class BookkeepingAccounts
      # Create a Bookkeeping Account
      #
      # @overload create(name:, account_id: nil, compliance_category: nil, entity_id: nil, request_options: {})
      #
      # @param name [String] The name you choose for the account.
      #
      # @param account_id [String] The account, if `compliance_category` is `commingled_cash`.
      #
      # @param compliance_category [Symbol, Increase::Models::BookkeepingAccountCreateParams::ComplianceCategory] The account compliance category.
      #
      # @param entity_id [String] The entity, if `compliance_category` is `customer_balance`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BookkeepingAccount]
      #
      # @see Increase::Models::BookkeepingAccountCreateParams
      def create(params)
        parsed, options = Increase::BookkeepingAccountCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "bookkeeping_accounts",
          body: parsed,
          model: Increase::BookkeepingAccount,
          options: options
        )
      end

      # Update a Bookkeeping Account
      #
      # @overload update(bookkeeping_account_id, name:, request_options: {})
      #
      # @param bookkeeping_account_id [String] The bookkeeping account you would like to update.
      #
      # @param name [String] The name you choose for the account.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BookkeepingAccount]
      #
      # @see Increase::Models::BookkeepingAccountUpdateParams
      def update(bookkeeping_account_id, params)
        parsed, options = Increase::BookkeepingAccountUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["bookkeeping_accounts/%1$s", bookkeeping_account_id],
          body: parsed,
          model: Increase::BookkeepingAccount,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::BookkeepingAccountListParams} for more details.
      #
      # List Bookkeeping Accounts
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::BookkeepingAccount>]
      #
      # @see Increase::Models::BookkeepingAccountListParams
      def list(params = {})
        parsed, options = Increase::BookkeepingAccountListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "bookkeeping_accounts",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::BookkeepingAccount,
          options: options
        )
      end

      # Retrieve a Bookkeeping Account Balance
      #
      # @overload balance(bookkeeping_account_id, at_time: nil, request_options: {})
      #
      # @param bookkeeping_account_id [String] The identifier of the Bookkeeping Account to retrieve.
      #
      # @param at_time [Time] The moment to query the balance at. If not set, returns the current balances.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BookkeepingBalanceLookup]
      #
      # @see Increase::Models::BookkeepingAccountBalanceParams
      def balance(bookkeeping_account_id, params = {})
        parsed, options = Increase::BookkeepingAccountBalanceParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["bookkeeping_accounts/%1$s/balance", bookkeeping_account_id],
          query: parsed,
          model: Increase::BookkeepingBalanceLookup,
          options: options
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
