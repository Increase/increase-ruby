# typed: strong

module Increase
  module Models
    class Group < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Group, Increase::Internal::AnyHash) }

      # The Group identifier.
      sig { returns(String) }
      attr_accessor :id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Group
      # was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # A constant representing the object's type. For this resource it will always be
      # `group`.
      sig { returns(Increase::Group::Type::TaggedSymbol) }
      attr_accessor :type

      # Groups represent organizations using Increase. You can retrieve information
      # about your own organization via the API. More commonly, OAuth platforms can
      # retrieve information about the organizations that have granted them access.
      # Learn more about OAuth [here](https://increase.com/documentation/oauth).
      sig do
        params(
          id: String,
          created_at: Time,
          type: Increase::Group::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Group identifier.
        id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Group
        # was created.
        created_at:,
        # A constant representing the object's type. For this resource it will always be
        # `group`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            type: Increase::Group::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `group`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Group::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GROUP = T.let(:group, Increase::Group::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Group::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
