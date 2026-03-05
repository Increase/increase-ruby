# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Transactions#retrieve
    class TransactionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute transaction_id
      #   The identifier of the Transaction to retrieve.
      #
      #   @return [String]
      required :transaction_id, String

      # @!method initialize(transaction_id:, request_options: {})
      #   @param transaction_id [String] The identifier of the Transaction to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
