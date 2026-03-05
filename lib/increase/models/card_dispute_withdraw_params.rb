# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#withdraw
    class CardDisputeWithdrawParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_dispute_id
      #   The identifier of the Card Dispute to withdraw.
      #
      #   @return [String]
      required :card_dispute_id, String

      # @!attribute explanation
      #   The explanation for withdrawing the Card Dispute.
      #
      #   @return [String, nil]
      optional :explanation, String

      # @!method initialize(card_dispute_id:, explanation: nil, request_options: {})
      #   @param card_dispute_id [String] The identifier of the Card Dispute to withdraw.
      #
      #   @param explanation [String] The explanation for withdrawing the Card Dispute.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
