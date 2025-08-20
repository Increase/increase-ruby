# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Exports#create
    class ExportCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute category
      #   The type of Export to create.
      #
      #   @return [Symbol, Increase::Models::ExportCreateParams::Category]
      required :category, enum: -> { Increase::ExportCreateParams::Category }

      # @!attribute account_statement_bai2
      #   Options for the created export. Required if `category` is equal to
      #   `account_statement_bai2`.
      #
      #   @return [Increase::Models::ExportCreateParams::AccountStatementBai2, nil]
      optional :account_statement_bai2, -> { Increase::ExportCreateParams::AccountStatementBai2 }

      # @!attribute account_statement_ofx
      #   Options for the created export. Required if `category` is equal to
      #   `account_statement_ofx`.
      #
      #   @return [Increase::Models::ExportCreateParams::AccountStatementOfx, nil]
      optional :account_statement_ofx, -> { Increase::ExportCreateParams::AccountStatementOfx }

      # @!attribute balance_csv
      #   Options for the created export. Required if `category` is equal to
      #   `balance_csv`.
      #
      #   @return [Increase::Models::ExportCreateParams::BalanceCsv, nil]
      optional :balance_csv, -> { Increase::ExportCreateParams::BalanceCsv }

      # @!attribute bookkeeping_account_balance_csv
      #   Options for the created export. Required if `category` is equal to
      #   `bookkeeping_account_balance_csv`.
      #
      #   @return [Increase::Models::ExportCreateParams::BookkeepingAccountBalanceCsv, nil]
      optional :bookkeeping_account_balance_csv,
               -> { Increase::ExportCreateParams::BookkeepingAccountBalanceCsv }

      # @!attribute entity_csv
      #   Options for the created export. Required if `category` is equal to `entity_csv`.
      #
      #   @return [Increase::Models::ExportCreateParams::EntityCsv, nil]
      optional :entity_csv, -> { Increase::ExportCreateParams::EntityCsv }

      # @!attribute transaction_csv
      #   Options for the created export. Required if `category` is equal to
      #   `transaction_csv`.
      #
      #   @return [Increase::Models::ExportCreateParams::TransactionCsv, nil]
      optional :transaction_csv, -> { Increase::ExportCreateParams::TransactionCsv }

      # @!attribute vendor_csv
      #   Options for the created export. Required if `category` is equal to `vendor_csv`.
      #
      #   @return [Object, nil]
      optional :vendor_csv, Increase::Internal::Type::Unknown

      # @!method initialize(category:, account_statement_bai2: nil, account_statement_ofx: nil, balance_csv: nil, bookkeeping_account_balance_csv: nil, entity_csv: nil, transaction_csv: nil, vendor_csv: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::ExportCreateParams} for more details.
      #
      #   @param category [Symbol, Increase::Models::ExportCreateParams::Category] The type of Export to create.
      #
      #   @param account_statement_bai2 [Increase::Models::ExportCreateParams::AccountStatementBai2] Options for the created export. Required if `category` is equal to `account_stat
      #
      #   @param account_statement_ofx [Increase::Models::ExportCreateParams::AccountStatementOfx] Options for the created export. Required if `category` is equal to `account_stat
      #
      #   @param balance_csv [Increase::Models::ExportCreateParams::BalanceCsv] Options for the created export. Required if `category` is equal to `balance_csv`
      #
      #   @param bookkeeping_account_balance_csv [Increase::Models::ExportCreateParams::BookkeepingAccountBalanceCsv] Options for the created export. Required if `category` is equal to
      #   `bookkeeping\_
      #
      #   @param entity_csv [Increase::Models::ExportCreateParams::EntityCsv] Options for the created export. Required if `category` is equal to `entity_csv`.
      #
      #   @param transaction_csv [Increase::Models::ExportCreateParams::TransactionCsv] Options for the created export. Required if `category` is equal to
      #   `transaction\_
      #
      #   @param vendor_csv [Object] Options for the created export. Required if `category` is equal to `vendor_csv`.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The type of Export to create.
      module Category
        extend Increase::Internal::Type::Enum

        # Export an Open Financial Exchange (OFX) file of transactions and balances for a given time range and Account.
        ACCOUNT_STATEMENT_OFX = :account_statement_ofx

        # Export a BAI2 file of transactions and balances for a given date and optional Account.
        ACCOUNT_STATEMENT_BAI2 = :account_statement_bai2

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

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class AccountStatementBai2 < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The Account to create a BAI2 report for. If not provided, all open accounts will
        #   be included.
        #
        #   @return [String, nil]
        optional :account_id, String

        # @!attribute effective_date
        #   The date to create a BAI2 report for. If not provided, the current date will be
        #   used. The timezone is UTC. If the current date is used, the report will include
        #   intraday balances, otherwise it will include end-of-day balances for the
        #   provided date.
        #
        #   @return [Date, nil]
        optional :effective_date, Date

        # @!method initialize(account_id: nil, effective_date: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ExportCreateParams::AccountStatementBai2} for more details.
        #
        #   Options for the created export. Required if `category` is equal to
        #   `account_statement_bai2`.
        #
        #   @param account_id [String] The Account to create a BAI2 report for. If not provided, all open accounts will
        #
        #   @param effective_date [Date] The date to create a BAI2 report for. If not provided, the current date will be
      end

      class AccountStatementOfx < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The Account to create a statement for.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute created_at
        #   Filter results by time range on the `created_at` attribute.
        #
        #   @return [Increase::Models::ExportCreateParams::AccountStatementOfx::CreatedAt, nil]
        optional :created_at, -> { Increase::ExportCreateParams::AccountStatementOfx::CreatedAt }

        # @!method initialize(account_id:, created_at: nil)
        #   Options for the created export. Required if `category` is equal to
        #   `account_statement_ofx`.
        #
        #   @param account_id [String] The Account to create a statement for.
        #
        #   @param created_at [Increase::Models::ExportCreateParams::AccountStatementOfx::CreatedAt] Filter results by time range on the `created_at` attribute.

        # @see Increase::Models::ExportCreateParams::AccountStatementOfx#created_at
        class CreatedAt < Increase::Internal::Type::BaseModel
          # @!attribute after
          #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          #   timestamp.
          #
          #   @return [Time, nil]
          optional :after, Time

          # @!attribute before
          #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          #   timestamp.
          #
          #   @return [Time, nil]
          optional :before, Time

          # @!attribute on_or_after
          #   Return results on or after this
          #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          #
          #   @return [Time, nil]
          optional :on_or_after, Time

          # @!attribute on_or_before
          #   Return results on or before this
          #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          #
          #   @return [Time, nil]
          optional :on_or_before, Time

          # @!method initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::ExportCreateParams::AccountStatementOfx::CreatedAt} for more
          #   details.
          #
          #   Filter results by time range on the `created_at` attribute.
          #
          #   @param after [Time] Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) tim
          #
          #   @param before [Time] Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ti
          #
          #   @param on_or_after [Time] Return results on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_860
          #
          #   @param on_or_before [Time] Return results on or before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_86
        end
      end

      class BalanceCsv < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   Filter exported Transactions to the specified Account.
        #
        #   @return [String, nil]
        optional :account_id, String

        # @!attribute created_at
        #   Filter results by time range on the `created_at` attribute.
        #
        #   @return [Increase::Models::ExportCreateParams::BalanceCsv::CreatedAt, nil]
        optional :created_at, -> { Increase::ExportCreateParams::BalanceCsv::CreatedAt }

        # @!attribute program_id
        #   Filter exported Transactions to the specified Program.
        #
        #   @return [String, nil]
        optional :program_id, String

        # @!method initialize(account_id: nil, created_at: nil, program_id: nil)
        #   Options for the created export. Required if `category` is equal to
        #   `balance_csv`.
        #
        #   @param account_id [String] Filter exported Transactions to the specified Account.
        #
        #   @param created_at [Increase::Models::ExportCreateParams::BalanceCsv::CreatedAt] Filter results by time range on the `created_at` attribute.
        #
        #   @param program_id [String] Filter exported Transactions to the specified Program.

        # @see Increase::Models::ExportCreateParams::BalanceCsv#created_at
        class CreatedAt < Increase::Internal::Type::BaseModel
          # @!attribute after
          #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          #   timestamp.
          #
          #   @return [Time, nil]
          optional :after, Time

          # @!attribute before
          #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          #   timestamp.
          #
          #   @return [Time, nil]
          optional :before, Time

          # @!attribute on_or_after
          #   Return results on or after this
          #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          #
          #   @return [Time, nil]
          optional :on_or_after, Time

          # @!attribute on_or_before
          #   Return results on or before this
          #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          #
          #   @return [Time, nil]
          optional :on_or_before, Time

          # @!method initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::ExportCreateParams::BalanceCsv::CreatedAt} for more details.
          #
          #   Filter results by time range on the `created_at` attribute.
          #
          #   @param after [Time] Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) tim
          #
          #   @param before [Time] Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ti
          #
          #   @param on_or_after [Time] Return results on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_860
          #
          #   @param on_or_before [Time] Return results on or before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_86
        end
      end

      class BookkeepingAccountBalanceCsv < Increase::Internal::Type::BaseModel
        # @!attribute bookkeeping_account_id
        #   Filter exported Transactions to the specified Bookkeeping Account.
        #
        #   @return [String, nil]
        optional :bookkeeping_account_id, String

        # @!attribute created_at
        #   Filter results by time range on the `created_at` attribute.
        #
        #   @return [Increase::Models::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt, nil]
        optional :created_at, -> { Increase::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt }

        # @!method initialize(bookkeeping_account_id: nil, created_at: nil)
        #   Options for the created export. Required if `category` is equal to
        #   `bookkeeping_account_balance_csv`.
        #
        #   @param bookkeeping_account_id [String] Filter exported Transactions to the specified Bookkeeping Account.
        #
        #   @param created_at [Increase::Models::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt] Filter results by time range on the `created_at` attribute.

        # @see Increase::Models::ExportCreateParams::BookkeepingAccountBalanceCsv#created_at
        class CreatedAt < Increase::Internal::Type::BaseModel
          # @!attribute after
          #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          #   timestamp.
          #
          #   @return [Time, nil]
          optional :after, Time

          # @!attribute before
          #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          #   timestamp.
          #
          #   @return [Time, nil]
          optional :before, Time

          # @!attribute on_or_after
          #   Return results on or after this
          #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          #
          #   @return [Time, nil]
          optional :on_or_after, Time

          # @!attribute on_or_before
          #   Return results on or before this
          #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          #
          #   @return [Time, nil]
          optional :on_or_before, Time

          # @!method initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt}
          #   for more details.
          #
          #   Filter results by time range on the `created_at` attribute.
          #
          #   @param after [Time] Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) tim
          #
          #   @param before [Time] Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ti
          #
          #   @param on_or_after [Time] Return results on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_860
          #
          #   @param on_or_before [Time] Return results on or before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_86
        end
      end

      class EntityCsv < Increase::Internal::Type::BaseModel
        # @!attribute status
        #   Entity statuses to filter by.
        #
        #   @return [Increase::Models::ExportCreateParams::EntityCsv::Status, nil]
        optional :status, -> { Increase::ExportCreateParams::EntityCsv::Status }

        # @!method initialize(status: nil)
        #   Options for the created export. Required if `category` is equal to `entity_csv`.
        #
        #   @param status [Increase::Models::ExportCreateParams::EntityCsv::Status] Entity statuses to filter by.

        # @see Increase::Models::ExportCreateParams::EntityCsv#status
        class Status < Increase::Internal::Type::BaseModel
          # @!attribute in_
          #   Entity statuses to filter by. For GET requests, this should be encoded as a
          #   comma-delimited string, such as `?in=one,two,three`.
          #
          #   @return [Array<Symbol, Increase::Models::ExportCreateParams::EntityCsv::Status::In>]
          required :in_,
                   -> {
                     Increase::Internal::Type::ArrayOf[enum: Increase::ExportCreateParams::EntityCsv::Status::In]
                   },
                   api_name: :in

          # @!method initialize(in_:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::ExportCreateParams::EntityCsv::Status} for more details.
          #
          #   Entity statuses to filter by.
          #
          #   @param in_ [Array<Symbol, Increase::Models::ExportCreateParams::EntityCsv::Status::In>] Entity statuses to filter by. For GET requests, this should be encoded as a comm

          module In
            extend Increase::Internal::Type::Enum

            # The entity is active.
            ACTIVE = :active

            # The entity is archived, and can no longer be used to create accounts.
            ARCHIVED = :archived

            # The entity is temporarily disabled and cannot be used for financial activity.
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      class TransactionCsv < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   Filter exported Transactions to the specified Account.
        #
        #   @return [String, nil]
        optional :account_id, String

        # @!attribute created_at
        #   Filter results by time range on the `created_at` attribute.
        #
        #   @return [Increase::Models::ExportCreateParams::TransactionCsv::CreatedAt, nil]
        optional :created_at, -> { Increase::ExportCreateParams::TransactionCsv::CreatedAt }

        # @!attribute program_id
        #   Filter exported Transactions to the specified Program.
        #
        #   @return [String, nil]
        optional :program_id, String

        # @!method initialize(account_id: nil, created_at: nil, program_id: nil)
        #   Options for the created export. Required if `category` is equal to
        #   `transaction_csv`.
        #
        #   @param account_id [String] Filter exported Transactions to the specified Account.
        #
        #   @param created_at [Increase::Models::ExportCreateParams::TransactionCsv::CreatedAt] Filter results by time range on the `created_at` attribute.
        #
        #   @param program_id [String] Filter exported Transactions to the specified Program.

        # @see Increase::Models::ExportCreateParams::TransactionCsv#created_at
        class CreatedAt < Increase::Internal::Type::BaseModel
          # @!attribute after
          #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          #   timestamp.
          #
          #   @return [Time, nil]
          optional :after, Time

          # @!attribute before
          #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          #   timestamp.
          #
          #   @return [Time, nil]
          optional :before, Time

          # @!attribute on_or_after
          #   Return results on or after this
          #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          #
          #   @return [Time, nil]
          optional :on_or_after, Time

          # @!attribute on_or_before
          #   Return results on or before this
          #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          #
          #   @return [Time, nil]
          optional :on_or_before, Time

          # @!method initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::ExportCreateParams::TransactionCsv::CreatedAt} for more
          #   details.
          #
          #   Filter results by time range on the `created_at` attribute.
          #
          #   @param after [Time] Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) tim
          #
          #   @param before [Time] Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ti
          #
          #   @param on_or_after [Time] Return results on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_860
          #
          #   @param on_or_before [Time] Return results on or before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_86
        end
      end
    end
  end
end
