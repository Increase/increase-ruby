# typed: strong

module Increase
  module Resources
    class AccountStatements
      # Retrieve an Account Statement
      sig do
        params(
          account_statement_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::AccountStatement)
      end
      def retrieve(
        # The identifier of the Account Statement to retrieve.
        account_statement_id,
        request_options: {}
      )
      end

      # List Account Statements
      sig do
        params(
          account_id: String,
          cursor: String,
          limit: Integer,
          statement_period_start: T.any(Increase::Models::AccountStatementListParams::StatementPeriodStart, Increase::Internal::AnyHash),
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::AccountStatement])
      end
      def list(
        # Filter Account Statements to those belonging to the specified Account.
        account_id: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
        statement_period_start: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
