# frozen_string_literal: true

module Increase
  module Resources
    class AccountStatements
      # Retrieve an Account Statement
      #
      # @overload retrieve(account_statement_id, request_options: {})
      #
      # @param account_statement_id [String] The identifier of the Account Statement to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountStatement]
      #
      # @see Increase::Models::AccountStatementRetrieveParams
      def retrieve(account_statement_id, params = {})
        @client.request(
          method: :get,
          path: ["account_statements/%1$s", account_statement_id],
          model: Increase::AccountStatement,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::AccountStatementListParams} for more details.
      #
      # List Account Statements
      #
      # @overload list(account_id: nil, cursor: nil, limit: nil, statement_period_start: nil, request_options: {})
      #
      # @param account_id [String] Filter Account Statements to those belonging to the specified Account.
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param statement_period_start [Increase::Models::AccountStatementListParams::StatementPeriodStart]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountStatementListResponse]
      #
      # @see Increase::Models::AccountStatementListParams
      def list(params = {})
        parsed, options = Increase::AccountStatementListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "account_statements",
          query: parsed,
          model: Increase::Models::AccountStatementListResponse,
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
