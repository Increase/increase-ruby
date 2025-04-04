# frozen_string_literal: true

module Increase
  module Resources
    class BookkeepingAccounts
      # Create a Bookkeeping Account
      #
      # @overload create(name:, account_id: nil, compliance_category: nil, entity_id: nil, request_options: {})
      #
      # @param name [String]
      # @param account_id [String]
      # @param compliance_category [Symbol, Increase::Models::BookkeepingAccountCreateParams::ComplianceCategory]
      # @param entity_id [String]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BookkeepingAccount]
      #
      # @see Increase::Models::BookkeepingAccountCreateParams
      def create(params)
        parsed, options = Increase::Models::BookkeepingAccountCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "bookkeeping_accounts",
          body: parsed,
          model: Increase::Models::BookkeepingAccount,
          options: options
        )
      end

      # Update a Bookkeeping Account
      #
      # @overload update(bookkeeping_account_id, name:, request_options: {})
      #
      # @param bookkeeping_account_id [String]
      # @param name [String]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BookkeepingAccount]
      #
      # @see Increase::Models::BookkeepingAccountUpdateParams
      def update(bookkeeping_account_id, params)
        parsed, options = Increase::Models::BookkeepingAccountUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["bookkeeping_accounts/%1$s", bookkeeping_account_id],
          body: parsed,
          model: Increase::Models::BookkeepingAccount,
          options: options
        )
      end

      # List Bookkeeping Accounts
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param cursor [String]
      # @param idempotency_key [String]
      # @param limit [Integer]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::BookkeepingAccount>]
      #
      # @see Increase::Models::BookkeepingAccountListParams
      def list(params = {})
        parsed, options = Increase::Models::BookkeepingAccountListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "bookkeeping_accounts",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Models::BookkeepingAccount,
          options: options
        )
      end

      # Retrieve a Bookkeeping Account Balance
      #
      # @overload balance(bookkeeping_account_id, at_time: nil, request_options: {})
      #
      # @param bookkeeping_account_id [String]
      # @param at_time [Time]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::BookkeepingBalanceLookup]
      #
      # @see Increase::Models::BookkeepingAccountBalanceParams
      def balance(bookkeeping_account_id, params = {})
        parsed, options = Increase::Models::BookkeepingAccountBalanceParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["bookkeeping_accounts/%1$s/balance", bookkeeping_account_id],
          query: parsed,
          model: Increase::Models::BookkeepingBalanceLookup,
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
