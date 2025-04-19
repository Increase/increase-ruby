# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundACHTransfers#create_notification_of_change
    class InboundACHTransferCreateNotificationOfChangeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute updated_account_number
      #   The updated account number to send in the notification of change.
      #
      #   @return [String, nil]
      optional :updated_account_number, String

      # @!attribute updated_routing_number
      #   The updated routing number to send in the notification of change.
      #
      #   @return [String, nil]
      optional :updated_routing_number, String

      # @!method initialize(updated_account_number: nil, updated_routing_number: nil, request_options: {})
      #   @param updated_account_number [String]
      #   @param updated_routing_number [String]
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
