# typed: strong

module Increase
  module Models
    class AccountStatement < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The Account Statement identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account this Account Statement belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      # Statement was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The Account's balance at the start of its statement period.
      sig { returns(Integer) }
      attr_accessor :ending_balance

      # The identifier of the File containing a PDF of the statement.
      sig { returns(String) }
      attr_accessor :file_id

      # The Account's balance at the start of its statement period.
      sig { returns(Integer) }
      attr_accessor :starting_balance

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time representing the end
      # of the period the Account Statement covers.
      sig { returns(Time) }
      attr_accessor :statement_period_end

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time representing the
      # start of the period the Account Statement covers.
      sig { returns(Time) }
      attr_accessor :statement_period_start

      # A constant representing the object's type. For this resource it will always be
      # `account_statement`.
      sig { returns(Increase::AccountStatement::Type::TaggedSymbol) }
      attr_accessor :type

      # Account Statements are generated monthly for every active Account. You can
      # access the statement's data via the API or retrieve a PDF with its details via
      # its associated File.
      sig do
        params(
          id: String,
          account_id: String,
          created_at: Time,
          ending_balance: Integer,
          file_id: String,
          starting_balance: Integer,
          statement_period_end: Time,
          statement_period_start: Time,
          type: Increase::AccountStatement::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account Statement identifier.
        id:,
        # The identifier for the Account this Account Statement belongs to.
        account_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
        # Statement was created.
        created_at:,
        # The Account's balance at the start of its statement period.
        ending_balance:,
        # The identifier of the File containing a PDF of the statement.
        file_id:,
        # The Account's balance at the start of its statement period.
        starting_balance:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time representing the end
        # of the period the Account Statement covers.
        statement_period_end:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time representing the
        # start of the period the Account Statement covers.
        statement_period_start:,
        # A constant representing the object's type. For this resource it will always be
        # `account_statement`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            created_at: Time,
            ending_balance: Integer,
            file_id: String,
            starting_balance: Integer,
            statement_period_end: Time,
            statement_period_start: Time,
            type: Increase::AccountStatement::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `account_statement`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::AccountStatement::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_STATEMENT =
          T.let(
            :account_statement,
            Increase::AccountStatement::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::AccountStatement::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
