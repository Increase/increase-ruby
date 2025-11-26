# typed: strong

module Increase
  module Models
    class FileListResponse < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::Models::FileListResponse, Increase::Internal::AnyHash)
        end

      # The contents of the list.
      sig { returns(T::Array[Increase::File]) }
      attr_accessor :data

      # A pointer to a place in the list.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # A list of File objects.
      sig do
        params(
          data: T::Array[Increase::File::OrHash],
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The contents of the list.
        data:,
        # A pointer to a place in the list.
        next_cursor:
      )
      end

      sig do
        override.returns(
          { data: T::Array[Increase::File], next_cursor: T.nilable(String) }
        )
      end
      def to_hash
      end
    end
  end
end
