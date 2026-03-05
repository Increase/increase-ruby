# typed: strong

module Increase
  module Models
    class SwiftTransferCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::SwiftTransferCancelParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the pending Swift Transfer to cancel.
      sig { returns(String) }
      attr_accessor :swift_transfer_id

      sig do
        params(
          swift_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the pending Swift Transfer to cancel.
        swift_transfer_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            swift_transfer_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
