# typed: strong

module Increase
  module Models
    class AccountListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      sig { returns(T.nilable(Increase::Models::AccountListParams::CreatedAt)) }
      attr_reader :created_at

      sig { params(created_at: T.any(Increase::Models::AccountListParams::CreatedAt, Increase::Internal::AnyHash)).void }
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter Accounts for those belonging to the specified Entity.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      # Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      # Filter Accounts for those belonging to the specified Entity as informational.
      sig { returns(T.nilable(String)) }
      attr_reader :informational_entity_id

      sig { params(informational_entity_id: String).void }
      attr_writer :informational_entity_id

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter Accounts for those in a specific Program.
      sig { returns(T.nilable(String)) }
      attr_reader :program_id

      sig { params(program_id: String).void }
      attr_writer :program_id

      sig { returns(T.nilable(Increase::Models::AccountListParams::Status)) }
      attr_reader :status

      sig { params(status: T.any(Increase::Models::AccountListParams::Status, Increase::Internal::AnyHash)).void }
      attr_writer :status

      sig do
        params(
          created_at: T.any(Increase::Models::AccountListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          entity_id: String,
          idempotency_key: String,
          informational_entity_id: String,
          limit: Integer,
          program_id: String,
          status: T.any(Increase::Models::AccountListParams::Status, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        created_at: nil,
        cursor: nil,
        entity_id: nil,
        idempotency_key: nil,
        informational_entity_id: nil,
        limit: nil,
        program_id: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              created_at: Increase::Models::AccountListParams::CreatedAt,
              cursor: String,
              entity_id: String,
              idempotency_key: String,
              informational_entity_id: String,
              limit: Integer,
              program_id: String,
              status: Increase::Models::AccountListParams::Status,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
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

      class Status < Increase::Internal::Type::BaseModel
        # Filter Accounts for those with the specified status. For GET requests, this
        #   should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::AccountListParams::Status::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::AccountListParams::Status::In::OrSymbol]).void }
        attr_writer :in_

        sig { params(in_: T::Array[Increase::Models::AccountListParams::Status::In::OrSymbol]).returns(T.attached_class) }
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::AccountListParams::Status::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountListParams::Status::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::AccountListParams::Status::In::TaggedSymbol) }

          # Closed Accounts on which no new activity can occur.
          CLOSED = T.let(:closed, Increase::Models::AccountListParams::Status::In::TaggedSymbol)

          # Open Accounts that are ready to use.
          OPEN = T.let(:open, Increase::Models::AccountListParams::Status::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::AccountListParams::Status::In::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
