# typed: strong

module Increase
  module Models
    module Simulations
      class WireDrawdownRequestRefuseParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::WireDrawdownRequestRefuseParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Wire Drawdown Request you wish to refuse.
        sig { returns(String) }
        attr_accessor :wire_drawdown_request_id

        # Additional information about the refusal that the simulated refusal will have.
        sig { returns(T.nilable(String)) }
        attr_reader :refusal_reason_additional_information

        sig { params(refusal_reason_additional_information: String).void }
        attr_writer :refusal_reason_additional_information

        # The reason code that the simulated refusal will have.
        #
        # Defaults to `other`.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::OrSymbol
            )
          )
        end
        attr_reader :refusal_reason_code

        sig do
          params(
            refusal_reason_code:
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::OrSymbol
          ).void
        end
        attr_writer :refusal_reason_code

        sig do
          params(
            wire_drawdown_request_id: String,
            refusal_reason_additional_information: String,
            refusal_reason_code:
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Wire Drawdown Request you wish to refuse.
          wire_drawdown_request_id:,
          # Additional information about the refusal that the simulated refusal will have.
          refusal_reason_additional_information: nil,
          # The reason code that the simulated refusal will have.
          #
          # Defaults to `other`.
          refusal_reason_code: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              wire_drawdown_request_id: String,
              refusal_reason_additional_information: String,
              refusal_reason_code:
                Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The reason code that the simulated refusal will have.
        #
        # Defaults to `other`.
        module RefusalReasonCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The debtor's account number is invalid or missing. Corresponds to the Fedwire reason code `AC02`.
          INVALID_DEBTOR_ACCOUNT_NUMBER =
            T.let(
              :invalid_debtor_account_number,
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::TaggedSymbol
            )

          # The debtor account does not allow drawdown requests. Corresponds to the Fedwire reason code `AG01`.
          TRANSACTION_FORBIDDEN =
            T.let(
              :transaction_forbidden,
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::TaggedSymbol
            )

          # The debtor account cannot be debited for a generic reason. Corresponds to the Fedwire reason code `AG07`.
          UNSUCCESSFUL_DIRECT_DEBIT =
            T.let(
              :unsuccessful_direct_debit,
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::TaggedSymbol
            )

          # The debtor's identification is inconsistent with the debtor account number. Corresponds to the Fedwire reason code `BE01`.
          INCONSISTENT_WITH_END_CUSTOMER =
            T.let(
              :inconsistent_with_end_customer,
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::TaggedSymbol
            )

          # The reason is provided as narrative information in the additional information field. Corresponds to the Fedwire reason code `NARR`.
          NARRATIVE =
            T.let(
              :narrative,
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::TaggedSymbol
            )

          # Some other error or issue has occurred.
          OTHER =
            T.let(
              :other,
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::TaggedSymbol
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
