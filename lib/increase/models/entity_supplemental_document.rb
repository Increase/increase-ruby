# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::SupplementalDocuments#create
    class EntitySupplementalDocument < Increase::Internal::Type::BaseModel
      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
      #   Supplemental Document was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute entity_id
      #   The Entity the supplemental document is attached to.
      #
      #   @return [String]
      required :entity_id, String

      # @!attribute file_id
      #   The File containing the document.
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
      #   `entity_supplemental_document`.
      #
      #   @return [Symbol, Increase::Models::EntitySupplementalDocument::Type]
      required :type, enum: -> { Increase::EntitySupplementalDocument::Type }

      # @!method initialize(created_at:, entity_id:, file_id:, idempotency_key:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntitySupplementalDocument} for more details.
      #
      #   Supplemental Documents are uploaded files connected to an Entity during
      #   onboarding.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Supplem
      #
      #   @param entity_id [String] The Entity the supplemental document is attached to.
      #
      #   @param file_id [String] The File containing the document.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param type [Symbol, Increase::Models::EntitySupplementalDocument::Type] A constant representing the object's type. For this resource it will always be `

      # A constant representing the object's type. For this resource it will always be
      # `entity_supplemental_document`.
      #
      # @see Increase::Models::EntitySupplementalDocument#type
      module Type
        extend Increase::Internal::Type::Enum

        ENTITY_SUPPLEMENTAL_DOCUMENT = :entity_supplemental_document

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
