# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::DigitalWalletTokenRequests#create
      class DigitalWalletTokenRequestCreateParams < Increase::Internal::Type::BaseModel
        # @!parse
        #   extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute card_id
        #   The identifier of the Card to be authorized.
        #
        #   @return [String]
        required :card_id, String

        # @!parse
        #   # @param card_id [String]
        #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(card_id:, request_options: {}, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
