# typed: strong

module Increase
  module Resources
    class InboundWireDrawdownRequests
      # Retrieve an Inbound Wire Drawdown Request
      sig do
        params(
          inbound_wire_drawdown_request_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::InboundWireDrawdownRequest)
      end
      def retrieve(
        # The identifier of the Inbound Wire Drawdown Request to retrieve.
        inbound_wire_drawdown_request_id,
        request_options: {}
      )
      end

      # List Inbound Wire Drawdown Requests
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::InboundWireDrawdownRequestListResponse)
      end
      def list(
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
