# typed: strong

module Increase
  module Models
    class PhysicalCardUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The status to update the Physical Card to.
      sig { returns(Increase::PhysicalCardUpdateParams::Status::OrSymbol) }
      attr_accessor :status

      sig do
        params(
          status: Increase::PhysicalCardUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The status to update the Physical Card to.
        status:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            status: Increase::PhysicalCardUpdateParams::Status::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The status to update the Physical Card to.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::PhysicalCardUpdateParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The physical card is active.
        ACTIVE =
          T.let(
            :active,
            Increase::PhysicalCardUpdateParams::Status::TaggedSymbol
          )

        # The physical card is temporarily disabled.
        DISABLED =
          T.let(
            :disabled,
            Increase::PhysicalCardUpdateParams::Status::TaggedSymbol
          )

        # The physical card is permanently canceled.
        CANCELED =
          T.let(
            :canceled,
            Increase::PhysicalCardUpdateParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::PhysicalCardUpdateParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
