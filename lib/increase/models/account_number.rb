# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountNumbers#create
    class AccountNumber < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Account Number identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the account this Account Number belongs to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number
      #   The account number.
      #
      #   @return [String]
      required :account_number, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #   Number was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute inbound_ach_debits
      #   Whether inbound ACH debits are allowed against this Account Number. Note that
      #   they will still be declined if this is `allowed` but the Account Number is not
      #   active.
      #
      #   @return [Symbol, Increase::Models::AccountNumber::InboundACHDebits]
      required :inbound_ach_debits, enum: -> { Increase::AccountNumber::InboundACHDebits }

      # @!attribute name
      #   The name you choose for the Account Number.
      #
      #   @return [String]
      required :name, String

      # @!attribute routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute status
      #   This indicates if payments can be made to the Account Number.
      #
      #   @return [Symbol, Increase::Models::AccountNumber::Status]
      required :status, enum: -> { Increase::AccountNumber::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `account_number`.
      #
      #   @return [Symbol, Increase::Models::AccountNumber::Type]
      required :type, enum: -> { Increase::AccountNumber::Type }

      # @!attribute unregistered_inbound_checks
      #   Whether unregistered inbound checks for this Account Number can be deposited.
      #
      #   @return [Symbol, Increase::Models::AccountNumber::UnregisteredInboundChecks]
      required :unregistered_inbound_checks, enum: -> { Increase::AccountNumber::UnregisteredInboundChecks }

      # @!method initialize(id:, account_id:, account_number:, created_at:, idempotency_key:, inbound_ach_debits:, name:, routing_number:, status:, type:, unregistered_inbound_checks:)
      #   Each account can have multiple account and routing numbers. We recommend that
      #   you use a set per vendor. This is similar to how you use different passwords for
      #   different websites. Account numbers can also be used to seamlessly reconcile
      #   inbound payments. Generating a unique account number per vendor ensures you
      #   always know the originator of an incoming payment.
      #
      #   @param id [String] The Account Number identifier.
      #
      #   @param account_id [String] The identifier for the account this Account Number belongs to.
      #
      #   @param account_number [String] The account number.
      #
      #   @param created_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #     Number was created.
      #
      #   @param idempotency_key [String, nil]
      #     The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @param inbound_ach_debits [Symbol, Increase::Models::AccountNumber::InboundACHDebits]
      #     Whether inbound ACH debits are allowed against this Account Number. Note that
      #     they will still be declined if this is `allowed` but the Account Number is not
      #     active.
      #
      #   @param name [String] The name you choose for the Account Number.
      #
      #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @param status [Symbol, Increase::Models::AccountNumber::Status]
      #     This indicates if payments can be made to the Account Number.
      #
      #   @param type [Symbol, Increase::Models::AccountNumber::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `account_number`.
      #
      #   @param unregistered_inbound_checks [Symbol, Increase::Models::AccountNumber::UnregisteredInboundChecks]
      #     Whether unregistered inbound checks for this Account Number can be deposited.

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # they will still be declined if this is `allowed` but the Account Number is not
      # active.
      #
      # @see Increase::Models::AccountNumber#inbound_ach_debits
      module InboundACHDebits
        extend Increase::Internal::Type::Enum

        # ACH Debits are allowed.
        ALLOWED = :allowed

        # ACH Debits are blocked. Received debits will be declined and returned with code `R20` (non-transaction account).
        BLOCKED = :blocked

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # This indicates if payments can be made to the Account Number.
      #
      # @see Increase::Models::AccountNumber#status
      module Status
        extend Increase::Internal::Type::Enum

        # The account number is active.
        ACTIVE = :active

        # The account number is temporarily disabled.
        DISABLED = :disabled

        # The account number is permanently disabled.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `account_number`.
      #
      # @see Increase::Models::AccountNumber#type
      module Type
        extend Increase::Internal::Type::Enum

        ACCOUNT_NUMBER = :account_number

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Whether unregistered inbound checks for this Account Number can be deposited.
      #
      # @see Increase::Models::AccountNumber#unregistered_inbound_checks
      module UnregisteredInboundChecks
        extend Increase::Internal::Type::Enum

        # Accept all Inbound Check Deposits, even if they are not associated with a Check Transfer or Checkbook Check.
        ALLOWED = :allowed

        # Only accept Inbound Check Deposits if they can be matched to a Check Transfer or Checkbook Check.
        BLOCKED = :blocked

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
