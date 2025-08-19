# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardTokens#create
      class CardTokenCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute capabilities
        #   The capabilities of the outbound card token.
        #
        #   @return [Array<Increase::Models::Simulations::CardTokenCreateParams::Capability>, nil]
        optional :capabilities,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Simulations::CardTokenCreateParams::Capability] }

        # @!attribute expiration
        #   The expiration date of the card.
        #
        #   @return [Date, nil]
        optional :expiration, Date

        # @!attribute last4
        #   The last 4 digits of the card number.
        #
        #   @return [String, nil]
        optional :last4, String

        # @!attribute prefix
        #   The prefix of the card number, usually the first 8 digits.
        #
        #   @return [String, nil]
        optional :prefix, String

        # @!attribute primary_account_number_length
        #   The total length of the card number, including prefix and last4.
        #
        #   @return [Integer, nil]
        optional :primary_account_number_length, Integer

        # @!method initialize(capabilities: nil, expiration: nil, last4: nil, prefix: nil, primary_account_number_length: nil, request_options: {})
        #   @param capabilities [Array<Increase::Models::Simulations::CardTokenCreateParams::Capability>] The capabilities of the outbound card token.
        #
        #   @param expiration [Date] The expiration date of the card.
        #
        #   @param last4 [String] The last 4 digits of the card number.
        #
        #   @param prefix [String] The prefix of the card number, usually the first 8 digits.
        #
        #   @param primary_account_number_length [Integer] The total length of the card number, including prefix and last4.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        class Capability < Increase::Internal::Type::BaseModel
          # @!attribute cross_border_push_transfers
          #   The cross-border push transfers capability.
          #
          #   @return [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers]
          required :cross_border_push_transfers,
                   enum: -> { Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers }

          # @!attribute domestic_push_transfers
          #   The domestic push transfers capability.
          #
          #   @return [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers]
          required :domestic_push_transfers,
                   enum: -> { Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers }

          # @!attribute route
          #   The route of the capability.
          #
          #   @return [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::Route]
          required :route, enum: -> { Increase::Simulations::CardTokenCreateParams::Capability::Route }

          # @!method initialize(cross_border_push_transfers:, domestic_push_transfers:, route:)
          #   @param cross_border_push_transfers [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers] The cross-border push transfers capability.
          #
          #   @param domestic_push_transfers [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers] The domestic push transfers capability.
          #
          #   @param route [Symbol, Increase::Models::Simulations::CardTokenCreateParams::Capability::Route] The route of the capability.

          # The cross-border push transfers capability.
          #
          # @see Increase::Models::Simulations::CardTokenCreateParams::Capability#cross_border_push_transfers
          module CrossBorderPushTransfers
            extend Increase::Internal::Type::Enum

            # The capability is supported.
            SUPPORTED = :supported

            # The capability is not supported.
            NOT_SUPPORTED = :not_supported

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The domestic push transfers capability.
          #
          # @see Increase::Models::Simulations::CardTokenCreateParams::Capability#domestic_push_transfers
          module DomesticPushTransfers
            extend Increase::Internal::Type::Enum

            # The capability is supported.
            SUPPORTED = :supported

            # The capability is not supported.
            NOT_SUPPORTED = :not_supported

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The route of the capability.
          #
          # @see Increase::Models::Simulations::CardTokenCreateParams::Capability#route
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
      end
    end
  end
end
