# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardFuelConfirmations#create
      class CardFuelConfirmationCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute amount
        #   The amount of the fuel_confirmation in minor units in the card authorization's
        #   currency.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute card_payment_id
        #   The identifier of the Card Payment to create a fuel_confirmation on.
        #
        #   @return [String]
        required :card_payment_id, String

        # @!method initialize(amount:, card_payment_id:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CardFuelConfirmationCreateParams} for more
        #   details.
        #
        #   @param amount [Integer] The amount of the fuel_confirmation in minor units in the card authorization's c
        #
        #   @param card_payment_id [String] The identifier of the Card Payment to create a fuel_confirmation on.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
