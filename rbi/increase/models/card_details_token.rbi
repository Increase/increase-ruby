# typed: strong

module Increase
  module Models
    class CardDetailsToken < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardDetailsToken, Increase::Internal::AnyHash)
        end

      # The token. Pass this to the `@increasebank/card-elements` library in your
      # frontend. Treat it as a credential: it authorizes anyone holding it to read the
      # Card's details until it expires.
      sig { returns(String) }
      attr_accessor :token

      # The time the token will expire. Tokens are valid for one hour.
      sig { returns(Time) }
      attr_accessor :expires_at

      # A constant representing the object's type. For this resource it will always be
      # `card_details_token`.
      sig { returns(Increase::CardDetailsToken::Type::TaggedSymbol) }
      attr_accessor :type

      # A short-lived token that authorizes Increase Card Elements to render the details
      # of a single Card.
      sig do
        params(
          token: String,
          expires_at: Time,
          type: Increase::CardDetailsToken::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The token. Pass this to the `@increasebank/card-elements` library in your
        # frontend. Treat it as a credential: it authorizes anyone holding it to read the
        # Card's details until it expires.
        token:,
        # The time the token will expire. Tokens are valid for one hour.
        expires_at:,
        # A constant representing the object's type. For this resource it will always be
        # `card_details_token`.
        type:
      )
      end

      sig do
        override.returns(
          {
            token: String,
            expires_at: Time,
            type: Increase::CardDetailsToken::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_details_token`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardDetailsToken::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_DETAILS_TOKEN =
          T.let(
            :card_details_token,
            Increase::CardDetailsToken::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::CardDetailsToken::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
