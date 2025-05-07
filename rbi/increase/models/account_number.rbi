# typed: strong

module Increase
  module Models
    class AccountNumber < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

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

      # Properties related to how this Account Number handles inbound ACH transfers.
      sig { returns(Increase::AccountNumber::InboundACH) }
      attr_reader :inbound_ach

      sig do
        params(inbound_ach: Increase::AccountNumber::InboundACH::OrHash).void
      end
      attr_writer :inbound_ach

      # Properties related to how this Account Number should handle inbound check
      # withdrawals.
      sig { returns(Increase::AccountNumber::InboundChecks) }
      attr_reader :inbound_checks

      sig do
        params(
          inbound_checks: Increase::AccountNumber::InboundChecks::OrHash
        ).void
      end
      attr_writer :inbound_checks

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
          inbound_ach: Increase::AccountNumber::InboundACH::OrHash,
          inbound_checks: Increase::AccountNumber::InboundChecks::OrHash,
          name: String,
          routing_number: String,
          status: Increase::AccountNumber::Status::OrSymbol,
          type: Increase::AccountNumber::Type::OrSymbol
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
        # Properties related to how this Account Number handles inbound ACH transfers.
        inbound_ach:,
        # Properties related to how this Account Number should handle inbound check
        # withdrawals.
        inbound_checks:,
        # The name you choose for the Account Number.
        name:,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN).
        routing_number:,
        # This indicates if payments can be made to the Account Number.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `account_number`.
        type:
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
            inbound_ach: Increase::AccountNumber::InboundACH,
            inbound_checks: Increase::AccountNumber::InboundChecks,
            name: String,
            routing_number: String,
            status: Increase::AccountNumber::Status::TaggedSymbol,
            type: Increase::AccountNumber::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class InboundACH < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # Whether ACH debits are allowed against this Account Number. Note that they will
        # still be declined if this is `allowed` if the Account Number is not active.
        sig do
          returns(
            Increase::AccountNumber::InboundACH::DebitStatus::TaggedSymbol
          )
        end
        attr_accessor :debit_status

        # Properties related to how this Account Number handles inbound ACH transfers.
        sig do
          params(
            debit_status:
              Increase::AccountNumber::InboundACH::DebitStatus::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether ACH debits are allowed against this Account Number. Note that they will
          # still be declined if this is `allowed` if the Account Number is not active.
          debit_status:
        )
        end

        sig do
          override.returns(
            {
              debit_status:
                Increase::AccountNumber::InboundACH::DebitStatus::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether ACH debits are allowed against this Account Number. Note that they will
        # still be declined if this is `allowed` if the Account Number is not active.
        module DebitStatus
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::AccountNumber::InboundACH::DebitStatus)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # ACH Debits are allowed.
          ALLOWED =
            T.let(
              :allowed,
              Increase::AccountNumber::InboundACH::DebitStatus::TaggedSymbol
            )

          # ACH Debits are blocked.
          BLOCKED =
            T.let(
              :blocked,
              Increase::AccountNumber::InboundACH::DebitStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountNumber::InboundACH::DebitStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class InboundChecks < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # How Increase should process checks with this account number printed on them.
        sig do
          returns(Increase::AccountNumber::InboundChecks::Status::TaggedSymbol)
        end
        attr_accessor :status

        # Properties related to how this Account Number should handle inbound check
        # withdrawals.
        sig do
          params(
            status: Increase::AccountNumber::InboundChecks::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # How Increase should process checks with this account number printed on them.
          status:
        )
        end

        sig do
          override.returns(
            {
              status:
                Increase::AccountNumber::InboundChecks::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # How Increase should process checks with this account number printed on them.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::AccountNumber::InboundChecks::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Checks with this Account Number will be processed even if they are not associated with a Check Transfer.
          ALLOWED =
            T.let(
              :allowed,
              Increase::AccountNumber::InboundChecks::Status::TaggedSymbol
            )

          # Checks with this Account Number will be processed only if they can be matched to an existing Check Transfer.
          CHECK_TRANSFERS_ONLY =
            T.let(
              :check_transfers_only,
              Increase::AccountNumber::InboundChecks::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountNumber::InboundChecks::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
    end
  end
end
