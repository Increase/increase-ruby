# typed: strong

module Increase
  module Models
    class BookkeepingAccountListResponse < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Increase::Models::BookkeepingAccountListResponse,
            Increase::Internal::AnyHash
          )
        end

      # The contents of the list.
      sig { returns(T::Array[Increase::BookkeepingAccount]) }
      attr_accessor :data

      # A pointer to a place in the list.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # A list of Bookkeeping Account objects.
      sig do
        params(
          data: T::Array[Increase::BookkeepingAccount::OrHash],
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
          {
            data: T::Array[Increase::BookkeepingAccount],
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
