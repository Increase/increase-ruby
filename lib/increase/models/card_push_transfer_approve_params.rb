# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardPushTransfers#approve
    class CardPushTransferApproveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_push_transfer_id
      #   The identifier of the Card Push Transfer to approve.
      #
      #   @return [String]
      required :card_push_transfer_id, String

      # @!method initialize(card_push_transfer_id:, request_options: {})
      #   @param card_push_transfer_id [String] The identifier of the Card Push Transfer to approve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
