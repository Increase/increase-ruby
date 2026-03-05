# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardAuthentications#challenge_attempts
      class CardAuthenticationChallengeAttemptsParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute card_payment_id
        #   The identifier of the Card Payment to be challenged.
        #
        #   @return [String]
        required :card_payment_id, String

        # @!attribute one_time_code
        #   The one-time code to be validated.
        #
        #   @return [String]
        required :one_time_code, String

        # @!method initialize(card_payment_id:, one_time_code:, request_options: {})
        #   @param card_payment_id [String] The identifier of the Card Payment to be challenged.
        #
        #   @param one_time_code [String] The one-time code to be validated.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
