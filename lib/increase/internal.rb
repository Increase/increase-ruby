# frozen_string_literal: true

module Increase
  module Internal
    OMIT =
      Object.new.tap do
        _1.define_singleton_method(:inspect) { "#<#{Increase::Internal}::OMIT>" }
      end
        .freeze
  end
end
