# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardTokens#capabilities
    class CardTokenCapabilities < Increase::Internal::Type::BaseModel
      # @!attribute routes
      #   Each route represent a path e.g., a push transfer can take.
      #
      #   @return [Array<Increase::Models::CardTokenCapabilities::Route>]
      required :routes, -> { Increase::Internal::Type::ArrayOf[Increase::CardTokenCapabilities::Route] }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_token_capabilities`.
      #
      #   @return [Symbol, Increase::Models::CardTokenCapabilities::Type]
      required :type, enum: -> { Increase::CardTokenCapabilities::Type }

      # @!method initialize(routes:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardTokenCapabilities} for more details.
      #
      #   The capabilities of a Card Token describe whether the card can be used for
      #   specific operations, such as Card Push Transfers. The capabilities can change
      #   over time based on the issuing bank's configuration of the card range.
      #
      #   @param routes [Array<Increase::Models::CardTokenCapabilities::Route>] Each route represent a path e.g., a push transfer can take.
      #
      #   @param type [Symbol, Increase::Models::CardTokenCapabilities::Type] A constant representing the object's type. For this resource it will always be `

      class Route < Increase::Internal::Type::BaseModel
        # @!attribute cross_border_push_transfers
        #   Whether you can push funds to the card using cross-border Card Push Transfers.
        #
        #   @return [Symbol, Increase::Models::CardTokenCapabilities::Route::CrossBorderPushTransfers]
        required :cross_border_push_transfers,
                 enum: -> { Increase::CardTokenCapabilities::Route::CrossBorderPushTransfers }

        # @!attribute domestic_push_transfers
        #   Whether you can push funds to the card using domestic Card Push Transfers.
        #
        #   @return [Symbol, Increase::Models::CardTokenCapabilities::Route::DomesticPushTransfers]
        required :domestic_push_transfers,
                 enum: -> { Increase::CardTokenCapabilities::Route::DomesticPushTransfers }

        # @!attribute route
        #   The card network route the capabilities apply to.
        #
        #   @return [Symbol, Increase::Models::CardTokenCapabilities::Route::Route]
        required :route, enum: -> { Increase::CardTokenCapabilities::Route::Route }

        # @!method initialize(cross_border_push_transfers:, domestic_push_transfers:, route:)
        #   @param cross_border_push_transfers [Symbol, Increase::Models::CardTokenCapabilities::Route::CrossBorderPushTransfers] Whether you can push funds to the card using cross-border Card Push Transfers.
        #
        #   @param domestic_push_transfers [Symbol, Increase::Models::CardTokenCapabilities::Route::DomesticPushTransfers] Whether you can push funds to the card using domestic Card Push Transfers.
        #
        #   @param route [Symbol, Increase::Models::CardTokenCapabilities::Route::Route] The card network route the capabilities apply to.

        # Whether you can push funds to the card using cross-border Card Push Transfers.
        #
        # @see Increase::Models::CardTokenCapabilities::Route#cross_border_push_transfers
        module CrossBorderPushTransfers
          extend Increase::Internal::Type::Enum

          # The capability is supported.
          SUPPORTED = :supported

          # The capability is not supported.
          NOT_SUPPORTED = :not_supported

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Whether you can push funds to the card using domestic Card Push Transfers.
        #
        # @see Increase::Models::CardTokenCapabilities::Route#domestic_push_transfers
        module DomesticPushTransfers
          extend Increase::Internal::Type::Enum

          # The capability is supported.
          SUPPORTED = :supported

          # The capability is not supported.
          NOT_SUPPORTED = :not_supported

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The card network route the capabilities apply to.
        #
        # @see Increase::Models::CardTokenCapabilities::Route#route
        module Route
          extend Increase::Internal::Type::Enum

          # Visa and Interlink
          VISA = :visa

          # Mastercard and Maestro
          MASTERCARD = :mastercard

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_token_capabilities`.
      #
      # @see Increase::Models::CardTokenCapabilities#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_TOKEN_CAPABILITIES = :card_token_capabilities

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
