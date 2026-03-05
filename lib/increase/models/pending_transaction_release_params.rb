# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PendingTransactions#release
    class PendingTransactionReleaseParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute pending_transaction_id
      #   The identifier of the Pending Transaction to release.
      #
      #   @return [String]
      required :pending_transaction_id, String

      # @!method initialize(pending_transaction_id:, request_options: {})
      #   @param pending_transaction_id [String] The identifier of the Pending Transaction to release.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
