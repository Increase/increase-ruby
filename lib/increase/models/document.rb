# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Documents#create
    class Document < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Document identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_verification_letter
      #   Properties of an account verification letter document.
      #
      #   @return [Increase::Models::Document::AccountVerificationLetter, nil]
      required :account_verification_letter, -> { Increase::Document::AccountVerificationLetter }, nil?: true

      # @!attribute category
      #   The type of document.
      #
      #   @return [Symbol, Increase::Models::Document::Category]
      required :category, enum: -> { Increase::Document::Category }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
      #   Document was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute entity_id
      #   The identifier of the Entity the document was generated for.
      #
      #   @return [String, nil]
      required :entity_id, String, nil?: true

      # @!attribute file_id
      #   The identifier of the File containing the Document's contents.
      #
      #   @return [String]
      required :file_id, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `document`.
      #
      #   @return [Symbol, Increase::Models::Document::Type]
      required :type, enum: -> { Increase::Document::Type }

      # @!method initialize(id:, account_verification_letter:, category:, created_at:, entity_id:, file_id:, idempotency_key:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::Document} for more details.
      #
      #   Increase generates certain documents / forms automatically for your application;
      #   they can be listed here.
      #
      #   @param id [String] The Document identifier.
      #
      #   @param account_verification_letter [Increase::Models::Document::AccountVerificationLetter, nil] Properties of an account verification letter document.
      #
      #   @param category [Symbol, Increase::Models::Document::Category] The type of document.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Documen
      #
      #   @param entity_id [String, nil] The identifier of the Entity the document was generated for.
      #
      #   @param file_id [String] The identifier of the File containing the Document's contents.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param type [Symbol, Increase::Models::Document::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::Document#account_verification_letter
      class AccountVerificationLetter < Increase::Internal::Type::BaseModel
        # @!attribute account_number_id
        #   The identifier of the Account Number the document was generated for.
        #
        #   @return [String]
        required :account_number_id, String

        # @!method initialize(account_number_id:)
        #   Properties of an account verification letter document.
        #
        #   @param account_number_id [String] The identifier of the Account Number the document was generated for.
      end

      # The type of document.
      #
      # @see Increase::Models::Document#category
      module Category
        extend Increase::Internal::Type::Enum

        # Internal Revenue Service Form 1099-INT.
        FORM_1099_INT = :form_1099_int

        # Internal Revenue Service Form 1099-MISC.
        FORM_1099_MISC = :form_1099_misc

        # A document submitted in response to a proof of authorization request for an ACH transfer.
        PROOF_OF_AUTHORIZATION = :proof_of_authorization

        # Company information, such a policies or procedures, typically submitted during our due diligence process.
        COMPANY_INFORMATION = :company_information

        # An account verification letter.
        ACCOUNT_VERIFICATION_LETTER = :account_verification_letter

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `document`.
      #
      # @see Increase::Models::Document#type
      module Type
        extend Increase::Internal::Type::Enum

        DOCUMENT = :document

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
