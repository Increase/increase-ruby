# frozen_string_literal: true

module Increase
  module Resources
    class ExternalAccounts
      # Some parameter documentations has been truncated, see
      # {Increase::Models::ExternalAccountCreateParams} for more details.
      #
      # Create an External Account
      #
      # @overload create(account_number:, description:, routing_number:, account_holder: nil, funding: nil, request_options: {})
      #
      # @param account_number [String] The account number for the destination account.
      #
      # @param description [String] The name you choose for the Account.
      #
      # @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the des
      #
      # @param account_holder [Symbol, Increase::Models::ExternalAccountCreateParams::AccountHolder] The type of entity that owns the External Account.
      #
      # @param funding [Symbol, Increase::Models::ExternalAccountCreateParams::Funding] The type of the destination account. Defaults to `checking`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ExternalAccount]
      #
      # @see Increase::Models::ExternalAccountCreateParams
      def create(params)
        parsed, options = Increase::ExternalAccountCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "external_accounts",
          body: parsed,
          model: Increase::ExternalAccount,
          options: options
        )
      end

      # Retrieve an External Account
      #
      # @overload retrieve(external_account_id, request_options: {})
      #
      # @param external_account_id [String] The identifier of the External Account.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ExternalAccount]
      #
      # @see Increase::Models::ExternalAccountRetrieveParams
      def retrieve(external_account_id, params = {})
        @client.request(
          method: :get,
          path: ["external_accounts/%1$s", external_account_id],
          model: Increase::ExternalAccount,
          options: params[:request_options]
        )
      end

      # Update an External Account
      #
      # @overload update(external_account_id, account_holder: nil, description: nil, funding: nil, status: nil, request_options: {})
      #
      # @param external_account_id [String] The external account identifier.
      #
      # @param account_holder [Symbol, Increase::Models::ExternalAccountUpdateParams::AccountHolder] The type of entity that owns the External Account.
      #
      # @param description [String] The description you choose to give the external account.
      #
      # @param funding [Symbol, Increase::Models::ExternalAccountUpdateParams::Funding] The funding type of the External Account.
      #
      # @param status [Symbol, Increase::Models::ExternalAccountUpdateParams::Status] The status of the External Account.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ExternalAccount]
      #
      # @see Increase::Models::ExternalAccountUpdateParams
      def update(external_account_id, params = {})
        parsed, options = Increase::ExternalAccountUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["external_accounts/%1$s", external_account_id],
          body: parsed,
          model: Increase::ExternalAccount,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::ExternalAccountListParams} for more details.
      #
      # List External Accounts
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, routing_number: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param routing_number [String] Filter External Accounts to those with the specified Routing Number.
      #
      # @param status [Increase::Models::ExternalAccountListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ExternalAccountListResponse]
      #
      # @see Increase::Models::ExternalAccountListParams
      def list(params = {})
        parsed, options = Increase::ExternalAccountListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "external_accounts",
          query: parsed,
          model: Increase::Models::ExternalAccountListResponse,
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
