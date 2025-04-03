# typed: strong

module Increase
  module Resources
    class Simulations
      class AccountStatements
        # Simulates an [Account Statement](#account-statements) being created for an
        #   account. In production, Account Statements are generated once per month.
        sig do
          params(
            account_id: String,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::AccountStatement)
        end
        def create(
          # The identifier of the Account the statement is for.
          account_id:,
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
end
