# typed: strong

module Increase
  module Models
    class CheckbookRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CheckbookRetrieveParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Checkbook.
      sig { returns(String) }
      attr_accessor :checkbook_id

      sig do
        params(
          checkbook_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Checkbook.
        checkbook_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { checkbook_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
