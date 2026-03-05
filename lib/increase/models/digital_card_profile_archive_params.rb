# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalCardProfiles#archive
    class DigitalCardProfileArchiveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute digital_card_profile_id
      #   The identifier of the Digital Card Profile to archive.
      #
      #   @return [String]
      required :digital_card_profile_id, String

      # @!method initialize(digital_card_profile_id:, request_options: {})
      #   @param digital_card_profile_id [String] The identifier of the Digital Card Profile to archive.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
