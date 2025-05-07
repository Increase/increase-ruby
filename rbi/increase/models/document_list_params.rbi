# typed: strong

module Increase
  module Models
    class DocumentListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      sig { returns(T.nilable(Increase::DocumentListParams::Category)) }
      attr_reader :category

      sig do
        params(category: Increase::DocumentListParams::Category::OrHash).void
      end
      attr_writer :category

      sig { returns(T.nilable(Increase::DocumentListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: Increase::DocumentListParams::CreatedAt::OrHash).void
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
      # objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          category: Increase::DocumentListParams::Category::OrHash,
          created_at: Increase::DocumentListParams::CreatedAt::OrHash,
          cursor: String,
          entity_id: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter Documents to ones belonging to the specified Entity.
        entity_id: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            category: Increase::DocumentListParams::Category,
            created_at: Increase::DocumentListParams::CreatedAt,
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
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # Filter Documents for those with the specified category or categories. For GET
        # requests, this should be encoded as a comma-delimited string, such as
        # `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[Increase::DocumentListParams::Category::In::OrSymbol]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_: T::Array[Increase::DocumentListParams::Category::In::OrSymbol]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_: T::Array[Increase::DocumentListParams::Category::In::OrSymbol]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter Documents for those with the specified category or categories. For GET
          # requests, this should be encoded as a comma-delimited string, such as
          # `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[Increase::DocumentListParams::Category::In::OrSymbol]
            }
          )
        end
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::DocumentListParams::Category::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Internal Revenue Service Form 1099-INT.
          FORM_1099_INT =
            T.let(
              :form_1099_int,
              Increase::DocumentListParams::Category::In::TaggedSymbol
            )

          # Internal Revenue Service Form 1099-MISC.
          FORM_1099_MISC =
            T.let(
              :form_1099_misc,
              Increase::DocumentListParams::Category::In::TaggedSymbol
            )

          # A document submitted in response to a proof of authorization request for an ACH transfer.
          PROOF_OF_AUTHORIZATION =
            T.let(
              :proof_of_authorization,
              Increase::DocumentListParams::Category::In::TaggedSymbol
            )

          # Company information, such a policies or procedures, typically submitted during our due diligence process.
          COMPANY_INFORMATION =
            T.let(
              :company_information,
              Increase::DocumentListParams::Category::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::DocumentListParams::Category::In::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

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
    end
  end
end
