# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundMailItems
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InboundMailItemCreateParams} for more details.
        #
        # Simulates an Inbound Mail Item to one of your Lockbox Addresses or Lockbox
        # Recipients, as if someone had mailed a physical check.
        #
        # @overload create(amount:, contents_file_id: nil, lockbox_address_id: nil, lockbox_recipient_id: nil, request_options: {})
        #
        # @param amount [Integer] The amount of the check to be simulated, in cents.
        #
        # @param contents_file_id [String] The file containing the PDF contents. If not present, a default check image file
        #
        # @param lockbox_address_id [String] The identifier of the Lockbox Address to simulate inbound mail to.
        #
        # @param lockbox_recipient_id [String] The identifier of the Lockbox Recipient to simulate inbound mail to.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::InboundMailItem]
        #
        # @see Increase::Models::Simulations::InboundMailItemCreateParams
        def create(params)
          parsed, options = Increase::Simulations::InboundMailItemCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/inbound_mail_items",
            body: parsed,
            model: Increase::InboundMailItem,
            options: options
          )
        end

        # @api private
        #
        # @param client [Increase::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
