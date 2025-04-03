# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountNumbers#update
    class AccountNumberUpdateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] inbound_ach
      #   Options related to how this Account Number handles inbound ACH transfers.
      #
      #   @return [Increase::Models::AccountNumberUpdateParams::InboundACH, nil]
      optional :inbound_ach, -> { Increase::Models::AccountNumberUpdateParams::InboundACH }

      # @!parse
      #   # @return [Increase::Models::AccountNumberUpdateParams::InboundACH]
      #   attr_writer :inbound_ach

      # @!attribute [r] inbound_checks
      #   Options related to how this Account Number should handle inbound check
      #     withdrawals.
      #
      #   @return [Increase::Models::AccountNumberUpdateParams::InboundChecks, nil]
      optional :inbound_checks, -> { Increase::Models::AccountNumberUpdateParams::InboundChecks }

      # @!parse
      #   # @return [Increase::Models::AccountNumberUpdateParams::InboundChecks]
      #   attr_writer :inbound_checks

      # @!attribute [r] name
      #   The name you choose for the Account Number.
      #
      #   @return [String, nil]
      optional :name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :name

      # @!attribute [r] status
      #   This indicates if transfers can be made to the Account Number.
      #
      #   @return [Symbol, Increase::Models::AccountNumberUpdateParams::Status, nil]
      optional :status, enum: -> { Increase::Models::AccountNumberUpdateParams::Status }

      # @!parse
      #   # @return [Symbol, Increase::Models::AccountNumberUpdateParams::Status]
      #   attr_writer :status

      # @!parse
      #   # @param inbound_ach [Increase::Models::AccountNumberUpdateParams::InboundACH]
      #   # @param inbound_checks [Increase::Models::AccountNumberUpdateParams::InboundChecks]
      #   # @param name [String]
      #   # @param status [Symbol, Increase::Models::AccountNumberUpdateParams::Status]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(inbound_ach: nil, inbound_checks: nil, name: nil, status: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class InboundACH < Increase::Internal::Type::BaseModel
        # @!attribute [r] debit_status
        #   Whether ACH debits are allowed against this Account Number. Note that ACH debits
        #     will be declined if this is `allowed` but the Account Number is not active.
        #
        #   @return [Symbol, Increase::Models::AccountNumberUpdateParams::InboundACH::DebitStatus, nil]
        optional :debit_status, enum: -> { Increase::Models::AccountNumberUpdateParams::InboundACH::DebitStatus }

        # @!parse
        #   # @return [Symbol, Increase::Models::AccountNumberUpdateParams::InboundACH::DebitStatus]
        #   attr_writer :debit_status

        # @!parse
        #   # Options related to how this Account Number handles inbound ACH transfers.
        #   #
        #   # @param debit_status [Symbol, Increase::Models::AccountNumberUpdateParams::InboundACH::DebitStatus]
        #   #
        #   def initialize(debit_status: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        #   will be declined if this is `allowed` but the Account Number is not active.
        #
        # @see Increase::Models::AccountNumberUpdateParams::InboundACH#debit_status
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
        #   How Increase should process checks with this account number printed on them.
        #
        #   @return [Symbol, Increase::Models::AccountNumberUpdateParams::InboundChecks::Status]
        required :status, enum: -> { Increase::Models::AccountNumberUpdateParams::InboundChecks::Status }

        # @!parse
        #   # Options related to how this Account Number should handle inbound check
        #   #   withdrawals.
        #   #
        #   # @param status [Symbol, Increase::Models::AccountNumberUpdateParams::InboundChecks::Status]
        #   #
        #   def initialize(status:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # How Increase should process checks with this account number printed on them.
        #
        # @see Increase::Models::AccountNumberUpdateParams::InboundChecks#status
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

      # This indicates if transfers can be made to the Account Number.
      module Status
        extend Increase::Internal::Type::Enum

        # The account number is active.
        ACTIVE = :active

        # The account number is temporarily disabled.
        DISABLED = :disabled

        # The account number is permanently disabled.
        CANCELED = :canceled

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
