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

      # @!attribute inbound_ach
      #   Options related to how this Account Number should handle inbound ACH transfers.
      #
      #   @return [Increase::AccountNumberCreateParams::InboundACH, nil]
      optional :inbound_ach, -> { Increase::AccountNumberCreateParams::InboundACH }

      # @!attribute inbound_checks
      #   Options related to how this Account Number should handle inbound check
      #   withdrawals.
      #
      #   @return [Increase::AccountNumberCreateParams::InboundChecks, nil]
      optional :inbound_checks, -> { Increase::AccountNumberCreateParams::InboundChecks }

      # @!method initialize(account_id:, name:, inbound_ach: nil, inbound_checks: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::AccountNumberCreateParams} for more details.
      #
      #   @param account_id [String] The Account the Account Number should belong to.
      #
      #   @param name [String] The name you choose for the Account Number.
      #
      #   @param inbound_ach [Increase::AccountNumberCreateParams::InboundACH] Options related to how this Account Number should handle inbound ACH transfers.
      #
      #   @param inbound_checks [Increase::AccountNumberCreateParams::InboundChecks] Options related to how this Account Number should handle inbound check withdrawa
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class InboundACH < Increase::Internal::Type::BaseModel
        # @!attribute debit_status
        #   Whether ACH debits are allowed against this Account Number. Note that ACH debits
        #   will be declined if this is `allowed` but the Account Number is not active. If
        #   you do not specify this field, the default is `allowed`.
        #
        #   @return [Symbol, Increase::AccountNumberCreateParams::InboundACH::DebitStatus]
        required :debit_status, enum: -> { Increase::AccountNumberCreateParams::InboundACH::DebitStatus }

        # @!method initialize(debit_status:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::AccountNumberCreateParams::InboundACH} for more details.
        #
        #   Options related to how this Account Number should handle inbound ACH transfers.
        #
        #   @param debit_status [Symbol, Increase::AccountNumberCreateParams::InboundACH::DebitStatus] Whether ACH debits are allowed against this Account Number. Note that ACH debits

        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        # will be declined if this is `allowed` but the Account Number is not active. If
        # you do not specify this field, the default is `allowed`.
        #
        # @see Increase::AccountNumberCreateParams::InboundACH#debit_status
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

      class InboundChecks < Increase::Internal::Type::BaseModel
        # @!attribute status
        #   How Increase should process checks with this account number printed on them. If
        #   you do not specify this field, the default is `check_transfers_only`.
        #
        #   @return [Symbol, Increase::AccountNumberCreateParams::InboundChecks::Status]
        required :status, enum: -> { Increase::AccountNumberCreateParams::InboundChecks::Status }

        # @!method initialize(status:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::AccountNumberCreateParams::InboundChecks} for more details.
        #
        #   Options related to how this Account Number should handle inbound check
        #   withdrawals.
        #
        #   @param status [Symbol, Increase::AccountNumberCreateParams::InboundChecks::Status] How Increase should process checks with this account number printed on them. If

        # How Increase should process checks with this account number printed on them. If
        # you do not specify this field, the default is `check_transfers_only`.
        #
        # @see Increase::AccountNumberCreateParams::InboundChecks#status
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
    end
  end
end
