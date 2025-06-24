# typed: strong

module Increase
  module Models
    class FileListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::FileListParams, Increase::Internal::AnyHash)
        end

      sig { returns(T.nilable(Increase::FileListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: Increase::FileListParams::CreatedAt::OrHash).void
      end
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter records to the one with the specified `idempotency_key` you chose for
      # that object. This value is unique across Increase and is used to ensure that a
      # request is only processed once. Learn more about
      # [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      # Limit the size of the list that is returned. The default (and maximum) is 100
      # objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Increase::FileListParams::Purpose)) }
      attr_reader :purpose

      sig { params(purpose: Increase::FileListParams::Purpose::OrHash).void }
      attr_writer :purpose

      sig do
        params(
          created_at: Increase::FileListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          purpose: Increase::FileListParams::Purpose::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        purpose: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            created_at: Increase::FileListParams::CreatedAt,
            cursor: String,
            idempotency_key: String,
            limit: Integer,
            purpose: Increase::FileListParams::Purpose,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::FileListParams::CreatedAt,
              Increase::Internal::AnyHash
            )
          end

        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        # timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        # timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(
            after: Time,
            before: Time,
            on_or_after: Time,
            on_or_before: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          after: nil,
          # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          before: nil,
          # Return results on or after this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          on_or_after: nil,
          # Return results on or before this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          on_or_before: nil
        )
        end

        sig do
          override.returns(
            { after: Time, before: Time, on_or_after: Time, on_or_before: Time }
          )
        end
        def to_hash
        end
      end

      class Purpose < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::FileListParams::Purpose,
              Increase::Internal::AnyHash
            )
          end

        # Filter Files for those with the specified purpose or purposes. For GET requests,
        # this should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        sig do
          returns(
            T.nilable(T::Array[Increase::FileListParams::Purpose::In::OrSymbol])
          )
        end
        attr_reader :in_

        sig do
          params(
            in_: T::Array[Increase::FileListParams::Purpose::In::OrSymbol]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_: T::Array[Increase::FileListParams::Purpose::In::OrSymbol]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter Files for those with the specified purpose or purposes. For GET requests,
          # this should be encoded as a comma-delimited string, such as `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            { in_: T::Array[Increase::FileListParams::Purpose::In::OrSymbol] }
          )
        end
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::FileListParams::Purpose::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An image of the front of a check, used for check deposits.
          CHECK_IMAGE_FRONT =
            T.let(
              :check_image_front,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # An image of the back of a check, used for check deposits.
          CHECK_IMAGE_BACK =
            T.let(
              :check_image_back,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # An image of the front of a deposited check after processing by Increase and submission to the Federal Reserve.
          PROCESSED_CHECK_IMAGE_FRONT =
            T.let(
              :processed_check_image_front,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # An image of the back of a deposited check after processing by Increase and submission to the Federal Reserve.
          PROCESSED_CHECK_IMAGE_BACK =
            T.let(
              :processed_check_image_back,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # An image of a check that was mailed to a recipient.
          MAILED_CHECK_IMAGE =
            T.let(
              :mailed_check_image,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A document to be printed on an additional page and mailed with a check that you've requested Increase print.
          CHECK_ATTACHMENT =
            T.let(
              :check_attachment,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A scanned mail item sent to Increase.
          INBOUND_MAIL_ITEM =
            T.let(
              :inbound_mail_item,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # IRS Form 1099-INT.
          FORM_1099_INT =
            T.let(
              :form_1099_int,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # IRS Form 1099-MISC.
          FORM_1099_MISC =
            T.let(
              :form_1099_misc,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # IRS Form SS-4.
          FORM_SS_4 =
            T.let(
              :form_ss_4,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # An image of a government-issued ID.
          IDENTITY_DOCUMENT =
            T.let(
              :identity_document,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A statement generated by Increase.
          INCREASE_STATEMENT =
            T.let(
              :increase_statement,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A file purpose not covered by any of the other cases.
          OTHER =
            T.let(:other, Increase::FileListParams::Purpose::In::TaggedSymbol)

          # A legal document forming a trust.
          TRUST_FORMATION_DOCUMENT =
            T.let(
              :trust_formation_document,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A card image to be rendered inside digital wallet apps. This must be a 1536x969 pixel PNG.
          DIGITAL_WALLET_ARTWORK =
            T.let(
              :digital_wallet_artwork,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # An icon for you app to be rendered inside digital wallet apps. This must be a 100x100 pixel PNG.
          DIGITAL_WALLET_APP_ICON =
            T.let(
              :digital_wallet_app_icon,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A card image to be printed on the front of a physical card. This must be a 2100x1340 pixel PNG with no other color but black.
          PHYSICAL_CARD_FRONT =
            T.let(
              :physical_card_front,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # The image to be printed on the back of a physical card.
          PHYSICAL_CARD_BACK =
            T.let(
              :physical_card_back,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # An image representing the entirety of the carrier used for a physical card. This must be a 2550x3300 pixel PNG with no other color but black.
          PHYSICAL_CARD_CARRIER =
            T.let(
              :physical_card_carrier,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A document requested by Increase.
          DOCUMENT_REQUEST =
            T.let(
              :document_request,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A supplemental document associated an an Entity.
          ENTITY_SUPPLEMENTAL_DOCUMENT =
            T.let(
              :entity_supplemental_document,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # The results of an Export you requested via the dashboard or API.
          EXPORT =
            T.let(:export, Increase::FileListParams::Purpose::In::TaggedSymbol)

          # An attachment to an Unusual Activity Report.
          UNUSUAL_ACTIVITY_REPORT_ATTACHMENT =
            T.let(
              :unusual_activity_report_attachment,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A document granting another entity access to the funds into your account.
          DEPOSIT_ACCOUNT_CONTROL_AGREEMENT =
            T.let(
              :deposit_account_control_agreement,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # A file containing additional evidence for a Proof of Authorization Request Submission.
          PROOF_OF_AUTHORIZATION_REQUEST_SUBMISSION =
            T.let(
              :proof_of_authorization_request_submission,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # An account verification letter.
          ACCOUNT_VERIFICATION_LETTER =
            T.let(
              :account_verification_letter,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          # Funding instructions.
          FUNDING_INSTRUCTIONS =
            T.let(
              :funding_instructions,
              Increase::FileListParams::Purpose::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::FileListParams::Purpose::In::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
