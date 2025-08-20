# typed: strong

module Increase
  module Models
    class CardIframeURL < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardIframeURL, Increase::Internal::AnyHash)
        end

      # The time the iframe URL will expire.
      sig { returns(Time) }
      attr_accessor :expires_at

      # The iframe URL for the Card. Treat this as an opaque URL.
      sig { returns(String) }
      attr_accessor :iframe_url

      # A constant representing the object's type. For this resource it will always be
      # `card_iframe_url`.
      sig { returns(Increase::CardIframeURL::Type::TaggedSymbol) }
      attr_accessor :type

      # An object containing the iframe URL for a Card.
      sig do
        params(
          expires_at: Time,
          iframe_url: String,
          type: Increase::CardIframeURL::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The time the iframe URL will expire.
        expires_at:,
        # The iframe URL for the Card. Treat this as an opaque URL.
        iframe_url:,
        # A constant representing the object's type. For this resource it will always be
        # `card_iframe_url`.
        type:
      )
      end

      sig do
        override.returns(
          {
            expires_at: Time,
            iframe_url: String,
            type: Increase::CardIframeURL::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_iframe_url`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardIframeURL::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_IFRAME_URL =
          T.let(:card_iframe_url, Increase::CardIframeURL::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardIframeURL::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
