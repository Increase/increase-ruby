# typed: strong

module Increase
  module Models
    module Simulations
      class InboundCheckDepositAdjustmentParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::InboundCheckDepositAdjustmentParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Inbound Check Deposit to adjust.
        sig { returns(String) }
        attr_accessor :inbound_check_deposit_id

        # The adjustment amount in cents. Defaults to the amount of the Inbound Check
        # Deposit.
        sig { returns(T.nilable(Integer)) }
        attr_reader :amount

        sig { params(amount: Integer).void }
        attr_writer :amount

        # The reason for the adjustment. Defaults to `wrong_payee_credit`.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::OrSymbol
            )
          )
        end
        attr_reader :reason

        sig do
          params(
            reason:
              Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::OrSymbol
          ).void
        end
        attr_writer :reason

        sig do
          params(
            inbound_check_deposit_id: String,
            amount: Integer,
            reason:
              Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Inbound Check Deposit to adjust.
          inbound_check_deposit_id:,
          # The adjustment amount in cents. Defaults to the amount of the Inbound Check
          # Deposit.
          amount: nil,
          # The reason for the adjustment. Defaults to `wrong_payee_credit`.
          reason: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              inbound_check_deposit_id: String,
              amount: Integer,
              reason:
                Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The reason for the adjustment. Defaults to `wrong_payee_credit`.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The return was initiated too late and the receiving institution has responded with a Late Return Claim.
          LATE_RETURN =
            T.let(
              :late_return,
              Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          # The check was deposited to the wrong payee and the depositing institution has reimbursed the funds with a Wrong Payee Credit.
          WRONG_PAYEE_CREDIT =
            T.let(
              :wrong_payee_credit,
              Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          # The check was deposited with a different amount than what was written on the check.
          ADJUSTED_AMOUNT =
            T.let(
              :adjusted_amount,
              Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          # The recipient was not able to process the check. This usually happens for e.g., low quality images.
          NON_CONFORMING_ITEM =
            T.let(
              :non_conforming_item,
              Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          # The check has already been deposited elsewhere and so this is a duplicate.
          PAID =
            T.let(
              :paid,
              Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::InboundCheckDepositAdjustmentParams::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
