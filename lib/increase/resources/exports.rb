# frozen_string_literal: true

module Increase
  module Resources
    class Exports
      # Some parameter documentations has been truncated, see
      # {Increase::Models::ExportCreateParams} for more details.
      #
      # Create an Export
      #
      # @overload create(category:, account_statement_ofx: nil, balance_csv: nil, bookkeeping_account_balance_csv: nil, entity_csv: nil, transaction_csv: nil, vendor_csv: nil, request_options: {})
      #
      # @param category [Symbol, Increase::ExportCreateParams::Category] The type of Export to create.
      #
      # @param account_statement_ofx [Increase::ExportCreateParams::AccountStatementOfx] Options for the created export. Required if `category` is equal to `account_stat
      #
      # @param balance_csv [Increase::ExportCreateParams::BalanceCsv] Options for the created export. Required if `category` is equal to `balance_csv`
      #
      # @param bookkeeping_account_balance_csv [Increase::ExportCreateParams::BookkeepingAccountBalanceCsv] Options for the created export. Required if `category` is equal to
      # `bookkeeping\_
      #
      # @param entity_csv [Increase::ExportCreateParams::EntityCsv] Options for the created export. Required if `category` is equal to `entity_csv`.
      #
      # @param transaction_csv [Increase::ExportCreateParams::TransactionCsv] Options for the created export. Required if `category` is equal to
      # `transaction\_
      #
      # @param vendor_csv [Object] Options for the created export. Required if `category` is equal to `vendor_csv`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Export]
      #
      # @see Increase::Models::ExportCreateParams
      def create(params)
        parsed, options = Increase::ExportCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "exports",
          body: parsed,
          model: Increase::Export,
          options: options
        )
      end

      # Retrieve an Export
      #
      # @overload retrieve(export_id, request_options: {})
      #
      # @param export_id [String] The identifier of the Export to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Export]
      #
      # @see Increase::Models::ExportRetrieveParams
      def retrieve(export_id, params = {})
        @client.request(
          method: :get,
          path: ["exports/%1$s", export_id],
          model: Increase::Export,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::ExportListParams} for more details.
      #
      # List Exports
      #
      # @overload list(category: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param category [Increase::ExportListParams::Category]
      #
      # @param created_at [Increase::ExportListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::ExportListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Export>]
      #
      # @see Increase::Models::ExportListParams
      def list(params = {})
        parsed, options = Increase::ExportListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "exports",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Export,
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
