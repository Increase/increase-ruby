# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::EventSubscriptions#retrieve
    class EventSubscriptionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute event_subscription_id
      #   The identifier of the Event Subscription.
      #
      #   @return [String]
      required :event_subscription_id, String

      # @!method initialize(event_subscription_id:, request_options: {})
      #   @param event_subscription_id [String] The identifier of the Event Subscription.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
