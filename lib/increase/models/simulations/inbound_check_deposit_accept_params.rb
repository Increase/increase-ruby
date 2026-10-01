# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundCheckDeposits#accept
      class InboundCheckDepositAcceptParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute inbound_check_deposit_id
        #   The identifier of the Inbound Check Deposit you wish to accept.
        #
        #   @return [String]
        required :inbound_check_deposit_id, String

        # @!method initialize(inbound_check_deposit_id:, request_options: {})
        #   @param inbound_check_deposit_id [String] The identifier of the Inbound Check Deposit you wish to accept.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
