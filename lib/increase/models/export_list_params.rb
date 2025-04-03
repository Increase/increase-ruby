# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Exports#list
    class ExportListParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] category
      #
      #   @return [Increase::Models::ExportListParams::Category, nil]
      optional :category, -> { Increase::Models::ExportListParams::Category }

      # @!parse
      #   # @return [Increase::Models::ExportListParams::Category]
      #   attr_writer :category

      # @!attribute [r] created_at
      #
      #   @return [Increase::Models::ExportListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::Models::ExportListParams::CreatedAt }

      # @!parse
      #   # @return [Increase::Models::ExportListParams::CreatedAt]
      #   attr_writer :created_at

      # @!attribute [r] cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!parse
      #   # @return [String]
      #   attr_writer :cursor

      # @!attribute [r] idempotency_key
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #     that object. This value is unique across Increase and is used to ensure that a
      #     request is only processed once. Learn more about
      #     [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!parse
      #   # @return [String]
      #   attr_writer :idempotency_key

      # @!attribute [r] limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #     objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :limit

      # @!attribute [r] status
      #
      #   @return [Increase::Models::ExportListParams::Status, nil]
      optional :status, -> { Increase::Models::ExportListParams::Status }

      # @!parse
      #   # @return [Increase::Models::ExportListParams::Status]
      #   attr_writer :status

      # @!parse
      #   # @param category [Increase::Models::ExportListParams::Category]
      #   # @param created_at [Increase::Models::ExportListParams::CreatedAt]
      #   # @param cursor [String]
      #   # @param idempotency_key [String]
      #   # @param limit [Integer]
      #   # @param status [Increase::Models::ExportListParams::Status]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     category: nil,
      #     created_at: nil,
      #     cursor: nil,
      #     idempotency_key: nil,
      #     limit: nil,
      #     status: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class Category < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   Filter Exports for those with the specified category or categories. For GET
        #     requests, this should be encoded as a comma-delimited string, such as
        #     `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::ExportListParams::Category::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::ExportListParams::Category::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::ExportListParams::Category::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::ExportListParams::Category::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        module In
          extend Increase::Internal::Type::Enum

          # Export an Open Financial Exchange (OFX) file of transactions and balances for a given time range and Account.
          ACCOUNT_STATEMENT_OFX = :account_statement_ofx

          # Export a CSV of all transactions for a given time range.
          TRANSACTION_CSV = :transaction_csv

          # Export a CSV of account balances for the dates in a given range.
          BALANCE_CSV = :balance_csv

          # Export a CSV of bookkeeping account balances for the dates in a given range.
          BOOKKEEPING_ACCOUNT_BALANCE_CSV = :bookkeeping_account_balance_csv

          # Export a CSV of entities with a given status.
          ENTITY_CSV = :entity_csv

          # Export a CSV of vendors added to the third-party risk management dashboard.
          VENDOR_CSV = :vendor_csv

          # Certain dashboard tables are available as CSV exports. This export cannot be created via the API.
          DASHBOARD_TABLE_CSV = :dashboard_table_csv

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # @!attribute [r] after
        #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #     timestamp.
        #
        #   @return [Time, nil]
        optional :after, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :after

        # @!attribute [r] before
        #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #     timestamp.
        #
        #   @return [Time, nil]
        optional :before, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :before

        # @!attribute [r] on_or_after
        #   Return results on or after this
        #     [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_after, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :on_or_after

        # @!attribute [r] on_or_before
        #   Return results on or before this
        #     [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_before, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :on_or_before

        # @!parse
        #   # @param after [Time]
        #   # @param before [Time]
        #   # @param on_or_after [Time]
        #   # @param on_or_before [Time]
        #   #
        #   def initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   Filter Exports for those with the specified status or statuses. For GET
        #     requests, this should be encoded as a comma-delimited string, such as
        #     `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::ExportListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::ExportListParams::Status::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::ExportListParams::Status::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::ExportListParams::Status::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        module In
          extend Increase::Internal::Type::Enum

          # Increase is generating the export.
          PENDING = :pending

          # The export has been successfully generated.
          COMPLETE = :complete

          # The export failed to generate. Increase will reach out to you to resolve the issue.
          FAILED = :failed

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
