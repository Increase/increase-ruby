# typed: strong

module Increase
  module Models
    class LockboxAddressRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::LockboxAddressRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Lockbox Address to retrieve.
      sig { returns(String) }
      attr_accessor :lockbox_address_id

      sig do
        params(
          lockbox_address_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Lockbox Address to retrieve.
        lockbox_address_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lockbox_address_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
