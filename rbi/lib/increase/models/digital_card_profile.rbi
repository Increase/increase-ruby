# typed: strong

module Increase
  module Models
    class DigitalCardProfile < Increase::Internal::Type::BaseModel
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
      #   the Card Dispute was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # A description you can use to identify the Card Profile.
      sig { returns(String) }
      attr_accessor :description

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # A user-facing description for whoever is issuing the card.
      sig { returns(String) }
      attr_accessor :issuer_name

      # The status of the Card Profile.
      sig { returns(Increase::Models::DigitalCardProfile::Status::TaggedSymbol) }
      attr_accessor :status

      # The Card's text color, specified as an RGB triple.
      sig { returns(Increase::Models::DigitalCardProfile::TextColor) }
      attr_reader :text_color

      sig do
        params(text_color: T.any(Increase::Models::DigitalCardProfile::TextColor, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :text_color

      # A constant representing the object's type. For this resource it will always be
      #   `digital_card_profile`.
      sig { returns(Increase::Models::DigitalCardProfile::Type::TaggedSymbol) }
      attr_accessor :type

      # This contains artwork and metadata relating to a Card's appearance in digital
      #   wallet apps like Apple Pay and Google Pay. For more information, see our guide
      #   on [digital card artwork](https://increase.com/documentation/card-art).
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
          status: Increase::Models::DigitalCardProfile::Status::OrSymbol,
          text_color: T.any(Increase::Models::DigitalCardProfile::TextColor, Increase::Internal::AnyHash),
          type: Increase::Models::DigitalCardProfile::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        app_icon_file_id:,
        background_image_file_id:,
        card_description:,
        contact_email:,
        contact_phone:,
        contact_website:,
        created_at:,
        description:,
        idempotency_key:,
        issuer_name:,
        status:,
        text_color:,
        type:
      )
      end

      sig do
        override
          .returns(
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
              status: Increase::Models::DigitalCardProfile::Status::TaggedSymbol,
              text_color: Increase::Models::DigitalCardProfile::TextColor,
              type: Increase::Models::DigitalCardProfile::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      # The status of the Card Profile.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::DigitalCardProfile::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::DigitalCardProfile::Status::TaggedSymbol) }

        # The Card Profile is awaiting review from Increase and/or processing by card networks.
        PENDING = T.let(:pending, Increase::Models::DigitalCardProfile::Status::TaggedSymbol)

        # There is an issue with the Card Profile preventing it from use.
        REJECTED = T.let(:rejected, Increase::Models::DigitalCardProfile::Status::TaggedSymbol)

        # The Card Profile can be assigned to Cards.
        ACTIVE = T.let(:active, Increase::Models::DigitalCardProfile::Status::TaggedSymbol)

        # The Card Profile is no longer in use.
        ARCHIVED = T.let(:archived, Increase::Models::DigitalCardProfile::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::DigitalCardProfile::Status::TaggedSymbol]) }
        def self.values
        end
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

        # The Card's text color, specified as an RGB triple.
        sig { params(blue: Integer, green: Integer, red: Integer).returns(T.attached_class) }
        def self.new(blue:, green:, red:)
        end

        sig { override.returns({blue: Integer, green: Integer, red: Integer}) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `digital_card_profile`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::DigitalCardProfile::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::DigitalCardProfile::Type::TaggedSymbol) }

        DIGITAL_CARD_PROFILE =
          T.let(:digital_card_profile, Increase::Models::DigitalCardProfile::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::DigitalCardProfile::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
