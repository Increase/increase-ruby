# frozen_string_literal: true

module Increase
  module Resources
    class ExternalAccounts
      # Create an External Account
      #
      # @param params [Increase::Models::ExternalAccountCreateParams, Hash{Symbol => Object}] Attributes to send in this request.
      #
      #   @option params [String] :account_number The account number for the destination account.
      #
      #   @option params [String] :description The name you choose for the Account.
      #
      #   @option params [String] :routing_number The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #     destination account.
      #
      #   @option params [Symbol, Increase::Models::ExternalAccountCreateParams::AccountHolder] :account_holder The type of entity that owns the External Account.
      #
      #   @option params [Symbol, Increase::Models::ExternalAccountCreateParams::Funding] :funding The type of the destination account. Defaults to `checking`.
      #
      # @param opts [Hash{Symbol => Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::ExternalAccount]
      #
      def create(params = {}, opts = {})
        parsed = Increase::Models::ExternalAccountCreateParams.dump(params)
        req = {
          method: :post,
          path: "external_accounts",
          body: parsed,
          model: Increase::Models::ExternalAccount
        }
        @client.request(req, opts)
      end

      # Retrieve an External Account
      #
      # @param external_account_id [String] The identifier of the External Account.
      #
      # @param opts [Hash{Symbol => Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::ExternalAccount]
      #
      def retrieve(external_account_id, opts = {})
        req = {
          method: :get,
          path: ["external_accounts/%0s", external_account_id],
          model: Increase::Models::ExternalAccount
        }
        @client.request(req, opts)
      end

      # Update an External Account
      #
      # @param external_account_id [String] The external account identifier.
      #
      # @param params [Increase::Models::ExternalAccountUpdateParams, Hash{Symbol => Object}] Attributes to send in this request.
      #
      #   @option params [Symbol, Increase::Models::ExternalAccountUpdateParams::AccountHolder] :account_holder The type of entity that owns the External Account.
      #
      #   @option params [String] :description The description you choose to give the external account.
      #
      #   @option params [Symbol, Increase::Models::ExternalAccountUpdateParams::Funding] :funding The funding type of the External Account.
      #
      #   @option params [Symbol, Increase::Models::ExternalAccountUpdateParams::Status] :status The status of the External Account.
      #
      # @param opts [Hash{Symbol => Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::ExternalAccount]
      #
      def update(external_account_id, params = {}, opts = {})
        parsed = Increase::Models::ExternalAccountUpdateParams.dump(params)
        req = {
          method: :patch,
          path: ["external_accounts/%0s", external_account_id],
          body: parsed,
          model: Increase::Models::ExternalAccount
        }
        @client.request(req, opts)
      end

      # List External Accounts
      #
      # @param params [Increase::Models::ExternalAccountListParams, Hash{Symbol => Object}] Attributes to send in this request.
      #
      #   @option params [String] :cursor Return the page of entries after this one.
      #
      #   @option params [String] :idempotency_key Filter records to the one with the specified `idempotency_key` you chose for
      #     that object. This value is unique across Increase and is used to ensure that a
      #     request is only processed once. Learn more about
      #     [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #     objects.
      #
      #   @option params [String] :routing_number Filter External Accounts to those with the specified Routing Number.
      #
      #   @option params [Increase::Models::ExternalAccountListParams::Status] :status
      #
      # @param opts [Hash{Symbol => Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Page<Increase::Models::ExternalAccount>]
      #
      def list(params = {}, opts = {})
        parsed = Increase::Models::ExternalAccountListParams.dump(params)
        req = {
          method: :get,
          path: "external_accounts",
          query: parsed,
          page: Increase::Page,
          model: Increase::Models::ExternalAccount
        }
        @client.request(req, opts)
      end

      # @param client [Increase::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
