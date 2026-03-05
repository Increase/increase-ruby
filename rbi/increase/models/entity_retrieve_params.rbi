# typed: strong

module Increase
  module Models
    class EntityRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::EntityRetrieveParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Entity to retrieve.
      sig { returns(String) }
      attr_accessor :entity_id

      sig do
        params(
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Entity to retrieve.
        entity_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { entity_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
