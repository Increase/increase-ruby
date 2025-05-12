# typed: strong

module Increase
  module Models
    class Export < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Export, Increase::Internal::AnyHash) }

      # The Export identifier.
      sig { returns(String) }
      attr_accessor :id

      # The category of the Export. We may add additional possible values for this enum
      # over time; your application should be able to handle that gracefully.
      sig { returns(Increase::Export::Category::TaggedSymbol) }
      attr_accessor :category

      # The time the Export was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # A URL at which the Export's file can be downloaded. This will be present when
      # the Export's status transitions to `complete`.
      sig { returns(T.nilable(String)) }
      attr_accessor :file_download_url

      # The File containing the contents of the Export. This will be present when the
      # Export's status transitions to `complete`.
      sig { returns(T.nilable(String)) }
      attr_accessor :file_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The status of the Export.
      sig { returns(Increase::Export::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `export`.
      sig { returns(Increase::Export::Type::TaggedSymbol) }
      attr_accessor :type

      # Exports are batch summaries of your Increase data. You can make them from the
      # API or dashboard. Since they can take a while, they are generated
      # asynchronously. We send a webhook when they are ready. For more information,
      # please read our
      # [Exports documentation](https://increase.com/documentation/exports).
      sig do
        params(
          id: String,
          category: Increase::Export::Category::OrSymbol,
          created_at: Time,
          file_download_url: T.nilable(String),
          file_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          status: Increase::Export::Status::OrSymbol,
          type: Increase::Export::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Export identifier.
        id:,
        # The category of the Export. We may add additional possible values for this enum
        # over time; your application should be able to handle that gracefully.
        category:,
        # The time the Export was created.
        created_at:,
        # A URL at which the Export's file can be downloaded. This will be present when
        # the Export's status transitions to `complete`.
        file_download_url:,
        # The File containing the contents of the Export. This will be present when the
        # Export's status transitions to `complete`.
        file_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The status of the Export.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `export`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            category: Increase::Export::Category::TaggedSymbol,
            created_at: Time,
            file_download_url: T.nilable(String),
            file_id: T.nilable(String),
            idempotency_key: T.nilable(String),
            status: Increase::Export::Status::TaggedSymbol,
            type: Increase::Export::Type::TaggedSymbol
          }
        )
      end
      def to_hash
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

        sig do
          override.returns(T::Array[Increase::Export::Category::TaggedSymbol])
        end
        def self.values
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
    end
  end
end
