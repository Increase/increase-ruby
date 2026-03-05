# typed: strong

module Increase
  module Models
    class InboundRealTimePaymentsTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundRealTimePaymentsTransferRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Inbound Real-Time Payments Transfer to get details for.
      sig { returns(String) }
      attr_accessor :inbound_real_time_payments_transfer_id

      sig do
        params(
          inbound_real_time_payments_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Inbound Real-Time Payments Transfer to get details for.
        inbound_real_time_payments_transfer_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_real_time_payments_transfer_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
