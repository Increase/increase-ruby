# typed: strong

module Increase
  module Models
    class LockboxRecipient < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::LockboxRecipient, Increase::Internal::AnyHash)
        end

      # The Lockbox Recipient identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account that checks sent to this Lockbox Recipient will
      # be deposited into.
      sig { returns(String) }
      attr_accessor :account_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      # Recipient was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The description of the Lockbox Recipient.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The identifier for the Lockbox Address where this Lockbox Recipient may receive
      # physical mail.
      sig { returns(String) }
      attr_accessor :lockbox_address_id

      # The mail stop code uniquely identifying this Lockbox Recipient at its Lockbox
      # Address. It should be included in the mailing address intended for this Lockbox
      # Recipient.
      sig { returns(String) }
      attr_accessor :mail_stop_code

      # The name of the Lockbox Recipient.
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient_name

      # The status of the Lockbox Recipient.
      sig do
        returns(T.nilable(Increase::LockboxRecipient::Status::TaggedSymbol))
      end
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `lockbox_recipient`.
      sig { returns(Increase::LockboxRecipient::Type::TaggedSymbol) }
      attr_accessor :type

      # Lockbox Recipients represent an inbox at a Lockbox Address. Checks received for
      # a Lockbox Recipient are deposited into its associated Account.
      sig do
        params(
          id: String,
          account_id: String,
          created_at: Time,
          description: T.nilable(String),
          idempotency_key: T.nilable(String),
          lockbox_address_id: String,
          mail_stop_code: String,
          recipient_name: T.nilable(String),
          status: T.nilable(Increase::LockboxRecipient::Status::OrSymbol),
          type: Increase::LockboxRecipient::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Lockbox Recipient identifier.
        id:,
        # The identifier for the Account that checks sent to this Lockbox Recipient will
        # be deposited into.
        account_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
        # Recipient was created.
        created_at:,
        # The description of the Lockbox Recipient.
        description:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The identifier for the Lockbox Address where this Lockbox Recipient may receive
        # physical mail.
        lockbox_address_id:,
        # The mail stop code uniquely identifying this Lockbox Recipient at its Lockbox
        # Address. It should be included in the mailing address intended for this Lockbox
        # Recipient.
        mail_stop_code:,
        # The name of the Lockbox Recipient.
        recipient_name:,
        # The status of the Lockbox Recipient.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `lockbox_recipient`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            created_at: Time,
            description: T.nilable(String),
            idempotency_key: T.nilable(String),
            lockbox_address_id: String,
            mail_stop_code: String,
            recipient_name: T.nilable(String),
            status: T.nilable(Increase::LockboxRecipient::Status::TaggedSymbol),
            type: Increase::LockboxRecipient::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The status of the Lockbox Recipient.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::LockboxRecipient::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # This Lockbox Recipient is active.
        ACTIVE =
          T.let(:active, Increase::LockboxRecipient::Status::TaggedSymbol)

        # This Lockbox Recipient is disabled. Checks mailed to this Lockbox Recipient will be rejected.
        DISABLED =
          T.let(:disabled, Increase::LockboxRecipient::Status::TaggedSymbol)

        # This Lockbox Recipient is canceled and cannot be modified. Checks mailed to this Lockbox Recipient will be rejected.
        CANCELED =
          T.let(:canceled, Increase::LockboxRecipient::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::LockboxRecipient::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `lockbox_recipient`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::LockboxRecipient::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCKBOX_RECIPIENT =
          T.let(
            :lockbox_recipient,
            Increase::LockboxRecipient::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::LockboxRecipient::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
