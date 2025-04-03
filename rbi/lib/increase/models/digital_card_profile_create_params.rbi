# typed: strong

module Increase
  module Models
    class DigitalCardProfileCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The identifier of the File containing the card's icon image.
      sig { returns(String) }
      attr_accessor :app_icon_file_id

      # The identifier of the File containing the card's front image.
      sig { returns(String) }
      attr_accessor :background_image_file_id

      # A user-facing description for the card itself.
      sig { returns(String) }
      attr_accessor :card_description

      # A description you can use to identify the Card Profile.
      sig { returns(String) }
      attr_accessor :description

      # A user-facing description for whoever is issuing the card.
      sig { returns(String) }
      attr_accessor :issuer_name

      # An email address the user can contact to receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_reader :contact_email

      sig { params(contact_email: String).void }
      attr_writer :contact_email

      # A phone number the user can contact to receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_reader :contact_phone

      sig { params(contact_phone: String).void }
      attr_writer :contact_phone

      # A website the user can visit to view and receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_reader :contact_website

      sig { params(contact_website: String).void }
      attr_writer :contact_website

      # The Card's text color, specified as an RGB triple. The default is white.
      sig { returns(T.nilable(Increase::Models::DigitalCardProfileCreateParams::TextColor)) }
      attr_reader :text_color

      sig do
        params(
          text_color: T.any(Increase::Models::DigitalCardProfileCreateParams::TextColor, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :text_color

      sig do
        params(
          app_icon_file_id: String,
          background_image_file_id: String,
          card_description: String,
          description: String,
          issuer_name: String,
          contact_email: String,
          contact_phone: String,
          contact_website: String,
          text_color: T.any(Increase::Models::DigitalCardProfileCreateParams::TextColor, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        app_icon_file_id:,
        background_image_file_id:,
        card_description:,
        description:,
        issuer_name:,
        contact_email: nil,
        contact_phone: nil,
        contact_website: nil,
        text_color: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              app_icon_file_id: String,
              background_image_file_id: String,
              card_description: String,
              description: String,
              issuer_name: String,
              contact_email: String,
              contact_phone: String,
              contact_website: String,
              text_color: Increase::Models::DigitalCardProfileCreateParams::TextColor,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class TextColor < Increase::Internal::Type::BaseModel
        # The value of the blue channel in the RGB color.
        sig { returns(Integer) }
        attr_accessor :blue

        # The value of the green channel in the RGB color.
        sig { returns(Integer) }
        attr_accessor :green

        # The value of the red channel in the RGB color.
        sig { returns(Integer) }
        attr_accessor :red

        # The Card's text color, specified as an RGB triple. The default is white.
        sig { params(blue: Integer, green: Integer, red: Integer).returns(T.attached_class) }
        def self.new(blue:, green:, red:)
        end

        sig { override.returns({blue: Integer, green: Integer, red: Integer}) }
        def to_hash
        end
      end
    end
  end
end
