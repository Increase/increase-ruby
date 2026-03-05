# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCardProfiles#retrieve
    class PhysicalCardProfileRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute physical_card_profile_id
      #   The identifier of the Card Profile.
      #
      #   @return [String]
      required :physical_card_profile_id, String

      # @!method initialize(physical_card_profile_id:, request_options: {})
      #   @param physical_card_profile_id [String] The identifier of the Card Profile.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
