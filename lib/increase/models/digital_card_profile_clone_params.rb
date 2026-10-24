# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalCardProfiles#clone_
    class DigitalCardProfileCloneParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute digital_card_profile_id
      #   The identifier of the Digital Card Profile to clone.
      #
      #   @return [String]
      required :digital_card_profile_id, String

      # @!attribute app_icon_file_id
      #   The identifier of the File containing the card's icon image.
      #
      #   @return [String, nil]
      optional :app_icon_file_id, String

      # @!attribute apple_pay
      #   Apple Pay specific settings for the Card Profile. Each list you leave out is
      #   copied from the original Card Profile.
      #
      #   @return [Increase::Models::DigitalCardProfileCloneParams::ApplePay, nil]
      optional :apple_pay, -> { Increase::DigitalCardProfileCloneParams::ApplePay }

      # @!attribute background_image_file_id
      #   The identifier of the File containing the card's front image.
      #
      #   @return [String, nil]
      optional :background_image_file_id, String

      # @!attribute card_description
      #   A user-facing description for the card itself.
      #
      #   @return [String, nil]
      optional :card_description, String

      # @!attribute contact_email
      #   An email address the user can contact to receive support for their card.
      #
      #   @return [String, nil]
      optional :contact_email, String

      # @!attribute contact_name
      #   The name of your company or card program, shown to the user as who to contact
      #   for support with their card.
      #
      #   @return [String, nil]
      optional :contact_name, String

      # @!attribute contact_phone
      #   A phone number the user can contact to receive support for their card.
      #
      #   @return [String, nil]
      optional :contact_phone, String

      # @!attribute contact_website
      #   A website the user can visit to view and receive support for their card.
      #
      #   @return [String, nil]
      optional :contact_website, String

      # @!attribute description
      #   A description you can use to identify the Card Profile.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute text_color
      #   The Card's text color, specified as an RGB triple. The default is white.
      #
      #   @return [Increase::Models::DigitalCardProfileCloneParams::TextColor, nil]
      optional :text_color, -> { Increase::DigitalCardProfileCloneParams::TextColor }

      # @!method initialize(digital_card_profile_id:, app_icon_file_id: nil, apple_pay: nil, background_image_file_id: nil, card_description: nil, contact_email: nil, contact_name: nil, contact_phone: nil, contact_website: nil, description: nil, text_color: nil, request_options: {})
      #   @param digital_card_profile_id [String] The identifier of the Digital Card Profile to clone.
      #
      #   @param app_icon_file_id [String] The identifier of the File containing the card's icon image.
      #
      #   @param apple_pay [Increase::Models::DigitalCardProfileCloneParams::ApplePay]
      #     Apple Pay specific settings for the Card Profile. Each list you leave out is
      #     copied from the original Card Profile.
      #
      #   @param background_image_file_id [String] The identifier of the File containing the card's front image.
      #
      #   @param card_description [String] A user-facing description for the card itself.
      #
      #   @param contact_email [String] An email address the user can contact to receive support for their card.
      #
      #   @param contact_name [String]
      #     The name of your company or card program, shown to the user as who to contact
      #     for support with their card.
      #
      #   @param contact_phone [String] A phone number the user can contact to receive support for their card.
      #
      #   @param contact_website [String] A website the user can visit to view and receive support for their card.
      #
      #   @param description [String] A description you can use to identify the Card Profile.
      #
      #   @param text_color [Increase::Models::DigitalCardProfileCloneParams::TextColor]
      #     The Card's text color, specified as an RGB triple. The default is white.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class ApplePay < Increase::Internal::Type::BaseModel
        # @!attribute associated_application_identifiers
        #   The applications to associate with cards using this Card Profile.
        #
        #   @return [Array<Increase::Models::DigitalCardProfileCloneParams::ApplePay::AssociatedApplicationIdentifier>, nil]
        optional :associated_application_identifiers,
                 -> { Increase::Internal::Type::ArrayOf[Increase::DigitalCardProfileCloneParams::ApplePay::AssociatedApplicationIdentifier] }

        # @!attribute associated_store_identifiers
        #   The App Store listings of the applications to associate with cards using this
        #   Card Profile.
        #
        #   @return [Array<Increase::Models::DigitalCardProfileCloneParams::ApplePay::AssociatedStoreIdentifier>, nil]
        optional :associated_store_identifiers,
                 -> { Increase::Internal::Type::ArrayOf[Increase::DigitalCardProfileCloneParams::ApplePay::AssociatedStoreIdentifier] }

        # @!method initialize(associated_application_identifiers: nil, associated_store_identifiers: nil)
        #   Apple Pay specific settings for the Card Profile. Each list you leave out is
        #   copied from the original Card Profile.
        #
        #   @param associated_application_identifiers [Array<Increase::Models::DigitalCardProfileCloneParams::ApplePay::AssociatedApplicationIdentifier>]
        #     The applications to associate with cards using this Card Profile.
        #
        #   @param associated_store_identifiers [Array<Increase::Models::DigitalCardProfileCloneParams::ApplePay::AssociatedStoreIdentifier>]
        #     The App Store listings of the applications to associate with cards using this
        #     Card Profile.

        class AssociatedApplicationIdentifier < Increase::Internal::Type::BaseModel
          # @!attribute identifier
          #   The application identifier, composed of your Apple Developer Team ID and the
          #   application's bundle identifier, like `ABCDE12345.com.example.app`.
          #
          #   @return [String]
          required :identifier, String

          # @!method initialize(identifier:)
          #   @param identifier [String]
          #     The application identifier, composed of your Apple Developer Team ID and the
          #     application's bundle identifier, like `ABCDE12345.com.example.app`.
        end

        class AssociatedStoreIdentifier < Increase::Internal::Type::BaseModel
          # @!attribute identifier
          #   The numeric App Store identifier.
          #
          #   @return [String]
          required :identifier, String

          # @!method initialize(identifier:)
          #   @param identifier [String] The numeric App Store identifier.
        end
      end

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

        # @!method initialize(blue:, green:, red:)
        #   The Card's text color, specified as an RGB triple. The default is white.
        #
        #   @param blue [Integer] The value of the blue channel in the RGB color.
        #
        #   @param green [Integer] The value of the green channel in the RGB color.
        #
        #   @param red [Integer] The value of the red channel in the RGB color.
      end
    end
  end
end
