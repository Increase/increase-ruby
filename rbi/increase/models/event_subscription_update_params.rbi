# typed: strong

module Increase
  module Models
    class EventSubscriptionUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The status to update the Event Subscription with.
      sig do
        returns(
          T.nilable(Increase::EventSubscriptionUpdateParams::Status::OrSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: Increase::EventSubscriptionUpdateParams::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig do
        params(
          status: Increase::EventSubscriptionUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The status to update the Event Subscription with.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            status: Increase::EventSubscriptionUpdateParams::Status::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The status to update the Event Subscription with.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::EventSubscriptionUpdateParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The subscription is active and Events will be delivered normally.
        ACTIVE =
          T.let(
            :active,
            Increase::EventSubscriptionUpdateParams::Status::TaggedSymbol
          )

        # The subscription is temporarily disabled and Events will not be delivered.
        DISABLED =
          T.let(
            :disabled,
            Increase::EventSubscriptionUpdateParams::Status::TaggedSymbol
          )

        # The subscription is permanently disabled and Events will not be delivered.
        DELETED =
          T.let(
            :deleted,
            Increase::EventSubscriptionUpdateParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::EventSubscriptionUpdateParams::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
