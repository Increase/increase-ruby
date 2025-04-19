# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardAuthorizationExpirations#create
      class CardAuthorizationExpirationCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute card_payment_id
        #   The identifier of the Card Payment to expire.
        #
        #   @return [String]
        required :card_payment_id, String

        # @!method initialize(card_payment_id:, request_options: {})
        #   @param card_payment_id [String]
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
