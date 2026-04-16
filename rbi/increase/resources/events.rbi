# typed: strong

module Increase
  module Resources
    class Events
      # Retrieve an Event
      sig do
        params(
          event_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Event)
      end
      def retrieve(
        # The identifier of the Event.
        event_id,
        request_options: {}
      )
      end

      # List Events
      sig do
        params(
          associated_object_id: String,
          category: Increase::EventListParams::Category::OrHash,
          created_at: Increase::EventListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          order_by: Increase::EventListParams::OrderBy::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::Event])
      end
      def list(
        # Filter Events to those belonging to the object with the provided identifier.
        associated_object_id: nil,
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        order_by: nil,
        request_options: {}
      )
      end

      sig do
        params(
          payload: String,
          headers: T::Hash[String, String],
          key: T.nilable(String)
        ).returns(Increase::UnwrapWebhookEvent)
      end
      def unwrap(
        # The raw webhook payload as a string
        payload,
        # The raw HTTP headers that came with the payload
        headers:,
        # The webhook signing key
        key: @client.webhook_secret
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
