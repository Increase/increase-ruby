# typed: strong

module Increase
  module Models
    class InboundACHTransferDeclineParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The reason why this transfer will be returned. If this parameter is unset, the
      # return codes will be `payment_stopped` for debits and
      # `credit_entry_refused_by_receiver` for credits.
      sig do
        returns(
          T.nilable(Increase::InboundACHTransferDeclineParams::Reason::OrSymbol)
        )
      end
      attr_reader :reason

      sig do
        params(
          reason: Increase::InboundACHTransferDeclineParams::Reason::OrSymbol
        ).void
      end
      attr_writer :reason

      sig do
        params(
          reason: Increase::InboundACHTransferDeclineParams::Reason::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The reason why this transfer will be returned. If this parameter is unset, the
        # return codes will be `payment_stopped` for debits and
        # `credit_entry_refused_by_receiver` for credits.
        reason: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            reason: Increase::InboundACHTransferDeclineParams::Reason::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The reason why this transfer will be returned. If this parameter is unset, the
      # return codes will be `payment_stopped` for debits and
      # `credit_entry_refused_by_receiver` for credits.
      module Reason
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundACHTransferDeclineParams::Reason)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The customer's account has insufficient funds. This reason is only allowed for debits. The Nacha return code is R01.
        INSUFFICIENT_FUNDS =
          T.let(
            :insufficient_funds,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request. The Nacha return code is R06.
        RETURNED_PER_ODFI_REQUEST =
          T.let(
            :returned_per_odfi_request,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The customer no longer authorizes this transaction. The Nacha return code is R07.
        AUTHORIZATION_REVOKED_BY_CUSTOMER =
          T.let(
            :authorization_revoked_by_customer,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The customer asked for the payment to be stopped. This reason is only allowed for debits. The Nacha return code is R08.
        PAYMENT_STOPPED =
          T.let(
            :payment_stopped,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The customer advises that the debit was unauthorized. The Nacha return code is R10.
        CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
          T.let(
            :customer_advised_unauthorized_improper_ineligible_or_incomplete,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The payee is deceased. The Nacha return code is R14.
        REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
          T.let(
            :representative_payee_deceased_or_unable_to_continue_in_that_capacity,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The account holder is deceased. The Nacha return code is R15.
        BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED =
          T.let(
            :beneficiary_or_account_holder_deceased,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The customer refused a credit entry. This reason is only allowed for credits. The Nacha return code is R23.
        CREDIT_ENTRY_REFUSED_BY_RECEIVER =
          T.let(
            :credit_entry_refused_by_receiver,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The account holder identified this transaction as a duplicate. The Nacha return code is R24.
        DUPLICATE_ENTRY =
          T.let(
            :duplicate_entry,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        # The corporate customer no longer authorizes this transaction. The Nacha return code is R29.
        CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED =
          T.let(
            :corporate_customer_advised_not_authorized,
            Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::InboundACHTransferDeclineParams::Reason::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
