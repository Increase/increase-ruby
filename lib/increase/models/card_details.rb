# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDetails#update
    class CardDetailsAPI < Increase::Internal::Type::BaseModel
      # @!attribute card_id
      #   The identifier for the Card for which sensitive details have been returned.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute expiration_month
      #   The month the card expires in M format (e.g., August is 8).
      #
      #   @return [Integer]
      required :expiration_month, Integer

      # @!attribute expiration_year
      #   The year the card expires in YYYY format (e.g., 2025).
      #
      #   @return [Integer]
      required :expiration_year, Integer

      # @!attribute pin
      #   The 4-digit PIN for the card, for use with ATMs.
      #
      #   @return [String]
      required :pin, String

      # @!attribute primary_account_number
      #   The card number.
      #
      #   @return [String]
      required :primary_account_number, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_details`.
      #
      #   @return [Symbol, Increase::Models::CardDetailsAPI::Type]
      required :type, enum: -> { Increase::CardDetailsAPI::Type }

      # @!attribute verification_code
      #   The three-digit verification code for the card. It's also known as the Card
      #   Verification Code (CVC), the Card Verification Value (CVV), or the Card
      #   Identification (CID).
      #
      #   @return [String]
      required :verification_code, String

      # @!method initialize(card_id:, expiration_month:, expiration_year:, pin:, primary_account_number:, type:, verification_code:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardDetailsAPI} for more details.
      #
      #   An object containing the sensitive details (card number, CVC, etc) for a Card.
      #
      #   @param card_id [String] The identifier for the Card for which sensitive details have been returned.
      #
      #   @param expiration_month [Integer] The month the card expires in M format (e.g., August is 8).
      #
      #   @param expiration_year [Integer] The year the card expires in YYYY format (e.g., 2025).
      #
      #   @param pin [String] The 4-digit PIN for the card, for use with ATMs.
      #
      #   @param primary_account_number [String] The card number.
      #
      #   @param type [Symbol, Increase::Models::CardDetailsAPI::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param verification_code [String] The three-digit verification code for the card. It's also known as the Card Veri

      # A constant representing the object's type. For this resource it will always be
      # `card_details`.
      #
      # @see Increase::Models::CardDetailsAPI#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_DETAILS = :card_details

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
