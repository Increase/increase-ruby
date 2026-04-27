# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundMailItems
        # Simulates an inbound mail item to your account, as if someone had mailed a
        # physical check to one of your account's Lockboxes.
        sig do
          params(
            amount: Integer,
            contents_file_id: String,
            lockbox_address_id: String,
            lockbox_recipient_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::InboundMailItem)
        end
        def create(
          # The amount of the check to be simulated, in cents.
          amount:,
          # The file containing the PDF contents. If not present, a default check image file
          # will be used.
          contents_file_id: nil,
          # The identifier of the Lockbox Address to simulate inbound mail to.
          lockbox_address_id: nil,
          # The identifier of the Lockbox Recipient to simulate inbound mail to.
          lockbox_recipient_id: nil,
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
