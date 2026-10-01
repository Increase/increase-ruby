# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#create_details_token
    class CardDetailsToken < Increase::Internal::Type::BaseModel
      # @!attribute token
      #   The token. Pass this to the `@increasebank/card-elements` library in your
      #   frontend. Treat it as a credential: it authorizes anyone holding it to read the
      #   Card's details until it expires.
      #
      #   @return [String]
      required :token, String

      # @!attribute expires_at
      #   The time the token will expire. Tokens are valid for one hour.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_details_token`.
      #
      #   @return [Symbol, Increase::Models::CardDetailsToken::Type]
      required :type, enum: -> { Increase::CardDetailsToken::Type }

      # @!method initialize(token:, expires_at:, type:)
      #   A short-lived token that authorizes Increase Card Elements to render the details
      #   of a single Card.
      #
      #   @param token [String]
      #     The token. Pass this to the `@increasebank/card-elements` library in your
      #     frontend. Treat it as a credential: it authorizes anyone holding it to read the
      #     Card's details until it expires.
      #
      #   @param expires_at [Time] The time the token will expire. Tokens are valid for one hour.
      #
      #   @param type [Symbol, Increase::Models::CardDetailsToken::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `card_details_token`.

      # A constant representing the object's type. For this resource it will always be
      # `card_details_token`.
      #
      # @see Increase::Models::CardDetailsToken#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_DETAILS_TOKEN = :card_details_token

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
