# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimeDecisions#retrieve
    class RealTimeDecisionRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute real_time_decision_id
      #   The identifier of the Real-Time Decision.
      #
      #   @return [String]
      required :real_time_decision_id, String

      # @!method initialize(real_time_decision_id:, request_options: {})
      #   @param real_time_decision_id [String] The identifier of the Real-Time Decision.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
