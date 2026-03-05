# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::ACHTransfers#settle
      class ACHTransferSettleParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute ach_transfer_id
        #   The identifier of the ACH Transfer you wish to become settled.
        #
        #   @return [String]
        required :ach_transfer_id, String

        # @!attribute inbound_funds_hold_behavior
        #   The behavior of the inbound funds hold that is created when the ACH Transfer is
        #   settled. If no behavior is specified, the inbound funds hold will be released
        #   immediately in order for the funds to be available for use.
        #
        #   @return [Symbol, Increase::Models::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior, nil]
        optional :inbound_funds_hold_behavior,
                 enum: -> { Increase::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior }

        # @!method initialize(ach_transfer_id:, inbound_funds_hold_behavior: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::ACHTransferSettleParams} for more details.
        #
        #   @param ach_transfer_id [String] The identifier of the ACH Transfer you wish to become settled.
        #
        #   @param inbound_funds_hold_behavior [Symbol, Increase::Models::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior] The behavior of the inbound funds hold that is created when the ACH Transfer is
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The behavior of the inbound funds hold that is created when the ACH Transfer is
        # settled. If no behavior is specified, the inbound funds hold will be released
        # immediately in order for the funds to be available for use.
        module InboundFundsHoldBehavior
          extend Increase::Internal::Type::Enum

          # Release the inbound funds hold immediately.
          RELEASE_IMMEDIATELY = :release_immediately

          # Release the inbound funds hold on the default schedule.
          RELEASE_ON_DEFAULT_SCHEDULE = :release_on_default_schedule

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
