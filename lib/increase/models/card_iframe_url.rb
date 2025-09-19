# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDetails#create_details_iframe
    class CardIframeURL < Increase::Internal::Type::BaseModel
      # @!attribute expires_at
      #   The time the iframe URL will expire.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute iframe_url
      #   The iframe URL for the Card. Treat this as an opaque URL.
      #
      #   @return [String]
      required :iframe_url, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_iframe_url`.
      #
      #   @return [Symbol, Increase::Models::CardIframeURL::Type]
      required :type, enum: -> { Increase::CardIframeURL::Type }

      # @!method initialize(expires_at:, iframe_url:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardIframeURL} for more details.
      #
      #   An object containing the iframe URL for a Card.
      #
      #   @param expires_at [Time] The time the iframe URL will expire.
      #
      #   @param iframe_url [String] The iframe URL for the Card. Treat this as an opaque URL.
      #
      #   @param type [Symbol, Increase::Models::CardIframeURL::Type] A constant representing the object's type. For this resource it will always be `

      # A constant representing the object's type. For this resource it will always be
      # `card_iframe_url`.
      #
      # @see Increase::Models::CardIframeURL#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_IFRAME_URL = :card_iframe_url

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
