# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountNumbers#create
    class AccountNumberCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
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

      # @!attribute [r] inbound_ach
      #   Options related to how this Account Number should handle inbound ACH transfers.
      #
      #   @return [Increase::Models::AccountNumberCreateParams::InboundACH, nil]
      optional :inbound_ach, -> { Increase::Models::AccountNumberCreateParams::InboundACH }

      # @!parse
      #   # @return [Increase::Models::AccountNumberCreateParams::InboundACH]
      #   attr_writer :inbound_ach

      # @!attribute [r] inbound_checks
      #   Options related to how this Account Number should handle inbound check
      #     withdrawals.
      #
      #   @return [Increase::Models::AccountNumberCreateParams::InboundChecks, nil]
      optional :inbound_checks, -> { Increase::Models::AccountNumberCreateParams::InboundChecks }

      # @!parse
      #   # @return [Increase::Models::AccountNumberCreateParams::InboundChecks]
      #   attr_writer :inbound_checks

      # @!parse
      #   # @param account_id [String]
      #   # @param name [String]
      #   # @param inbound_ach [Increase::Models::AccountNumberCreateParams::InboundACH]
      #   # @param inbound_checks [Increase::Models::AccountNumberCreateParams::InboundChecks]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(account_id:, name:, inbound_ach: nil, inbound_checks: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class InboundACH < Increase::Internal::Type::BaseModel
        # @!attribute debit_status
        #   Whether ACH debits are allowed against this Account Number. Note that ACH debits
        #     will be declined if this is `allowed` but the Account Number is not active. If
        #     you do not specify this field, the default is `allowed`.
        #
        #   @return [Symbol, Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus]
        required :debit_status, enum: -> { Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus }

        # @!parse
        #   # Options related to how this Account Number should handle inbound ACH transfers.
        #   #
        #   # @param debit_status [Symbol, Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus]
        #   #
        #   def initialize(debit_status:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        #   will be declined if this is `allowed` but the Account Number is not active. If
        #   you do not specify this field, the default is `allowed`.
        #
        # @see Increase::Models::AccountNumberCreateParams::InboundACH#debit_status
        module DebitStatus
          extend Increase::Internal::Type::Enum

          # ACH Debits are allowed.
          ALLOWED = :allowed

          # ACH Debits are blocked.
          BLOCKED = :blocked

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      class InboundChecks < Increase::Internal::Type::BaseModel
        # @!attribute status
        #   How Increase should process checks with this account number printed on them. If
        #     you do not specify this field, the default is `check_transfers_only`.
        #
        #   @return [Symbol, Increase::Models::AccountNumberCreateParams::InboundChecks::Status]
        required :status, enum: -> { Increase::Models::AccountNumberCreateParams::InboundChecks::Status }

        # @!parse
        #   # Options related to how this Account Number should handle inbound check
        #   #   withdrawals.
        #   #
        #   # @param status [Symbol, Increase::Models::AccountNumberCreateParams::InboundChecks::Status]
        #   #
        #   def initialize(status:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # How Increase should process checks with this account number printed on them. If
        #   you do not specify this field, the default is `check_transfers_only`.
        #
        # @see Increase::Models::AccountNumberCreateParams::InboundChecks#status
        module Status
          extend Increase::Internal::Type::Enum

          # Checks with this Account Number will be processed even if they are not associated with a Check Transfer.
          ALLOWED = :allowed

          # Checks with this Account Number will be processed only if they can be matched to an existing Check Transfer.
          CHECK_TRANSFERS_ONLY = :check_transfers_only

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
