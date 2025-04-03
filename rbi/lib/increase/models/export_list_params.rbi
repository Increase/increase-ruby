# typed: strong

module Increase
  module Models
    class ExportListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      sig { returns(T.nilable(Increase::Models::ExportListParams::Category)) }
      attr_reader :category

      sig { params(category: T.any(Increase::Models::ExportListParams::Category, Increase::Internal::AnyHash)).void }
      attr_writer :category

      sig { returns(T.nilable(Increase::Models::ExportListParams::CreatedAt)) }
      attr_reader :created_at

      sig { params(created_at: T.any(Increase::Models::ExportListParams::CreatedAt, Increase::Internal::AnyHash)).void }
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Increase::Models::ExportListParams::Status)) }
      attr_reader :status

      sig { params(status: T.any(Increase::Models::ExportListParams::Status, Increase::Internal::AnyHash)).void }
      attr_writer :status

      sig do
        params(
          category: T.any(Increase::Models::ExportListParams::Category, Increase::Internal::AnyHash),
          created_at: T.any(Increase::Models::ExportListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: T.any(Increase::Models::ExportListParams::Status, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        category: nil,
        created_at: nil,
        cursor: nil,
        idempotency_key: nil,
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              category: Increase::Models::ExportListParams::Category,
              created_at: Increase::Models::ExportListParams::CreatedAt,
              cursor: String,
              idempotency_key: String,
              limit: Integer,
              status: Increase::Models::ExportListParams::Status,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Category < Increase::Internal::Type::BaseModel
        # Filter Exports for those with the specified category or categories. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::ExportListParams::Category::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::ExportListParams::Category::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::ExportListParams::Category::In::OrSymbol]).returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::ExportListParams::Category::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::ExportListParams::Category::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::ExportListParams::Category::In::TaggedSymbol) }

          # Export an Open Financial Exchange (OFX) file of transactions and balances for a given time range and Account.
          ACCOUNT_STATEMENT_OFX =
            T.let(:account_statement_ofx, Increase::Models::ExportListParams::Category::In::TaggedSymbol)

          # Export a CSV of all transactions for a given time range.
          TRANSACTION_CSV = T.let(:transaction_csv, Increase::Models::ExportListParams::Category::In::TaggedSymbol)

          # Export a CSV of account balances for the dates in a given range.
          BALANCE_CSV = T.let(:balance_csv, Increase::Models::ExportListParams::Category::In::TaggedSymbol)

          # Export a CSV of bookkeeping account balances for the dates in a given range.
          BOOKKEEPING_ACCOUNT_BALANCE_CSV =
            T.let(:bookkeeping_account_balance_csv, Increase::Models::ExportListParams::Category::In::TaggedSymbol)

          # Export a CSV of entities with a given status.
          ENTITY_CSV = T.let(:entity_csv, Increase::Models::ExportListParams::Category::In::TaggedSymbol)

          # Export a CSV of vendors added to the third-party risk management dashboard.
          VENDOR_CSV = T.let(:vendor_csv, Increase::Models::ExportListParams::Category::In::TaggedSymbol)

          # Certain dashboard tables are available as CSV exports. This export cannot be created via the API.
          DASHBOARD_TABLE_CSV =
            T.let(:dashboard_table_csv, Increase::Models::ExportListParams::Category::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::ExportListParams::Category::In::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(after: Time, before: Time, on_or_after: Time, on_or_before: Time).returns(T.attached_class)
        end
        def self.new(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        end

        sig { override.returns({after: Time, before: Time, on_or_after: Time, on_or_before: Time}) }
        def to_hash
        end
      end

      class Status < Increase::Internal::Type::BaseModel
        # Filter Exports for those with the specified status or statuses. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::ExportListParams::Status::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::ExportListParams::Status::In::OrSymbol]).void }
        attr_writer :in_

        sig { params(in_: T::Array[Increase::Models::ExportListParams::Status::In::OrSymbol]).returns(T.attached_class) }
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::ExportListParams::Status::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::ExportListParams::Status::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::ExportListParams::Status::In::TaggedSymbol) }

          # Increase is generating the export.
          PENDING = T.let(:pending, Increase::Models::ExportListParams::Status::In::TaggedSymbol)

          # The export has been successfully generated.
          COMPLETE = T.let(:complete, Increase::Models::ExportListParams::Status::In::TaggedSymbol)

          # The export failed to generate. Increase will reach out to you to resolve the issue.
          FAILED = T.let(:failed, Increase::Models::ExportListParams::Status::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::ExportListParams::Status::In::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
