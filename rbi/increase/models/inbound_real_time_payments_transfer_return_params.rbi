# typed: strong

module Increase
  module Models
    class InboundRealTimePaymentsTransferReturnParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundRealTimePaymentsTransferReturnParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Inbound Real-Time Payments Transfer to return to its
      # sender.
      sig { returns(String) }
      attr_accessor :inbound_real_time_payments_transfer_id

      # The amount to return, in USD cents. Defaults to the full amount of the Inbound
      # Real-Time Payments Transfer, and can't be higher than it.
      sig { returns(T.nilable(Integer)) }
      attr_reader :amount

      sig { params(amount: Integer).void }
      attr_writer :amount

      sig do
        params(
          inbound_real_time_payments_transfer_id: String,
          amount: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Inbound Real-Time Payments Transfer to return to its
        # sender.
        inbound_real_time_payments_transfer_id:,
        # The amount to return, in USD cents. Defaults to the full amount of the Inbound
        # Real-Time Payments Transfer, and can't be higher than it.
        amount: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_real_time_payments_transfer_id: String,
            amount: Integer,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
