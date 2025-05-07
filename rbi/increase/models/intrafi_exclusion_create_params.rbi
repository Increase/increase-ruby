# typed: strong

module Increase
  module Models
    class IntrafiExclusionCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The name of the financial institution to be excluded.
      sig { returns(String) }
      attr_accessor :bank_name

      # The identifier of the Entity whose deposits will be excluded.
      sig { returns(String) }
      attr_accessor :entity_id

      sig do
        params(
          bank_name: String,
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the financial institution to be excluded.
        bank_name:,
        # The identifier of the Entity whose deposits will be excluded.
        entity_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            bank_name: String,
            entity_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
