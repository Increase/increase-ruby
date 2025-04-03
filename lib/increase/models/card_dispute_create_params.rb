# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#create
    class CardDisputeCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute disputed_transaction_id
      #   The Transaction you wish to dispute. This Transaction must have a `source_type`
      #     of `card_settlement`.
      #
      #   @return [String]
      required :disputed_transaction_id, String

      # @!attribute explanation
      #   Why you are disputing this Transaction.
      #
      #   @return [String]
      required :explanation, String

      # @!attribute [r] amount
      #   The monetary amount of the part of the transaction that is being disputed. This
      #     is optional and will default to the full amount of the transaction if not
      #     provided. If provided, the amount must be less than or equal to the amount of
      #     the transaction.
      #
      #   @return [Integer, nil]
      optional :amount, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :amount

      # @!parse
      #   # @param disputed_transaction_id [String]
      #   # @param explanation [String]
      #   # @param amount [Integer]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(disputed_transaction_id:, explanation:, amount: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
