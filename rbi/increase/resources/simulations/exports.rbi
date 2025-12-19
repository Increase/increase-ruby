# typed: strong

module Increase
  module Resources
    class Simulations
      class Exports
        # Many exports are created by you via POST /exports or in the Dashboard. Some
        # exports are created automatically by Increase. For example, tax documents are
        # published once a year. In sandbox, you can trigger the arrival of an export that
        # would normally only be created automatically via this simulation.
        sig do
          params(
            category:
              Increase::Simulations::ExportCreateParams::Category::OrSymbol,
            form_1099_int:
              Increase::Simulations::ExportCreateParams::Form1099Int::OrHash,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::Export)
        end
        def create(
          # The type of Export to create.
          category:,
          # Options for the created export. Required if `category` is equal to
          # `form_1099_int`.
          form_1099_int: nil,
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
