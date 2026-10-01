# typed: strong

module Increase
  module Models
    class PhysicalCheckBatchCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::PhysicalCheckBatchCancelParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the pending Physical Check Batch to cancel.
      sig { returns(String) }
      attr_accessor :physical_check_batch_id

      sig do
        params(
          physical_check_batch_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the pending Physical Check Batch to cancel.
        physical_check_batch_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            physical_check_batch_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
