# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#balance
    class AccountBalanceParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] at_time
      #   The moment to query the balance at. If not set, returns the current balances.
      #
      #   @return [Time, nil]
      optional :at_time, Time

      # @!parse
      #   # @return [Time]
      #   attr_writer :at_time

      # @!method initialize(at_time: nil, request_options: {})
      #   @param at_time [Time]
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
