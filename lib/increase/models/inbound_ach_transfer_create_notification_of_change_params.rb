# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundACHTransfers#create_notification_of_change
    class InboundACHTransferCreateNotificationOfChangeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_ach_transfer_id
      #   The identifier of the Inbound ACH Transfer for which to create a notification of
      #   change.
      #
      #   @return [String]
      required :inbound_ach_transfer_id, String

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

      # @!method initialize(inbound_ach_transfer_id:, updated_account_number: nil, updated_routing_number: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundACHTransferCreateNotificationOfChangeParams} for more
      #   details.
      #
      #   @param inbound_ach_transfer_id [String] The identifier of the Inbound ACH Transfer for which to create a notification of
      #
      #   @param updated_account_number [String] The updated account number to send in the notification of change.
      #
      #   @param updated_routing_number [String] The updated routing number to send in the notification of change.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
