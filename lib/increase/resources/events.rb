# frozen_string_literal: true

module Increase
  module Resources
    class Events
      # Retrieve an Event
      #
      # @overload retrieve(event_id, request_options: {})
      #
      # @param event_id [String] The identifier of the Event.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Event]
      #
      # @see Increase::Models::EventRetrieveParams
      def retrieve(event_id, params = {})
        @client.request(
          method: :get,
          path: ["events/%1$s", event_id],
          model: Increase::Event,
          options: params[:request_options]
        )
      end

      # List Events
      #
      # @overload list(associated_object_id: nil, category: nil, created_at: nil, cursor: nil, limit: nil, order_by: nil, request_options: {})
      #
      # @param associated_object_id [String]
      #   Filter Events to those belonging to the object with the provided identifier.
      #
      # @param category [Increase::Models::EventListParams::Category]
      #
      # @param created_at [Increase::Models::EventListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param order_by [Increase::Models::EventListParams::OrderBy]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::Event>]
      #
      # @see Increase::Models::EventListParams
      def list(params = {})
        parsed, options = Increase::EventListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "events",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::Event,
          options: options
        )
      end

      # @param payload [String] The raw webhook payload as a string
      #
      # @param headers [Hash{String=>String}] The raw HTTP headers that came with the payload
      #
      # @param key [String, nil]
      #   The webhook signing key, as the raw secret string. It is Base64-encoded before
      #   being passed to StandardWebhooks, so to sign a synthetic payload in tests,
      #   construct the signer the same way:
      #   StandardWebhooks::Webhook.new(Base64.strict_encode64(key))
      #
      # @return [Increase::Models::UnwrapWebhookEvent]
      def unwrap(payload, headers:, key: @client.webhook_secret)
        if key.nil?
          raise ArgumentError.new("Cannot verify a webhook without a key on either the client's webhook_secret or passed in as an argument")
        end

        ::StandardWebhooks::Webhook.new(Base64.strict_encode64(key)).verify(payload, headers)

        parsed = JSON.parse(payload, symbolize_names: true)
        Increase::Internal::Type::Converter.coerce(Increase::Models::UnwrapWebhookEvent, parsed)
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
