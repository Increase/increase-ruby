# typed: strong

module Increase
  module Internal
    module Type
      # @api private
      #
      # Array of items of a given type.
      class ArrayOf
        include Increase::Internal::Type::Converter

        abstract!
        final!

        Elem = type_member(:out)

        sig(:final) do
          params(
            type_info: T.any(
              Increase::Internal::AnyHash,
              T.proc.returns(Increase::Internal::Type::Converter::Input),
              Increase::Internal::Type::Converter::Input
            ),
            spec: Increase::Internal::AnyHash
          )
            .returns(T.attached_class)
        end
        def self.[](type_info, spec = {})
        end

        sig(:final) { params(other: T.anything).returns(T::Boolean) }
        def ===(other)
        end

        sig(:final) { params(other: T.anything).returns(T::Boolean) }
        def ==(other)
        end

        # @api private
        sig(:final) do
          override
            .params(value: T.any(
              T::Enumerable[Elem],
              T.anything
            ),
                    state: Increase::Internal::Type::Converter::State)
            .returns(T.any(T::Array[T.anything], T.anything))
        end
        def coerce(value, state:)
        end

        # @api private
        sig(:final) do
          override
            .params(value: T.any(T::Enumerable[Elem], T.anything))
            .returns(T.any(T::Array[T.anything], T.anything))
        end
        def dump(value)
        end

        # @api private
        sig(:final) { returns(Elem) }
        protected def item_type
        end

        # @api private
        sig(:final) { returns(T::Boolean) }
        protected def nilable?
        end

        # @api private
        sig(:final) do
          params(
            type_info: T.any(
              Increase::Internal::AnyHash,
              T.proc.returns(Increase::Internal::Type::Converter::Input),
              Increase::Internal::Type::Converter::Input
            ),
            spec: Increase::Internal::AnyHash
          )
            .void
        end
        def initialize(type_info, spec = {})
        end
      end
    end
  end
end
