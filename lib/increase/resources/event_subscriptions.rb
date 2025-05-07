# frozen_string_literal: true

module Increase
  module Resources
    class EventSubscriptions
      # Some parameter documentations has been truncated, see
      # {Increase::Models::EventSubscriptionCreateParams} for more details.
      #
      # Create an Event Subscription
      #
      # @overload create(url:, oauth_connection_id: nil, selected_event_category: nil, shared_secret: nil, request_options: {})
      #
      # @param url [String] The URL you'd like us to send webhooks to.
      #
      # @param oauth_connection_id [String] If specified, this subscription will only receive webhooks for Events associated
      #
      # @param selected_event_category [Symbol, Increase::EventSubscriptionCreateParams::SelectedEventCategory] If specified, this subscription will only receive webhooks for Events with the s
      #
      # @param shared_secret [String] The key that will be used to sign webhooks. If no value is passed, a random stri
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::EventSubscription]
      #
      # @see Increase::Models::EventSubscriptionCreateParams
      def create(params)
        parsed, options = Increase::EventSubscriptionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "event_subscriptions",
          body: parsed,
          model: Increase::EventSubscription,
          options: options
        )
      end

      # Retrieve an Event Subscription
      #
      # @overload retrieve(event_subscription_id, request_options: {})
      #
      # @param event_subscription_id [String] The identifier of the Event Subscription.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::EventSubscription]
      #
      # @see Increase::Models::EventSubscriptionRetrieveParams
      def retrieve(event_subscription_id, params = {})
        @client.request(
          method: :get,
          path: ["event_subscriptions/%1$s", event_subscription_id],
          model: Increase::EventSubscription,
          options: params[:request_options]
        )
      end

      # Update an Event Subscription
      #
      # @overload update(event_subscription_id, status: nil, request_options: {})
      #
      # @param event_subscription_id [String] The identifier of the Event Subscription.
      #
      # @param status [Symbol, Increase::EventSubscriptionUpdateParams::Status] The status to update the Event Subscription with.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::EventSubscription]
      #
      # @see Increase::Models::EventSubscriptionUpdateParams
      def update(event_subscription_id, params = {})
        parsed, options = Increase::EventSubscriptionUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["event_subscriptions/%1$s", event_subscription_id],
          body: parsed,
          model: Increase::EventSubscription,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EventSubscriptionListParams} for more details.
      #
      # List Event Subscriptions
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::EventSubscription>]
      #
      # @see Increase::Models::EventSubscriptionListParams
      def list(params = {})
        parsed, options = Increase::EventSubscriptionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "event_subscriptions",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::EventSubscription,
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
