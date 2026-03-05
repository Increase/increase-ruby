# typed: strong

module Increase
  module Models
    class IntrafiExclusionArchiveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::IntrafiExclusionArchiveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the IntraFi Exclusion request to archive. It may take 5
      # business days for an exclusion removal to be processed. Removing an exclusion
      # does not guarantee that funds will be swept to the previously-excluded bank.
      sig { returns(String) }
      attr_accessor :intrafi_exclusion_id

      sig do
        params(
          intrafi_exclusion_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the IntraFi Exclusion request to archive. It may take 5
        # business days for an exclusion removal to be processed. Removing an exclusion
        # does not guarantee that funds will be swept to the previously-excluded bank.
        intrafi_exclusion_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            intrafi_exclusion_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
