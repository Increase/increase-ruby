# typed: strong

module Increase
  module Resources
    class Simulations
      class Documents
        # Simulates an tax document being created for an account.
        sig do
          params(
            account_id: String,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::Document)
        end
        def create(
          # The identifier of the Account the tax document is for.
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
