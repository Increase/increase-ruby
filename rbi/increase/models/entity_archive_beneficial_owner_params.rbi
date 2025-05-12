# typed: strong

module Increase
  module Models
    class EntityArchiveBeneficialOwnerParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::EntityArchiveBeneficialOwnerParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifying details of anyone controlling or owning 25% or more of the
      # corporation.
      sig { returns(String) }
      attr_accessor :beneficial_owner_id

      sig do
        params(
          beneficial_owner_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifying details of anyone controlling or owning 25% or more of the
        # corporation.
        beneficial_owner_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            beneficial_owner_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
