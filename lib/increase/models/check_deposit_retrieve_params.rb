# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckDeposits#retrieve
    class CheckDepositRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute check_deposit_id
      #   The identifier of the Check Deposit to retrieve.
      #
      #   @return [String]
      required :check_deposit_id, String

      # @!method initialize(check_deposit_id:, request_options: {})
      #   @param check_deposit_id [String] The identifier of the Check Deposit to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
