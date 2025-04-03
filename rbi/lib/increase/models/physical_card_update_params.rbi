# typed: strong

module Increase
  module Models
    class PhysicalCardUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The status to update the Physical Card to.
      sig { returns(Increase::Models::PhysicalCardUpdateParams::Status::OrSymbol) }
      attr_accessor :status

      sig do
        params(
          status: Increase::Models::PhysicalCardUpdateParams::Status::OrSymbol,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(status:, request_options: {})
      end

      sig do
        override
          .returns(
            {
              status: Increase::Models::PhysicalCardUpdateParams::Status::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      # The status to update the Physical Card to.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::PhysicalCardUpdateParams::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::PhysicalCardUpdateParams::Status::TaggedSymbol) }

        # The physical card is active.
        ACTIVE = T.let(:active, Increase::Models::PhysicalCardUpdateParams::Status::TaggedSymbol)

        # The physical card is temporarily disabled.
        DISABLED = T.let(:disabled, Increase::Models::PhysicalCardUpdateParams::Status::TaggedSymbol)

        # The physical card is permanently canceled.
        CANCELED = T.let(:canceled, Increase::Models::PhysicalCardUpdateParams::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::PhysicalCardUpdateParams::Status::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
