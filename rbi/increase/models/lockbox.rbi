# typed: strong

module Increase
  module Models
    class Lockbox < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The Lockbox identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account checks sent to this lockbox will be deposited
      # into.
      sig { returns(String) }
      attr_accessor :account_id

      # The mailing address for the Lockbox.
      sig { returns(Increase::Lockbox::Address) }
      attr_reader :address

      sig { params(address: Increase::Lockbox::Address::OrHash).void }
      attr_writer :address

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      # was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The description you choose for the Lockbox.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The recipient name you choose for the Lockbox.
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient_name

      # This indicates if mail can be sent to this address.
      sig { returns(Increase::Lockbox::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `lockbox`.
      sig { returns(Increase::Lockbox::Type::TaggedSymbol) }
      attr_accessor :type

      # Lockboxes are physical locations that can receive mail containing paper checks.
      # Increase will automatically create a Check Deposit for checks received this way.
      sig do
        params(
          id: String,
          account_id: String,
          address: Increase::Lockbox::Address::OrHash,
          created_at: Time,
          description: T.nilable(String),
          idempotency_key: T.nilable(String),
          recipient_name: T.nilable(String),
          status: Increase::Lockbox::Status::OrSymbol,
          type: Increase::Lockbox::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Lockbox identifier.
        id:,
        # The identifier for the Account checks sent to this lockbox will be deposited
        # into.
        account_id:,
        # The mailing address for the Lockbox.
        address:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
        # was created.
        created_at:,
        # The description you choose for the Lockbox.
        description:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The recipient name you choose for the Lockbox.
        recipient_name:,
        # This indicates if mail can be sent to this address.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `lockbox`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            address: Increase::Lockbox::Address,
            created_at: Time,
            description: T.nilable(String),
            idempotency_key: T.nilable(String),
            recipient_name: T.nilable(String),
            status: Increase::Lockbox::Status::TaggedSymbol,
            type: Increase::Lockbox::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Address < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

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

        # The recipient line of the address. This will include the recipient name you
        # provide when creating the address, as well as an ATTN suffix to help route the
        # mail to your lockbox. Mail senders must include this ATTN line to receive mail
        # at this Lockbox.
        sig { returns(T.nilable(String)) }
        attr_accessor :recipient

        # The two-letter United States Postal Service (USPS) abbreviation for the state of
        # the address.
        sig { returns(String) }
        attr_accessor :state

        # The mailing address for the Lockbox.
        sig do
          params(
            city: String,
            line1: String,
            line2: String,
            postal_code: String,
            recipient: T.nilable(String),
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
          # The recipient line of the address. This will include the recipient name you
          # provide when creating the address, as well as an ATTN suffix to help route the
          # mail to your lockbox. Mail senders must include this ATTN line to receive mail
          # at this Lockbox.
          recipient:,
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
              recipient: T.nilable(String),
              state: String
            }
          )
        end
        def to_hash
        end
      end

      # This indicates if mail can be sent to this address.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Lockbox::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # This Lockbox is active. Checks mailed to it will be deposited automatically.
        ACTIVE = T.let(:active, Increase::Lockbox::Status::TaggedSymbol)

        # This Lockbox is inactive. Checks mailed to it will not be deposited.
        INACTIVE = T.let(:inactive, Increase::Lockbox::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Lockbox::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `lockbox`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Lockbox::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCKBOX = T.let(:lockbox, Increase::Lockbox::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Lockbox::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
