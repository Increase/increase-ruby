# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundMailItems
        # Simulates an Inbound Mail Item to one of your Lockbox Addresses or Lockbox
        # Recipients, as if someone had mailed a physical check. Increase automatically
        # deposits a check mailed to a Lockbox Recipient into the recipient's Account. A
        # check mailed to a Lockbox Address must be deposited or ignored with the
        # [Action an Inbound Mail Item](#inbound-mail-items) endpoint.
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
          # The identifier of the Lockbox Address to simulate inbound mail to. Exactly one
          # lockbox identifier parameter must be provided.
          lockbox_address_id: nil,
          # The identifier of the Lockbox Recipient to simulate inbound mail to. Exactly one
          # lockbox identifier parameter must be provided.
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
