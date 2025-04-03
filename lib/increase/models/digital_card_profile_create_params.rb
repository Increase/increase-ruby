# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalCardProfiles#create
    class DigitalCardProfileCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute app_icon_file_id
      #   The identifier of the File containing the card's icon image.
      #
      #   @return [String]
      required :app_icon_file_id, String

      # @!attribute background_image_file_id
      #   The identifier of the File containing the card's front image.
      #
      #   @return [String]
      required :background_image_file_id, String

      # @!attribute card_description
      #   A user-facing description for the card itself.
      #
      #   @return [String]
      required :card_description, String

      # @!attribute description
      #   A description you can use to identify the Card Profile.
      #
      #   @return [String]
      required :description, String

      # @!attribute issuer_name
      #   A user-facing description for whoever is issuing the card.
      #
      #   @return [String]
      required :issuer_name, String

      # @!attribute [r] contact_email
      #   An email address the user can contact to receive support for their card.
      #
      #   @return [String, nil]
      optional :contact_email, String

      # @!parse
      #   # @return [String]
      #   attr_writer :contact_email

      # @!attribute [r] contact_phone
      #   A phone number the user can contact to receive support for their card.
      #
      #   @return [String, nil]
      optional :contact_phone, String

      # @!parse
      #   # @return [String]
      #   attr_writer :contact_phone

      # @!attribute [r] contact_website
      #   A website the user can visit to view and receive support for their card.
      #
      #   @return [String, nil]
      optional :contact_website, String

      # @!parse
      #   # @return [String]
      #   attr_writer :contact_website

      # @!attribute [r] text_color
      #   The Card's text color, specified as an RGB triple. The default is white.
      #
      #   @return [Increase::Models::DigitalCardProfileCreateParams::TextColor, nil]
      optional :text_color, -> { Increase::Models::DigitalCardProfileCreateParams::TextColor }

      # @!parse
      #   # @return [Increase::Models::DigitalCardProfileCreateParams::TextColor]
      #   attr_writer :text_color

      # @!parse
      #   # @param app_icon_file_id [String]
      #   # @param background_image_file_id [String]
      #   # @param card_description [String]
      #   # @param description [String]
      #   # @param issuer_name [String]
      #   # @param contact_email [String]
      #   # @param contact_phone [String]
      #   # @param contact_website [String]
      #   # @param text_color [Increase::Models::DigitalCardProfileCreateParams::TextColor]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     app_icon_file_id:,
      #     background_image_file_id:,
      #     card_description:,
      #     description:,
      #     issuer_name:,
      #     contact_email: nil,
      #     contact_phone: nil,
      #     contact_website: nil,
      #     text_color: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class TextColor < Increase::Internal::Type::BaseModel
        # @!attribute blue
        #   The value of the blue channel in the RGB color.
        #
        #   @return [Integer]
        required :blue, Integer

        # @!attribute green
        #   The value of the green channel in the RGB color.
        #
        #   @return [Integer]
        required :green, Integer

        # @!attribute red
        #   The value of the red channel in the RGB color.
        #
        #   @return [Integer]
        required :red, Integer

        # @!parse
        #   # The Card's text color, specified as an RGB triple. The default is white.
        #   #
        #   # @param blue [Integer]
        #   # @param green [Integer]
        #   # @param red [Integer]
        #   #
        #   def initialize(blue:, green:, red:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
