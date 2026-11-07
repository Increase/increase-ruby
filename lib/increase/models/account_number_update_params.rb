# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountNumbers#update
    class AccountNumberUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   The identifier of the Account Number.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute inbound_ach_debits
      #   Whether inbound ACH debits are allowed against this Account Number. Note that
      #   ACH debits will be declined if this is `allowed` but the Account Number is not
      #   active.
      #
      #   @return [Symbol, Increase::Models::AccountNumberUpdateParams::InboundACHDebits, nil]
      optional :inbound_ach_debits, enum: -> { Increase::AccountNumberUpdateParams::InboundACHDebits }

      # @!attribute name
      #   The name you choose for the Account Number.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute status
      #   This indicates if transfers can be made to the Account Number.
      #
      #   @return [Symbol, Increase::Models::AccountNumberUpdateParams::Status, nil]
      optional :status, enum: -> { Increase::AccountNumberUpdateParams::Status }

      # @!attribute unregistered_inbound_checks
      #   Whether unregistered inbound checks for this Account Number can be deposited.
      #
      #   @return [Symbol, Increase::Models::AccountNumberUpdateParams::UnregisteredInboundChecks, nil]
      optional :unregistered_inbound_checks,
               enum: -> { Increase::AccountNumberUpdateParams::UnregisteredInboundChecks }

      # @!method initialize(account_number_id:, inbound_ach_debits: nil, name: nil, status: nil, unregistered_inbound_checks: nil, request_options: {})
      #   @param account_number_id [String] The identifier of the Account Number.
      #
      #   @param inbound_ach_debits [Symbol, Increase::Models::AccountNumberUpdateParams::InboundACHDebits]
      #     Whether inbound ACH debits are allowed against this Account Number. Note that
      #     ACH debits will be declined if this is `allowed` but the Account Number is not
      #     active.
      #
      #   @param name [String] The name you choose for the Account Number.
      #
      #   @param status [Symbol, Increase::Models::AccountNumberUpdateParams::Status]
      #     This indicates if transfers can be made to the Account Number.
      #
      #   @param unregistered_inbound_checks [Symbol, Increase::Models::AccountNumberUpdateParams::UnregisteredInboundChecks]
      #     Whether unregistered inbound checks for this Account Number can be deposited.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # ACH debits will be declined if this is `allowed` but the Account Number is not
      # active.
      module InboundACHDebits
        extend Increase::Internal::Type::Enum

        # ACH Debits are allowed.
        ALLOWED = :allowed

        # ACH Debits are blocked. Received debits will be declined and returned with code `R20` (non-transaction account).
        BLOCKED = :blocked

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # This indicates if transfers can be made to the Account Number.
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

      # Whether unregistered inbound checks for this Account Number can be deposited.
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
