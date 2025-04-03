# typed: strong

module Increase
  module Models
    class CheckTransferStopPaymentParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The reason why this transfer should be stopped.
      sig { returns(T.nilable(Increase::Models::CheckTransferStopPaymentParams::Reason::OrSymbol)) }
      attr_reader :reason

      sig { params(reason: Increase::Models::CheckTransferStopPaymentParams::Reason::OrSymbol).void }
      attr_writer :reason

      sig do
        params(
          reason: Increase::Models::CheckTransferStopPaymentParams::Reason::OrSymbol,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(reason: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              reason: Increase::Models::CheckTransferStopPaymentParams::Reason::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      # The reason why this transfer should be stopped.
      module Reason
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CheckTransferStopPaymentParams::Reason) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::CheckTransferStopPaymentParams::Reason::TaggedSymbol) }

        # The check could not be delivered.
        MAIL_DELIVERY_FAILED =
          T.let(:mail_delivery_failed, Increase::Models::CheckTransferStopPaymentParams::Reason::TaggedSymbol)

        # The check was not authorized.
        NOT_AUTHORIZED =
          T.let(:not_authorized, Increase::Models::CheckTransferStopPaymentParams::Reason::TaggedSymbol)

        # The check was stopped for another reason.
        UNKNOWN = T.let(:unknown, Increase::Models::CheckTransferStopPaymentParams::Reason::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::CheckTransferStopPaymentParams::Reason::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
