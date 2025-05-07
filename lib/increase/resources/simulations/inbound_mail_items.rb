# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundMailItems
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InboundMailItemCreateParams} for more details.
        #
        # Simulates an inbound mail item to your account, as if someone had mailed a
        # physical check to one of your account's Lockboxes.
        #
        # @overload create(amount:, lockbox_id:, contents_file_id: nil, request_options: {})
        #
        # @param amount [Integer] The amount of the check to be simulated, in cents.
        #
        # @param lockbox_id [String] The identifier of the Lockbox to simulate inbound mail to.
        #
        # @param contents_file_id [String] The file containing the PDF contents. If not present, a default check image file
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::InboundMailItem]
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
