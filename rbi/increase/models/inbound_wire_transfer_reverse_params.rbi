# typed: strong

module Increase
  module Models
    class InboundWireTransferReverseParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Reason for the reversal.
      sig { returns(Increase::Models::InboundWireTransferReverseParams::Reason::OrSymbol) }
      attr_accessor :reason

      sig do
        params(
          reason: Increase::Models::InboundWireTransferReverseParams::Reason::OrSymbol,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # Reason for the reversal.
        reason:,
        request_options: {}
      ); end
      sig do
        override
          .returns(
            {
              reason: Increase::Models::InboundWireTransferReverseParams::Reason::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash; end

      # Reason for the reversal.
      module Reason
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundWireTransferReverseParams::Reason) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The inbound wire transfer was a duplicate.
        DUPLICATE = T.let(:duplicate, Increase::Models::InboundWireTransferReverseParams::Reason::TaggedSymbol)

        # The recipient of the wire transfer requested the funds be returned to the sender.
        CREDITOR_REQUEST =
          T.let(:creditor_request, Increase::Models::InboundWireTransferReverseParams::Reason::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::InboundWireTransferReverseParams::Reason::TaggedSymbol]) }
        def self.values; end
      end
    end
  end
end
