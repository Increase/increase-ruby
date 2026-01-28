# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#withdraw
    class CardDisputeWithdrawParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute explanation
      #   The explanation for withdrawing the Card Dispute.
      #
      #   @return [String, nil]
      optional :explanation, String

      # @!method initialize(explanation: nil, request_options: {})
      #   @param explanation [String] The explanation for withdrawing the Card Dispute.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
