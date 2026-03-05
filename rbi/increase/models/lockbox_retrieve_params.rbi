# typed: strong

module Increase
  module Models
    class LockboxRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::LockboxRetrieveParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Lockbox to retrieve.
      sig { returns(String) }
      attr_accessor :lockbox_id

      sig do
        params(
          lockbox_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Lockbox to retrieve.
        lockbox_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { lockbox_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
