# typed: strong

module Increase
  module Models
    class ACHTransferRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::ACHTransferRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the ACH Transfer.
      sig { returns(String) }
      attr_accessor :ach_transfer_id

      sig do
        params(
          ach_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the ACH Transfer.
        ach_transfer_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { ach_transfer_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
