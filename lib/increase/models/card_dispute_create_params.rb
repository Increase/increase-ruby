# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#create
    class CardDisputeCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute disputed_transaction_id
      #   The Transaction you wish to dispute. This Transaction must have a `source_type`
      #   of `card_settlement`.
      #
      #   @return [String]
      required :disputed_transaction_id, String

      # @!attribute explanation
      #   Why you are disputing this Transaction.
      #
      #   @return [String]
      required :explanation, String

      # @!attribute amount
      #   The monetary amount of the part of the transaction that is being disputed. This
      #   is optional and will default to the full amount of the transaction if not
      #   provided. If provided, the amount must be less than or equal to the amount of
      #   the transaction.
      #
      #   @return [Integer, nil]
      optional :amount, Integer

      # @!method initialize(disputed_transaction_id:, explanation:, amount: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardDisputeCreateParams} for more details.
      #
      #   @param disputed_transaction_id [String] The Transaction you wish to dispute. This Transaction must have a `source_type`
      #
      #   @param explanation [String] Why you are disputing this Transaction.
      #
      #   @param amount [Integer] The monetary amount of the part of the transaction that is being disputed. This
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
