# typed: strong

module Increase
  module Models
    class Document < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The Document identifier.
      sig { returns(String) }
      attr_accessor :id

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

      # A constant representing the object's type. For this resource it will always be
      # `document`.
      sig { returns(Increase::Document::Type::TaggedSymbol) }
      attr_accessor :type

      # Increase generates certain documents / forms automatically for your application;
      # they can be listed here.
      sig do
        params(
          id: String,
          category: Increase::Document::Category::OrSymbol,
          created_at: Time,
          entity_id: T.nilable(String),
          file_id: String,
          type: Increase::Document::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Document identifier.
        id:,
        # The type of document.
        category:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the
        # Document was created.
        created_at:,
        # The identifier of the Entity the document was generated for.
        entity_id:,
        # The identifier of the File containing the Document's contents.
        file_id:,
        # A constant representing the object's type. For this resource it will always be
        # `document`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            category: Increase::Document::Category::TaggedSymbol,
            created_at: Time,
            entity_id: T.nilable(String),
            file_id: String,
            type: Increase::Document::Type::TaggedSymbol
          }
        )
      end
      def to_hash
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

        sig do
          override.returns(T::Array[Increase::Document::Category::TaggedSymbol])
        end
        def self.values
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
