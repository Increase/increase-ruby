# typed: strong

module Increase
  module Models
    class InboundACHTransferTransferReturnParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The reason why this transfer will be returned. The most usual return codes are
      #   `payment_stopped` for debits and `credit_entry_refused_by_receiver` for credits.
      sig { returns(Increase::Models::InboundACHTransferTransferReturnParams::Reason::OrSymbol) }
      attr_accessor :reason

      sig do
        params(
          reason: Increase::Models::InboundACHTransferTransferReturnParams::Reason::OrSymbol,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(reason:, request_options: {})
      end

      sig do
        override
          .returns(
            {
              reason: Increase::Models::InboundACHTransferTransferReturnParams::Reason::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      # The reason why this transfer will be returned. The most usual return codes are
      #   `payment_stopped` for debits and `credit_entry_refused_by_receiver` for credits.
      module Reason
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Models::InboundACHTransferTransferReturnParams::Reason) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol) }

        # The customer's account has insufficient funds. This reason is only allowed for debits. The Nacha return code is R01.
        INSUFFICIENT_FUNDS =
          T.let(:insufficient_funds, Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol)

        # The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request. The Nacha return code is R06.
        RETURNED_PER_ODFI_REQUEST =
          T.let(
            :returned_per_odfi_request,
            Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol
          )

        # The customer no longer authorizes this transaction. The Nacha return code is R07.
        AUTHORIZATION_REVOKED_BY_CUSTOMER =
          T.let(
            :authorization_revoked_by_customer,
            Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol
          )

        # The customer asked for the payment to be stopped. This reason is only allowed for debits. The Nacha return code is R08.
        PAYMENT_STOPPED =
          T.let(:payment_stopped, Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol)

        # The customer advises that the debit was unauthorized. The Nacha return code is R10.
        CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
          T.let(
            :customer_advised_unauthorized_improper_ineligible_or_incomplete,
            Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol
          )

        # The payee is deceased. The Nacha return code is R14.
        REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
          T.let(
            :representative_payee_deceased_or_unable_to_continue_in_that_capacity,
            Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol
          )

        # The account holder is deceased. The Nacha return code is R15.
        BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED =
          T.let(
            :beneficiary_or_account_holder_deceased,
            Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol
          )

        # The customer refused a credit entry. This reason is only allowed for credits. The Nacha return code is R23.
        CREDIT_ENTRY_REFUSED_BY_RECEIVER =
          T.let(
            :credit_entry_refused_by_receiver,
            Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol
          )

        # The account holder identified this transaction as a duplicate. The Nacha return code is R24.
        DUPLICATE_ENTRY =
          T.let(:duplicate_entry, Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol)

        # The corporate customer no longer authorizes this transaction. The Nacha return code is R29.
        CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED =
          T.let(
            :corporate_customer_advised_not_authorized,
            Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol
          )

        sig { override.returns(T::Array[Increase::Models::InboundACHTransferTransferReturnParams::Reason::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
