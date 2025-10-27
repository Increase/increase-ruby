# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardRefunds#create
      class CardRefundCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute amount
        #   The refund amount in cents. Pulled off the `pending_transaction` or the
        #   `transaction` if not provided.
        #
        #   @return [Integer, nil]
        optional :amount, Integer

        # @!attribute pending_transaction_id
        #   The identifier of the Pending Transaction for the refund authorization. If this
        #   is provided, `transaction` must not be provided as a refund with a refund
        #   authorized can not be linked to a regular transaction.
        #
        #   @return [String, nil]
        optional :pending_transaction_id, String

        # @!attribute transaction_id
        #   The identifier for the Transaction to refund. The Transaction's source must have
        #   a category of card_settlement.
        #
        #   @return [String, nil]
        optional :transaction_id, String

        # @!method initialize(amount: nil, pending_transaction_id: nil, transaction_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CardRefundCreateParams} for more details.
        #
        #   @param amount [Integer] The refund amount in cents. Pulled off the `pending_transaction` or the `transac
        #
        #   @param pending_transaction_id [String] The identifier of the Pending Transaction for the refund authorization. If this
        #
        #   @param transaction_id [String] The identifier for the Transaction to refund. The Transaction's source must have
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
