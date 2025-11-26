# typed: strong

module Increase
  module Internal
    class Page
      include Increase::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.anything) }
      attr_accessor :data

      sig { returns(T.anything) }
      attr_accessor :next_cursor

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
