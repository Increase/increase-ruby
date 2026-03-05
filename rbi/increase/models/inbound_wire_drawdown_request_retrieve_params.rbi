# typed: strong

module Increase
  module Models
    class InboundWireDrawdownRequestRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundWireDrawdownRequestRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Inbound Wire Drawdown Request to retrieve.
      sig { returns(String) }
      attr_accessor :inbound_wire_drawdown_request_id

      sig do
        params(
          inbound_wire_drawdown_request_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Inbound Wire Drawdown Request to retrieve.
        inbound_wire_drawdown_request_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_wire_drawdown_request_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
