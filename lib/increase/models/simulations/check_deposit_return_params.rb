# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CheckDeposits#return_
      class CheckDepositReturnParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute check_deposit_id
        #   The identifier of the Check Deposit you wish to return.
        #
        #   @return [String]
        required :check_deposit_id, String

        # @!method initialize(check_deposit_id:, request_options: {})
        #   @param check_deposit_id [String] The identifier of the Check Deposit you wish to return.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
