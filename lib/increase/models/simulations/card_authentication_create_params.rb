# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardAuthentications#create
      class CardAuthenticationCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute card_id
        #   The identifier of the Card to be authorized.
        #
        #   @return [String]
        required :card_id, String

        # @!attribute category
        #   The category of the card authentication attempt.
        #
        #   @return [Symbol, Increase::Models::Simulations::CardAuthenticationCreateParams::Category, nil]
        optional :category, enum: -> { Increase::Simulations::CardAuthenticationCreateParams::Category }

        # @!attribute device_channel
        #   The device channel of the card authentication attempt.
        #
        #   @return [Symbol, Increase::Models::Simulations::CardAuthenticationCreateParams::DeviceChannel, nil]
        optional :device_channel,
                 enum: -> { Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel }

        # @!attribute merchant_acceptor_id
        #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
        #   is transacting with.
        #
        #   @return [String, nil]
        optional :merchant_acceptor_id, String

        # @!attribute merchant_category_code
        #   The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        #   card is transacting with.
        #
        #   @return [String, nil]
        optional :merchant_category_code, String

        # @!attribute merchant_country
        #   The country the merchant resides in.
        #
        #   @return [String, nil]
        optional :merchant_country, String

        # @!attribute merchant_name
        #   The name of the merchant
        #
        #   @return [String, nil]
        optional :merchant_name, String

        # @!attribute purchase_amount
        #   The purchase amount in cents.
        #
        #   @return [Integer, nil]
        optional :purchase_amount, Integer

        # @!method initialize(card_id:, category: nil, device_channel: nil, merchant_acceptor_id: nil, merchant_category_code: nil, merchant_country: nil, merchant_name: nil, purchase_amount: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CardAuthenticationCreateParams} for more
        #   details.
        #
        #   @param card_id [String] The identifier of the Card to be authorized.
        #
        #   @param category [Symbol, Increase::Models::Simulations::CardAuthenticationCreateParams::Category] The category of the card authentication attempt.
        #
        #   @param device_channel [Symbol, Increase::Models::Simulations::CardAuthenticationCreateParams::DeviceChannel] The device channel of the card authentication attempt.
        #
        #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
        #
        #   @param merchant_category_code [String] The Merchant Category Code (commonly abbreviated as MCC) of the merchant the car
        #
        #   @param merchant_country [String] The country the merchant resides in.
        #
        #   @param merchant_name [String] The name of the merchant
        #
        #   @param purchase_amount [Integer] The purchase amount in cents.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The category of the card authentication attempt.
        module Category
          extend Increase::Internal::Type::Enum

          # The authentication attempt is for a payment.
          PAYMENT_AUTHENTICATION = :payment_authentication

          # The authentication attempt is not for a payment.
          NON_PAYMENT_AUTHENTICATION = :non_payment_authentication

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The device channel of the card authentication attempt.
        module DeviceChannel
          extend Increase::Internal::Type::Enum

          # The authentication attempt was made from an app.
          APP = :app

          # The authentication attempt was made from a browser.
          BROWSER = :browser

          # The authentication attempt was initiated by the 3DS Requestor.
          THREE_DS_REQUESTOR_INITIATED = :three_ds_requestor_initiated

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
