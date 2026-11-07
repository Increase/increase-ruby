# typed: strong

module Increase
  module Models
    class AccountNumberUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::AccountNumberUpdateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Account Number.
      sig { returns(String) }
      attr_accessor :account_number_id

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # ACH debits will be declined if this is `allowed` but the Account Number is not
      # active.
      sig do
        returns(
          T.nilable(
            Increase::AccountNumberUpdateParams::InboundACHDebits::OrSymbol
          )
        )
      end
      attr_reader :inbound_ach_debits

      sig do
        params(
          inbound_ach_debits:
            Increase::AccountNumberUpdateParams::InboundACHDebits::OrSymbol
        ).void
      end
      attr_writer :inbound_ach_debits

      # The name you choose for the Account Number.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # This indicates if transfers can be made to the Account Number.
      sig do
        returns(
          T.nilable(Increase::AccountNumberUpdateParams::Status::OrSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: Increase::AccountNumberUpdateParams::Status::OrSymbol
        ).void
      end
      attr_writer :status

      # Whether unregistered inbound checks for this Account Number can be deposited.
      sig do
        returns(
          T.nilable(
            Increase::AccountNumberUpdateParams::UnregisteredInboundChecks::OrSymbol
          )
        )
      end
      attr_reader :unregistered_inbound_checks

      sig do
        params(
          unregistered_inbound_checks:
            Increase::AccountNumberUpdateParams::UnregisteredInboundChecks::OrSymbol
        ).void
      end
      attr_writer :unregistered_inbound_checks

      sig do
        params(
          account_number_id: String,
          inbound_ach_debits:
            Increase::AccountNumberUpdateParams::InboundACHDebits::OrSymbol,
          name: String,
          status: Increase::AccountNumberUpdateParams::Status::OrSymbol,
          unregistered_inbound_checks:
            Increase::AccountNumberUpdateParams::UnregisteredInboundChecks::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Account Number.
        account_number_id:,
        # Whether inbound ACH debits are allowed against this Account Number. Note that
        # ACH debits will be declined if this is `allowed` but the Account Number is not
        # active.
        inbound_ach_debits: nil,
        # The name you choose for the Account Number.
        name: nil,
        # This indicates if transfers can be made to the Account Number.
        status: nil,
        # Whether unregistered inbound checks for this Account Number can be deposited.
        unregistered_inbound_checks: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_number_id: String,
            inbound_ach_debits:
              Increase::AccountNumberUpdateParams::InboundACHDebits::OrSymbol,
            name: String,
            status: Increase::AccountNumberUpdateParams::Status::OrSymbol,
            unregistered_inbound_checks:
              Increase::AccountNumberUpdateParams::UnregisteredInboundChecks::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # ACH debits will be declined if this is `allowed` but the Account Number is not
      # active.
      module InboundACHDebits
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::AccountNumberUpdateParams::InboundACHDebits)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # ACH Debits are allowed.
        ALLOWED =
          T.let(
            :allowed,
            Increase::AccountNumberUpdateParams::InboundACHDebits::TaggedSymbol
          )

        # ACH Debits are blocked. Received debits will be declined and returned with code `R20` (non-transaction account).
        BLOCKED =
          T.let(
            :blocked,
            Increase::AccountNumberUpdateParams::InboundACHDebits::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::AccountNumberUpdateParams::InboundACHDebits::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # This indicates if transfers can be made to the Account Number.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::AccountNumberUpdateParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The account number is active.
        ACTIVE =
          T.let(
            :active,
            Increase::AccountNumberUpdateParams::Status::TaggedSymbol
          )

        # The account number is temporarily disabled.
        DISABLED =
          T.let(
            :disabled,
            Increase::AccountNumberUpdateParams::Status::TaggedSymbol
          )

        # The account number is permanently disabled.
        CANCELED =
          T.let(
            :canceled,
            Increase::AccountNumberUpdateParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::AccountNumberUpdateParams::Status::TaggedSymbol]
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
            T.all(
              Symbol,
              Increase::AccountNumberUpdateParams::UnregisteredInboundChecks
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Accept all Inbound Check Deposits, even if they are not associated with a Check Transfer or Checkbook Check.
        ALLOWED =
          T.let(
            :allowed,
            Increase::AccountNumberUpdateParams::UnregisteredInboundChecks::TaggedSymbol
          )

        # Only accept Inbound Check Deposits if they can be matched to a Check Transfer or Checkbook Check.
        BLOCKED =
          T.let(
            :blocked,
            Increase::AccountNumberUpdateParams::UnregisteredInboundChecks::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::AccountNumberUpdateParams::UnregisteredInboundChecks::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
