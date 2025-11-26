# typed: strong

module Increase
  module Resources
    class RoutingNumbers
      # You can use this API to confirm if a routing number is valid, such as when a
      # user is providing you with bank account details. Since routing numbers uniquely
      # identify a bank, this will always return 0 or 1 entry. In Sandbox, the only
      # valid routing number for this method is 110000000.
      sig do
        params(
          routing_number: String,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::RoutingNumberListResponse)
      end
      def list(
        # Filter financial institutions by routing number.
        routing_number:,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
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
