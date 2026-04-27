# typed: strong

module Increase
  module Models
    class LockboxAddressUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::LockboxAddressUpdateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Lockbox Address.
      sig { returns(String) }
      attr_accessor :lockbox_address_id

      # The description you choose for the Lockbox Address.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The status of the Lockbox Address.
      sig do
        returns(
          T.nilable(Increase::LockboxAddressUpdateParams::Status::OrSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: Increase::LockboxAddressUpdateParams::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig do
        params(
          lockbox_address_id: String,
          description: String,
          status: Increase::LockboxAddressUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Lockbox Address.
        lockbox_address_id:,
        # The description you choose for the Lockbox Address.
        description: nil,
        # The status of the Lockbox Address.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lockbox_address_id: String,
            description: String,
            status: Increase::LockboxAddressUpdateParams::Status::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The status of the Lockbox Address.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::LockboxAddressUpdateParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # This Lockbox Address is active.
        ACTIVE =
          T.let(
            :active,
            Increase::LockboxAddressUpdateParams::Status::TaggedSymbol
          )

        # This Lockbox Address is disabled.
        DISABLED =
          T.let(
            :disabled,
            Increase::LockboxAddressUpdateParams::Status::TaggedSymbol
          )

        # This Lockbox Address is permanently disabled.
        CANCELED =
          T.let(
            :canceled,
            Increase::LockboxAddressUpdateParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::LockboxAddressUpdateParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
