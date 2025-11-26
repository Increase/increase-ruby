# frozen_string_literal: true

module Increase
  module Resources
    class RoutingNumbers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::RoutingNumberListParams} for more details.
      #
      # You can use this API to confirm if a routing number is valid, such as when a
      # user is providing you with bank account details. Since routing numbers uniquely
      # identify a bank, this will always return 0 or 1 entry. In Sandbox, the only
      # valid routing number for this method is 110000000.
      #
      # @overload list(routing_number:, cursor: nil, limit: nil, request_options: {})
      #
      # @param routing_number [String] Filter financial institutions by routing number.
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::RoutingNumberListResponse>]
      #
      # @see Increase::Models::RoutingNumberListParams
      def list(params)
        parsed, options = Increase::RoutingNumberListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "routing_numbers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Models::RoutingNumberListResponse,
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
