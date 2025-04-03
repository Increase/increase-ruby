# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardRefunds#create
      class CardRefundCreateParams < Increase::Internal::Type::BaseModel
        # @!parse
        #   extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute transaction_id
        #   The identifier for the Transaction to refund. The Transaction's source must have
        #     a category of card_settlement.
        #
        #   @return [String]
        required :transaction_id, String

        # @!parse
        #   # @param transaction_id [String]
        #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(transaction_id:, request_options: {}, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
