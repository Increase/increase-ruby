# typed: strong

module Increase
  module Models
    class AccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::AccountUpdateParams, Increase::Internal::AnyHash)
        end

      # The new name of the Account.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The new name of the Account.
        name: nil,
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
