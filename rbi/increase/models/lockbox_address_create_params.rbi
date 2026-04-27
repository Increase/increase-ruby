# typed: strong

module Increase
  module Models
    class LockboxAddressCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::LockboxAddressCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The description you choose for the Lockbox Address.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        params(
          description: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The description you choose for the Lockbox Address.
        description: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { description: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
