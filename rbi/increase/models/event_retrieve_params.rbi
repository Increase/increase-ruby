# typed: strong

module Increase
  module Models
    class EventRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::EventRetrieveParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Event.
      sig { returns(String) }
      attr_accessor :event_id

      sig do
        params(
          event_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Event.
        event_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { event_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
