# frozen_string_literal: true

module Increase
  module Models
    class CardDisputeCreateParams < Increase::BaseModel
      # @!attribute disputed_transaction_id
      #   The Transaction you wish to dispute. This Transaction must have a `source_type` of `card_settlement`.
      #
      #   @return [String]
      required :disputed_transaction_id, String

      # @!attribute explanation
      #   Why you are disputing this Transaction.
      #
      #   @return [String]
      required :explanation, String

      # @!attribute amount
      #   The monetary amount of the part of the transaction that is being disputed. This is optional and will default to the full amount of the transaction if not provided. If provided, the amount must be less than or equal to the amount of the transaction.
      #
      #   @return [Integer]
      optional :amount, Integer

      # @!parse
      #   # @param disputed_transaction_id [String] The Transaction you wish to dispute. This Transaction must have a `source_type`
      #   #   of `card_settlement`.
      #   #
      #   # @param explanation [String] Why you are disputing this Transaction.
      #   #
      #   # @param amount [Integer] The monetary amount of the part of the transaction that is being disputed. This
      #   #   is optional and will default to the full amount of the transaction if not
      #   #   provided. If provided, the amount must be less than or equal to the amount of
      #   #   the transaction.
      #   #
      #   def initialize(disputed_transaction_id:, explanation:, amount: nil, **) = super

      # def initialize: (Hash | Increase::BaseModel) -> void
    end
  end
end
