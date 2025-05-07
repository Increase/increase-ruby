# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardIncrements#create
      class CardIncrementCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute amount
        #   The amount of the increment in minor units in the card authorization's currency.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute card_payment_id
        #   The identifier of the Card Payment to create a increment on.
        #
        #   @return [String]
        required :card_payment_id, String

        # @!attribute event_subscription_id
        #   The identifier of the Event Subscription to use. If provided, will override the
        #   default real time event subscription. Because you can only create one real time
        #   decision event subscription, you can use this field to route events to any
        #   specified event subscription for testing purposes.
        #
        #   @return [String, nil]
        optional :event_subscription_id, String

        # @!method initialize(amount:, card_payment_id:, event_subscription_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CardIncrementCreateParams} for more details.
        #
        #   @param amount [Integer] The amount of the increment in minor units in the card authorization's currency.
        #
        #   @param card_payment_id [String] The identifier of the Card Payment to create a increment on.
        #
        #   @param event_subscription_id [String] The identifier of the Event Subscription to use. If provided, will override the
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
