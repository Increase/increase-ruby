# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountStatements#retrieve
    class AccountStatement < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Account Statement identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the Account this Account Statement belongs to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #   Statement was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute ending_balance
      #   The Account's balance at the start of its statement period.
      #
      #   @return [Integer]
      required :ending_balance, Integer

      # @!attribute file_id
      #   The identifier of the File containing a PDF of the statement.
      #
      #   @return [String]
      required :file_id, String

      # @!attribute starting_balance
      #   The Account's balance at the start of its statement period.
      #
      #   @return [Integer]
      required :starting_balance, Integer

      # @!attribute statement_period_end
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time representing the end
      #   of the period the Account Statement covers.
      #
      #   @return [Time]
      required :statement_period_end, Time

      # @!attribute statement_period_start
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time representing the
      #   start of the period the Account Statement covers.
      #
      #   @return [Time]
      required :statement_period_start, Time

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `account_statement`.
      #
      #   @return [Symbol, Increase::AccountStatement::Type]
      required :type, enum: -> { Increase::AccountStatement::Type }

      # @!method initialize(id:, account_id:, created_at:, ending_balance:, file_id:, starting_balance:, statement_period_end:, statement_period_start:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::AccountStatement} for more details.
      #
      #   Account Statements are generated monthly for every active Account. You can
      #   access the statement's data via the API or retrieve a PDF with its details via
      #   its associated File.
      #
      #   @param id [String] The Account Statement identifier.
      #
      #   @param account_id [String] The identifier for the Account this Account Statement belongs to.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #
      #   @param ending_balance [Integer] The Account's balance at the start of its statement period.
      #
      #   @param file_id [String] The identifier of the File containing a PDF of the statement.
      #
      #   @param starting_balance [Integer] The Account's balance at the start of its statement period.
      #
      #   @param statement_period_end [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time representing the end
      #
      #   @param statement_period_start [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time representing the sta
      #
      #   @param type [Symbol, Increase::AccountStatement::Type] A constant representing the object's type. For this resource it will always be `

      # A constant representing the object's type. For this resource it will always be
      # `account_statement`.
      #
      # @see Increase::AccountStatement#type
      module Type
        extend Increase::Internal::Type::Enum

        ACCOUNT_STATEMENT = :account_statement

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
