# typed: strong

module Increase
  module Models
    class CardDetailsAPI < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardDetailsAPI, Increase::Internal::AnyHash)
        end

      # The identifier for the Card for which sensitive details have been returned.
      sig { returns(String) }
      attr_accessor :card_id

      # The month the card expires in M format (e.g., August is 8).
      sig { returns(Integer) }
      attr_accessor :expiration_month

      # The year the card expires in YYYY format (e.g., 2025).
      sig { returns(Integer) }
      attr_accessor :expiration_year

      # The 4-digit PIN for the card, for use with ATMs.
      sig { returns(String) }
      attr_accessor :pin

      # The card number.
      sig { returns(String) }
      attr_accessor :primary_account_number

      # A constant representing the object's type. For this resource it will always be
      # `card_details`.
      sig { returns(Increase::CardDetailsAPI::Type::TaggedSymbol) }
      attr_accessor :type

      # The three-digit verification code for the card. It's also known as the Card
      # Verification Code (CVC), the Card Verification Value (CVV), or the Card
      # Identification (CID).
      sig { returns(String) }
      attr_accessor :verification_code

      # An object containing the sensitive details (card number, CVC, etc) for a Card.
      sig do
        params(
          card_id: String,
          expiration_month: Integer,
          expiration_year: Integer,
          pin: String,
          primary_account_number: String,
          type: Increase::CardDetailsAPI::Type::OrSymbol,
          verification_code: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the Card for which sensitive details have been returned.
        card_id:,
        # The month the card expires in M format (e.g., August is 8).
        expiration_month:,
        # The year the card expires in YYYY format (e.g., 2025).
        expiration_year:,
        # The 4-digit PIN for the card, for use with ATMs.
        pin:,
        # The card number.
        primary_account_number:,
        # A constant representing the object's type. For this resource it will always be
        # `card_details`.
        type:,
        # The three-digit verification code for the card. It's also known as the Card
        # Verification Code (CVC), the Card Verification Value (CVV), or the Card
        # Identification (CID).
        verification_code:
      )
      end

      sig do
        override.returns(
          {
            card_id: String,
            expiration_month: Integer,
            expiration_year: Integer,
            pin: String,
            primary_account_number: String,
            type: Increase::CardDetailsAPI::Type::TaggedSymbol,
            verification_code: String
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_details`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardDetailsAPI::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_DETAILS =
          T.let(:card_details, Increase::CardDetailsAPI::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardDetailsAPI::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
