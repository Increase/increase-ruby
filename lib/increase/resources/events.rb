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
      # @return [Increase::Event]
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

      # Some parameter documentations has been truncated, see
      # {Increase::Models::EventListParams} for more details.
      #
      # List Events
      #
      # @overload list(associated_object_id: nil, category: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param associated_object_id [String] Filter Events to those belonging to the object with the provided identifier.
      #
      # @param category [Increase::EventListParams::Category]
      #
      # @param created_at [Increase::EventListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Event>]
      #
      # @see Increase::Models::EventListParams
      def list(params = {})
        parsed, options = Increase::EventListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "events",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Event,
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
