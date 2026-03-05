# typed: strong

module Increase
  module Models
    class RealTimePaymentsTransferCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::RealTimePaymentsTransferCancelParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the pending Real-Time Payments Transfer to cancel.
      sig { returns(String) }
      attr_accessor :real_time_payments_transfer_id

      sig do
        params(
          real_time_payments_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the pending Real-Time Payments Transfer to cancel.
        real_time_payments_transfer_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            real_time_payments_transfer_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
