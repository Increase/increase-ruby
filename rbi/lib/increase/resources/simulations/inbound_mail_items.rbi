# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundMailItems
        # Simulates an inbound mail item to your account, as if someone had mailed a
        #   physical check to one of your account's Lockboxes.
        sig do
          params(
            amount: Integer,
            lockbox_id: String,
            contents_file_id: String,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::InboundMailItem)
        end
        def create(
          # The amount of the check to be simulated, in cents.
          amount:,
          # The identifier of the Lockbox to simulate inbound mail to.
          lockbox_id:,
          # The file containing the PDF contents. If not present, a default check image file
          #   will be used.
          contents_file_id: nil,
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
