# typed: strong

module Increase
  module Models
    class ProgramRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::ProgramRetrieveParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Program to retrieve.
      sig { returns(String) }
      attr_accessor :program_id

      sig do
        params(
          program_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Program to retrieve.
        program_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { program_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
