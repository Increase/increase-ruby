# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DeclinedTransactions#retrieve
    class DeclinedTransactionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute declined_transaction_id
      #   The identifier of the Declined Transaction.
      #
      #   @return [String]
      required :declined_transaction_id, String

      # @!method initialize(declined_transaction_id:, request_options: {})
      #   @param declined_transaction_id [String] The identifier of the Declined Transaction.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
