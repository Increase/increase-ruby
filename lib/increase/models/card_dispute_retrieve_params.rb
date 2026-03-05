# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#retrieve
    class CardDisputeRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_dispute_id
      #   The identifier of the Card Dispute.
      #
      #   @return [String]
      required :card_dispute_id, String

      # @!method initialize(card_dispute_id:, request_options: {})
      #   @param card_dispute_id [String] The identifier of the Card Dispute.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
