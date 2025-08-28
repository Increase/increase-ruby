# typed: strong

module Increase
  module Models
    module Simulations
      class ACHTransferSettleParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::ACHTransferSettleParams,
              Increase::Internal::AnyHash
            )
          end

        # The behavior of the inbound funds hold that is created when the ACH Transfer is
        # settled. If no behavior is specified, the inbound funds hold will be released
        # immediately in order for the funds to be available for use.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior::OrSymbol
            )
          )
        end
        attr_reader :inbound_funds_hold_behavior

        sig do
          params(
            inbound_funds_hold_behavior:
              Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior::OrSymbol
          ).void
        end
        attr_writer :inbound_funds_hold_behavior

        sig do
          params(
            inbound_funds_hold_behavior:
              Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The behavior of the inbound funds hold that is created when the ACH Transfer is
          # settled. If no behavior is specified, the inbound funds hold will be released
          # immediately in order for the funds to be available for use.
          inbound_funds_hold_behavior: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              inbound_funds_hold_behavior:
                Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The behavior of the inbound funds hold that is created when the ACH Transfer is
        # settled. If no behavior is specified, the inbound funds hold will be released
        # immediately in order for the funds to be available for use.
        module InboundFundsHoldBehavior
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Release the inbound funds hold immediately.
          RELEASE_IMMEDIATELY =
            T.let(
              :release_immediately,
              Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior::TaggedSymbol
            )

          # Release the inbound funds hold on the default schedule.
          RELEASE_ON_DEFAULT_SCHEDULE =
            T.let(
              :release_on_default_schedule,
              Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior::TaggedSymbol
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
