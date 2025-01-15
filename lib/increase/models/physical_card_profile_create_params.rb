# frozen_string_literal: true

module Increase
  module Models
    class PhysicalCardProfileCreateParams < Increase::BaseModel
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

      # @!parse
      #   # @param carrier_image_file_id [String] The identifier of the File containing the physical card's carrier image.
      #   #
      #   # @param contact_phone [String] A phone number the user can contact to receive support for their card.
      #   #
      #   # @param description [String] A description you can use to identify the Card Profile.
      #   #
      #   # @param front_image_file_id [String] The identifier of the File containing the physical card's front image.
      #   #
      #   def initialize(carrier_image_file_id:, contact_phone:, description:, front_image_file_id:, **) = super

      # def initialize: (Hash | Increase::BaseModel) -> void
    end
  end
end
