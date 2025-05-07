# typed: strong

module Increase
  module Models
    class OAuthApplication < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The OAuth Application's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The OAuth Application's client_id. Use this to authenticate with the OAuth
      # Application.
      sig { returns(String) }
      attr_accessor :client_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      # Application was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      # Application was deleted.
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      # The name you chose for this OAuth Application.
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Whether the application is active.
      sig { returns(Increase::OAuthApplication::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `oauth_application`.
      sig { returns(Increase::OAuthApplication::Type::TaggedSymbol) }
      attr_accessor :type

      # An OAuth Application lets you build an application for others to use with their
      # Increase data. You can create an OAuth Application via the Dashboard and read
      # information about it with the API. Learn more about OAuth
      # [here](https://increase.com/documentation/oauth).
      sig do
        params(
          id: String,
          client_id: String,
          created_at: Time,
          deleted_at: T.nilable(Time),
          name: T.nilable(String),
          status: Increase::OAuthApplication::Status::OrSymbol,
          type: Increase::OAuthApplication::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The OAuth Application's identifier.
        id:,
        # The OAuth Application's client_id. Use this to authenticate with the OAuth
        # Application.
        client_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
        # Application was created.
        created_at:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
        # Application was deleted.
        deleted_at:,
        # The name you chose for this OAuth Application.
        name:,
        # Whether the application is active.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `oauth_application`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            client_id: String,
            created_at: Time,
            deleted_at: T.nilable(Time),
            name: T.nilable(String),
            status: Increase::OAuthApplication::Status::TaggedSymbol,
            type: Increase::OAuthApplication::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Whether the application is active.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::OAuthApplication::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The application is active and can be used by your users.
        ACTIVE =
          T.let(:active, Increase::OAuthApplication::Status::TaggedSymbol)

        # The application is deleted.
        DELETED =
          T.let(:deleted, Increase::OAuthApplication::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::OAuthApplication::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `oauth_application`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::OAuthApplication::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OAUTH_APPLICATION =
          T.let(
            :oauth_application,
            Increase::OAuthApplication::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::OAuthApplication::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
