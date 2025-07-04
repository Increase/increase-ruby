# typed: strong

module Increase
  module Models
    class File < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::File, Increase::Internal::AnyHash) }

      # The File's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The time the File was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # A description of the File.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Whether the File was generated by Increase or by you and sent to Increase.
      sig { returns(Increase::File::Direction::TaggedSymbol) }
      attr_accessor :direction

      # The filename that was provided upon upload or generated by Increase.
      sig { returns(T.nilable(String)) }
      attr_accessor :filename

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The MIME type of the file.
      sig { returns(String) }
      attr_accessor :mime_type

      # What the File will be used for. We may add additional possible values for this
      # enum over time; your application should be able to handle such additions
      # gracefully.
      sig { returns(Increase::File::Purpose::TaggedSymbol) }
      attr_accessor :purpose

      # A constant representing the object's type. For this resource it will always be
      # `file`.
      sig { returns(Increase::File::Type::TaggedSymbol) }
      attr_accessor :type

      # Files are objects that represent a file hosted on Increase's servers. The file
      # may have been uploaded by you (for example, when uploading a check image) or it
      # may have been created by Increase (for example, an autogenerated statement PDF).
      # If you need to download a File, create a File Link.
      sig do
        params(
          id: String,
          created_at: Time,
          description: T.nilable(String),
          direction: Increase::File::Direction::OrSymbol,
          filename: T.nilable(String),
          idempotency_key: T.nilable(String),
          mime_type: String,
          purpose: Increase::File::Purpose::OrSymbol,
          type: Increase::File::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The File's identifier.
        id:,
        # The time the File was created.
        created_at:,
        # A description of the File.
        description:,
        # Whether the File was generated by Increase or by you and sent to Increase.
        direction:,
        # The filename that was provided upon upload or generated by Increase.
        filename:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The MIME type of the file.
        mime_type:,
        # What the File will be used for. We may add additional possible values for this
        # enum over time; your application should be able to handle such additions
        # gracefully.
        purpose:,
        # A constant representing the object's type. For this resource it will always be
        # `file`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            description: T.nilable(String),
            direction: Increase::File::Direction::TaggedSymbol,
            filename: T.nilable(String),
            idempotency_key: T.nilable(String),
            mime_type: String,
            purpose: Increase::File::Purpose::TaggedSymbol,
            type: Increase::File::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Whether the File was generated by Increase or by you and sent to Increase.
      module Direction
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::File::Direction) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # This File was sent by you to Increase.
        TO_INCREASE =
          T.let(:to_increase, Increase::File::Direction::TaggedSymbol)

        # This File was generated by Increase.
        FROM_INCREASE =
          T.let(:from_increase, Increase::File::Direction::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::File::Direction::TaggedSymbol])
        end
        def self.values
        end
      end

      # What the File will be used for. We may add additional possible values for this
      # enum over time; your application should be able to handle such additions
      # gracefully.
      module Purpose
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::File::Purpose) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # An image of the front of a check, used for check deposits.
        CHECK_IMAGE_FRONT =
          T.let(:check_image_front, Increase::File::Purpose::TaggedSymbol)

        # An image of the back of a check, used for check deposits.
        CHECK_IMAGE_BACK =
          T.let(:check_image_back, Increase::File::Purpose::TaggedSymbol)

        # An image of the front of a deposited check after processing by Increase and submission to the Federal Reserve.
        PROCESSED_CHECK_IMAGE_FRONT =
          T.let(
            :processed_check_image_front,
            Increase::File::Purpose::TaggedSymbol
          )

        # An image of the back of a deposited check after processing by Increase and submission to the Federal Reserve.
        PROCESSED_CHECK_IMAGE_BACK =
          T.let(
            :processed_check_image_back,
            Increase::File::Purpose::TaggedSymbol
          )

        # An image of a check that was mailed to a recipient.
        MAILED_CHECK_IMAGE =
          T.let(:mailed_check_image, Increase::File::Purpose::TaggedSymbol)

        # A document to be printed on an additional page and mailed with a check that you've requested Increase print.
        CHECK_ATTACHMENT =
          T.let(:check_attachment, Increase::File::Purpose::TaggedSymbol)

        # A scanned mail item sent to Increase.
        INBOUND_MAIL_ITEM =
          T.let(:inbound_mail_item, Increase::File::Purpose::TaggedSymbol)

        # IRS Form 1099-INT.
        FORM_1099_INT =
          T.let(:form_1099_int, Increase::File::Purpose::TaggedSymbol)

        # IRS Form 1099-MISC.
        FORM_1099_MISC =
          T.let(:form_1099_misc, Increase::File::Purpose::TaggedSymbol)

        # IRS Form SS-4.
        FORM_SS_4 = T.let(:form_ss_4, Increase::File::Purpose::TaggedSymbol)

        # An image of a government-issued ID.
        IDENTITY_DOCUMENT =
          T.let(:identity_document, Increase::File::Purpose::TaggedSymbol)

        # A statement generated by Increase.
        INCREASE_STATEMENT =
          T.let(:increase_statement, Increase::File::Purpose::TaggedSymbol)

        # A file purpose not covered by any of the other cases.
        OTHER = T.let(:other, Increase::File::Purpose::TaggedSymbol)

        # A legal document forming a trust.
        TRUST_FORMATION_DOCUMENT =
          T.let(
            :trust_formation_document,
            Increase::File::Purpose::TaggedSymbol
          )

        # A card image to be rendered inside digital wallet apps. This must be a 1536x969 pixel PNG.
        DIGITAL_WALLET_ARTWORK =
          T.let(:digital_wallet_artwork, Increase::File::Purpose::TaggedSymbol)

        # An icon for you app to be rendered inside digital wallet apps. This must be a 100x100 pixel PNG.
        DIGITAL_WALLET_APP_ICON =
          T.let(:digital_wallet_app_icon, Increase::File::Purpose::TaggedSymbol)

        # A card image to be printed on the front of a physical card. This must be a 2100x1340 pixel PNG with no other color but black.
        PHYSICAL_CARD_FRONT =
          T.let(:physical_card_front, Increase::File::Purpose::TaggedSymbol)

        # The image to be printed on the back of a physical card.
        PHYSICAL_CARD_BACK =
          T.let(:physical_card_back, Increase::File::Purpose::TaggedSymbol)

        # An image representing the entirety of the carrier used for a physical card. This must be a 2550x3300 pixel PNG with no other color but black.
        PHYSICAL_CARD_CARRIER =
          T.let(:physical_card_carrier, Increase::File::Purpose::TaggedSymbol)

        # A document requested by Increase.
        DOCUMENT_REQUEST =
          T.let(:document_request, Increase::File::Purpose::TaggedSymbol)

        # A supplemental document associated an an Entity.
        ENTITY_SUPPLEMENTAL_DOCUMENT =
          T.let(
            :entity_supplemental_document,
            Increase::File::Purpose::TaggedSymbol
          )

        # The results of an Export you requested via the dashboard or API.
        EXPORT = T.let(:export, Increase::File::Purpose::TaggedSymbol)

        # An attachment to an Unusual Activity Report.
        UNUSUAL_ACTIVITY_REPORT_ATTACHMENT =
          T.let(
            :unusual_activity_report_attachment,
            Increase::File::Purpose::TaggedSymbol
          )

        # A document granting another entity access to the funds into your account.
        DEPOSIT_ACCOUNT_CONTROL_AGREEMENT =
          T.let(
            :deposit_account_control_agreement,
            Increase::File::Purpose::TaggedSymbol
          )

        # A file containing additional evidence for a Proof of Authorization Request Submission.
        PROOF_OF_AUTHORIZATION_REQUEST_SUBMISSION =
          T.let(
            :proof_of_authorization_request_submission,
            Increase::File::Purpose::TaggedSymbol
          )

        # An account verification letter.
        ACCOUNT_VERIFICATION_LETTER =
          T.let(
            :account_verification_letter,
            Increase::File::Purpose::TaggedSymbol
          )

        # Funding instructions.
        FUNDING_INSTRUCTIONS =
          T.let(:funding_instructions, Increase::File::Purpose::TaggedSymbol)

        # A Hold Harmless Letter.
        HOLD_HARMLESS_LETTER =
          T.let(:hold_harmless_letter, Increase::File::Purpose::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::File::Purpose::TaggedSymbol])
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `file`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::File::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FILE = T.let(:file, Increase::File::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::File::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
