# typed: strong

module Increase
  module Models
    class AccountNumberCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::AccountNumberCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The Account the Account Number should belong to.
      sig { returns(String) }
      attr_accessor :account_id

      # The name you choose for the Account Number.
      sig { returns(String) }
      attr_accessor :name

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # ACH debits will be declined if this is `allowed` but the Account Number is not
      # active. If you do not specify this field, the default is `allowed`.
      sig do
        returns(
          T.nilable(
            Increase::AccountNumberCreateParams::InboundACHDebits::OrSymbol
          )
        )
      end
      attr_reader :inbound_ach_debits

      sig do
        params(
          inbound_ach_debits:
            Increase::AccountNumberCreateParams::InboundACHDebits::OrSymbol
        ).void
      end
      attr_writer :inbound_ach_debits

      # Whether unregistered inbound checks for this Account Number can be deposited. If
      # you do not specify this field, the default is `blocked`.
      sig do
        returns(
          T.nilable(
            Increase::AccountNumberCreateParams::UnregisteredInboundChecks::OrSymbol
          )
        )
      end
      attr_reader :unregistered_inbound_checks

      sig do
        params(
          unregistered_inbound_checks:
            Increase::AccountNumberCreateParams::UnregisteredInboundChecks::OrSymbol
        ).void
      end
      attr_writer :unregistered_inbound_checks

      sig do
        params(
          account_id: String,
          name: String,
          inbound_ach_debits:
            Increase::AccountNumberCreateParams::InboundACHDebits::OrSymbol,
          unregistered_inbound_checks:
            Increase::AccountNumberCreateParams::UnregisteredInboundChecks::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account the Account Number should belong to.
        account_id:,
        # The name you choose for the Account Number.
        name:,
        # Whether inbound ACH debits are allowed against this Account Number. Note that
        # ACH debits will be declined if this is `allowed` but the Account Number is not
        # active. If you do not specify this field, the default is `allowed`.
        inbound_ach_debits: nil,
        # Whether unregistered inbound checks for this Account Number can be deposited. If
        # you do not specify this field, the default is `blocked`.
        unregistered_inbound_checks: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            name: String,
            inbound_ach_debits:
              Increase::AccountNumberCreateParams::InboundACHDebits::OrSymbol,
            unregistered_inbound_checks:
              Increase::AccountNumberCreateParams::UnregisteredInboundChecks::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # ACH debits will be declined if this is `allowed` but the Account Number is not
      # active. If you do not specify this field, the default is `allowed`.
      module InboundACHDebits
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::AccountNumberCreateParams::InboundACHDebits)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # ACH Debits are allowed.
        ALLOWED =
          T.let(
            :allowed,
            Increase::AccountNumberCreateParams::InboundACHDebits::TaggedSymbol
          )

        # ACH Debits are blocked. Received debits will be declined and returned with code `R20` (non-transaction account).
        BLOCKED =
          T.let(
            :blocked,
            Increase::AccountNumberCreateParams::InboundACHDebits::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::AccountNumberCreateParams::InboundACHDebits::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Whether unregistered inbound checks for this Account Number can be deposited. If
      # you do not specify this field, the default is `blocked`.
      module UnregisteredInboundChecks
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::AccountNumberCreateParams::UnregisteredInboundChecks
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Accept all Inbound Check Deposits, even if they are not associated with a Check Transfer or Checkbook Check.
        ALLOWED =
          T.let(
            :allowed,
            Increase::AccountNumberCreateParams::UnregisteredInboundChecks::TaggedSymbol
          )

        # Only accept Inbound Check Deposits if they can be matched to a Check Transfer or Checkbook Check.
        BLOCKED =
          T.let(
            :blocked,
            Increase::AccountNumberCreateParams::UnregisteredInboundChecks::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::AccountNumberCreateParams::UnregisteredInboundChecks::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
