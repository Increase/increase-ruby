# typed: strong

module Increase
  module Models
    class DigitalCardProfile < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::DigitalCardProfile, Increase::Internal::AnyHash)
        end

      # The Card Profile identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier of the File containing the card's icon image.
      sig { returns(String) }
      attr_accessor :app_icon_file_id

      # The identifier of the File containing the card's front image.
      sig { returns(String) }
      attr_accessor :background_image_file_id

      # A user-facing description for the card itself.
      sig { returns(String) }
      attr_accessor :card_description

      # An email address the user can contact to receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_email

      # A phone number the user can contact to receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_phone

      # A website the user can visit to view and receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_website

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Digital Card Profile was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # A description you can use to identify the Card Profile.
      sig { returns(String) }
      attr_accessor :description

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # A user-facing description for whoever is issuing the card.
      sig { returns(String) }
      attr_accessor :issuer_name

      # The status of the Card Profile.
      sig { returns(Increase::DigitalCardProfile::Status::TaggedSymbol) }
      attr_accessor :status

      # The Card's text color, specified as an RGB triple.
      sig { returns(Increase::DigitalCardProfile::TextColor) }
      attr_reader :text_color

      sig do
        params(text_color: Increase::DigitalCardProfile::TextColor::OrHash).void
      end
      attr_writer :text_color

      # A constant representing the object's type. For this resource it will always be
      # `digital_card_profile`.
      sig { returns(Increase::DigitalCardProfile::Type::TaggedSymbol) }
      attr_accessor :type

      # This contains artwork and metadata relating to a Card's appearance in digital
      # wallet apps like Apple Pay and Google Pay. For more information, see our guide
      # on [digital card artwork](https://increase.com/documentation/card-art).
      sig do
        params(
          id: String,
          app_icon_file_id: String,
          background_image_file_id: String,
          card_description: String,
          contact_email: T.nilable(String),
          contact_phone: T.nilable(String),
          contact_website: T.nilable(String),
          created_at: Time,
          description: String,
          idempotency_key: T.nilable(String),
          issuer_name: String,
          status: Increase::DigitalCardProfile::Status::OrSymbol,
          text_color: Increase::DigitalCardProfile::TextColor::OrHash,
          type: Increase::DigitalCardProfile::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Card Profile identifier.
        id:,
        # The identifier of the File containing the card's icon image.
        app_icon_file_id:,
        # The identifier of the File containing the card's front image.
        background_image_file_id:,
        # A user-facing description for the card itself.
        card_description:,
        # An email address the user can contact to receive support for their card.
        contact_email:,
        # A phone number the user can contact to receive support for their card.
        contact_phone:,
        # A website the user can visit to view and receive support for their card.
        contact_website:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Digital Card Profile was created.
        created_at:,
        # A description you can use to identify the Card Profile.
        description:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # A user-facing description for whoever is issuing the card.
        issuer_name:,
        # The status of the Card Profile.
        status:,
        # The Card's text color, specified as an RGB triple.
        text_color:,
        # A constant representing the object's type. For this resource it will always be
        # `digital_card_profile`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            app_icon_file_id: String,
            background_image_file_id: String,
            card_description: String,
            contact_email: T.nilable(String),
            contact_phone: T.nilable(String),
            contact_website: T.nilable(String),
            created_at: Time,
            description: String,
            idempotency_key: T.nilable(String),
            issuer_name: String,
            status: Increase::DigitalCardProfile::Status::TaggedSymbol,
            text_color: Increase::DigitalCardProfile::TextColor,
            type: Increase::DigitalCardProfile::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The status of the Card Profile.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::DigitalCardProfile::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Card Profile is awaiting review from Increase and/or processing by card networks.
        PENDING =
          T.let(:pending, Increase::DigitalCardProfile::Status::TaggedSymbol)

        # There is an issue with the Card Profile preventing it from use.
        REJECTED =
          T.let(:rejected, Increase::DigitalCardProfile::Status::TaggedSymbol)

        # The Card Profile can be assigned to Cards.
        ACTIVE =
          T.let(:active, Increase::DigitalCardProfile::Status::TaggedSymbol)

        # The Card Profile is no longer in use.
        ARCHIVED =
          T.let(:archived, Increase::DigitalCardProfile::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::DigitalCardProfile::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class TextColor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalCardProfile::TextColor,
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

        # The Card's text color, specified as an RGB triple.
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

      # A constant representing the object's type. For this resource it will always be
      # `digital_card_profile`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::DigitalCardProfile::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DIGITAL_CARD_PROFILE =
          T.let(
            :digital_card_profile,
            Increase::DigitalCardProfile::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DigitalCardProfile::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
