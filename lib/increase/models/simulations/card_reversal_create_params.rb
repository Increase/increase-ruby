# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardReversals#create
      class CardReversalCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute card_payment_id
        #   The identifier of the Card Payment to create a reversal on.
        #
        #   @return [String]
        required :card_payment_id, String

        # @!attribute amount
        #   The amount of the reversal in minor units in the card authorization's currency.
        #   This defaults to the authorization amount.
        #
        #   @return [Integer, nil]
        optional :amount, Integer

        # @!method initialize(card_payment_id:, amount: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CardReversalCreateParams} for more details.
        #
        #   @param card_payment_id [String] The identifier of the Card Payment to create a reversal on.
        #
        #   @param amount [Integer] The amount of the reversal in minor units in the card authorization's currency.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
