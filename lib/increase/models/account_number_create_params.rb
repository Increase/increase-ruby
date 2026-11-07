# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountNumbers#create
    class AccountNumberCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Account the Account Number should belong to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute name
      #   The name you choose for the Account Number.
      #
      #   @return [String]
      required :name, String

      # @!attribute inbound_ach_debits
      #   Whether inbound ACH debits are allowed against this Account Number. Note that
      #   ACH debits will be declined if this is `allowed` but the Account Number is not
      #   active. If you do not specify this field, the default is `allowed`.
      #
      #   @return [Symbol, Increase::Models::AccountNumberCreateParams::InboundACHDebits, nil]
      optional :inbound_ach_debits, enum: -> { Increase::AccountNumberCreateParams::InboundACHDebits }

      # @!attribute unregistered_inbound_checks
      #   Whether unregistered inbound checks for this Account Number can be deposited. If
      #   you do not specify this field, the default is `blocked`.
      #
      #   @return [Symbol, Increase::Models::AccountNumberCreateParams::UnregisteredInboundChecks, nil]
      optional :unregistered_inbound_checks,
               enum: -> { Increase::AccountNumberCreateParams::UnregisteredInboundChecks }

      # @!method initialize(account_id:, name:, inbound_ach_debits: nil, unregistered_inbound_checks: nil, request_options: {})
      #   @param account_id [String] The Account the Account Number should belong to.
      #
      #   @param name [String] The name you choose for the Account Number.
      #
      #   @param inbound_ach_debits [Symbol, Increase::Models::AccountNumberCreateParams::InboundACHDebits]
      #     Whether inbound ACH debits are allowed against this Account Number. Note that
      #     ACH debits will be declined if this is `allowed` but the Account Number is not
      #     active. If you do not specify this field, the default is `allowed`.
      #
      #   @param unregistered_inbound_checks [Symbol, Increase::Models::AccountNumberCreateParams::UnregisteredInboundChecks]
      #     Whether unregistered inbound checks for this Account Number can be deposited. If
      #     you do not specify this field, the default is `blocked`.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # Whether inbound ACH debits are allowed against this Account Number. Note that
      # ACH debits will be declined if this is `allowed` but the Account Number is not
      # active. If you do not specify this field, the default is `allowed`.
      module InboundACHDebits
        extend Increase::Internal::Type::Enum

        # ACH Debits are allowed.
        ALLOWED = :allowed

        # ACH Debits are blocked. Received debits will be declined and returned with code `R20` (non-transaction account).
        BLOCKED = :blocked

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Whether unregistered inbound checks for this Account Number can be deposited. If
      # you do not specify this field, the default is `blocked`.
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
