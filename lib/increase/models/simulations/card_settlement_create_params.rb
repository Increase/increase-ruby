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

        # @!attribute amount
        #   The amount to be settled. This defaults to the amount of the Pending Transaction
        #   being settled, or a random amount if `pending_transaction_id` is not provided.
        #
        #   @return [Integer, nil]
        optional :amount, Integer

        # @!attribute pending_transaction_id
        #   The identifier of the Pending Transaction for the Card Authorization you wish to
        #   settle. If not provided, the settlement will be force posted without a Card
        #   Authorization.
        #
        #   @return [String, nil]
        optional :pending_transaction_id, String

        # @!method initialize(card_id:, amount: nil, pending_transaction_id: nil, request_options: {})
        #   @param card_id [String] The identifier of the Card to create a settlement on.
        #
        #   @param amount [Integer]
        #     The amount to be settled. This defaults to the amount of the Pending Transaction
        #     being settled, or a random amount if `pending_transaction_id` is not provided.
        #
        #   @param pending_transaction_id [String]
        #     The identifier of the Pending Transaction for the Card Authorization you wish to
        #     settle. If not provided, the settlement will be force posted without a Card
        #     Authorization.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
