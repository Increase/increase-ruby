# typed: strong

module Increase
  module Models
    class OAuthConnectionListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter results to only include OAuth Connections for a specific OAuth
      #   Application.
      sig { returns(T.nilable(String)) }
      attr_reader :oauth_application_id

      sig { params(oauth_application_id: String).void }
      attr_writer :oauth_application_id

      sig { returns(T.nilable(Increase::Models::OAuthConnectionListParams::Status)) }
      attr_reader :status

      sig do
        params(status: T.any(Increase::Models::OAuthConnectionListParams::Status, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :status

      sig do
        params(
          cursor: String,
          limit: Integer,
          oauth_application_id: String,
          status: T.any(Increase::Models::OAuthConnectionListParams::Status, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(cursor: nil, limit: nil, oauth_application_id: nil, status: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              cursor: String,
              limit: Integer,
              oauth_application_id: String,
              status: Increase::Models::OAuthConnectionListParams::Status,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Status < Increase::Internal::Type::BaseModel
        # Filter to OAuth Connections by their status. By default, return only the
        #   `active` ones. For GET requests, this should be encoded as a comma-delimited
        #   string, such as `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::OAuthConnectionListParams::Status::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::OAuthConnectionListParams::Status::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::OAuthConnectionListParams::Status::In::OrSymbol])
            .returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::OAuthConnectionListParams::Status::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::OAuthConnectionListParams::Status::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::OAuthConnectionListParams::Status::In::TaggedSymbol) }

          # The OAuth connection is active.
          ACTIVE = T.let(:active, Increase::Models::OAuthConnectionListParams::Status::In::TaggedSymbol)

          # The OAuth connection is permanently deactivated.
          INACTIVE = T.let(:inactive, Increase::Models::OAuthConnectionListParams::Status::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::OAuthConnectionListParams::Status::In::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
