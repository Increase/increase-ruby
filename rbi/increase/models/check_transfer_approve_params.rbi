# typed: strong

module Increase
  module Models
    class CheckTransferApproveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CheckTransferApproveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Check Transfer to approve.
      sig { returns(String) }
      attr_accessor :check_transfer_id

      sig do
        params(
          check_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Check Transfer to approve.
        check_transfer_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            check_transfer_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
