# typed: strong

module Increase
  module Models
    class InboundWireTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundWireTransferRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Inbound Wire Transfer to get details for.
      sig { returns(String) }
      attr_accessor :inbound_wire_transfer_id

      sig do
        params(
          inbound_wire_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Inbound Wire Transfer to get details for.
        inbound_wire_transfer_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_wire_transfer_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
