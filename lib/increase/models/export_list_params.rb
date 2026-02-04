# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Exports#list
    class ExportListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute category
      #   Filter Exports for those with the specified category.
      #
      #   @return [Symbol, Increase::Models::ExportListParams::Category, nil]
      optional :category, enum: -> { Increase::ExportListParams::Category }

      # @!attribute created_at
      #
      #   @return [Increase::Models::ExportListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::ExportListParams::CreatedAt }

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute form_1099_int
      #
      #   @return [Increase::Models::ExportListParams::Form1099Int, nil]
      optional :form_1099_int, -> { Increase::ExportListParams::Form1099Int }

      # @!attribute form_1099_misc
      #
      #   @return [Increase::Models::ExportListParams::Form1099Misc, nil]
      optional :form_1099_misc, -> { Increase::ExportListParams::Form1099Misc }

      # @!attribute idempotency_key
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #
      #   @return [Increase::Models::ExportListParams::Status, nil]
      optional :status, -> { Increase::ExportListParams::Status }

      # @!method initialize(category: nil, created_at: nil, cursor: nil, form_1099_int: nil, form_1099_misc: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::ExportListParams} for more details.
      #
      #   @param category [Symbol, Increase::Models::ExportListParams::Category] Filter Exports for those with the specified category.
      #
      #   @param created_at [Increase::Models::ExportListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param form_1099_int [Increase::Models::ExportListParams::Form1099Int]
      #
      #   @param form_1099_misc [Increase::Models::ExportListParams::Form1099Misc]
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param status [Increase::Models::ExportListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # Filter Exports for those with the specified category.
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

        # Certain dashboard tables are available as CSV exports. This export cannot be created via the API.
        DASHBOARD_TABLE_CSV = :dashboard_table_csv

        # A PDF of an account verification letter.
        ACCOUNT_VERIFICATION_LETTER = :account_verification_letter

        # A PDF of funding instructions.
        FUNDING_INSTRUCTIONS = :funding_instructions

        # A PDF of an Internal Revenue Service Form 1099-INT.
        FORM_1099_INT = :form_1099_int

        # A PDF of an Internal Revenue Service Form 1099-MISC.
        FORM_1099_MISC = :form_1099_misc

        # @!method self.values
        #   @return [Array<Symbol>]
      end

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
        #   {Increase::Models::ExportListParams::CreatedAt} for more details.
        #
        #   @param after [Time] Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) tim
        #
        #   @param before [Time] Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ti
        #
        #   @param on_or_after [Time] Return results on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_860
        #
        #   @param on_or_before [Time] Return results on or before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_86
      end

      class Form1099Int < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   Filter Form 1099-INT Exports to those for the specified Account.
        #
        #   @return [String, nil]
        optional :account_id, String

        # @!method initialize(account_id: nil)
        #   @param account_id [String] Filter Form 1099-INT Exports to those for the specified Account.
      end

      class Form1099Misc < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   Filter Form 1099-MISC Exports to those for the specified Account.
        #
        #   @return [String, nil]
        optional :account_id, String

        # @!method initialize(account_id: nil)
        #   @param account_id [String] Filter Form 1099-MISC Exports to those for the specified Account.
      end

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter Exports for those with the specified status or statuses. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::ExportListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::ExportListParams::Status::In] },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ExportListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::Models::ExportListParams::Status::In>] Filter Exports for those with the specified status or statuses. For GET requests

        module In
          extend Increase::Internal::Type::Enum

          # Increase is generating the export.
          PENDING = :pending

          # The export has been successfully generated.
          COMPLETE = :complete

          # The export failed to generate. Increase will reach out to you to resolve the issue.
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
