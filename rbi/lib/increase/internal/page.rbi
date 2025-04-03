# typed: strong

module Increase
  module Internal
    class Page
      Elem = type_member

      include Increase::Internal::Type::BasePage

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :data

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig { returns(String) }
      def inspect
      end
    end
  end
end
