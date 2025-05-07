# typed: strong

module Increase
  module Models
    class DigitalCardProfileCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

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
      sig do
        returns(T.nilable(Increase::DigitalCardProfileCreateParams::TextColor))
      end
      attr_reader :text_color

      sig do
        params(
          text_color:
            Increase::DigitalCardProfileCreateParams::TextColor::OrHash
        ).void
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
          text_color:
            Increase::DigitalCardProfileCreateParams::TextColor::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the File containing the card's icon image.
        app_icon_file_id:,
        # The identifier of the File containing the card's front image.
        background_image_file_id:,
        # A user-facing description for the card itself.
        card_description:,
        # A description you can use to identify the Card Profile.
        description:,
        # A user-facing description for whoever is issuing the card.
        issuer_name:,
        # An email address the user can contact to receive support for their card.
        contact_email: nil,
        # A phone number the user can contact to receive support for their card.
        contact_phone: nil,
        # A website the user can visit to view and receive support for their card.
        contact_website: nil,
        # The Card's text color, specified as an RGB triple. The default is white.
        text_color: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            app_icon_file_id: String,
            background_image_file_id: String,
            card_description: String,
            description: String,
            issuer_name: String,
            contact_email: String,
            contact_phone: String,
            contact_website: String,
            text_color: Increase::DigitalCardProfileCreateParams::TextColor,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class TextColor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

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
        sig do
          params(blue: Integer, green: Integer, red: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The value of the blue channel in the RGB color.
          blue:,
          # The value of the green channel in the RGB color.
          green:,
          # The value of the red channel in the RGB color.
          red:
        )
        end

        sig do
          override.returns({ blue: Integer, green: Integer, red: Integer })
        end
        def to_hash
        end
      end
    end
  end
end
