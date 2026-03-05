# typed: strong

module Increase
  module Models
    module Simulations
      class CheckDepositAdjustmentParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CheckDepositAdjustmentParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Check Deposit you wish to adjust.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        # The adjustment amount in the minor unit of the Check Deposit's currency (e.g.,
        # cents). A negative amount means that the funds are being clawed back by the
        # other bank and is a debit to your account. Defaults to the negative of the Check
        # Deposit amount.
        sig { returns(T.nilable(Integer)) }
        attr_reader :amount

        sig { params(amount: Integer).void }
        attr_writer :amount

        # The reason for the adjustment. Defaults to `non_conforming_item`, which is often
        # used for a low quality image that the recipient wasn't able to handle.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::OrSymbol
            )
          )
        end
        attr_reader :reason

        sig do
          params(
            reason:
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::OrSymbol
          ).void
        end
        attr_writer :reason

        sig do
          params(
            check_deposit_id: String,
            amount: Integer,
            reason:
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Check Deposit you wish to adjust.
          check_deposit_id:,
          # The adjustment amount in the minor unit of the Check Deposit's currency (e.g.,
          # cents). A negative amount means that the funds are being clawed back by the
          # other bank and is a debit to your account. Defaults to the negative of the Check
          # Deposit amount.
          amount: nil,
          # The reason for the adjustment. Defaults to `non_conforming_item`, which is often
          # used for a low quality image that the recipient wasn't able to handle.
          reason: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              check_deposit_id: String,
              amount: Integer,
              reason:
                Increase::Simulations::CheckDepositAdjustmentParams::Reason::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The reason for the adjustment. Defaults to `non_conforming_item`, which is often
        # used for a low quality image that the recipient wasn't able to handle.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::CheckDepositAdjustmentParams::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The return was initiated too late and the receiving institution has responded with a Late Return Claim.
          LATE_RETURN =
            T.let(
              :late_return,
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          # The check was deposited to the wrong payee and the depositing institution has reimbursed the funds with a Wrong Payee Credit.
          WRONG_PAYEE_CREDIT =
            T.let(
              :wrong_payee_credit,
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          # The check was deposited with a different amount than what was written on the check.
          ADJUSTED_AMOUNT =
            T.let(
              :adjusted_amount,
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          # The recipient was not able to process the check. This usually happens for e.g., low quality images.
          NON_CONFORMING_ITEM =
            T.let(
              :non_conforming_item,
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          # The check has already been deposited elsewhere and so this is a duplicate.
          PAID =
            T.let(
              :paid,
              Increase::Simulations::CheckDepositAdjustmentParams::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::CheckDepositAdjustmentParams::Reason::TaggedSymbol
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
