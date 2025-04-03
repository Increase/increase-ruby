# typed: strong

module Increase
  module Models
    class BookkeepingAccountBalanceParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The moment to query the balance at. If not set, returns the current balances.
      sig { returns(T.nilable(Time)) }
      attr_reader :at_time

      sig { params(at_time: Time).void }
      attr_writer :at_time

      sig do
        params(at_time: Time, request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          .returns(T.attached_class)
      end
      def self.new(at_time: nil, request_options: {})
      end

      sig { override.returns({at_time: Time, request_options: Increase::RequestOptions}) }
      def to_hash
      end
    end
  end
end
