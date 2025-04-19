# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardSettlements#create
      class CardSettlementCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute card_id
        #   The identifier of the Card to create a settlement on.
        #
        #   @return [String]
        required :card_id, String

        # @!attribute pending_transaction_id
        #   The identifier of the Pending Transaction for the Card Authorization you wish to
        #   settle.
        #
        #   @return [String]
        required :pending_transaction_id, String

        # @!attribute amount
        #   The amount to be settled. This defaults to the amount of the Pending Transaction
        #   being settled.
        #
        #   @return [Integer, nil]
        optional :amount, Integer

        # @!method initialize(card_id:, pending_transaction_id:, amount: nil, request_options: {})
        #   @param card_id [String]
        #   @param pending_transaction_id [String]
        #   @param amount [Integer]
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
