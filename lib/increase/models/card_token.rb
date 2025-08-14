# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardTokens#retrieve
    class CardToken < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Card Token's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the card token was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute expiration_date
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the card
      #   expires.
      #
      #   @return [Date]
      required :expiration_date, Date

      # @!attribute last4
      #   The last 4 digits of the card number.
      #
      #   @return [String]
      required :last4, String

      # @!attribute length
      #   The length of the card number.
      #
      #   @return [Integer]
      required :length, Integer

      # @!attribute prefix
      #   The prefix of the card number, usually 8 digits.
      #
      #   @return [String]
      required :prefix, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_token`.
      #
      #   @return [Symbol, Increase::Models::CardToken::Type]
      required :type, enum: -> { Increase::CardToken::Type }

      # @!method initialize(id:, created_at:, expiration_date:, last4:, length:, prefix:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardToken} for more details.
      #
      #   Card Tokens represent a tokenized card number that can be used for Card Push
      #   Transfers and Card Validations.
      #
      #   @param id [String] The Card Token's identifier.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param expiration_date [Date] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the card expire
      #
      #   @param last4 [String] The last 4 digits of the card number.
      #
      #   @param length [Integer] The length of the card number.
      #
      #   @param prefix [String] The prefix of the card number, usually 8 digits.
      #
      #   @param type [Symbol, Increase::Models::CardToken::Type] A constant representing the object's type. For this resource it will always be `

      # A constant representing the object's type. For this resource it will always be
      # `card_token`.
      #
      # @see Increase::Models::CardToken#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_TOKEN = :card_token

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
