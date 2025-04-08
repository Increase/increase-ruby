# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCardProfiles#create
    class PhysicalCardProfileCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute carrier_image_file_id
      #   The identifier of the File containing the physical card's carrier image.
      #
      #   @return [String]
      required :carrier_image_file_id, String

      # @!attribute contact_phone
      #   A phone number the user can contact to receive support for their card.
      #
      #   @return [String]
      required :contact_phone, String

      # @!attribute description
      #   A description you can use to identify the Card Profile.
      #
      #   @return [String]
      required :description, String

      # @!attribute front_image_file_id
      #   The identifier of the File containing the physical card's front image.
      #
      #   @return [String]
      required :front_image_file_id, String

      # @!attribute program_id
      #   The identifier for the Program that this Physical Card Profile falls under.
      #
      #   @return [String]
      required :program_id, String

      # @!parse
      #   # @param carrier_image_file_id [String]
      #   # @param contact_phone [String]
      #   # @param description [String]
      #   # @param front_image_file_id [String]
      #   # @param program_id [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     carrier_image_file_id:,
      #     contact_phone:,
      #     description:,
      #     front_image_file_id:,
      #     program_id:,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
