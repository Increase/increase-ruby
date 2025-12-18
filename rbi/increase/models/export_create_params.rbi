# typed: strong

module Increase
  module Models
    class ExportCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::ExportCreateParams, Increase::Internal::AnyHash)
        end

      # The type of Export to create.
      sig { returns(Increase::ExportCreateParams::Category::OrSymbol) }
      attr_accessor :category

      # Options for the created export. Required if `category` is equal to
      # `account_statement_bai2`.
      sig do
        returns(T.nilable(Increase::ExportCreateParams::AccountStatementBai2))
      end
      attr_reader :account_statement_bai2

      sig do
        params(
          account_statement_bai2:
            Increase::ExportCreateParams::AccountStatementBai2::OrHash
        ).void
      end
      attr_writer :account_statement_bai2

      # Options for the created export. Required if `category` is equal to
      # `account_statement_ofx`.
      sig do
        returns(T.nilable(Increase::ExportCreateParams::AccountStatementOfx))
      end
      attr_reader :account_statement_ofx

      sig do
        params(
          account_statement_ofx:
            Increase::ExportCreateParams::AccountStatementOfx::OrHash
        ).void
      end
      attr_writer :account_statement_ofx

      # Options for the created export. Required if `category` is equal to
      # `account_verification_letter`.
      sig do
        returns(
          T.nilable(Increase::ExportCreateParams::AccountVerificationLetter)
        )
      end
      attr_reader :account_verification_letter

      sig do
        params(
          account_verification_letter:
            Increase::ExportCreateParams::AccountVerificationLetter::OrHash
        ).void
      end
      attr_writer :account_verification_letter

      # Options for the created export. Required if `category` is equal to
      # `balance_csv`.
      sig { returns(T.nilable(Increase::ExportCreateParams::BalanceCsv)) }
      attr_reader :balance_csv

      sig do
        params(
          balance_csv: Increase::ExportCreateParams::BalanceCsv::OrHash
        ).void
      end
      attr_writer :balance_csv

      # Options for the created export. Required if `category` is equal to
      # `bookkeeping_account_balance_csv`.
      sig do
        returns(
          T.nilable(Increase::ExportCreateParams::BookkeepingAccountBalanceCsv)
        )
      end
      attr_reader :bookkeeping_account_balance_csv

      sig do
        params(
          bookkeeping_account_balance_csv:
            Increase::ExportCreateParams::BookkeepingAccountBalanceCsv::OrHash
        ).void
      end
      attr_writer :bookkeeping_account_balance_csv

      # Options for the created export. Required if `category` is equal to `entity_csv`.
      sig { returns(T.nilable(Increase::ExportCreateParams::EntityCsv)) }
      attr_reader :entity_csv

      sig do
        params(entity_csv: Increase::ExportCreateParams::EntityCsv::OrHash).void
      end
      attr_writer :entity_csv

      # Options for the created export. Required if `category` is equal to
      # `funding_instructions`.
      sig do
        returns(T.nilable(Increase::ExportCreateParams::FundingInstructions))
      end
      attr_reader :funding_instructions

      sig do
        params(
          funding_instructions:
            Increase::ExportCreateParams::FundingInstructions::OrHash
        ).void
      end
      attr_writer :funding_instructions

      # Options for the created export. Required if `category` is equal to
      # `transaction_csv`.
      sig { returns(T.nilable(Increase::ExportCreateParams::TransactionCsv)) }
      attr_reader :transaction_csv

      sig do
        params(
          transaction_csv: Increase::ExportCreateParams::TransactionCsv::OrHash
        ).void
      end
      attr_writer :transaction_csv

      # Options for the created export. Required if `category` is equal to `vendor_csv`.
      sig { returns(T.nilable(Increase::ExportCreateParams::VendorCsv)) }
      attr_reader :vendor_csv

      sig do
        params(vendor_csv: Increase::ExportCreateParams::VendorCsv::OrHash).void
      end
      attr_writer :vendor_csv

      sig do
        params(
          category: Increase::ExportCreateParams::Category::OrSymbol,
          account_statement_bai2:
            Increase::ExportCreateParams::AccountStatementBai2::OrHash,
          account_statement_ofx:
            Increase::ExportCreateParams::AccountStatementOfx::OrHash,
          account_verification_letter:
            Increase::ExportCreateParams::AccountVerificationLetter::OrHash,
          balance_csv: Increase::ExportCreateParams::BalanceCsv::OrHash,
          bookkeeping_account_balance_csv:
            Increase::ExportCreateParams::BookkeepingAccountBalanceCsv::OrHash,
          entity_csv: Increase::ExportCreateParams::EntityCsv::OrHash,
          funding_instructions:
            Increase::ExportCreateParams::FundingInstructions::OrHash,
          transaction_csv: Increase::ExportCreateParams::TransactionCsv::OrHash,
          vendor_csv: Increase::ExportCreateParams::VendorCsv::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The type of Export to create.
        category:,
        # Options for the created export. Required if `category` is equal to
        # `account_statement_bai2`.
        account_statement_bai2: nil,
        # Options for the created export. Required if `category` is equal to
        # `account_statement_ofx`.
        account_statement_ofx: nil,
        # Options for the created export. Required if `category` is equal to
        # `account_verification_letter`.
        account_verification_letter: nil,
        # Options for the created export. Required if `category` is equal to
        # `balance_csv`.
        balance_csv: nil,
        # Options for the created export. Required if `category` is equal to
        # `bookkeeping_account_balance_csv`.
        bookkeeping_account_balance_csv: nil,
        # Options for the created export. Required if `category` is equal to `entity_csv`.
        entity_csv: nil,
        # Options for the created export. Required if `category` is equal to
        # `funding_instructions`.
        funding_instructions: nil,
        # Options for the created export. Required if `category` is equal to
        # `transaction_csv`.
        transaction_csv: nil,
        # Options for the created export. Required if `category` is equal to `vendor_csv`.
        vendor_csv: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            category: Increase::ExportCreateParams::Category::OrSymbol,
            account_statement_bai2:
              Increase::ExportCreateParams::AccountStatementBai2,
            account_statement_ofx:
              Increase::ExportCreateParams::AccountStatementOfx,
            account_verification_letter:
              Increase::ExportCreateParams::AccountVerificationLetter,
            balance_csv: Increase::ExportCreateParams::BalanceCsv,
            bookkeeping_account_balance_csv:
              Increase::ExportCreateParams::BookkeepingAccountBalanceCsv,
            entity_csv: Increase::ExportCreateParams::EntityCsv,
            funding_instructions:
              Increase::ExportCreateParams::FundingInstructions,
            transaction_csv: Increase::ExportCreateParams::TransactionCsv,
            vendor_csv: Increase::ExportCreateParams::VendorCsv,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The type of Export to create.
      module Category
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::ExportCreateParams::Category) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Export an Open Financial Exchange (OFX) file of transactions and balances for a given time range and Account.
        ACCOUNT_STATEMENT_OFX =
          T.let(
            :account_statement_ofx,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        # Export a BAI2 file of transactions and balances for a given date and optional Account.
        ACCOUNT_STATEMENT_BAI2 =
          T.let(
            :account_statement_bai2,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        # Export a CSV of all transactions for a given time range.
        TRANSACTION_CSV =
          T.let(
            :transaction_csv,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        # Export a CSV of account balances for the dates in a given range.
        BALANCE_CSV =
          T.let(
            :balance_csv,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        # Export a CSV of bookkeeping account balances for the dates in a given range.
        BOOKKEEPING_ACCOUNT_BALANCE_CSV =
          T.let(
            :bookkeeping_account_balance_csv,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        # Export a CSV of entities with a given status.
        ENTITY_CSV =
          T.let(
            :entity_csv,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        # Export a CSV of vendors added to the third-party risk management dashboard.
        VENDOR_CSV =
          T.let(
            :vendor_csv,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        # A PDF of an account verification letter.
        ACCOUNT_VERIFICATION_LETTER =
          T.let(
            :account_verification_letter,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        # A PDF of funding instructions.
        FUNDING_INSTRUCTIONS =
          T.let(
            :funding_instructions,
            Increase::ExportCreateParams::Category::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::ExportCreateParams::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class AccountStatementBai2 < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ExportCreateParams::AccountStatementBai2,
              Increase::Internal::AnyHash
            )
          end

        # The Account to create a BAI2 report for. If not provided, all open accounts will
        # be included.
        sig { returns(T.nilable(String)) }
        attr_reader :account_id

        sig { params(account_id: String).void }
        attr_writer :account_id

        # The date to create a BAI2 report for. If not provided, the current date will be
        # used. The timezone is UTC. If the current date is used, the report will include
        # intraday balances, otherwise it will include end-of-day balances for the
        # provided date.
        sig { returns(T.nilable(Date)) }
        attr_reader :effective_date

        sig { params(effective_date: Date).void }
        attr_writer :effective_date

        # The Program to create a BAI2 report for. If not provided, all open accounts will
        # be included.
        sig { returns(T.nilable(String)) }
        attr_reader :program_id

        sig { params(program_id: String).void }
        attr_writer :program_id

        # Options for the created export. Required if `category` is equal to
        # `account_statement_bai2`.
        sig do
          params(
            account_id: String,
            effective_date: Date,
            program_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The Account to create a BAI2 report for. If not provided, all open accounts will
          # be included.
          account_id: nil,
          # The date to create a BAI2 report for. If not provided, the current date will be
          # used. The timezone is UTC. If the current date is used, the report will include
          # intraday balances, otherwise it will include end-of-day balances for the
          # provided date.
          effective_date: nil,
          # The Program to create a BAI2 report for. If not provided, all open accounts will
          # be included.
          program_id: nil
        )
        end

        sig do
          override.returns(
            { account_id: String, effective_date: Date, program_id: String }
          )
        end
        def to_hash
        end
      end

      class AccountStatementOfx < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ExportCreateParams::AccountStatementOfx,
              Increase::Internal::AnyHash
            )
          end

        # The Account to create a statement for.
        sig { returns(String) }
        attr_accessor :account_id

        # Filter results by time range on the `created_at` attribute.
        sig do
          returns(
            T.nilable(
              Increase::ExportCreateParams::AccountStatementOfx::CreatedAt
            )
          )
        end
        attr_reader :created_at

        sig do
          params(
            created_at:
              Increase::ExportCreateParams::AccountStatementOfx::CreatedAt::OrHash
          ).void
        end
        attr_writer :created_at

        # Options for the created export. Required if `category` is equal to
        # `account_statement_ofx`.
        sig do
          params(
            account_id: String,
            created_at:
              Increase::ExportCreateParams::AccountStatementOfx::CreatedAt::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The Account to create a statement for.
          account_id:,
          # Filter results by time range on the `created_at` attribute.
          created_at: nil
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              created_at:
                Increase::ExportCreateParams::AccountStatementOfx::CreatedAt
            }
          )
        end
        def to_hash
        end

        class CreatedAt < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ExportCreateParams::AccountStatementOfx::CreatedAt,
                Increase::Internal::AnyHash
              )
            end

          # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :after

          sig { params(after: Time).void }
          attr_writer :after

          # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :before

          sig { params(before: Time).void }
          attr_writer :before

          # Return results on or after this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :on_or_after

          sig { params(on_or_after: Time).void }
          attr_writer :on_or_after

          # Return results on or before this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :on_or_before

          sig { params(on_or_before: Time).void }
          attr_writer :on_or_before

          # Filter results by time range on the `created_at` attribute.
          sig do
            params(
              after: Time,
              before: Time,
              on_or_after: Time,
              on_or_before: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            # timestamp.
            after: nil,
            # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            # timestamp.
            before: nil,
            # Return results on or after this
            # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
            on_or_after: nil,
            # Return results on or before this
            # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
            on_or_before: nil
          )
          end

          sig do
            override.returns(
              {
                after: Time,
                before: Time,
                on_or_after: Time,
                on_or_before: Time
              }
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
              Increase::ExportCreateParams::AccountVerificationLetter,
              Increase::Internal::AnyHash
            )
          end

        # The Account Number to create a letter for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # The date of the balance to include in the letter. Defaults to the current date.
        sig { returns(T.nilable(Date)) }
        attr_reader :balance_date

        sig { params(balance_date: Date).void }
        attr_writer :balance_date

        # Options for the created export. Required if `category` is equal to
        # `account_verification_letter`.
        sig do
          params(account_number_id: String, balance_date: Date).returns(
            T.attached_class
          )
        end
        def self.new(
          # The Account Number to create a letter for.
          account_number_id:,
          # The date of the balance to include in the letter. Defaults to the current date.
          balance_date: nil
        )
        end

        sig do
          override.returns({ account_number_id: String, balance_date: Date })
        end
        def to_hash
        end
      end

      class BalanceCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ExportCreateParams::BalanceCsv,
              Increase::Internal::AnyHash
            )
          end

        # Filter exported Transactions to the specified Account.
        sig { returns(T.nilable(String)) }
        attr_reader :account_id

        sig { params(account_id: String).void }
        attr_writer :account_id

        # Filter results by time range on the `created_at` attribute.
        sig do
          returns(
            T.nilable(Increase::ExportCreateParams::BalanceCsv::CreatedAt)
          )
        end
        attr_reader :created_at

        sig do
          params(
            created_at:
              Increase::ExportCreateParams::BalanceCsv::CreatedAt::OrHash
          ).void
        end
        attr_writer :created_at

        # Filter exported Transactions to the specified Program.
        sig { returns(T.nilable(String)) }
        attr_reader :program_id

        sig { params(program_id: String).void }
        attr_writer :program_id

        # Options for the created export. Required if `category` is equal to
        # `balance_csv`.
        sig do
          params(
            account_id: String,
            created_at:
              Increase::ExportCreateParams::BalanceCsv::CreatedAt::OrHash,
            program_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter exported Transactions to the specified Account.
          account_id: nil,
          # Filter results by time range on the `created_at` attribute.
          created_at: nil,
          # Filter exported Transactions to the specified Program.
          program_id: nil
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              created_at: Increase::ExportCreateParams::BalanceCsv::CreatedAt,
              program_id: String
            }
          )
        end
        def to_hash
        end

        class CreatedAt < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ExportCreateParams::BalanceCsv::CreatedAt,
                Increase::Internal::AnyHash
              )
            end

          # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :after

          sig { params(after: Time).void }
          attr_writer :after

          # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :before

          sig { params(before: Time).void }
          attr_writer :before

          # Return results on or after this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :on_or_after

          sig { params(on_or_after: Time).void }
          attr_writer :on_or_after

          # Return results on or before this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :on_or_before

          sig { params(on_or_before: Time).void }
          attr_writer :on_or_before

          # Filter results by time range on the `created_at` attribute.
          sig do
            params(
              after: Time,
              before: Time,
              on_or_after: Time,
              on_or_before: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            # timestamp.
            after: nil,
            # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            # timestamp.
            before: nil,
            # Return results on or after this
            # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
            on_or_after: nil,
            # Return results on or before this
            # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
            on_or_before: nil
          )
          end

          sig do
            override.returns(
              {
                after: Time,
                before: Time,
                on_or_after: Time,
                on_or_before: Time
              }
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
              Increase::ExportCreateParams::BookkeepingAccountBalanceCsv,
              Increase::Internal::AnyHash
            )
          end

        # Filter exported Transactions to the specified Bookkeeping Account.
        sig { returns(T.nilable(String)) }
        attr_reader :bookkeeping_account_id

        sig { params(bookkeeping_account_id: String).void }
        attr_writer :bookkeeping_account_id

        # Filter results by time range on the `created_at` attribute.
        sig do
          returns(
            T.nilable(
              Increase::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt
            )
          )
        end
        attr_reader :created_at

        sig do
          params(
            created_at:
              Increase::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt::OrHash
          ).void
        end
        attr_writer :created_at

        # Options for the created export. Required if `category` is equal to
        # `bookkeeping_account_balance_csv`.
        sig do
          params(
            bookkeeping_account_id: String,
            created_at:
              Increase::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter exported Transactions to the specified Bookkeeping Account.
          bookkeeping_account_id: nil,
          # Filter results by time range on the `created_at` attribute.
          created_at: nil
        )
        end

        sig do
          override.returns(
            {
              bookkeeping_account_id: String,
              created_at:
                Increase::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt
            }
          )
        end
        def to_hash
        end

        class CreatedAt < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ExportCreateParams::BookkeepingAccountBalanceCsv::CreatedAt,
                Increase::Internal::AnyHash
              )
            end

          # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :after

          sig { params(after: Time).void }
          attr_writer :after

          # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :before

          sig { params(before: Time).void }
          attr_writer :before

          # Return results on or after this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :on_or_after

          sig { params(on_or_after: Time).void }
          attr_writer :on_or_after

          # Return results on or before this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :on_or_before

          sig { params(on_or_before: Time).void }
          attr_writer :on_or_before

          # Filter results by time range on the `created_at` attribute.
          sig do
            params(
              after: Time,
              before: Time,
              on_or_after: Time,
              on_or_before: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            # timestamp.
            after: nil,
            # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            # timestamp.
            before: nil,
            # Return results on or after this
            # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
            on_or_after: nil,
            # Return results on or before this
            # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
            on_or_before: nil
          )
          end

          sig do
            override.returns(
              {
                after: Time,
                before: Time,
                on_or_after: Time,
                on_or_before: Time
              }
            )
          end
          def to_hash
          end
        end
      end

      class EntityCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ExportCreateParams::EntityCsv,
              Increase::Internal::AnyHash
            )
          end

        # Entity statuses to filter by.
        sig do
          returns(T.nilable(Increase::ExportCreateParams::EntityCsv::Status))
        end
        attr_reader :status

        sig do
          params(
            status: Increase::ExportCreateParams::EntityCsv::Status::OrHash
          ).void
        end
        attr_writer :status

        # Options for the created export. Required if `category` is equal to `entity_csv`.
        sig do
          params(
            status: Increase::ExportCreateParams::EntityCsv::Status::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Entity statuses to filter by.
          status: nil
        )
        end

        sig do
          override.returns(
            { status: Increase::ExportCreateParams::EntityCsv::Status }
          )
        end
        def to_hash
        end

        class Status < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ExportCreateParams::EntityCsv::Status,
                Increase::Internal::AnyHash
              )
            end

          # Entity statuses to filter by. For GET requests, this should be encoded as a
          # comma-delimited string, such as `?in=one,two,three`.
          sig do
            returns(
              T::Array[
                Increase::ExportCreateParams::EntityCsv::Status::In::OrSymbol
              ]
            )
          end
          attr_accessor :in_

          # Entity statuses to filter by.
          sig do
            params(
              in_:
                T::Array[
                  Increase::ExportCreateParams::EntityCsv::Status::In::OrSymbol
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Entity statuses to filter by. For GET requests, this should be encoded as a
            # comma-delimited string, such as `?in=one,two,three`.
            in_:
          )
          end

          sig do
            override.returns(
              {
                in_:
                  T::Array[
                    Increase::ExportCreateParams::EntityCsv::Status::In::OrSymbol
                  ]
              }
            )
          end
          def to_hash
          end

          module In
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::ExportCreateParams::EntityCsv::Status::In
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The entity is active.
            ACTIVE =
              T.let(
                :active,
                Increase::ExportCreateParams::EntityCsv::Status::In::TaggedSymbol
              )

            # The entity is archived, and can no longer be used to create accounts.
            ARCHIVED =
              T.let(
                :archived,
                Increase::ExportCreateParams::EntityCsv::Status::In::TaggedSymbol
              )

            # The entity is temporarily disabled and cannot be used for financial activity.
            DISABLED =
              T.let(
                :disabled,
                Increase::ExportCreateParams::EntityCsv::Status::In::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::ExportCreateParams::EntityCsv::Status::In::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class FundingInstructions < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ExportCreateParams::FundingInstructions,
              Increase::Internal::AnyHash
            )
          end

        # The Account Number to create funding instructions for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # Options for the created export. Required if `category` is equal to
        # `funding_instructions`.
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

      class TransactionCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ExportCreateParams::TransactionCsv,
              Increase::Internal::AnyHash
            )
          end

        # Filter exported Transactions to the specified Account.
        sig { returns(T.nilable(String)) }
        attr_reader :account_id

        sig { params(account_id: String).void }
        attr_writer :account_id

        # Filter results by time range on the `created_at` attribute.
        sig do
          returns(
            T.nilable(Increase::ExportCreateParams::TransactionCsv::CreatedAt)
          )
        end
        attr_reader :created_at

        sig do
          params(
            created_at:
              Increase::ExportCreateParams::TransactionCsv::CreatedAt::OrHash
          ).void
        end
        attr_writer :created_at

        # Filter exported Transactions to the specified Program.
        sig { returns(T.nilable(String)) }
        attr_reader :program_id

        sig { params(program_id: String).void }
        attr_writer :program_id

        # Options for the created export. Required if `category` is equal to
        # `transaction_csv`.
        sig do
          params(
            account_id: String,
            created_at:
              Increase::ExportCreateParams::TransactionCsv::CreatedAt::OrHash,
            program_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter exported Transactions to the specified Account.
          account_id: nil,
          # Filter results by time range on the `created_at` attribute.
          created_at: nil,
          # Filter exported Transactions to the specified Program.
          program_id: nil
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              created_at:
                Increase::ExportCreateParams::TransactionCsv::CreatedAt,
              program_id: String
            }
          )
        end
        def to_hash
        end

        class CreatedAt < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ExportCreateParams::TransactionCsv::CreatedAt,
                Increase::Internal::AnyHash
              )
            end

          # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :after

          sig { params(after: Time).void }
          attr_writer :after

          # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :before

          sig { params(before: Time).void }
          attr_writer :before

          # Return results on or after this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :on_or_after

          sig { params(on_or_after: Time).void }
          attr_writer :on_or_after

          # Return results on or before this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          sig { returns(T.nilable(Time)) }
          attr_reader :on_or_before

          sig { params(on_or_before: Time).void }
          attr_writer :on_or_before

          # Filter results by time range on the `created_at` attribute.
          sig do
            params(
              after: Time,
              before: Time,
              on_or_after: Time,
              on_or_before: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            # timestamp.
            after: nil,
            # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            # timestamp.
            before: nil,
            # Return results on or after this
            # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
            on_or_after: nil,
            # Return results on or before this
            # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
            on_or_before: nil
          )
          end

          sig do
            override.returns(
              {
                after: Time,
                before: Time,
                on_or_after: Time,
                on_or_before: Time
              }
            )
          end
          def to_hash
          end
        end
      end

      class VendorCsv < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ExportCreateParams::VendorCsv,
              Increase::Internal::AnyHash
            )
          end

        # Options for the created export. Required if `category` is equal to `vendor_csv`.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
