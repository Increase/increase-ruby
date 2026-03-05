# typed: strong

module Increase
  module Models
    class ExportRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::ExportRetrieveParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Export to retrieve.
      sig { returns(String) }
      attr_accessor :export_id

      sig do
        params(
          export_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Export to retrieve.
        export_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { export_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
