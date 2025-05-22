# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Documents#retrieve
    class Document < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Document identifier.
      #
      #   @return [String]
      required :id, String

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

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `document`.
      #
      #   @return [Symbol, Increase::Models::Document::Type]
      required :type, enum: -> { Increase::Document::Type }

      # @!method initialize(id:, category:, created_at:, entity_id:, file_id:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::Document} for more details.
      #
      #   Increase generates certain documents / forms automatically for your application;
      #   they can be listed here.
      #
      #   @param id [String] The Document identifier.
      #
      #   @param category [Symbol, Increase::Models::Document::Category] The type of document.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Documen
      #
      #   @param entity_id [String, nil] The identifier of the Entity the document was generated for.
      #
      #   @param file_id [String] The identifier of the File containing the Document's contents.
      #
      #   @param type [Symbol, Increase::Models::Document::Type] A constant representing the object's type. For this resource it will always be `

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
