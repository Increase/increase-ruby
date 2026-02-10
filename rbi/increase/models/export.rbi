# typed: strong

module Increase
  module Models
    class Export < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Export, Increase::Internal::AnyHash) }

      # The Export identifier.
      sig { returns(String) }
      attr_accessor :id

      # Details of the account statement BAI2 export. This field will be present when
      # the `category` is equal to `account_statement_bai2`.
      sig { returns(T.nilable(Increase::Export::AccountStatementBai2)) }
      attr_reader :account_statement_bai2

      sig do
        params(
          account_statement_bai2:
            T.nilable(Increase::Export::AccountStatementBai2::OrHash)
        ).void
      end
      attr_writer :account_statement_bai2

      # Details of the account statement OFX export. This field will be present when the
      # `category` is equal to `account_statement_ofx`.
      sig { returns(T.nilable(Increase::Export::AccountStatementOfx)) }
      attr_reader :account_statement_ofx

      sig do
        params(
          account_statement_ofx:
            T.nilable(Increase::Export::AccountStatementOfx::OrHash)
        ).void
      end
      attr_writer :account_statement_ofx

      # Details of the account verification letter export. This field will be present
      # when the `category` is equal to `account_verification_letter`.
      sig { returns(T.nilable(Increase::Export::AccountVerificationLetter)) }
      attr_reader :account_verification_letter

      sig do
        params(
          account_verification_letter:
            T.nilable(Increase::Export::AccountVerificationLetter::OrHash)
        ).void
      end
      attr_writer :account_verification_letter

      # Details of the balance CSV export. This field will be present when the
      # `category` is equal to `balance_csv`.
      sig { returns(T.nilable(Increase::Export::BalanceCsv)) }
      attr_reader :balance_csv

      sig do
        params(
          balance_csv: T.nilable(Increase::Export::BalanceCsv::OrHash)
        ).void
      end
      attr_writer :balance_csv

      # Details of the bookkeeping account balance CSV export. This field will be
      # present when the `category` is equal to `bookkeeping_account_balance_csv`.
      sig { returns(T.nilable(Increase::Export::BookkeepingAccountBalanceCsv)) }
      attr_reader :bookkeeping_account_balance_csv

      sig do
        params(
          bookkeeping_account_balance_csv:
            T.nilable(Increase::Export::BookkeepingAccountBalanceCsv::OrHash)
        ).void
      end
      attr_writer :bookkeeping_account_balance_csv

      # The category of the Export. We may add additional possible values for this enum
      # over time; your application should be able to handle that gracefully.
      sig { returns(Increase::Export::Category::TaggedSymbol) }
      attr_accessor :category

      # The time the Export was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Details of the dashboard table CSV export. This field will be present when the
      # `category` is equal to `dashboard_table_csv`.
      sig { returns(T.nilable(Increase::Export::DashboardTableCsv)) }
      attr_reader :dashboard_table_csv

      sig do
        params(
          dashboard_table_csv:
            T.nilable(Increase::Export::DashboardTableCsv::OrHash)
        ).void
      end
      attr_writer :dashboard_table_csv

      # Details of the entity CSV export. This field will be present when the `category`
      # is equal to `entity_csv`.
      sig { returns(T.nilable(Increase::Export::EntityCsv)) }
      attr_reader :entity_csv

      sig do
        params(entity_csv: T.nilable(Increase::Export::EntityCsv::OrHash)).void
      end
      attr_writer :entity_csv

      # Details of the Form 1099-INT export. This field will be present when the
      # `category` is equal to `form_1099_int`.
      sig { returns(T.nilable(Increase::Export::Form1099Int)) }
      attr_reader :form_1099_int

      sig do
        params(
          form_1099_int: T.nilable(Increase::Export::Form1099Int::OrHash)
        ).void
      end
      attr_writer :form_1099_int

      # Details of the Form 1099-MISC export. This field will be present when the
      # `category` is equal to `form_1099_misc`.
      sig { returns(T.nilable(Increase::Export::Form1099Misc)) }
      attr_reader :form_1099_misc

      sig do
        params(
          form_1099_misc: T.nilable(Increase::Export::Form1099Misc::OrHash)
        ).void
      end
      attr_writer :form_1099_misc

      # Details of the funding instructions export. This field will be present when the
      # `category` is equal to `funding_instructions`.
      sig { returns(T.nilable(Increase::Export::FundingInstructions)) }
      attr_reader :funding_instructions

      sig do
        params(
          funding_instructions:
            T.nilable(Increase::Export::FundingInstructions::OrHash)
        ).void
      end
      attr_writer :funding_instructions

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The result of the Export. This will be present when the Export's status
      # transitions to `complete`.
      sig { returns(T.nilable(Increase::Export::Result)) }
      attr_reader :result

      sig { params(result: T.nilable(Increase::Export::Result::OrHash)).void }
      attr_writer :result

      # The status of the Export.
      sig { returns(Increase::Export::Status::TaggedSymbol) }
      attr_accessor :status

      # Details of the transaction CSV export. This field will be present when the
      # `category` is equal to `transaction_csv`.
      sig { returns(T.nilable(Increase::Export::TransactionCsv)) }
      attr_reader :transaction_csv

      sig do
        params(
          transaction_csv: T.nilable(Increase::Export::TransactionCsv::OrHash)
        ).void
      end
      attr_writer :transaction_csv

      # A constant representing the object's type. For this resource it will always be
      # `export`.
      sig { returns(Increase::Export::Type::TaggedSymbol) }
      attr_accessor :type

      # Details of the vendor CSV export. This field will be present when the `category`
      # is equal to `vendor_csv`.
      sig { returns(T.nilable(Increase::Export::VendorCsv)) }
      attr_reader :vendor_csv

      sig do
        params(vendor_csv: T.nilable(Increase::Export::VendorCsv::OrHash)).void
      end
      attr_writer :vendor_csv

      # Details of the voided check export. This field will be present when the
      # `category` is equal to `voided_check`.
      sig { returns(T.nilable(Increase::Export::VoidedCheck)) }
      attr_reader :voided_check

      sig do
        params(
          voided_check: T.nilable(Increase::Export::VoidedCheck::OrHash)
        ).void
      end
      attr_writer :voided_check

      # Exports are generated files. Some exports can contain a lot of data, like a CSV
      # of your transactions. Others can be a single document, like a tax form. Since
      # they can take a while, they are generated asynchronously. We send a webhook when
      # they are ready. For more information, please read our
      # [Exports documentation](https://increase.com/documentation/exports).
      sig do
        params(
          id: String,
          account_statement_bai2:
            T.nilable(Increase::Export::AccountStatementBai2::OrHash),
          account_statement_ofx:
            T.nilable(Increase::Export::AccountStatementOfx::OrHash),
          account_verification_letter:
            T.nilable(Increase::Export::AccountVerificationLetter::OrHash),
          balance_csv: T.nilable(Increase::Export::BalanceCsv::OrHash),
          bookkeeping_account_balance_csv:
            T.nilable(Increase::Export::BookkeepingAccountBalanceCsv::OrHash),
          category: Increase::Export::Category::OrSymbol,
          created_at: Time,
          dashboard_table_csv:
            T.nilable(Increase::Export::DashboardTableCsv::OrHash),
          entity_csv: T.nilable(Increase::Export::EntityCsv::OrHash),
          form_1099_int: T.nilable(Increase::Export::Form1099Int::OrHash),
          form_1099_misc: T.nilable(Increase::Export::Form1099Misc::OrHash),
          funding_instructions:
            T.nilable(Increase::Export::FundingInstructions::OrHash),
          idempotency_key: T.nilable(String),
          result: T.nilable(Increase::Export::Result::OrHash),
          status: Increase::Export::Status::OrSymbol,
          transaction_csv: T.nilable(Increase::Export::TransactionCsv::OrHash),
          type: Increase::Export::Type::OrSymbol,
          vendor_csv: T.nilable(Increase::Export::VendorCsv::OrHash),
          voided_check: T.nilable(Increase::Export::VoidedCheck::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # The Export identifier.
        id:,
        # Details of the account statement BAI2 export. This field will be present when
        # the `category` is equal to `account_statement_bai2`.
        account_statement_bai2:,
        # Details of the account statement OFX export. This field will be present when the
        # `category` is equal to `account_statement_ofx`.
        account_statement_ofx:,
        # Details of the account verification letter export. This field will be present
        # when the `category` is equal to `account_verification_letter`.
        account_verification_letter:,
        # Details of the balance CSV export. This field will be present when the
        # `category` is equal to `balance_csv`.
        balance_csv:,
        # Details of the bookkeeping account balance CSV export. This field will be
        # present when the `category` is equal to `bookkeeping_account_balance_csv`.
        bookkeeping_account_balance_csv:,
        # The category of the Export. We may add additional possible values for this enum
        # over time; your application should be able to handle that gracefully.
        category:,
        # The time the Export was created.
        created_at:,
        # Details of the dashboard table CSV export. This field will be present when the
        # `category` is equal to `dashboard_table_csv`.
        dashboard_table_csv:,
        # Details of the entity CSV export. This field will be present when the `category`
        # is equal to `entity_csv`.
        entity_csv:,
        # Details of the Form 1099-INT export. This field will be present when the
        # `category` is equal to `form_1099_int`.
        form_1099_int:,
        # Details of the Form 1099-MISC export. This field will be present when the
        # `category` is equal to `form_1099_misc`.
        form_1099_misc:,
        # Details of the funding instructions export. This field will be present when the
        # `category` is equal to `funding_instructions`.
        funding_instructions:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The result of the Export. This will be present when the Export's status
        # transitions to `complete`.
        result:,
        # The status of the Export.
        status:,
        # Details of the transaction CSV export. This field will be present when the
        # `category` is equal to `transaction_csv`.
        transaction_csv:,
        # A constant representing the object's type. For this resource it will always be
        # `export`.
        type:,
        # Details of the vendor CSV export. This field will be present when the `category`
        # is equal to `vendor_csv`.
        vendor_csv:,
        # Details of the voided check export. This field will be present when the
        # `category` is equal to `voided_check`.
        voided_check:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_statement_bai2:
              T.nilable(Increase::Export::AccountStatementBai2),
            account_statement_ofx:
              T.nilable(Increase::Export::AccountStatementOfx),
            account_verification_letter:
              T.nilable(Increase::Export::AccountVerificationLetter),
            balance_csv: T.nilable(Increase::Export::BalanceCsv),
            bookkeeping_account_balance_csv:
              T.nilable(Increase::Export::BookkeepingAccountBalanceCsv),
            category: Increase::Export::Category::TaggedSymbol,
            created_at: Time,
            dashboard_table_csv: T.nilable(Increase::Export::DashboardTableCsv),
            entity_csv: T.nilable(Increase::Export::EntityCsv),
            form_1099_int: T.nilable(Increase::Export::Form1099Int),
            form_1099_misc: T.nilable(Increase::Export::Form1099Misc),
            funding_instructions:
              T.nilable(Increase::Export::FundingInstructions),
            idempotency_key: T.nilable(String),
            result: T.nilable(Increase::Export::Result),
            status: Increase::Export::Status::TaggedSymbol,
            transaction_csv: T.nilable(Increase::Export::TransactionCsv),
            type: Increase::Export::Type::TaggedSymbol,
            vendor_csv: T.nilable(Increase::Export::VendorCsv),
            voided_check: T.nilable(Increase::Export::VoidedCheck)
          }
        )
      end
      def to_hash
      end

      class AccountStatementBai2 < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Export::AccountStatementBai2,
              Increase::Internal::AnyHash
            )
          end

        # Filter results by Account.
        sig { returns(T.nilable(String)) }
        attr_accessor :account_id

        # The date for which to retrieve the balance.
        sig { returns(T.nilable(Date)) }
        attr_accessor :effective_date

        # Filter results by Program.
        sig { returns(T.nilable(String)) }
        attr_accessor :program_id

        # Details of the account statement BAI2 export. This field will be present when
        # the `category` is equal to `account_statement_bai2`.
        sig do
          params(
            account_id: T.nilable(String),
            effective_date: T.nilable(Date),
            program_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter results by Account.
          account_id:,
          # The date for which to retrieve the balance.
          effective_date:,
          # Filter results by Program.
          program_id:
        )
        end

        sig do
          override.returns(
            {
              account_id: T.nilable(String),
              effective_date: T.nilable(Date),
              program_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class AccountStatementOfx < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Export::AccountStatementOfx,
              Increase::Internal::AnyHash
            )
          end

        # The Account to create a statement for.
        sig { returns(String) }
        attr_accessor :account_id

        # Filter transactions by their created date.
        sig do
          returns(T.nilable(Increase::Export::AccountStatementOfx::CreatedAt))
        end
        attr_reader :created_at

        sig do
          params(
            created_at:
              T.nilable(
                Increase::Export::AccountStatementOfx::CreatedAt::OrHash
              )
          ).void
        end
        attr_writer :created_at

        # Details of the account statement OFX export. This field will be present when the
        # `category` is equal to `account_statement_ofx`.
        sig do
          params(
            account_id: String,
            created_at:
              T.nilable(
                Increase::Export::AccountStatementOfx::CreatedAt::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The Account to create a statement for.
          account_id:,
          # Filter transactions by their created date.
          created_at:
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              created_at:
                T.nilable(Increase::Export::AccountStatementOfx::CreatedAt)
            }
          )
        end
        def to_hash
        end

        class CreatedAt < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Export::AccountStatementOfx::CreatedAt,
                Increase::Internal::AnyHash
              )
            end

          # Filter results to transactions created after this time.
          sig { returns(T.nilable(Time)) }
          attr_accessor :after

          # Filter results to transactions created before this time.
          sig { returns(T.nilable(Time)) }
          attr_accessor :before

          # Filter transactions by their created date.
          sig do
            params(after: T.nilable(Time), before: T.nilable(Time)).returns(
              T.attached_class
            )
          end
          def self.new(
            # Filter results to transactions created after this time.
            after:,
            # Filter results to transactions created before this time.
            before:
          )
          end

          sig do
            override.returns(
              { after: T.nilable(Time), before: T.nilable(Time) }
            )
          end
          def to_hash
          end
        end
      end

      class AccountVerificationLetter < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Export::AccountVerificationLetter,
              Increase::Internal::AnyHash
            )
          end

        # The Account Number to create a letter for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # The date of the balance to include in the letter.
        sig { returns(T.nilable(Date)) }
        attr_accessor :balance_date

        # Details of the account verification letter export. This field will be present
        # when the `category` is equal to `account_verification_letter`.
        sig do
          params(
            account_number_id: String,
            balance_date: T.nilable(Date)
          ).returns(T.attached_class)
        end
        def self.new(
          # The Account Number to create a letter for.
          account_number_id:,
          # The date of the balance to include in the letter.
          balance_date:
        )
        end

        sig do
          override.returns(
            { account_number_id: String, balance_date: T.nilable(Date) }
          )
        end
        def to_hash
        end
      end

      class BalanceCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Export::BalanceCsv, Increase::Internal::AnyHash)
          end

        # Filter results by Account.
        sig { returns(T.nilable(String)) }
        attr_accessor :account_id

        # Filter balances by their created date.
        sig { returns(T.nilable(Increase::Export::BalanceCsv::CreatedAt)) }
        attr_reader :created_at

        sig do
          params(
            created_at:
              T.nilable(Increase::Export::BalanceCsv::CreatedAt::OrHash)
          ).void
        end
        attr_writer :created_at

        # Details of the balance CSV export. This field will be present when the
        # `category` is equal to `balance_csv`.
        sig do
          params(
            account_id: T.nilable(String),
            created_at:
              T.nilable(Increase::Export::BalanceCsv::CreatedAt::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter results by Account.
          account_id:,
          # Filter balances by their created date.
          created_at:
        )
        end

        sig do
          override.returns(
            {
              account_id: T.nilable(String),
              created_at: T.nilable(Increase::Export::BalanceCsv::CreatedAt)
            }
          )
        end
        def to_hash
        end

        class CreatedAt < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Export::BalanceCsv::CreatedAt,
                Increase::Internal::AnyHash
              )
            end

          # Filter balances created after this time.
          sig { returns(T.nilable(Time)) }
          attr_accessor :after

          # Filter balances created before this time.
          sig { returns(T.nilable(Time)) }
          attr_accessor :before

          # Filter balances by their created date.
          sig do
            params(after: T.nilable(Time), before: T.nilable(Time)).returns(
              T.attached_class
            )
          end
          def self.new(
            # Filter balances created after this time.
            after:,
            # Filter balances created before this time.
            before:
          )
          end

          sig do
            override.returns(
              { after: T.nilable(Time), before: T.nilable(Time) }
            )
          end
          def to_hash
          end
        end
      end

      class BookkeepingAccountBalanceCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Export::BookkeepingAccountBalanceCsv,
              Increase::Internal::AnyHash
            )
          end

        # Filter results by Bookkeeping Account.
        sig { returns(T.nilable(String)) }
        attr_accessor :bookkeeping_account_id

        # Filter balances by their created date.
        sig do
          returns(
            T.nilable(Increase::Export::BookkeepingAccountBalanceCsv::CreatedAt)
          )
        end
        attr_reader :created_at

        sig do
          params(
            created_at:
              T.nilable(
                Increase::Export::BookkeepingAccountBalanceCsv::CreatedAt::OrHash
              )
          ).void
        end
        attr_writer :created_at

        # Details of the bookkeeping account balance CSV export. This field will be
        # present when the `category` is equal to `bookkeeping_account_balance_csv`.
        sig do
          params(
            bookkeeping_account_id: T.nilable(String),
            created_at:
              T.nilable(
                Increase::Export::BookkeepingAccountBalanceCsv::CreatedAt::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter results by Bookkeeping Account.
          bookkeeping_account_id:,
          # Filter balances by their created date.
          created_at:
        )
        end

        sig do
          override.returns(
            {
              bookkeeping_account_id: T.nilable(String),
              created_at:
                T.nilable(
                  Increase::Export::BookkeepingAccountBalanceCsv::CreatedAt
                )
            }
          )
        end
        def to_hash
        end

        class CreatedAt < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Export::BookkeepingAccountBalanceCsv::CreatedAt,
                Increase::Internal::AnyHash
              )
            end

          # Filter balances created after this time.
          sig { returns(T.nilable(Time)) }
          attr_accessor :after

          # Filter balances created before this time.
          sig { returns(T.nilable(Time)) }
          attr_accessor :before

          # Filter balances by their created date.
          sig do
            params(after: T.nilable(Time), before: T.nilable(Time)).returns(
              T.attached_class
            )
          end
          def self.new(
            # Filter balances created after this time.
            after:,
            # Filter balances created before this time.
            before:
          )
          end

          sig do
            override.returns(
              { after: T.nilable(Time), before: T.nilable(Time) }
            )
          end
          def to_hash
          end
        end
      end

      # The category of the Export. We may add additional possible values for this enum
      # over time; your application should be able to handle that gracefully.
      module Category
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Export::Category) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Export an Open Financial Exchange (OFX) file of transactions and balances for a given time range and Account.
        ACCOUNT_STATEMENT_OFX =
          T.let(
            :account_statement_ofx,
            Increase::Export::Category::TaggedSymbol
          )

        # Export a BAI2 file of transactions and balances for a given date and optional Account.
        ACCOUNT_STATEMENT_BAI2 =
          T.let(
            :account_statement_bai2,
            Increase::Export::Category::TaggedSymbol
          )

        # Export a CSV of all transactions for a given time range.
        TRANSACTION_CSV =
          T.let(:transaction_csv, Increase::Export::Category::TaggedSymbol)

        # Export a CSV of account balances for the dates in a given range.
        BALANCE_CSV =
          T.let(:balance_csv, Increase::Export::Category::TaggedSymbol)

        # Export a CSV of bookkeeping account balances for the dates in a given range.
        BOOKKEEPING_ACCOUNT_BALANCE_CSV =
          T.let(
            :bookkeeping_account_balance_csv,
            Increase::Export::Category::TaggedSymbol
          )

        # Export a CSV of entities with a given status.
        ENTITY_CSV =
          T.let(:entity_csv, Increase::Export::Category::TaggedSymbol)

        # Export a CSV of vendors added to the third-party risk management dashboard.
        VENDOR_CSV =
          T.let(:vendor_csv, Increase::Export::Category::TaggedSymbol)

        # Certain dashboard tables are available as CSV exports. This export cannot be created via the API.
        DASHBOARD_TABLE_CSV =
          T.let(:dashboard_table_csv, Increase::Export::Category::TaggedSymbol)

        # A PDF of an account verification letter.
        ACCOUNT_VERIFICATION_LETTER =
          T.let(
            :account_verification_letter,
            Increase::Export::Category::TaggedSymbol
          )

        # A PDF of funding instructions.
        FUNDING_INSTRUCTIONS =
          T.let(:funding_instructions, Increase::Export::Category::TaggedSymbol)

        # A PDF of an Internal Revenue Service Form 1099-INT.
        FORM_1099_INT =
          T.let(:form_1099_int, Increase::Export::Category::TaggedSymbol)

        # A PDF of an Internal Revenue Service Form 1099-MISC.
        FORM_1099_MISC =
          T.let(:form_1099_misc, Increase::Export::Category::TaggedSymbol)

        # A PDF of a voided check.
        VOIDED_CHECK =
          T.let(:voided_check, Increase::Export::Category::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Export::Category::TaggedSymbol])
        end
        def self.values
        end
      end

      class DashboardTableCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Export::DashboardTableCsv,
              Increase::Internal::AnyHash
            )
          end

        # Details of the dashboard table CSV export. This field will be present when the
        # `category` is equal to `dashboard_table_csv`.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end

      class EntityCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Export::EntityCsv, Increase::Internal::AnyHash)
          end

        # Details of the entity CSV export. This field will be present when the `category`
        # is equal to `entity_csv`.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end

      class Form1099Int < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Export::Form1099Int, Increase::Internal::AnyHash)
          end

        # The Account the tax form is for.
        sig { returns(String) }
        attr_accessor :account_id

        # Whether the tax form is a corrected form.
        sig { returns(T::Boolean) }
        attr_accessor :corrected

        # A description of the tax form.
        sig { returns(String) }
        attr_accessor :description

        # The tax year for the tax form.
        sig { returns(Integer) }
        attr_accessor :year

        # Details of the Form 1099-INT export. This field will be present when the
        # `category` is equal to `form_1099_int`.
        sig do
          params(
            account_id: String,
            corrected: T::Boolean,
            description: String,
            year: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The Account the tax form is for.
          account_id:,
          # Whether the tax form is a corrected form.
          corrected:,
          # A description of the tax form.
          description:,
          # The tax year for the tax form.
          year:
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              corrected: T::Boolean,
              description: String,
              year: Integer
            }
          )
        end
        def to_hash
        end
      end

      class Form1099Misc < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Export::Form1099Misc, Increase::Internal::AnyHash)
          end

        # The Account the tax form is for.
        sig { returns(String) }
        attr_accessor :account_id

        # Whether the tax form is a corrected form.
        sig { returns(T::Boolean) }
        attr_accessor :corrected

        # The tax year for the tax form.
        sig { returns(Integer) }
        attr_accessor :year

        # Details of the Form 1099-MISC export. This field will be present when the
        # `category` is equal to `form_1099_misc`.
        sig do
          params(
            account_id: String,
            corrected: T::Boolean,
            year: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The Account the tax form is for.
          account_id:,
          # Whether the tax form is a corrected form.
          corrected:,
          # The tax year for the tax form.
          year:
        )
        end

        sig do
          override.returns(
            { account_id: String, corrected: T::Boolean, year: Integer }
          )
        end
        def to_hash
        end
      end

      class FundingInstructions < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Export::FundingInstructions,
              Increase::Internal::AnyHash
            )
          end

        # The Account Number to create funding instructions for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # Details of the funding instructions export. This field will be present when the
        # `category` is equal to `funding_instructions`.
        sig { params(account_number_id: String).returns(T.attached_class) }
        def self.new(
          # The Account Number to create funding instructions for.
          account_number_id:
        )
        end

        sig { override.returns({ account_number_id: String }) }
        def to_hash
        end
      end

      class Result < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Export::Result, Increase::Internal::AnyHash)
          end

        # The File containing the contents of the Export.
        sig { returns(String) }
        attr_accessor :file_id

        # The result of the Export. This will be present when the Export's status
        # transitions to `complete`.
        sig { params(file_id: String).returns(T.attached_class) }
        def self.new(
          # The File containing the contents of the Export.
          file_id:
        )
        end

        sig { override.returns({ file_id: String }) }
        def to_hash
        end
      end

      # The status of the Export.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Export::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Increase is generating the export.
        PENDING = T.let(:pending, Increase::Export::Status::TaggedSymbol)

        # The export has been successfully generated.
        COMPLETE = T.let(:complete, Increase::Export::Status::TaggedSymbol)

        # The export failed to generate. Increase will reach out to you to resolve the issue.
        FAILED = T.let(:failed, Increase::Export::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Export::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      class TransactionCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Export::TransactionCsv, Increase::Internal::AnyHash)
          end

        # Filter results by Account.
        sig { returns(T.nilable(String)) }
        attr_accessor :account_id

        # Filter transactions by their created date.
        sig { returns(T.nilable(Increase::Export::TransactionCsv::CreatedAt)) }
        attr_reader :created_at

        sig do
          params(
            created_at:
              T.nilable(Increase::Export::TransactionCsv::CreatedAt::OrHash)
          ).void
        end
        attr_writer :created_at

        # Details of the transaction CSV export. This field will be present when the
        # `category` is equal to `transaction_csv`.
        sig do
          params(
            account_id: T.nilable(String),
            created_at:
              T.nilable(Increase::Export::TransactionCsv::CreatedAt::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter results by Account.
          account_id:,
          # Filter transactions by their created date.
          created_at:
        )
        end

        sig do
          override.returns(
            {
              account_id: T.nilable(String),
              created_at: T.nilable(Increase::Export::TransactionCsv::CreatedAt)
            }
          )
        end
        def to_hash
        end

        class CreatedAt < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Export::TransactionCsv::CreatedAt,
                Increase::Internal::AnyHash
              )
            end

          # Filter transactions created after this time.
          sig { returns(T.nilable(Time)) }
          attr_accessor :after

          # Filter transactions created before this time.
          sig { returns(T.nilable(Time)) }
          attr_accessor :before

          # Filter transactions by their created date.
          sig do
            params(after: T.nilable(Time), before: T.nilable(Time)).returns(
              T.attached_class
            )
          end
          def self.new(
            # Filter transactions created after this time.
            after:,
            # Filter transactions created before this time.
            before:
          )
          end

          sig do
            override.returns(
              { after: T.nilable(Time), before: T.nilable(Time) }
            )
          end
          def to_hash
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `export`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Export::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXPORT = T.let(:export, Increase::Export::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Export::Type::TaggedSymbol]) }
        def self.values
        end
      end

      class VendorCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Export::VendorCsv, Increase::Internal::AnyHash)
          end

        # Details of the vendor CSV export. This field will be present when the `category`
        # is equal to `vendor_csv`.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end

      class VoidedCheck < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Export::VoidedCheck, Increase::Internal::AnyHash)
          end

        # The Account Number for the voided check.
        sig { returns(String) }
        attr_accessor :account_number_id

        # The payer information printed on the check.
        sig { returns(T::Array[Increase::Export::VoidedCheck::Payer]) }
        attr_accessor :payer

        # Details of the voided check export. This field will be present when the
        # `category` is equal to `voided_check`.
        sig do
          params(
            account_number_id: String,
            payer: T::Array[Increase::Export::VoidedCheck::Payer::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # The Account Number for the voided check.
          account_number_id:,
          # The payer information printed on the check.
          payer:
        )
        end

        sig do
          override.returns(
            {
              account_number_id: String,
              payer: T::Array[Increase::Export::VoidedCheck::Payer]
            }
          )
        end
        def to_hash
        end

        class Payer < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Export::VoidedCheck::Payer,
                Increase::Internal::AnyHash
              )
            end

          # The contents of the line.
          sig { returns(String) }
          attr_accessor :line

          sig { params(line: String).returns(T.attached_class) }
          def self.new(
            # The contents of the line.
            line:
          )
          end

          sig { override.returns({ line: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
