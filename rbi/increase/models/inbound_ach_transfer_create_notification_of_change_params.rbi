# typed: strong

module Increase
  module Models
    class InboundACHTransferCreateNotificationOfChangeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundACHTransferCreateNotificationOfChangeParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Inbound ACH Transfer for which to create a notification of
      # change.
      sig { returns(String) }
      attr_accessor :inbound_ach_transfer_id

      # The updated account number to send in the notification of change.
      sig { returns(T.nilable(String)) }
      attr_reader :updated_account_number

      sig { params(updated_account_number: String).void }
      attr_writer :updated_account_number

      # The updated routing number to send in the notification of change.
      sig { returns(T.nilable(String)) }
      attr_reader :updated_routing_number

      sig { params(updated_routing_number: String).void }
      attr_writer :updated_routing_number

      sig do
        params(
          inbound_ach_transfer_id: String,
          updated_account_number: String,
          updated_routing_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Inbound ACH Transfer for which to create a notification of
        # change.
        inbound_ach_transfer_id:,
        # The updated account number to send in the notification of change.
        updated_account_number: nil,
        # The updated routing number to send in the notification of change.
        updated_routing_number: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_ach_transfer_id: String,
            updated_account_number: String,
            updated_routing_number: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
