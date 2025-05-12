# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::Programs#create
      class ProgramCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute name
        #   The name of the program being added.
        #
        #   @return [String]
        required :name, String

        # @!attribute reserve_account_id
        #   The identifier of the Account the Program should be added to is for.
        #
        #   @return [String, nil]
        optional :reserve_account_id, String

        # @!method initialize(name:, reserve_account_id: nil, request_options: {})
        #   @param name [String] The name of the program being added.
        #
        #   @param reserve_account_id [String] The identifier of the Account the Program should be added to is for.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
