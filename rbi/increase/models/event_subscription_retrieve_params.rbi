# typed: strong

module Increase
  module Models
    class EventSubscriptionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::EventSubscriptionRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Event Subscription.
      sig { returns(String) }
      attr_accessor :event_subscription_id

      sig do
        params(
          event_subscription_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Event Subscription.
        event_subscription_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event_subscription_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
