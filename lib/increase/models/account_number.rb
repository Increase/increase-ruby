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

      # @!attribute inbound_ach
      #   Properties related to how this Account Number handles inbound ACH transfers.
      #
      #   @return [Increase::AccountNumber::InboundACH]
      required :inbound_ach, -> { Increase::AccountNumber::InboundACH }

      # @!attribute inbound_checks
      #   Properties related to how this Account Number should handle inbound check
      #   withdrawals.
      #
      #   @return [Increase::AccountNumber::InboundChecks]
      required :inbound_checks, -> { Increase::AccountNumber::InboundChecks }

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
      #   @return [Symbol, Increase::AccountNumber::Status]
      required :status, enum: -> { Increase::AccountNumber::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `account_number`.
      #
      #   @return [Symbol, Increase::AccountNumber::Type]
      required :type, enum: -> { Increase::AccountNumber::Type }

      # @!method initialize(id:, account_id:, account_number:, created_at:, idempotency_key:, inbound_ach:, inbound_checks:, name:, routing_number:, status:, type:)
      #   Some parameter documentations has been truncated, see {Increase::AccountNumber}
      #   for more details.
      #
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
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Account
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param inbound_ach [Increase::AccountNumber::InboundACH] Properties related to how this Account Number handles inbound ACH transfers.
      #
      #   @param inbound_checks [Increase::AccountNumber::InboundChecks] Properties related to how this Account Number should handle inbound check withdr
      #
      #   @param name [String] The name you choose for the Account Number.
      #
      #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @param status [Symbol, Increase::AccountNumber::Status] This indicates if payments can be made to the Account Number.
      #
      #   @param type [Symbol, Increase::AccountNumber::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::AccountNumber#inbound_ach
      class InboundACH < Increase::Internal::Type::BaseModel
        # @!attribute debit_status
        #   Whether ACH debits are allowed against this Account Number. Note that they will
        #   still be declined if this is `allowed` if the Account Number is not active.
        #
        #   @return [Symbol, Increase::AccountNumber::InboundACH::DebitStatus]
        required :debit_status, enum: -> { Increase::AccountNumber::InboundACH::DebitStatus }

        # @!method initialize(debit_status:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::AccountNumber::InboundACH} for more details.
        #
        #   Properties related to how this Account Number handles inbound ACH transfers.
        #
        #   @param debit_status [Symbol, Increase::AccountNumber::InboundACH::DebitStatus] Whether ACH debits are allowed against this Account Number. Note that they will

        # Whether ACH debits are allowed against this Account Number. Note that they will
        # still be declined if this is `allowed` if the Account Number is not active.
        #
        # @see Increase::AccountNumber::InboundACH#debit_status
        module DebitStatus
          extend Increase::Internal::Type::Enum

          # ACH Debits are allowed.
          ALLOWED = :allowed

          # ACH Debits are blocked.
          BLOCKED = :blocked

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::AccountNumber#inbound_checks
      class InboundChecks < Increase::Internal::Type::BaseModel
        # @!attribute status
        #   How Increase should process checks with this account number printed on them.
        #
        #   @return [Symbol, Increase::AccountNumber::InboundChecks::Status]
        required :status, enum: -> { Increase::AccountNumber::InboundChecks::Status }

        # @!method initialize(status:)
        #   Properties related to how this Account Number should handle inbound check
        #   withdrawals.
        #
        #   @param status [Symbol, Increase::AccountNumber::InboundChecks::Status] How Increase should process checks with this account number printed on them.

        # How Increase should process checks with this account number printed on them.
        #
        # @see Increase::AccountNumber::InboundChecks#status
        module Status
          extend Increase::Internal::Type::Enum

          # Checks with this Account Number will be processed even if they are not associated with a Check Transfer.
          ALLOWED = :allowed

          # Checks with this Account Number will be processed only if they can be matched to an existing Check Transfer.
          CHECK_TRANSFERS_ONLY = :check_transfers_only

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # This indicates if payments can be made to the Account Number.
      #
      # @see Increase::AccountNumber#status
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
      # @see Increase::AccountNumber#type
      module Type
        extend Increase::Internal::Type::Enum

        ACCOUNT_NUMBER = :account_number

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
