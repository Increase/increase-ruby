# typed: strong

module Increase
  module Internal
    class Page
      include Increase::Internal::Type::BasePage

      Elem = type_member

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
