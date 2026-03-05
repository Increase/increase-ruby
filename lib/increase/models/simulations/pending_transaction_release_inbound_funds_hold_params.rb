# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::PendingTransactions#release_inbound_funds_hold
      class PendingTransactionReleaseInboundFundsHoldParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute pending_transaction_id
        #   The pending transaction to release. The pending transaction must have a
        #   `inbound_funds_hold` source.
        #
        #   @return [String]
        required :pending_transaction_id, String

        # @!method initialize(pending_transaction_id:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::PendingTransactionReleaseInboundFundsHoldParams}
        #   for more details.
        #
        #   @param pending_transaction_id [String] The pending transaction to release. The pending transaction must have a `inbound
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
