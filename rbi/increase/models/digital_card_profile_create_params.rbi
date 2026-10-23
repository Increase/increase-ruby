# typed: strong

module Increase
  module Models
    class DigitalCardProfileCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::DigitalCardProfileCreateParams,
            Increase::Internal::AnyHash
          )
        end

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

      # Apple Pay specific settings for the Card Profile.
      sig do
        returns(T.nilable(Increase::DigitalCardProfileCreateParams::ApplePay))
      end
      attr_reader :apple_pay

      sig do
        params(
          apple_pay: Increase::DigitalCardProfileCreateParams::ApplePay::OrHash
        ).void
      end
      attr_writer :apple_pay

      # An email address the user can contact to receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_reader :contact_email

      sig { params(contact_email: String).void }
      attr_writer :contact_email

      # The name of your company or card program, shown to the user as who to contact
      # for support with their card.
      sig { returns(T.nilable(String)) }
      attr_reader :contact_name

      sig { params(contact_name: String).void }
      attr_writer :contact_name

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
          apple_pay: Increase::DigitalCardProfileCreateParams::ApplePay::OrHash,
          contact_email: String,
          contact_name: String,
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
        # Apple Pay specific settings for the Card Profile.
        apple_pay: nil,
        # An email address the user can contact to receive support for their card.
        contact_email: nil,
        # The name of your company or card program, shown to the user as who to contact
        # for support with their card.
        contact_name: nil,
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
            apple_pay: Increase::DigitalCardProfileCreateParams::ApplePay,
            contact_email: String,
            contact_name: String,
            contact_phone: String,
            contact_website: String,
            text_color: Increase::DigitalCardProfileCreateParams::TextColor,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class ApplePay < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalCardProfileCreateParams::ApplePay,
              Increase::Internal::AnyHash
            )
          end

        # The applications to associate with cards using this Card Profile.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedApplicationIdentifier
              ]
            )
          )
        end
        attr_reader :associated_application_identifiers

        sig do
          params(
            associated_application_identifiers:
              T::Array[
                Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedApplicationIdentifier::OrHash
              ]
          ).void
        end
        attr_writer :associated_application_identifiers

        # The App Store listings of the applications to associate with cards using this
        # Card Profile.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedStoreIdentifier
              ]
            )
          )
        end
        attr_reader :associated_store_identifiers

        sig do
          params(
            associated_store_identifiers:
              T::Array[
                Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedStoreIdentifier::OrHash
              ]
          ).void
        end
        attr_writer :associated_store_identifiers

        # Apple Pay specific settings for the Card Profile.
        sig do
          params(
            associated_application_identifiers:
              T::Array[
                Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedApplicationIdentifier::OrHash
              ],
            associated_store_identifiers:
              T::Array[
                Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedStoreIdentifier::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # The applications to associate with cards using this Card Profile.
          associated_application_identifiers: nil,
          # The App Store listings of the applications to associate with cards using this
          # Card Profile.
          associated_store_identifiers: nil
        )
        end

        sig do
          override.returns(
            {
              associated_application_identifiers:
                T::Array[
                  Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedApplicationIdentifier
                ],
              associated_store_identifiers:
                T::Array[
                  Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedStoreIdentifier
                ]
            }
          )
        end
        def to_hash
        end

        class AssociatedApplicationIdentifier < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedApplicationIdentifier,
                Increase::Internal::AnyHash
              )
            end

          # The application identifier, composed of your Apple Developer Team ID and the
          # application's bundle identifier, like `ABCDE12345.com.example.app`.
          sig { returns(String) }
          attr_accessor :identifier

          sig { params(identifier: String).returns(T.attached_class) }
          def self.new(
            # The application identifier, composed of your Apple Developer Team ID and the
            # application's bundle identifier, like `ABCDE12345.com.example.app`.
            identifier:
          )
          end

          sig { override.returns({ identifier: String }) }
          def to_hash
          end
        end

        class AssociatedStoreIdentifier < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DigitalCardProfileCreateParams::ApplePay::AssociatedStoreIdentifier,
                Increase::Internal::AnyHash
              )
            end

          # The numeric App Store identifier.
          sig { returns(String) }
          attr_accessor :identifier

          sig { params(identifier: String).returns(T.attached_class) }
          def self.new(
            # The numeric App Store identifier.
            identifier:
          )
          end

          sig { override.returns({ identifier: String }) }
          def to_hash
          end
        end
      end

      class TextColor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalCardProfileCreateParams::TextColor,
              Increase::Internal::AnyHash
            )
          end

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
