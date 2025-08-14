# typed: strong

module Increase
  module Models
    class CardToken < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::CardToken, Increase::Internal::AnyHash) }

      # The Card Token's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the card token was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the card
      # expires.
      sig { returns(Date) }
      attr_accessor :expiration_date

      # The last 4 digits of the card number.
      sig { returns(String) }
      attr_accessor :last4

      # The length of the card number.
      sig { returns(Integer) }
      attr_accessor :length

      # The prefix of the card number, usually 8 digits.
      sig { returns(String) }
      attr_accessor :prefix

      # A constant representing the object's type. For this resource it will always be
      # `card_token`.
      sig { returns(Increase::CardToken::Type::TaggedSymbol) }
      attr_accessor :type

      # Card Tokens represent a tokenized card number that can be used for Card Push
      # Transfers and Card Validations.
      sig do
        params(
          id: String,
          created_at: Time,
          expiration_date: Date,
          last4: String,
          length: Integer,
          prefix: String,
          type: Increase::CardToken::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Card Token's identifier.
        id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the card token was created.
        created_at:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the card
        # expires.
        expiration_date:,
        # The last 4 digits of the card number.
        last4:,
        # The length of the card number.
        length:,
        # The prefix of the card number, usually 8 digits.
        prefix:,
        # A constant representing the object's type. For this resource it will always be
        # `card_token`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            expiration_date: Date,
            last4: String,
            length: Integer,
            prefix: String,
            type: Increase::CardToken::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_token`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::CardToken::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_TOKEN = T.let(:card_token, Increase::CardToken::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::CardToken::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
