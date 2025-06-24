# typed: strong

module Increase
  module Models
    class Document < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Document, Increase::Internal::AnyHash) }

      # The Document identifier.
      sig { returns(String) }
      attr_accessor :id

      # Properties of an account verification letter document.
      sig { returns(T.nilable(Increase::Document::AccountVerificationLetter)) }
      attr_reader :account_verification_letter

      sig do
        params(
          account_verification_letter:
            T.nilable(Increase::Document::AccountVerificationLetter::OrHash)
        ).void
      end
      attr_writer :account_verification_letter

      # The type of document.
      sig { returns(Increase::Document::Category::TaggedSymbol) }
      attr_accessor :category

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
      # Document was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The identifier of the Entity the document was generated for.
      sig { returns(T.nilable(String)) }
      attr_accessor :entity_id

      # The identifier of the File containing the Document's contents.
      sig { returns(String) }
      attr_accessor :file_id

      # Properties of a funding instructions document.
      sig { returns(T.nilable(Increase::Document::FundingInstructions)) }
      attr_reader :funding_instructions

      sig do
        params(
          funding_instructions:
            T.nilable(Increase::Document::FundingInstructions::OrHash)
        ).void
      end
      attr_writer :funding_instructions

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # A constant representing the object's type. For this resource it will always be
      # `document`.
      sig { returns(Increase::Document::Type::TaggedSymbol) }
      attr_accessor :type

      # Increase generates certain documents / forms automatically for your application;
      # they can be listed here.
      sig do
        params(
          id: String,
          account_verification_letter:
            T.nilable(Increase::Document::AccountVerificationLetter::OrHash),
          category: Increase::Document::Category::OrSymbol,
          created_at: Time,
          entity_id: T.nilable(String),
          file_id: String,
          funding_instructions:
            T.nilable(Increase::Document::FundingInstructions::OrHash),
          idempotency_key: T.nilable(String),
          type: Increase::Document::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Document identifier.
        id:,
        # Properties of an account verification letter document.
        account_verification_letter:,
        # The type of document.
        category:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
        # Document was created.
        created_at:,
        # The identifier of the Entity the document was generated for.
        entity_id:,
        # The identifier of the File containing the Document's contents.
        file_id:,
        # Properties of a funding instructions document.
        funding_instructions:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # A constant representing the object's type. For this resource it will always be
        # `document`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_verification_letter:
              T.nilable(Increase::Document::AccountVerificationLetter),
            category: Increase::Document::Category::TaggedSymbol,
            created_at: Time,
            entity_id: T.nilable(String),
            file_id: String,
            funding_instructions:
              T.nilable(Increase::Document::FundingInstructions),
            idempotency_key: T.nilable(String),
            type: Increase::Document::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class AccountVerificationLetter < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Document::AccountVerificationLetter,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account Number the document was generated for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # Properties of an account verification letter document.
        sig { params(account_number_id: String).returns(T.attached_class) }
        def self.new(
          # The identifier of the Account Number the document was generated for.
          account_number_id:
        )
        end

        sig { override.returns({ account_number_id: String }) }
        def to_hash
        end
      end

      # The type of document.
      module Category
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Document::Category) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Internal Revenue Service Form 1099-INT.
        FORM_1099_INT =
          T.let(:form_1099_int, Increase::Document::Category::TaggedSymbol)

        # Internal Revenue Service Form 1099-MISC.
        FORM_1099_MISC =
          T.let(:form_1099_misc, Increase::Document::Category::TaggedSymbol)

        # A document submitted in response to a proof of authorization request for an ACH transfer.
        PROOF_OF_AUTHORIZATION =
          T.let(
            :proof_of_authorization,
            Increase::Document::Category::TaggedSymbol
          )

        # Company information, such a policies or procedures, typically submitted during our due diligence process.
        COMPANY_INFORMATION =
          T.let(
            :company_information,
            Increase::Document::Category::TaggedSymbol
          )

        # An account verification letter.
        ACCOUNT_VERIFICATION_LETTER =
          T.let(
            :account_verification_letter,
            Increase::Document::Category::TaggedSymbol
          )

        # Funding instructions.
        FUNDING_INSTRUCTIONS =
          T.let(
            :funding_instructions,
            Increase::Document::Category::TaggedSymbol
          )

        sig do
          override.returns(T::Array[Increase::Document::Category::TaggedSymbol])
        end
        def self.values
        end
      end

      class FundingInstructions < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Document::FundingInstructions,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account Number the document was generated for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # Properties of a funding instructions document.
        sig { params(account_number_id: String).returns(T.attached_class) }
        def self.new(
          # The identifier of the Account Number the document was generated for.
          account_number_id:
        )
        end

        sig { override.returns({ account_number_id: String }) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `document`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Document::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DOCUMENT = T.let(:document, Increase::Document::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Document::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
