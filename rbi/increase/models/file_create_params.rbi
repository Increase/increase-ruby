# typed: strong

module Increase
  module Models
    class FileCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::FileCreateParams, Increase::Internal::AnyHash)
        end

      # The file contents. This should follow the specifications of
      # [RFC 7578](https://datatracker.ietf.org/doc/html/rfc7578) which defines file
      # transfers for the multipart/form-data protocol.
      sig { returns(Increase::Internal::FileInput) }
      attr_accessor :file

      # What the File will be used for in Increase's systems.
      sig { returns(Increase::FileCreateParams::Purpose::OrSymbol) }
      attr_accessor :purpose

      # The description you choose to give the File.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        params(
          file: Increase::Internal::FileInput,
          purpose: Increase::FileCreateParams::Purpose::OrSymbol,
          description: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The file contents. This should follow the specifications of
        # [RFC 7578](https://datatracker.ietf.org/doc/html/rfc7578) which defines file
        # transfers for the multipart/form-data protocol.
        file:,
        # What the File will be used for in Increase's systems.
        purpose:,
        # The description you choose to give the File.
        description: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file: Increase::Internal::FileInput,
            purpose: Increase::FileCreateParams::Purpose::OrSymbol,
            description: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # What the File will be used for in Increase's systems.
      module Purpose
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::FileCreateParams::Purpose) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A file to be attached to a Card Dispute.
        CARD_DISPUTE_ATTACHMENT =
          T.let(
            :card_dispute_attachment,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # An image of the front of a check, used for check deposits.
        CHECK_IMAGE_FRONT =
          T.let(
            :check_image_front,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # An image of the back of a check, used for check deposits.
        CHECK_IMAGE_BACK =
          T.let(
            :check_image_back,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # An image of a check that was mailed to a recipient.
        MAILED_CHECK_IMAGE =
          T.let(
            :mailed_check_image,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # A document to be printed on an additional page and mailed with a check that you've requested Increase print. This must be a PDF whose pages are all US letter size and all have the same orientation.
        CHECK_ATTACHMENT =
          T.let(
            :check_attachment,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # An image to be used as the check voucher image, which is printed in the middle of the trifold area of a check. This must be a 2550x1100 pixel PNG.
        CHECK_VOUCHER_IMAGE =
          T.let(
            :check_voucher_image,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # IRS Form SS-4.
        FORM_SS_4 =
          T.let(:form_ss_4, Increase::FileCreateParams::Purpose::TaggedSymbol)

        # An image of a government-issued ID.
        IDENTITY_DOCUMENT =
          T.let(
            :identity_document,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # A supplemental document for a Loan Application.
        LOAN_APPLICATION_SUPPLEMENTAL_DOCUMENT =
          T.let(
            :loan_application_supplemental_document,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # A file purpose not covered by any of the other cases.
        OTHER = T.let(:other, Increase::FileCreateParams::Purpose::TaggedSymbol)

        # A legal document forming a trust.
        TRUST_FORMATION_DOCUMENT =
          T.let(
            :trust_formation_document,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # A card image to be rendered inside digital wallet apps. This must be a 1536x969 pixel PNG.
        DIGITAL_WALLET_ARTWORK =
          T.let(
            :digital_wallet_artwork,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # An icon for you app to be rendered inside digital wallet apps. This must be a 100x100 pixel PNG.
        DIGITAL_WALLET_APP_ICON =
          T.let(
            :digital_wallet_app_icon,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # A card image to be printed on the front of a physical card. This must be a 2100x1344 pixel PNG with no other color but black.
        PHYSICAL_CARD_FRONT =
          T.let(
            :physical_card_front,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # An image representing the entirety of the carrier used for a physical card. This must be a 2550x3300 pixel PNG with no other color but black.
        PHYSICAL_CARD_CARRIER =
          T.let(
            :physical_card_carrier,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # A document requested by Increase.
        DOCUMENT_REQUEST =
          T.let(
            :document_request,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # A supplemental document associated an an Entity.
        ENTITY_SUPPLEMENTAL_DOCUMENT =
          T.let(
            :entity_supplemental_document,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # An attachment to an Unusual Activity Report.
        UNUSUAL_ACTIVITY_REPORT_ATTACHMENT =
          T.let(
            :unusual_activity_report_attachment,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        # A file containing additional evidence for a Proof of Authorization Request Submission.
        PROOF_OF_AUTHORIZATION_REQUEST_SUBMISSION =
          T.let(
            :proof_of_authorization_request_submission,
            Increase::FileCreateParams::Purpose::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::FileCreateParams::Purpose::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
