# typed: strong

module Increase
  module Models
    class EntitySupplementalDocument < Increase::Internal::Type::BaseModel
      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
      #   Supplemental Document was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The Entity the supplemental document is attached to.
      sig { returns(String) }
      attr_accessor :entity_id

      # The File containing the document.
      sig { returns(String) }
      attr_accessor :file_id

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # A constant representing the object's type. For this resource it will always be
      #   `entity_supplemental_document`.
      sig { returns(Increase::Models::EntitySupplementalDocument::Type::TaggedSymbol) }
      attr_accessor :type

      # Supplemental Documents are uploaded files connected to an Entity during
      #   onboarding.
      sig do
        params(
          created_at: Time,
          entity_id: String,
          file_id: String,
          idempotency_key: T.nilable(String),
          type: Increase::Models::EntitySupplementalDocument::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(created_at:, entity_id:, file_id:, idempotency_key:, type:)
      end

      sig do
        override
          .returns(
            {
              created_at: Time,
              entity_id: String,
              file_id: String,
              idempotency_key: T.nilable(String),
              type: Increase::Models::EntitySupplementalDocument::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      #   `entity_supplemental_document`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::EntitySupplementalDocument::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::EntitySupplementalDocument::Type::TaggedSymbol) }

        ENTITY_SUPPLEMENTAL_DOCUMENT =
          T.let(:entity_supplemental_document, Increase::Models::EntitySupplementalDocument::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::EntitySupplementalDocument::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
