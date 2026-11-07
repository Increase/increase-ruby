# typed: strong

module Increase
  module Models
    class AccountNumber < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::AccountNumber, Increase::Internal::AnyHash)
        end

      # The Account Number identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the account this Account Number belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The account number.
      sig { returns(String) }
      attr_accessor :account_number

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      # Number was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # they will still be declined if this is `allowed` but the Account Number is not
      # active.
      sig { returns(Increase::AccountNumber::InboundACHDebits::TaggedSymbol) }
      attr_accessor :inbound_ach_debits

      # The name you choose for the Account Number.
      sig { returns(String) }
      attr_accessor :name

      # The American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :routing_number

      # This indicates if payments can be made to the Account Number.
      sig { returns(Increase::AccountNumber::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `account_number`.
      sig { returns(Increase::AccountNumber::Type::TaggedSymbol) }
      attr_accessor :type

      # Whether unregistered inbound checks for this Account Number can be deposited.
      sig do
        returns(
          Increase::AccountNumber::UnregisteredInboundChecks::TaggedSymbol
        )
      end
      attr_accessor :unregistered_inbound_checks

      # Each account can have multiple account and routing numbers. We recommend that
      # you use a set per vendor. This is similar to how you use different passwords for
      # different websites. Account numbers can also be used to seamlessly reconcile
      # inbound payments. Generating a unique account number per vendor ensures you
      # always know the originator of an incoming payment.
      sig do
        params(
          id: String,
          account_id: String,
          account_number: String,
          created_at: Time,
          idempotency_key: T.nilable(String),
          inbound_ach_debits:
            Increase::AccountNumber::InboundACHDebits::OrSymbol,
          name: String,
          routing_number: String,
          status: Increase::AccountNumber::Status::OrSymbol,
          type: Increase::AccountNumber::Type::OrSymbol,
          unregistered_inbound_checks:
            Increase::AccountNumber::UnregisteredInboundChecks::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account Number identifier.
        id:,
        # The identifier for the account this Account Number belongs to.
        account_id:,
        # The account number.
        account_number:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
        # Number was created.
        created_at:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # Whether inbound ACH debits are allowed against this Account Number. Note that
        # they will still be declined if this is `allowed` but the Account Number is not
        # active.
        inbound_ach_debits:,
        # The name you choose for the Account Number.
        name:,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN).
        routing_number:,
        # This indicates if payments can be made to the Account Number.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `account_number`.
        type:,
        # Whether unregistered inbound checks for this Account Number can be deposited.
        unregistered_inbound_checks:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            account_number: String,
            created_at: Time,
            idempotency_key: T.nilable(String),
            inbound_ach_debits:
              Increase::AccountNumber::InboundACHDebits::TaggedSymbol,
            name: String,
            routing_number: String,
            status: Increase::AccountNumber::Status::TaggedSymbol,
            type: Increase::AccountNumber::Type::TaggedSymbol,
            unregistered_inbound_checks:
              Increase::AccountNumber::UnregisteredInboundChecks::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # they will still be declined if this is `allowed` but the Account Number is not
      # active.
      module InboundACHDebits
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::AccountNumber::InboundACHDebits)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # ACH Debits are allowed.
        ALLOWED =
          T.let(
            :allowed,
            Increase::AccountNumber::InboundACHDebits::TaggedSymbol
          )

        # ACH Debits are blocked. Received debits will be declined and returned with code `R20` (non-transaction account).
        BLOCKED =
          T.let(
            :blocked,
            Increase::AccountNumber::InboundACHDebits::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::AccountNumber::InboundACHDebits::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # This indicates if payments can be made to the Account Number.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::AccountNumber::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The account number is active.
        ACTIVE = T.let(:active, Increase::AccountNumber::Status::TaggedSymbol)

        # The account number is temporarily disabled.
        DISABLED =
          T.let(:disabled, Increase::AccountNumber::Status::TaggedSymbol)

        # The account number is permanently disabled.
        CANCELED =
          T.let(:canceled, Increase::AccountNumber::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::AccountNumber::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `account_number`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::AccountNumber::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_NUMBER =
          T.let(:account_number, Increase::AccountNumber::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::AccountNumber::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Whether unregistered inbound checks for this Account Number can be deposited.
      module UnregisteredInboundChecks
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::AccountNumber::UnregisteredInboundChecks)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Accept all Inbound Check Deposits, even if they are not associated with a Check Transfer or Checkbook Check.
        ALLOWED =
          T.let(
            :allowed,
            Increase::AccountNumber::UnregisteredInboundChecks::TaggedSymbol
          )

        # Only accept Inbound Check Deposits if they can be matched to a Check Transfer or Checkbook Check.
        BLOCKED =
          T.let(
            :blocked,
            Increase::AccountNumber::UnregisteredInboundChecks::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::AccountNumber::UnregisteredInboundChecks::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
