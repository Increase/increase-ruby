# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::ACHTransfers#create_notification_of_change
      class ACHTransferCreateNotificationOfChangeParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute ach_transfer_id
        #   The identifier of the ACH Transfer you wish to create a notification of change
        #   for.
        #
        #   @return [String]
        required :ach_transfer_id, String

        # @!attribute corrected_account_funding
        #   The corrected account funding type.
        #
        #   @return [Symbol, Increase::Models::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding, nil]
        optional :corrected_account_funding,
                 enum: -> { Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding }

        # @!attribute corrected_account_number
        #   The corrected account number.
        #
        #   @return [String, nil]
        optional :corrected_account_number, String

        # @!attribute corrected_individual_id
        #   The corrected individual identifier.
        #
        #   @return [String, nil]
        optional :corrected_individual_id, String

        # @!attribute corrected_routing_number
        #   The corrected routing number.
        #
        #   @return [String, nil]
        optional :corrected_routing_number, String

        # @!method initialize(ach_transfer_id:, corrected_account_funding: nil, corrected_account_number: nil, corrected_individual_id: nil, corrected_routing_number: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::ACHTransferCreateNotificationOfChangeParams} for
        #   more details.
        #
        #   @param ach_transfer_id [String] The identifier of the ACH Transfer you wish to create a notification of change f
        #
        #   @param corrected_account_funding [Symbol, Increase::Models::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding] The corrected account funding type.
        #
        #   @param corrected_account_number [String] The corrected account number.
        #
        #   @param corrected_individual_id [String] The corrected individual identifier.
        #
        #   @param corrected_routing_number [String] The corrected routing number.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The corrected account funding type.
        module CorrectedAccountFunding
          extend Increase::Internal::Type::Enum

          # A checking account.
          CHECKING = :checking

          # A savings account.
          SAVINGS = :savings

          # A bank's general ledger. Uncommon.
          GENERAL_LEDGER = :general_ledger

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
