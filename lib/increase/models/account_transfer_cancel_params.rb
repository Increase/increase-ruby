# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountTransfers#cancel
    class AccountTransferCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_transfer_id
      #   The identifier of the pending Account Transfer to cancel.
      #
      #   @return [String]
      required :account_transfer_id, String

      # @!method initialize(account_transfer_id:, request_options: {})
      #   @param account_transfer_id [String] The identifier of the pending Account Transfer to cancel.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
