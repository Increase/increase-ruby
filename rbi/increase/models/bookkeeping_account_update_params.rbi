# typed: strong

module Increase
  module Models
    class BookkeepingAccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::BookkeepingAccountUpdateParams,
            Increase::Internal::AnyHash
          )
        end

      # The name you choose for the account.
      sig { returns(String) }
      attr_accessor :name

      sig do
        params(
          name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name you choose for the account.
        name:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { name: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
