# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class AccountStatements
        # Simulates an [Account Statement](#account-statements) being created for an
        # account. In production, Account Statements are generated once per month.
        #
        # @overload create(account_id:, request_options: {})
        #
        # @param account_id [String] The identifier of the Account the statement is for.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::AccountStatement]
        #
        # @see Increase::Models::Simulations::AccountStatementCreateParams
        def create(params)
          parsed, options = Increase::Simulations::AccountStatementCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/account_statements",
            body: parsed,
            model: Increase::AccountStatement,
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
end
