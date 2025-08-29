# typed: strong

module Increase
  module Models
    module Simulations
      class InboundCheckDepositCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::InboundCheckDepositCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account Number the Inbound Check Deposit will be against.
        sig { returns(String) }
        attr_accessor :account_number_id

        # The check amount in cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The check number on the check to be deposited.
        sig { returns(String) }
        attr_accessor :check_number

        # Simulate the outcome of
        # [payee name checking](https://increase.com/documentation/positive-pay#payee-name-mismatches).
        # Defaults to `not_evaluated`.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis::OrSymbol
            )
          )
        end
        attr_reader :payee_name_analysis

        sig do
          params(
            payee_name_analysis:
              Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis::OrSymbol
          ).void
        end
        attr_writer :payee_name_analysis

        sig do
          params(
            account_number_id: String,
            amount: Integer,
            check_number: String,
            payee_name_analysis:
              Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account Number the Inbound Check Deposit will be against.
          account_number_id:,
          # The check amount in cents.
          amount:,
          # The check number on the check to be deposited.
          check_number:,
          # Simulate the outcome of
          # [payee name checking](https://increase.com/documentation/positive-pay#payee-name-mismatches).
          # Defaults to `not_evaluated`.
          payee_name_analysis: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account_number_id: String,
              amount: Integer,
              check_number: String,
              payee_name_analysis:
                Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Simulate the outcome of
        # [payee name checking](https://increase.com/documentation/positive-pay#payee-name-mismatches).
        # Defaults to `not_evaluated`.
        module PayeeNameAnalysis
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The details on the check match the recipient name of the check transfer.
          NAME_MATCHES =
            T.let(
              :name_matches,
              Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis::TaggedSymbol
            )

          # The details on the check do not match the recipient name of the check transfer.
          DOES_NOT_MATCH =
            T.let(
              :does_not_match,
              Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis::TaggedSymbol
            )

          # The payee name analysis was not evaluated.
          NOT_EVALUATED =
            T.let(
              :not_evaluated,
              Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::InboundCheckDepositCreateParams::PayeeNameAnalysis::TaggedSymbol
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
