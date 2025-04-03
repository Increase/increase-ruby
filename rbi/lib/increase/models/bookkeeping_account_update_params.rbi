# typed: strong

module Increase
  module Models
    class BookkeepingAccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The name you choose for the account.
      sig { returns(String) }
      attr_accessor :name

      sig do
        params(name: String, request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          .returns(T.attached_class)
      end
      def self.new(name:, request_options: {})
      end

      sig { override.returns({name: String, request_options: Increase::RequestOptions}) }
      def to_hash
      end
    end
  end
end
