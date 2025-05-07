# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalCardProfiles#create
    class DigitalCardProfile < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Card Profile identifier.
      #
      #   @return [String]
      required :id, String

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

      # @!attribute contact_email
      #   An email address the user can contact to receive support for their card.
      #
      #   @return [String, nil]
      required :contact_email, String, nil?: true

      # @!attribute contact_phone
      #   A phone number the user can contact to receive support for their card.
      #
      #   @return [String, nil]
      required :contact_phone, String, nil?: true

      # @!attribute contact_website
      #   A website the user can visit to view and receive support for their card.
      #
      #   @return [String, nil]
      required :contact_website, String, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Card Dispute was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute description
      #   A description you can use to identify the Card Profile.
      #
      #   @return [String]
      required :description, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute issuer_name
      #   A user-facing description for whoever is issuing the card.
      #
      #   @return [String]
      required :issuer_name, String

      # @!attribute status
      #   The status of the Card Profile.
      #
      #   @return [Symbol, Increase::DigitalCardProfile::Status]
      required :status, enum: -> { Increase::DigitalCardProfile::Status }

      # @!attribute text_color
      #   The Card's text color, specified as an RGB triple.
      #
      #   @return [Increase::DigitalCardProfile::TextColor]
      required :text_color, -> { Increase::DigitalCardProfile::TextColor }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `digital_card_profile`.
      #
      #   @return [Symbol, Increase::DigitalCardProfile::Type]
      required :type, enum: -> { Increase::DigitalCardProfile::Type }

      # @!method initialize(id:, app_icon_file_id:, background_image_file_id:, card_description:, contact_email:, contact_phone:, contact_website:, created_at:, description:, idempotency_key:, issuer_name:, status:, text_color:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::DigitalCardProfile} for more details.
      #
      #   This contains artwork and metadata relating to a Card's appearance in digital
      #   wallet apps like Apple Pay and Google Pay. For more information, see our guide
      #   on [digital card artwork](https://increase.com/documentation/card-art).
      #
      #   @param id [String] The Card Profile identifier.
      #
      #   @param app_icon_file_id [String] The identifier of the File containing the card's icon image.
      #
      #   @param background_image_file_id [String] The identifier of the File containing the card's front image.
      #
      #   @param card_description [String] A user-facing description for the card itself.
      #
      #   @param contact_email [String, nil] An email address the user can contact to receive support for their card.
      #
      #   @param contact_phone [String, nil] A phone number the user can contact to receive support for their card.
      #
      #   @param contact_website [String, nil] A website the user can visit to view and receive support for their card.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param description [String] A description you can use to identify the Card Profile.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param issuer_name [String] A user-facing description for whoever is issuing the card.
      #
      #   @param status [Symbol, Increase::DigitalCardProfile::Status] The status of the Card Profile.
      #
      #   @param text_color [Increase::DigitalCardProfile::TextColor] The Card's text color, specified as an RGB triple.
      #
      #   @param type [Symbol, Increase::DigitalCardProfile::Type] A constant representing the object's type. For this resource it will always be `

      # The status of the Card Profile.
      #
      # @see Increase::DigitalCardProfile#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Card Profile is awaiting review from Increase and/or processing by card networks.
        PENDING = :pending

        # There is an issue with the Card Profile preventing it from use.
        REJECTED = :rejected

        # The Card Profile can be assigned to Cards.
        ACTIVE = :active

        # The Card Profile is no longer in use.
        ARCHIVED = :archived

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::DigitalCardProfile#text_color
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
        #   The Card's text color, specified as an RGB triple.
        #
        #   @param blue [Integer] The value of the blue channel in the RGB color.
        #
        #   @param green [Integer] The value of the green channel in the RGB color.
        #
        #   @param red [Integer] The value of the red channel in the RGB color.
      end

      # A constant representing the object's type. For this resource it will always be
      # `digital_card_profile`.
      #
      # @see Increase::DigitalCardProfile#type
      module Type
        extend Increase::Internal::Type::Enum

        DIGITAL_CARD_PROFILE = :digital_card_profile

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
