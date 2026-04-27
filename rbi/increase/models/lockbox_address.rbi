# typed: strong

module Increase
  module Models
    class LockboxAddress < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::LockboxAddress, Increase::Internal::AnyHash)
        end

      # The Lockbox Address identifier.
      sig { returns(String) }
      attr_accessor :id

      # The mailing address for the Lockbox Address. It will be present after Increase
      # generates it.
      sig { returns(T.nilable(Increase::LockboxAddress::Address)) }
      attr_reader :address

      sig do
        params(
          address: T.nilable(Increase::LockboxAddress::Address::OrHash)
        ).void
      end
      attr_writer :address

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      # Address was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The description you choose for the Lockbox Address.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The status of the Lockbox Address.
      sig { returns(Increase::LockboxAddress::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `lockbox_address`.
      sig { returns(Increase::LockboxAddress::Type::TaggedSymbol) }
      attr_accessor :type

      # Lockbox Addresses are physical locations that can receive mail containing paper
      # checks.
      sig do
        params(
          id: String,
          address: T.nilable(Increase::LockboxAddress::Address::OrHash),
          created_at: Time,
          description: T.nilable(String),
          idempotency_key: T.nilable(String),
          status: Increase::LockboxAddress::Status::OrSymbol,
          type: Increase::LockboxAddress::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Lockbox Address identifier.
        id:,
        # The mailing address for the Lockbox Address. It will be present after Increase
        # generates it.
        address:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
        # Address was created.
        created_at:,
        # The description you choose for the Lockbox Address.
        description:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The status of the Lockbox Address.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `lockbox_address`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            address: T.nilable(Increase::LockboxAddress::Address),
            created_at: Time,
            description: T.nilable(String),
            idempotency_key: T.nilable(String),
            status: Increase::LockboxAddress::Status::TaggedSymbol,
            type: Increase::LockboxAddress::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Address < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::LockboxAddress::Address,
              Increase::Internal::AnyHash
            )
          end

        # The city of the address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address.
        sig { returns(String) }
        attr_accessor :line2

        # The postal code of the address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The two-letter United States Postal Service (USPS) abbreviation for the state of
        # the address.
        sig { returns(String) }
        attr_accessor :state

        # The mailing address for the Lockbox Address. It will be present after Increase
        # generates it.
        sig do
          params(
            city: String,
            line1: String,
            line2: String,
            postal_code: String,
            state: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the address.
          city:,
          # The first line of the address.
          line1:,
          # The second line of the address.
          line2:,
          # The postal code of the address.
          postal_code:,
          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: String,
              line1: String,
              line2: String,
              postal_code: String,
              state: String
            }
          )
        end
        def to_hash
        end
      end

      # The status of the Lockbox Address.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::LockboxAddress::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Increase is generating this Lockbox Address.
        PENDING =
          T.let(:pending, Increase::LockboxAddress::Status::TaggedSymbol)

        # This Lockbox Address is active.
        ACTIVE = T.let(:active, Increase::LockboxAddress::Status::TaggedSymbol)

        # This Lockbox Address is disabled.
        DISABLED =
          T.let(:disabled, Increase::LockboxAddress::Status::TaggedSymbol)

        # This Lockbox Address is permanently disabled.
        CANCELED =
          T.let(:canceled, Increase::LockboxAddress::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::LockboxAddress::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `lockbox_address`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::LockboxAddress::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCKBOX_ADDRESS =
          T.let(:lockbox_address, Increase::LockboxAddress::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::LockboxAddress::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
