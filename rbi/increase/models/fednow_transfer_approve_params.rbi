# typed: strong

module Increase
  module Models
    class FednowTransferApproveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::FednowTransferApproveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the FedNow Transfer to approve.
      sig { returns(String) }
      attr_accessor :fednow_transfer_id

      sig do
        params(
          fednow_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the FedNow Transfer to approve.
        fednow_transfer_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            fednow_transfer_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
