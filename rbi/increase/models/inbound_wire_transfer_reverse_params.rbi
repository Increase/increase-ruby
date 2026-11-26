# typed: strong

module Increase
  module Models
    class InboundWireTransferReverseParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundWireTransferReverseParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Inbound Wire Transfer to reverse.
      sig { returns(String) }
      attr_accessor :inbound_wire_transfer_id

      # Reason for the reversal.
      sig do
        returns(Increase::InboundWireTransferReverseParams::Reason::OrSymbol)
      end
      attr_accessor :reason

      # The amount to return, in USD cents. Defaults to the full amount of the Inbound
      # Wire Transfer. A transfer can only be reversed once, so any amount you don't
      # return now stays with the recipient.
      sig { returns(T.nilable(Integer)) }
      attr_reader :amount

      sig { params(amount: Integer).void }
      attr_writer :amount

      sig do
        params(
          inbound_wire_transfer_id: String,
          reason: Increase::InboundWireTransferReverseParams::Reason::OrSymbol,
          amount: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Inbound Wire Transfer to reverse.
        inbound_wire_transfer_id:,
        # Reason for the reversal.
        reason:,
        # The amount to return, in USD cents. Defaults to the full amount of the Inbound
        # Wire Transfer. A transfer can only be reversed once, so any amount you don't
        # return now stays with the recipient.
        amount: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_wire_transfer_id: String,
            reason:
              Increase::InboundWireTransferReverseParams::Reason::OrSymbol,
            amount: Integer,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Reason for the reversal.
      module Reason
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundWireTransferReverseParams::Reason)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The inbound wire transfer was a duplicate.
        DUPLICATE =
          T.let(
            :duplicate,
            Increase::InboundWireTransferReverseParams::Reason::TaggedSymbol
          )

        # The recipient of the wire transfer requested the funds be returned to the sender.
        CREDITOR_REQUEST =
          T.let(
            :creditor_request,
            Increase::InboundWireTransferReverseParams::Reason::TaggedSymbol
          )

        # The account cannot currently receive inbound wires.
        TRANSACTION_FORBIDDEN =
          T.let(
            :transaction_forbidden,
            Increase::InboundWireTransferReverseParams::Reason::TaggedSymbol
          )

        # The inbound wire transfer was fraudulent.
        FRAUD =
          T.let(
            :fraud,
            Increase::InboundWireTransferReverseParams::Reason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::InboundWireTransferReverseParams::Reason::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
