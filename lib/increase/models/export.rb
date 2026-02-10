# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Exports#create
    class Export < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Export identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_statement_bai2
      #   Details of the account statement BAI2 export. This field will be present when
      #   the `category` is equal to `account_statement_bai2`.
      #
      #   @return [Increase::Models::Export::AccountStatementBai2, nil]
      required :account_statement_bai2, -> { Increase::Export::AccountStatementBai2 }, nil?: true

      # @!attribute account_statement_ofx
      #   Details of the account statement OFX export. This field will be present when the
      #   `category` is equal to `account_statement_ofx`.
      #
      #   @return [Increase::Models::Export::AccountStatementOfx, nil]
      required :account_statement_ofx, -> { Increase::Export::AccountStatementOfx }, nil?: true

      # @!attribute account_verification_letter
      #   Details of the account verification letter export. This field will be present
      #   when the `category` is equal to `account_verification_letter`.
      #
      #   @return [Increase::Models::Export::AccountVerificationLetter, nil]
      required :account_verification_letter, -> { Increase::Export::AccountVerificationLetter }, nil?: true

      # @!attribute balance_csv
      #   Details of the balance CSV export. This field will be present when the
      #   `category` is equal to `balance_csv`.
      #
      #   @return [Increase::Models::Export::BalanceCsv, nil]
      required :balance_csv, -> { Increase::Export::BalanceCsv }, nil?: true

      # @!attribute bookkeeping_account_balance_csv
      #   Details of the bookkeeping account balance CSV export. This field will be
      #   present when the `category` is equal to `bookkeeping_account_balance_csv`.
      #
      #   @return [Increase::Models::Export::BookkeepingAccountBalanceCsv, nil]
      required :bookkeeping_account_balance_csv,
               -> { Increase::Export::BookkeepingAccountBalanceCsv },
               nil?: true

      # @!attribute category
      #   The category of the Export. We may add additional possible values for this enum
      #   over time; your application should be able to handle that gracefully.
      #
      #   @return [Symbol, Increase::Models::Export::Category]
      required :category, enum: -> { Increase::Export::Category }

      # @!attribute created_at
      #   The time the Export was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute dashboard_table_csv
      #   Details of the dashboard table CSV export. This field will be present when the
      #   `category` is equal to `dashboard_table_csv`.
      #
      #   @return [Increase::Models::Export::DashboardTableCsv, nil]
      required :dashboard_table_csv, -> { Increase::Export::DashboardTableCsv }, nil?: true

      # @!attribute entity_csv
      #   Details of the entity CSV export. This field will be present when the `category`
      #   is equal to `entity_csv`.
      #
      #   @return [Increase::Models::Export::EntityCsv, nil]
      required :entity_csv, -> { Increase::Export::EntityCsv }, nil?: true

      # @!attribute form_1099_int
      #   Details of the Form 1099-INT export. This field will be present when the
      #   `category` is equal to `form_1099_int`.
      #
      #   @return [Increase::Models::Export::Form1099Int, nil]
      required :form_1099_int, -> { Increase::Export::Form1099Int }, nil?: true

      # @!attribute form_1099_misc
      #   Details of the Form 1099-MISC export. This field will be present when the
      #   `category` is equal to `form_1099_misc`.
      #
      #   @return [Increase::Models::Export::Form1099Misc, nil]
      required :form_1099_misc, -> { Increase::Export::Form1099Misc }, nil?: true

      # @!attribute funding_instructions
      #   Details of the funding instructions export. This field will be present when the
      #   `category` is equal to `funding_instructions`.
      #
      #   @return [Increase::Models::Export::FundingInstructions, nil]
      required :funding_instructions, -> { Increase::Export::FundingInstructions }, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute result
      #   The result of the Export. This will be present when the Export's status
      #   transitions to `complete`.
      #
      #   @return [Increase::Models::Export::Result, nil]
      required :result, -> { Increase::Export::Result }, nil?: true

      # @!attribute status
      #   The status of the Export.
      #
      #   @return [Symbol, Increase::Models::Export::Status]
      required :status, enum: -> { Increase::Export::Status }

      # @!attribute transaction_csv
      #   Details of the transaction CSV export. This field will be present when the
      #   `category` is equal to `transaction_csv`.
      #
      #   @return [Increase::Models::Export::TransactionCsv, nil]
      required :transaction_csv, -> { Increase::Export::TransactionCsv }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `export`.
      #
      #   @return [Symbol, Increase::Models::Export::Type]
      required :type, enum: -> { Increase::Export::Type }

      # @!attribute vendor_csv
      #   Details of the vendor CSV export. This field will be present when the `category`
      #   is equal to `vendor_csv`.
      #
      #   @return [Increase::Models::Export::VendorCsv, nil]
      required :vendor_csv, -> { Increase::Export::VendorCsv }, nil?: true

      # @!attribute voided_check
      #   Details of the voided check export. This field will be present when the
      #   `category` is equal to `voided_check`.
      #
      #   @return [Increase::Models::Export::VoidedCheck, nil]
      required :voided_check, -> { Increase::Export::VoidedCheck }, nil?: true

      # @!method initialize(id:, account_statement_bai2:, account_statement_ofx:, account_verification_letter:, balance_csv:, bookkeeping_account_balance_csv:, category:, created_at:, dashboard_table_csv:, entity_csv:, form_1099_int:, form_1099_misc:, funding_instructions:, idempotency_key:, result:, status:, transaction_csv:, type:, vendor_csv:, voided_check:)
      #   Some parameter documentations has been truncated, see {Increase::Models::Export}
      #   for more details.
      #
      #   Exports are generated files. Some exports can contain a lot of data, like a CSV
      #   of your transactions. Others can be a single document, like a tax form. Since
      #   they can take a while, they are generated asynchronously. We send a webhook when
      #   they are ready. For more information, please read our
      #   [Exports documentation](https://increase.com/documentation/exports).
      #
      #   @param id [String] The Export identifier.
      #
      #   @param account_statement_bai2 [Increase::Models::Export::AccountStatementBai2, nil] Details of the account statement BAI2 export. This field will be present when th
      #
      #   @param account_statement_ofx [Increase::Models::Export::AccountStatementOfx, nil] Details of the account statement OFX export. This field will be present when the
      #
      #   @param account_verification_letter [Increase::Models::Export::AccountVerificationLetter, nil] Details of the account verification letter export. This field will be present wh
      #
      #   @param balance_csv [Increase::Models::Export::BalanceCsv, nil] Details of the balance CSV export. This field will be present when the `category
      #
      #   @param bookkeeping_account_balance_csv [Increase::Models::Export::BookkeepingAccountBalanceCsv, nil] Details of the bookkeeping account balance CSV export. This field will be presen
      #
      #   @param category [Symbol, Increase::Models::Export::Category] The category of the Export. We may add additional possible values for this enum
      #
      #   @param created_at [Time] The time the Export was created.
      #
      #   @param dashboard_table_csv [Increase::Models::Export::DashboardTableCsv, nil] Details of the dashboard table CSV export. This field will be present when the `
      #
      #   @param entity_csv [Increase::Models::Export::EntityCsv, nil] Details of the entity CSV export. This field will be present when the `category`
      #
      #   @param form_1099_int [Increase::Models::Export::Form1099Int, nil] Details of the Form 1099-INT export. This field will be present when the `catego
      #
      #   @param form_1099_misc [Increase::Models::Export::Form1099Misc, nil] Details of the Form 1099-MISC export. This field will be present when the `categ
      #
      #   @param funding_instructions [Increase::Models::Export::FundingInstructions, nil] Details of the funding instructions export. This field will be present when the
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param result [Increase::Models::Export::Result, nil] The result of the Export. This will be present when the Export's status transiti
      #
      #   @param status [Symbol, Increase::Models::Export::Status] The status of the Export.
      #
      #   @param transaction_csv [Increase::Models::Export::TransactionCsv, nil] Details of the transaction CSV export. This field will be present when the `cate
      #
      #   @param type [Symbol, Increase::Models::Export::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param vendor_csv [Increase::Models::Export::VendorCsv, nil] Details of the vendor CSV export. This field will be present when the `category`
      #
      #   @param voided_check [Increase::Models::Export::VoidedCheck, nil] Details of the voided check export. This field will be present when the `categor

      # @see Increase::Models::Export#account_statement_bai2
      class AccountStatementBai2 < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   Filter results by Account.
        #
        #   @return [String, nil]
        required :account_id, String, nil?: true

        # @!attribute effective_date
        #   The date for which to retrieve the balance.
        #
        #   @return [Date, nil]
        required :effective_date, Date, nil?: true

        # @!attribute program_id
        #   Filter results by Program.
        #
        #   @return [String, nil]
        required :program_id, String, nil?: true

        # @!method initialize(account_id:, effective_date:, program_id:)
        #   Details of the account statement BAI2 export. This field will be present when
        #   the `category` is equal to `account_statement_bai2`.
        #
        #   @param account_id [String, nil] Filter results by Account.
        #
        #   @param effective_date [Date, nil] The date for which to retrieve the balance.
        #
        #   @param program_id [String, nil] Filter results by Program.
      end

      # @see Increase::Models::Export#account_statement_ofx
      class AccountStatementOfx < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The Account to create a statement for.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute created_at
        #   Filter transactions by their created date.
        #
        #   @return [Increase::Models::Export::AccountStatementOfx::CreatedAt, nil]
        required :created_at, -> { Increase::Export::AccountStatementOfx::CreatedAt }, nil?: true

        # @!method initialize(account_id:, created_at:)
        #   Details of the account statement OFX export. This field will be present when the
        #   `category` is equal to `account_statement_ofx`.
        #
        #   @param account_id [String] The Account to create a statement for.
        #
        #   @param created_at [Increase::Models::Export::AccountStatementOfx::CreatedAt, nil] Filter transactions by their created date.

        # @see Increase::Models::Export::AccountStatementOfx#created_at
        class CreatedAt < Increase::Internal::Type::BaseModel
          # @!attribute after
          #   Filter results to transactions created after this time.
          #
          #   @return [Time, nil]
          required :after, Time, nil?: true

          # @!attribute before
          #   Filter results to transactions created before this time.
          #
          #   @return [Time, nil]
          required :before, Time, nil?: true

          # @!method initialize(after:, before:)
          #   Filter transactions by their created date.
          #
          #   @param after [Time, nil] Filter results to transactions created after this time.
          #
          #   @param before [Time, nil] Filter results to transactions created before this time.
        end
      end

      # @see Increase::Models::Export#account_verification_letter
      class AccountVerificationLetter < Increase::Internal::Type::BaseModel
        # @!attribute account_number_id
        #   The Account Number to create a letter for.
        #
        #   @return [String]
        required :account_number_id, String

        # @!attribute balance_date
        #   The date of the balance to include in the letter.
        #
        #   @return [Date, nil]
        required :balance_date, Date, nil?: true

        # @!method initialize(account_number_id:, balance_date:)
        #   Details of the account verification letter export. This field will be present
        #   when the `category` is equal to `account_verification_letter`.
        #
        #   @param account_number_id [String] The Account Number to create a letter for.
        #
        #   @param balance_date [Date, nil] The date of the balance to include in the letter.
      end

      # @see Increase::Models::Export#balance_csv
      class BalanceCsv < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   Filter results by Account.
        #
        #   @return [String, nil]
        required :account_id, String, nil?: true

        # @!attribute created_at
        #   Filter balances by their created date.
        #
        #   @return [Increase::Models::Export::BalanceCsv::CreatedAt, nil]
        required :created_at, -> { Increase::Export::BalanceCsv::CreatedAt }, nil?: true

        # @!method initialize(account_id:, created_at:)
        #   Details of the balance CSV export. This field will be present when the
        #   `category` is equal to `balance_csv`.
        #
        #   @param account_id [String, nil] Filter results by Account.
        #
        #   @param created_at [Increase::Models::Export::BalanceCsv::CreatedAt, nil] Filter balances by their created date.

        # @see Increase::Models::Export::BalanceCsv#created_at
        class CreatedAt < Increase::Internal::Type::BaseModel
          # @!attribute after
          #   Filter balances created after this time.
          #
          #   @return [Time, nil]
          required :after, Time, nil?: true

          # @!attribute before
          #   Filter balances created before this time.
          #
          #   @return [Time, nil]
          required :before, Time, nil?: true

          # @!method initialize(after:, before:)
          #   Filter balances by their created date.
          #
          #   @param after [Time, nil] Filter balances created after this time.
          #
          #   @param before [Time, nil] Filter balances created before this time.
        end
      end

      # @see Increase::Models::Export#bookkeeping_account_balance_csv
      class BookkeepingAccountBalanceCsv < Increase::Internal::Type::BaseModel
        # @!attribute bookkeeping_account_id
        #   Filter results by Bookkeeping Account.
        #
        #   @return [String, nil]
        required :bookkeeping_account_id, String, nil?: true

        # @!attribute created_at
        #   Filter balances by their created date.
        #
        #   @return [Increase::Models::Export::BookkeepingAccountBalanceCsv::CreatedAt, nil]
        required :created_at, -> { Increase::Export::BookkeepingAccountBalanceCsv::CreatedAt }, nil?: true

        # @!method initialize(bookkeeping_account_id:, created_at:)
        #   Details of the bookkeeping account balance CSV export. This field will be
        #   present when the `category` is equal to `bookkeeping_account_balance_csv`.
        #
        #   @param bookkeeping_account_id [String, nil] Filter results by Bookkeeping Account.
        #
        #   @param created_at [Increase::Models::Export::BookkeepingAccountBalanceCsv::CreatedAt, nil] Filter balances by their created date.

        # @see Increase::Models::Export::BookkeepingAccountBalanceCsv#created_at
        class CreatedAt < Increase::Internal::Type::BaseModel
          # @!attribute after
          #   Filter balances created after this time.
          #
          #   @return [Time, nil]
          required :after, Time, nil?: true

          # @!attribute before
          #   Filter balances created before this time.
          #
          #   @return [Time, nil]
          required :before, Time, nil?: true

          # @!method initialize(after:, before:)
          #   Filter balances by their created date.
          #
          #   @param after [Time, nil] Filter balances created after this time.
          #
          #   @param before [Time, nil] Filter balances created before this time.
        end
      end

      # The category of the Export. We may add additional possible values for this enum
      # over time; your application should be able to handle that gracefully.
      #
      # @see Increase::Models::Export#category
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

        # A PDF of a voided check.
        VOIDED_CHECK = :voided_check

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::Export#dashboard_table_csv
      class DashboardTableCsv < Increase::Internal::Type::BaseModel
        # @!method initialize
        #   Details of the dashboard table CSV export. This field will be present when the
        #   `category` is equal to `dashboard_table_csv`.
      end

      # @see Increase::Models::Export#entity_csv
      class EntityCsv < Increase::Internal::Type::BaseModel
        # @!method initialize
        #   Details of the entity CSV export. This field will be present when the `category`
        #   is equal to `entity_csv`.
      end

      # @see Increase::Models::Export#form_1099_int
      class Form1099Int < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The Account the tax form is for.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute corrected
        #   Whether the tax form is a corrected form.
        #
        #   @return [Boolean]
        required :corrected, Increase::Internal::Type::Boolean

        # @!attribute description
        #   A description of the tax form.
        #
        #   @return [String]
        required :description, String

        # @!attribute year
        #   The tax year for the tax form.
        #
        #   @return [Integer]
        required :year, Integer

        # @!method initialize(account_id:, corrected:, description:, year:)
        #   Details of the Form 1099-INT export. This field will be present when the
        #   `category` is equal to `form_1099_int`.
        #
        #   @param account_id [String] The Account the tax form is for.
        #
        #   @param corrected [Boolean] Whether the tax form is a corrected form.
        #
        #   @param description [String] A description of the tax form.
        #
        #   @param year [Integer] The tax year for the tax form.
      end

      # @see Increase::Models::Export#form_1099_misc
      class Form1099Misc < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The Account the tax form is for.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute corrected
        #   Whether the tax form is a corrected form.
        #
        #   @return [Boolean]
        required :corrected, Increase::Internal::Type::Boolean

        # @!attribute year
        #   The tax year for the tax form.
        #
        #   @return [Integer]
        required :year, Integer

        # @!method initialize(account_id:, corrected:, year:)
        #   Details of the Form 1099-MISC export. This field will be present when the
        #   `category` is equal to `form_1099_misc`.
        #
        #   @param account_id [String] The Account the tax form is for.
        #
        #   @param corrected [Boolean] Whether the tax form is a corrected form.
        #
        #   @param year [Integer] The tax year for the tax form.
      end

      # @see Increase::Models::Export#funding_instructions
      class FundingInstructions < Increase::Internal::Type::BaseModel
        # @!attribute account_number_id
        #   The Account Number to create funding instructions for.
        #
        #   @return [String]
        required :account_number_id, String

        # @!method initialize(account_number_id:)
        #   Details of the funding instructions export. This field will be present when the
        #   `category` is equal to `funding_instructions`.
        #
        #   @param account_number_id [String] The Account Number to create funding instructions for.
      end

      # @see Increase::Models::Export#result
      class Result < Increase::Internal::Type::BaseModel
        # @!attribute file_id
        #   The File containing the contents of the Export.
        #
        #   @return [String]
        required :file_id, String

        # @!method initialize(file_id:)
        #   The result of the Export. This will be present when the Export's status
        #   transitions to `complete`.
        #
        #   @param file_id [String] The File containing the contents of the Export.
      end

      # The status of the Export.
      #
      # @see Increase::Models::Export#status
      module Status
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

      # @see Increase::Models::Export#transaction_csv
      class TransactionCsv < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   Filter results by Account.
        #
        #   @return [String, nil]
        required :account_id, String, nil?: true

        # @!attribute created_at
        #   Filter transactions by their created date.
        #
        #   @return [Increase::Models::Export::TransactionCsv::CreatedAt, nil]
        required :created_at, -> { Increase::Export::TransactionCsv::CreatedAt }, nil?: true

        # @!method initialize(account_id:, created_at:)
        #   Details of the transaction CSV export. This field will be present when the
        #   `category` is equal to `transaction_csv`.
        #
        #   @param account_id [String, nil] Filter results by Account.
        #
        #   @param created_at [Increase::Models::Export::TransactionCsv::CreatedAt, nil] Filter transactions by their created date.

        # @see Increase::Models::Export::TransactionCsv#created_at
        class CreatedAt < Increase::Internal::Type::BaseModel
          # @!attribute after
          #   Filter transactions created after this time.
          #
          #   @return [Time, nil]
          required :after, Time, nil?: true

          # @!attribute before
          #   Filter transactions created before this time.
          #
          #   @return [Time, nil]
          required :before, Time, nil?: true

          # @!method initialize(after:, before:)
          #   Filter transactions by their created date.
          #
          #   @param after [Time, nil] Filter transactions created after this time.
          #
          #   @param before [Time, nil] Filter transactions created before this time.
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `export`.
      #
      # @see Increase::Models::Export#type
      module Type
        extend Increase::Internal::Type::Enum

        EXPORT = :export

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::Export#vendor_csv
      class VendorCsv < Increase::Internal::Type::BaseModel
        # @!method initialize
        #   Details of the vendor CSV export. This field will be present when the `category`
        #   is equal to `vendor_csv`.
      end

      # @see Increase::Models::Export#voided_check
      class VoidedCheck < Increase::Internal::Type::BaseModel
        # @!attribute account_number_id
        #   The Account Number for the voided check.
        #
        #   @return [String]
        required :account_number_id, String

        # @!attribute payer
        #   The payer information printed on the check.
        #
        #   @return [Array<Increase::Models::Export::VoidedCheck::Payer>]
        required :payer, -> { Increase::Internal::Type::ArrayOf[Increase::Export::VoidedCheck::Payer] }

        # @!method initialize(account_number_id:, payer:)
        #   Details of the voided check export. This field will be present when the
        #   `category` is equal to `voided_check`.
        #
        #   @param account_number_id [String] The Account Number for the voided check.
        #
        #   @param payer [Array<Increase::Models::Export::VoidedCheck::Payer>] The payer information printed on the check.

        class Payer < Increase::Internal::Type::BaseModel
          # @!attribute line
          #   The contents of the line.
          #
          #   @return [String]
          required :line, String

          # @!method initialize(line:)
          #   @param line [String] The contents of the line.
        end
      end
    end
  end
end
