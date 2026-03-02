# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardAuthentications#challenge_attempts
      class CardAuthenticationChallengeAttemptsParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute one_time_code
        #   The one-time code to be validated.
        #
        #   @return [String]
        required :one_time_code, String

        # @!method initialize(one_time_code:, request_options: {})
        #   @param one_time_code [String] The one-time code to be validated.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
