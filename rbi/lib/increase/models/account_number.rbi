# typed: strong

module Increase
  module Models
    class AccountNumber < Increase::Internal::Type::BaseModel
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
      #   Number was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # Properties related to how this Account Number handles inbound ACH transfers.
      sig { returns(Increase::Models::AccountNumber::InboundACH) }
      attr_reader :inbound_ach

      sig { params(inbound_ach: T.any(Increase::Models::AccountNumber::InboundACH, Increase::Internal::AnyHash)).void }
      attr_writer :inbound_ach

      # Properties related to how this Account Number should handle inbound check
      #   withdrawals.
      sig { returns(Increase::Models::AccountNumber::InboundChecks) }
      attr_reader :inbound_checks

      sig do
        params(inbound_checks: T.any(Increase::Models::AccountNumber::InboundChecks, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :inbound_checks

      # The name you choose for the Account Number.
      sig { returns(String) }
      attr_accessor :name

      # The American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :routing_number

      # This indicates if payments can be made to the Account Number.
      sig { returns(Increase::Models::AccountNumber::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      #   `account_number`.
      sig { returns(Increase::Models::AccountNumber::Type::TaggedSymbol) }
      attr_accessor :type

      # Each account can have multiple account and routing numbers. We recommend that
      #   you use a set per vendor. This is similar to how you use different passwords for
      #   different websites. Account numbers can also be used to seamlessly reconcile
      #   inbound payments. Generating a unique account number per vendor ensures you
      #   always know the originator of an incoming payment.
      sig do
        params(
          id: String,
          account_id: String,
          account_number: String,
          created_at: Time,
          idempotency_key: T.nilable(String),
          inbound_ach: T.any(Increase::Models::AccountNumber::InboundACH, Increase::Internal::AnyHash),
          inbound_checks: T.any(Increase::Models::AccountNumber::InboundChecks, Increase::Internal::AnyHash),
          name: String,
          routing_number: String,
          status: Increase::Models::AccountNumber::Status::OrSymbol,
          type: Increase::Models::AccountNumber::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        account_id:,
        account_number:,
        created_at:,
        idempotency_key:,
        inbound_ach:,
        inbound_checks:,
        name:,
        routing_number:,
        status:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              account_id: String,
              account_number: String,
              created_at: Time,
              idempotency_key: T.nilable(String),
              inbound_ach: Increase::Models::AccountNumber::InboundACH,
              inbound_checks: Increase::Models::AccountNumber::InboundChecks,
              name: String,
              routing_number: String,
              status: Increase::Models::AccountNumber::Status::TaggedSymbol,
              type: Increase::Models::AccountNumber::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      class InboundACH < Increase::Internal::Type::BaseModel
        # Whether ACH debits are allowed against this Account Number. Note that they will
        #   still be declined if this is `allowed` if the Account Number is not active.
        sig { returns(Increase::Models::AccountNumber::InboundACH::DebitStatus::TaggedSymbol) }
        attr_accessor :debit_status

        # Properties related to how this Account Number handles inbound ACH transfers.
        sig do
          params(debit_status: Increase::Models::AccountNumber::InboundACH::DebitStatus::OrSymbol)
            .returns(T.attached_class)
        end
        def self.new(debit_status:)
        end

        sig { override.returns({debit_status: Increase::Models::AccountNumber::InboundACH::DebitStatus::TaggedSymbol}) }
        def to_hash
        end

        # Whether ACH debits are allowed against this Account Number. Note that they will
        #   still be declined if this is `allowed` if the Account Number is not active.
        module DebitStatus
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountNumber::InboundACH::DebitStatus) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::AccountNumber::InboundACH::DebitStatus::TaggedSymbol) }

          # ACH Debits are allowed.
          ALLOWED = T.let(:allowed, Increase::Models::AccountNumber::InboundACH::DebitStatus::TaggedSymbol)

          # ACH Debits are blocked.
          BLOCKED = T.let(:blocked, Increase::Models::AccountNumber::InboundACH::DebitStatus::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::AccountNumber::InboundACH::DebitStatus::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class InboundChecks < Increase::Internal::Type::BaseModel
        # How Increase should process checks with this account number printed on them.
        sig { returns(Increase::Models::AccountNumber::InboundChecks::Status::TaggedSymbol) }
        attr_accessor :status

        # Properties related to how this Account Number should handle inbound check
        #   withdrawals.
        sig { params(status: Increase::Models::AccountNumber::InboundChecks::Status::OrSymbol).returns(T.attached_class) }
        def self.new(status:)
        end

        sig { override.returns({status: Increase::Models::AccountNumber::InboundChecks::Status::TaggedSymbol}) }
        def to_hash
        end

        # How Increase should process checks with this account number printed on them.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountNumber::InboundChecks::Status) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::AccountNumber::InboundChecks::Status::TaggedSymbol) }

          # Checks with this Account Number will be processed even if they are not associated with a Check Transfer.
          ALLOWED = T.let(:allowed, Increase::Models::AccountNumber::InboundChecks::Status::TaggedSymbol)

          # Checks with this Account Number will be processed only if they can be matched to an existing Check Transfer.
          CHECK_TRANSFERS_ONLY =
            T.let(:check_transfers_only, Increase::Models::AccountNumber::InboundChecks::Status::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::AccountNumber::InboundChecks::Status::TaggedSymbol]) }
          def self.values
          end
        end
      end

      # This indicates if payments can be made to the Account Number.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountNumber::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::AccountNumber::Status::TaggedSymbol) }

        # The account number is active.
        ACTIVE = T.let(:active, Increase::Models::AccountNumber::Status::TaggedSymbol)

        # The account number is temporarily disabled.
        DISABLED = T.let(:disabled, Increase::Models::AccountNumber::Status::TaggedSymbol)

        # The account number is permanently disabled.
        CANCELED = T.let(:canceled, Increase::Models::AccountNumber::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::AccountNumber::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `account_number`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountNumber::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::AccountNumber::Type::TaggedSymbol) }

        ACCOUNT_NUMBER = T.let(:account_number, Increase::Models::AccountNumber::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::AccountNumber::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
