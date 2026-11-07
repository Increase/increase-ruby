# typed: strong

module Increase
  module Models
    class CheckbookCheckRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CheckbookCheckRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Checkbook Check.
      sig { returns(String) }
      attr_accessor :checkbook_check_id

      sig do
        params(
          checkbook_check_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Checkbook Check.
        checkbook_check_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            checkbook_check_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
