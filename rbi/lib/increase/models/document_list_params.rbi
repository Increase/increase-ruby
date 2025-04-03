# typed: strong

module Increase
  module Models
    class DocumentListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      sig { returns(T.nilable(Increase::Models::DocumentListParams::Category)) }
      attr_reader :category

      sig { params(category: T.any(Increase::Models::DocumentListParams::Category, Increase::Internal::AnyHash)).void }
      attr_writer :category

      sig { returns(T.nilable(Increase::Models::DocumentListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: T.any(Increase::Models::DocumentListParams::CreatedAt, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter Documents to ones belonging to the specified Entity.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          category: T.any(Increase::Models::DocumentListParams::Category, Increase::Internal::AnyHash),
          created_at: T.any(Increase::Models::DocumentListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          entity_id: String,
          limit: Integer,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        category: nil,
        created_at: nil,
        cursor: nil,
        entity_id: nil,
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              category: Increase::Models::DocumentListParams::Category,
              created_at: Increase::Models::DocumentListParams::CreatedAt,
              cursor: String,
              entity_id: String,
              limit: Integer,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Category < Increase::Internal::Type::BaseModel
        # Filter Documents for those with the specified category or categories. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::DocumentListParams::Category::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::DocumentListParams::Category::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::DocumentListParams::Category::In::OrSymbol])
            .returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::DocumentListParams::Category::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::DocumentListParams::Category::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::DocumentListParams::Category::In::TaggedSymbol) }

          # Internal Revenue Service Form 1099-INT.
          FORM_1099_INT = T.let(:form_1099_int, Increase::Models::DocumentListParams::Category::In::TaggedSymbol)

          # Internal Revenue Service Form 1099-MISC.
          FORM_1099_MISC = T.let(:form_1099_misc, Increase::Models::DocumentListParams::Category::In::TaggedSymbol)

          # A document submitted in response to a proof of authorization request for an ACH transfer.
          PROOF_OF_AUTHORIZATION =
            T.let(:proof_of_authorization, Increase::Models::DocumentListParams::Category::In::TaggedSymbol)

          # Company information, such a policies or procedures, typically submitted during our due diligence process.
          COMPANY_INFORMATION =
            T.let(:company_information, Increase::Models::DocumentListParams::Category::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::DocumentListParams::Category::In::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(after: Time, before: Time, on_or_after: Time, on_or_before: Time).returns(T.attached_class)
        end
        def self.new(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        end

        sig { override.returns({after: Time, before: Time, on_or_after: Time, on_or_before: Time}) }
        def to_hash
        end
      end
    end
  end
end
