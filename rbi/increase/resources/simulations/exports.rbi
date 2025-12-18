# typed: strong

module Increase
  module Resources
    class Simulations
      class Exports
        # Simulates a tax form export being generated.
        sig do
          params(
            account_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::Export)
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
