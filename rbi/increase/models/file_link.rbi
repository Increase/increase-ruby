# typed: strong

module Increase
  module Models
    class FileLink < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::FileLink, Increase::Internal::AnyHash) }

      # The File Link identifier.
      sig { returns(String) }
      attr_accessor :id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the File
      # Link was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the File
      # Link will expire.
      sig { returns(Time) }
      attr_accessor :expires_at

      # The identifier of the File the File Link points to.
      sig { returns(String) }
      attr_accessor :file_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # A constant representing the object's type. For this resource it will always be
      # `file_link`.
      sig { returns(Increase::FileLink::Type::TaggedSymbol) }
      attr_accessor :type

      # A URL where the File can be downloaded. The URL will expire after the
      # `expires_at` time. This URL is unauthenticated and can be used to download the
      # File without an Increase API key.
      sig { returns(String) }
      attr_accessor :unauthenticated_url

      # File Links let you generate a URL that can be used to download a File.
      sig do
        params(
          id: String,
          created_at: Time,
          expires_at: Time,
          file_id: String,
          idempotency_key: T.nilable(String),
          type: Increase::FileLink::Type::OrSymbol,
          unauthenticated_url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The File Link identifier.
        id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the File
        # Link was created.
        created_at:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the File
        # Link will expire.
        expires_at:,
        # The identifier of the File the File Link points to.
        file_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # A constant representing the object's type. For this resource it will always be
        # `file_link`.
        type:,
        # A URL where the File can be downloaded. The URL will expire after the
        # `expires_at` time. This URL is unauthenticated and can be used to download the
        # File without an Increase API key.
        unauthenticated_url:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            expires_at: Time,
            file_id: String,
            idempotency_key: T.nilable(String),
            type: Increase::FileLink::Type::TaggedSymbol,
            unauthenticated_url: String
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `file_link`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::FileLink::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FILE_LINK = T.let(:file_link, Increase::FileLink::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::FileLink::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
